<?php 
require_once("credentials.php");
require_once("db-routines.php");
date_default_timezone_set("America/Mexico_City");

switch ($_POST["action"]) {
    case 'run':
        run();
        break;
    case 'save':
        save();
        break;
    case 'loadSaved':
        loadSaved();
        break;
    case 'loadCode':
        loadCode();
        break;
    default:
        # code...
        break;
}

function run(){
    $code = $_POST["code"];
    $text = "<?php\n".$code."\n?>";

    try {
        $tester = fopen("tester.php", "w");
        fwrite($tester, $text);
        fclose($tester);
        
        sendStatus(200, []);
    } catch (\Throwable $th) {
        sendStatus(400, [], $th);
    }
}

function save(){
    $title = $_POST["title"];
    $code = $_POST["code"];
    $created = date("Y-m-d H:i:s", substr(time(), 0, 10));

    $codeToDb = "INSERT INTO php_code (id, title, code, created, deleted) VALUES (UUID(), '$title', '$code', '$created', 0)";
    $insert = insertQuery($codeToDb);
    if($insert == "ok"){
        sendStatus(200, []);
    }
}

function loadSaved(){
    $db = getQuery("SELECT * FROM php_code ORDER BY created");
    sendStatus(200, $db);
}

function loadCode(){
    $id = $_POST["id"];
    $code = getQuery("SELECT * FROM php_code WHERE id = '$id'");
    sendStatus(200, $code);
}

function sendStatus($status, $response = [], $error = []){
    switch ($status) {
        case 200:
            $server["response"] = $response;
            $server["status"] = "ok";
            $server["error"] = [];
            break;
        case 400:
            $server["status"] = "not ok";
            $server["error"] = $error;
            break;
        default:
            break;
    }
    echo json_encode($server);
}

// -- First Test
// $arrContextOptions= [
//     "ssl"=> [
//         "verify_peer"=>false,
//         "verify_peer_name"=>false,
//     ],
// ];  

// $url = "https://thebestproductmanager.com/products/prices-nxg-object";
// $page = @file_get_contents($url, false, stream_context_create($arrContextOptions));

// $page = str_replace("var priceMessages = ", "", $page);
// $page = str_replace("}];", "}]", $page);
// $prices = json_decode($page);

// echo "NXG current price list:";
// echo "<br>";

// foreach ($prices as $p) {
//     echo sprintf("%.2f", $p->price);
//     echo "<br>";
// }
?>