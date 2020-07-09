$(document).ready(function(){


    $("select#time").append(new Option(1+" hour",1));
    for(var i=1;i<24;i++){
        $("select#time").append(new Option(i+1+" hours",i+1));
    }
    var type_Gamme = {
        "standard":{price:7565,frais:0.10},
        "premium":{price:12345,frais:0.13},
        "excelium":{price:15400, frais:0.16}
    };
    showCorrectContent();
    showDetails();

    $("#typeElevator").on('change', function(){
        showCorrectContent();
        showDetails();
        //console.log($(this).index())
    })

    $("input").on("change",function(){
        showDetails();
    })

function showCorrectContent() {
    $(".quote").hide();
    $("."+$("#typeElevator").val()).show();
    $(".quote input").val(null)
    $(".show-quote input").val(null)
}

function showDetails() {
    var input_Gamme = $("input[name=gamme]:checked");
    $("#summary_type").text($("label[for="+input_Gamme.attr("id")+"]").text());
    var shaft = calcul();
    $("#summary_shaft").text(shaft);
    var type = type_Gamme[input_Gamme.val()];
    var costE = type.price*shaft;
    $("#summary_ECost").text("$"+Number(costE).toLocaleString('en', {
        minimumFractionDigits: 2
    }));
    $("#summary_ICost").text("$"+Number(costE*type.frais).toLocaleString('en', {
        minimumFractionDigits: 2
    }));
    $("#summary_FCost").text("$"+Number(costE*(1+type.frais)).toLocaleString('en', {
        minimumFractionDigits: 2
    }));
}

function calcul() {
    var floor = parseInt($("input[name=floor]").val());
    var shaft = 0;
    switch ($("#typeElevator").val()) {
        case "residential":          
            var col = parseInt(floor/20) +1;
            var apart = parseInt($("input[name=apartment]").val());
            var c = parseInt((parseInt(apart/floor)/6)+1);

            shaft = c*col;
            break;
        case "commercial":
            shaft = $("input[name=shafts]").val();
            break;
        case "corporate":
            floor += parseInt($("input[name=basement]").val());
            var occupant = $('input[name=occupant]').filter(function(){return this.value != ""}).val()
            var ele = Math.ceil((occupant*floor)/1000);// number of elevator
            var col = Math.ceil(floor/20);
            shaft = col*Math.ceil(ele/col)
            break;
        case "hybride":
            floor += parseInt($("input[name=basement]").val());
            var occupant = $('input[name=occupant]').filter(function(){return this.value != ""}).val()
            var ele = Math.ceil((occupant*floor)/1000);// number of elevator
            var col = Math.ceil(floor/20);
            shaft = col*Math.ceil(ele/col)
            break;
        default:
            break;
    }
    return isNaN(shaft) || $.isEmptyObject(shaft) ? 0 : shaft;
}
});