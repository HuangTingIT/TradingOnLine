window.onload=function(){
    var case1=false;
    var case2=false;
    var case3=false;
    var case4=false;
    var case5=false;
    var case6=false;
    var case7=false;
    var biaoti = document.getElementsByName("name")[0];
    var zhonglei = document.getElementsByName("category")[0];
    var shuliang = document.getElementsByName("num")[0];
    var jiage = document.getElementsByName("price")[0];
    var dizhi = document.getElementsByName("address")[0];
    var tupian = document.getElementsByName("file1")[0];
    var miaoshu = document.getElementsByName("_fm.i._0.de")[0];
    var fabu = document.getElementsByName("event_submit_do_publish")[0];
    biaoti.onblur=function(){
        document.getElementById("1").style.display="inline-block";
        var s = biaoti.value;
        if(s==""){
            document.getElementById("1").innerHTML='<i class="err"></i>不能为空!';
            document.getElementById('tijiao').disabled=true;
            case1=fasle;
        }else{
            case1=true;
            document.getElementById("1").innerHTML='<i class="ok"></i>OK!';
        }
        judge();
    }
    zhonglei.onblur=function(){
        document.getElementById("2").style.display="inline-block";
        var s = zhonglei.value;
        if(s==""){
            document.getElementById("2").innerHTML='<i class="err"></i>不能为空!';
            document.getElementById('tijiao').disabled=true;
            case2=false;
        }else{
            case2=true;
            document.getElementById("2").innerHTML='<i class="ok"></i>OK!';
        }
        judge();
    }
    shuliang.onchange=function(){
        document.getElementById("3").style.display="inline-block";
        var num = shuliang.value;
        if(isNaN(num)){ //该函数为真则不是数字
            document.getElementById("3").innerHTML='<i class="err"></i>请输入数字';
            document.getElementById('tijiao').disabled=true;
            case3=false;
        }else{
            if(num<=0){
                document.getElementById("3").innerHTML='<i class="err"></i>请输入大于0的数字';
                document.getElementById('tijiao').disabled=true;
                case3=false;
            }else{
                document.getElementById("3").innerHTML='<i class="ok"></i>OK!';
                case3=true;
            }
        }
        judge();
    }
    jiage.onchange=function(){
        document.getElementById("4").style.display="inline-block";
        var pri = jiage.value;
        if(isNaN(pri)){ //该函数为真则不是数字
            document.getElementById("4").innerHTML='元    <i class="err"></i>请输入数字';
            document.getElementById('tijiao').disabled=true;
            case4=false;
        }else{
            if(pri<=0){
                document.getElementById("4").innerHTML='元    <i class="err"></i>请输入大于0的数字';
                document.getElementById('tijiao').disabled=true;
                case4=false;
            }else{
                document.getElementById("4").innerHTML='元 <i class="ok"></i>OK!';
                case4=true;
            }
        }
        judge();
    }
    dizhi.onchange=function(){
        document.getElementById("5").style.display="inline-block";
        var index = dizhi.selectedIndex;
        var s = dizhi.options[index].value;
        if(s==""){
            document.getElementById("5").innerHTML='<i class="err"></i>不能为空!';
            document.getElementById('tijiao').disabled=true;
            case5=false;
        }else{
            case5=true;
            document.getElementById("5").innerHTML='<i class="ok"></i>OK!';
        }
        judge();
    }
    tupian.onchange=function(){
        var filename = tupian.value;
        if(filename==""){
            document.getElementById('tijiao').disabled=true;
            case6=fasle;
        }else{
            case6=true;
        }
        judge();
    }
    miaoshu.onblur=function(){
        document.getElementById("7").style.display="inline-block";
        var s = miaoshu.value;
        if(s==""){
            document.getElementById("7").innerHTML='<i class="err"></i>不能为空!';
            document.getElementById('tijiao').disabled=true;
            case7=false;
        }else{
            case7=true;
            document.getElementById("7").innerHTML='<i class="ok"></i>OK!';
        }
        judge();
    }
    function judge(){
        if(case1&&case2&&case3&&case4&&case5&&case6&&case7){
            document.getElementById('tijiao').disabled=false;
        }
    }
}

function fabu(){
    var pics = document.getElementsByName("file1");
    var judge=true;
    for(i=0;i<pics.length;i++){
        if(pics[i].value==""){
            judge=false;
        }
    }
    if(judge==false){
        alert("请在未选择图片的按钮处选择图片，或将该按钮删除！");
    }
    return judge;
}