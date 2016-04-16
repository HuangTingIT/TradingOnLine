function recordTime(){
    var now = new Date();
    //now.toLocaleTimeString("yyyy-MM-dd HH:mm:ss");
    var month = (now.getMonth()+1).toString();
    var day = now.getDate().toString();
    if(month.length==1){
        month = "0"+month;
    }
    if(day.length==1){
        day = "0"+day;
    }
    var  time = now.getFullYear() + "-" + month + "-" + day + " " + now.getHours() + ":" + now.getMinutes() + ":" + now.getSeconds();

    document.getElementsByName("time")[0].value = time;
    return true;
}