
function getLength(str){
    return str.replace(/[^\x00-xff]/g,"xx").length;
}
function findStr(str,n){
    var tmp=0;
    for(var i=0;i<str.length;i++){
        if (str.charAt(i)==n) {
            tmp++;
        }
    }
    return tmp;
}
window.onload=function(){
    var aInput=document.getElementsByTagName('input');
    var pwd=aInput[0];
    var pwd2=aInput[1];
    var sub=aInput[2];
    var aP=document.getElementsByTagName('p');
    var pwd_msg=aP[0];
    var pwd2_msg=aP[1];
    var aEm=document.getElementsByTagName('em');
    var name_length=0;

    pwd2.setAttribute("disabled","");

    //密码
    pwd.onfocus=function(){
        pwd_msg.style.display="inline-block";
        pwd_msg.innerHTML='<i class="ati"></i>6-16个字符，请使用字母加数字或符号的组合密码，不能单独使用字母、数字或符号。';
    }
    pwd.onkeyup=function(){
        //大于5字符“中”
        var m=findStr(pwd.value,pwd.value[0]);
        var re_n=/[^\d]/g;
        var re_m=/[^a-zA-Z]/g;
        if (this.value.length>5&&m!=this.value.length&&re_n.test(this.value)&&re_m.test(this.value)) {
            aEm[1].className="active";
            pwd2.removeAttribute("disabled");
            pwd2_msg.style.display="inline-block";
        }
        else{
            aEm[1].className="";
            pwd2.setAttribute("disabled","");
            pwd2_msg.style.display="none";
        }
        //大于10个字符“强”
        if(this.value.length>8&&m!=this.value.length&&re_n.test(this.value)&&re_m.test(this.value)){
            aEm[2].className="active";
        }
        else
            aEm[2].className="";
    }
    pwd.onblur=function(){
        var m=findStr(pwd.value,pwd.value[0]);
        var re_n=/[^\d]/g;
        var re_m=/[^a-zA-Z]/g;
        //不能为空
        if(this.value==""){
            pwd_msg.innerHTML='<i class="err"></i>不能为空!';
            sub.setAttribute("disabled","");
        }
        //不能用相同的字符
        else if (m==this.value.length) {
            pwd_msg.innerHTML='<i class="err"></i>不能用相同的字符';
            sub.setAttribute("disabled","");
        }
        //长度应为6-16个字符
        else if(this.value.length<6||this.value.length>16){
            pwd_msg.innerHTML='<i class="err"></i>长度应为6-16个字符';
            sub.setAttribute("disabled","");
        }
        //不能全为数字
        else if (!re_n.test(this.value)) {
            pwd_msg.innerHTML='<i class="err"></i>不能全为数字';
            sub.setAttribute("disabled","");
        }
        //不能全为字母
        else if(!re_m.test(this.value)){
            pwd_msg.innerHTML='<i class="err"></i>不能全为字母';
            sub.setAttribute("disabled","");
        }
        //OK!
        else{
            pwd_msg.innerHTML='<i class="ok"></i>OK!';
            if (this.value==pwd2.value) {
                pwd2_msg.innerHTML='<i class="ok"></i>OK!';
                sub.removeAttribute("disabled");
            }
        }
    }
    //确认密码
    pwd2.onblur=function(){
        if(this.value!=pwd.value){
            pwd2_msg.innerHTML='<i class="err"></i>两次输入密码不一致！';
            sub.setAttribute("disabled","");
        }
        else{
            pwd2_msg.innerHTML='<i class="ok"></i>OK!';
            sub.removeAttribute("disabled");
        }
    }
}

function judgeChange(){
    var xmlhttp;
    var pass = document.getElementsByName("SecondPW")[0].value;
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
            x = xmlhttp.responseText;
            if(x=="false"){
                alert("密码修改失败");
            }else{
                window.location.href="changepasswd_success.jsp";
            }
        }
    }
    xmlhttp.open("get","ChangeThePassWordServlet?FirstPW="+pass,"true");
    xmlhttp.send();
}