<?php
$arrContextOptions= [
    "ssl"=> [
        "verify_peer"=>false,
        "verify_peer_name"=>false,
    ],
];  

$url = "https://thebestproductmanager.com/products/prices-nxg-object";
$page = @file_get_contents($url, false, stream_context_create($arrContextOptions));

$page = str_replace("var priceMessages = ", "", $page);
$page = str_replace("}];", "}]", $page);
$prices = json_decode($page);

echo "NXG current price list:";
echo "<br>";

foreach ($prices as $p) {
    echo sprintf("%.2f", $p->price);
    echo "<br>";
}


?>