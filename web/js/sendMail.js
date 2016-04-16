function sendnum() {
    var sendsp = document.getElementById("sendsp");
    var resend = document.getElementById("sendsp2");
    document.getElementById("t").innerHTML = 60;
    sendsp.style.display = "none";
    resend.style.display = "inline";
    var int = self.setInterval(run, 1000);

    function run() {
        var tim = document.getElementById("t");
        if (tim.innerHTML == 0) {
            sendsp.innerHTML = "���·���";
            sendsp.style.display = "inline";
            resend.style.display = "none";
            window.clearInterval(int);
        }
        tim.innerHTML = tim.innerHTML - 1;
    }
}
function MailAjax(){
    var xmlhttp;
    var mail = document.getElementsByName("Email")[0].value;
    if (window.XMLHttpRequest)
    {// code for IE7+, Firefox, Chrome, Opera, Safari
        xmlhttp=new XMLHttpRequest();
    }
    else
    {// code for IE6, IE5
        xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
    }
    xmlhttp.onreadystatechange=function(){
        if(xmlhttp.readyState==4 && xmlhttp.status==200){
            var x = xmlhttp.responseText;
            if(x=="true"){ //û�ҵ�������
                document.getElementById('sendsp').setAttribute("disabled","");
                document.getElementById("emailJudge").style.display="inline-block";
                document.getElementById("emailJudge").innerHTML='<i class="err"></i>��������δע���˺ţ���˶Ժ���������';
            }else{
                document.getElementById("emailJudge").style.display="inline-block";
                document.getElementById("emailJudge").innerHTML='<i class="ok"></i>OK!';
                document.getElementById('sendsp').removeAttribute("disabled");
            }
        }
    }
    xmlhttp.open("post","AddInfoMailJudge?mail="+mail,"true");
    xmlhttp.send();
}

function sendCodeAjax(){
    var xmlhttp;
    var mail = document.getElementsByName("Email")[0].value;
    if (window.XMLHttpRequest)
    {// code for IE7+, Firefox, Chrome, Opera, Safari
        xmlhttp=new XMLHttpRequest();
    }
    else
    {// code for IE6, IE5
        xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
    }
    xmlhttp.onreadystatechange=function(){
        if(xmlhttp.readyState==4 && xmlhttp.status==200){
            alert("����֤���ѷ��ͣ���ע�����");
            document.getElementsByName("Code")[0].disabled=false;
        }
    }
    xmlhttp.open("get","SendPINServlet?Email="+mail,"true");
    xmlhttp.send();
}

function judgeCode(){
    var code = document.getElementsByName("Code")[0].value;
    if(code.length!=6){
        document.getElementById("sub").disabled=true;
    }else{
        judgeCodeAjax();
    }
}

function judgeCodeAjax(){
    var xmlhttp;
    var code = document.getElementsByName("Code")[0].value;
    if (window.XMLHttpRequest)
    {// code for IE7+, Firefox, Chrome, Opera, Safari
        xmlhttp=new XMLHttpRequest();
    }
    else
    {// code for IE6, IE5
        xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
    }
    xmlhttp.onreadystatechange=function() {
        if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
            var x = xmlhttp.responseText;
            if (x=="false") {
                var errorCount = document.getElementById("errorCount");
                var i=errorCount.value;
                if(i=="3"){
                    //document.getElementById("codeTip").innerHTML='�������������!()';
                    alert("�Ѿ����������֤�룬��ǰ��֤��������");
                    document.getElementById("sub").disabled=true;
                    errorCount.value="1";
                    document.getElementsByName("Email")[0].value="";
                    document.getElementById('sendsp').setAttribute("disabled","");
                    document.getElementsByName("Code")[0].value="";
                    document.getElementsByName("Code")[0].disabled=true;
                    document.getElementById("sub").disabled=true;
                    document.getElementById("codeTip").innerHTML='';
                }
                else if(i=="2"){
                    document.getElementById("codeTip").style.display="inline-block";
                    document.getElementById("codeTip").innerHTML='<i class="err"></i>�ڶ����������!(���������ε�ǰ��֤�뽫����)';
                    document.getElementById("sub").disabled=true;
                    errorCount.value="3";
                }else if(i=="1"){
                    document.getElementById("codeTip").style.display="inline-block";
                    document.getElementById("codeTip").innerHTML='<i class="err"></i>��һ���������!(���������ε�ǰ��֤�뽫����)';
                    document.getElementById("sub").disabled=true;
                    errorCount.value="2";
                }

            }else{
                document.getElementById("codeTip").style.display="inline-block";
                document.getElementById("codeTip").innerHTML='<i class="ok"></i>OK!';
                document.getElementById("errorCount").value="1";
                document.getElementById("sub").disabled=false;
            }
        }
    }
    xmlhttp.open("get","CheckTheCodeServlet?Code="+code,"false");
    xmlhttp.send();
}