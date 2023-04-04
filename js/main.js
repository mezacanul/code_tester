function run(){
    code = ($("textarea[name='code']").val())
    $("#result").html("...")
    setTimeout(()=>{
        $.post("server/build.php", { action: "run", code }).then((data)=>{
            try {
                server = JSON.parse(data)
                if(server.status == "ok"){
                    $.post("server/tester.php").then(data=>{
                        $("#result").html(data)
                    })
                }
            } catch(error) {
                alert("Error: check console")
                console.log(data, error)
            }
        })
    }, 500)
}

function save(){
    title = $("input[name='title']").val()
    code = $("textarea[name='code']").val()
    btnsState(0)

    $.post("server/build.php", { action: "save", title, code }).then((data)=>{
        try {
            data = JSON.parse(data)
            if(data.status == "ok"){
                savedAnim()
                setTimeout(() => { btnsState(1) }, 1000);
            }
        } catch (error) {
            alert("Error: check console")
            console.log(data, error)
        }
    })
}

function savedAnim() {
    $("#savedAnim").css("opacity", 1)
    setTimeout(() => {
        $("#savedAnim").css("opacity", 0)
    }, 2000);
}

function btnsState(state) {
    switch (state) {
        case 0:
            $("button").attr("disabled", "disabled")
            break;
        case 1:
            $("button").removeAttr("disabled")
            break;
        default:
            break;
    }
}

// -- EVENTS

$(window).on("load", ()=>{
    btnsState(0)
    $.post("server/build.php", { action: "loadSaved"}).then((data)=>{
        try {
            data = JSON.parse(data)
            code_db = data.response

            code_db.forEach(code => {
                option = "<option value='"+ code.id +"'>"+ code.title +"</option>"
                $("select[name='saved']").append(option) 
            });
        } catch(error) {
            alert("Error: check console")
            console.log(data, error)
        }
    })
})

$("textarea[name='code']").on("input", ()=>{
    currentTitleVal = $("input[name='title']").val()
    if(currentTitleVal != "" && $("input[name='title']").attr("data-original") != currentTitleVal){
        $("#save").removeAttr("disabled")
    }
    if($("select[name='saved']").val() != null){
        $("#update").removeAttr("disabled")
    }
    $("#run").removeAttr("disabled")  
})

$("input[name='title']").on("input", ()=>{
    if($("textarea[name='code']").val() != ""){
        $("#save").removeAttr("disabled")
    }
})

$("select[name='saved']").on("change", ()=>{
    id = $("select[name='saved']").val()
    $.post("server/build.php", { action: "loadCode", id}).then((data)=>{
        try {
            data = JSON.parse(data)
            code = (data.response[0]).code
            title = (data.response[0]).title
            $("textarea[name='code']").val("")
            $("textarea[name='code']").val(code)
            $("input[name='title']").val("")
            $("input[name='title']").val(title)
            $("input[name='title']").attr("data-original", title)
            
            $("#save").attr("disabled", "disabled")
            $("#update").attr("disabled", "disabled")
            $("#run").removeAttr("disabled")
            $("#delete").removeAttr("disabled")
        } catch (error) {
            alert("Error: check console")
            console.log(data, error)
        }
    })
})