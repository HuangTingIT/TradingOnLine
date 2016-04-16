
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

    //����
    pwd.onfocus=function(){
        pwd_msg.style.display="inline-block";
        pwd_msg.innerHTML='<i class="ati"></i>6-16���ַ�����ʹ����ĸ�����ֻ���ŵ�������룬���ܵ���ʹ����ĸ�����ֻ���š�';
    }
    pwd.onkeyup=function(){
        //����5�ַ����С�
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
        //����10���ַ���ǿ��
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
        //����Ϊ��
        if(this.value==""){
            pwd_msg.innerHTML='<i class="err"></i>����Ϊ��!';
            sub.setAttribute("disabled","");
        }
        //��������ͬ���ַ�
        else if (m==this.value.length) {
            pwd_msg.innerHTML='<i class="err"></i>��������ͬ���ַ�';
            sub.setAttribute("disabled","");
        }
        //����ӦΪ6-16���ַ�
        else if(this.value.length<6||this.value.length>16){
            pwd_msg.innerHTML='<i class="err"></i>����ӦΪ6-16���ַ�';
            sub.setAttribute("disabled","");
        }
        //����ȫΪ����
        else if (!re_n.test(this.value)) {
            pwd_msg.innerHTML='<i class="err"></i>����ȫΪ����';
            sub.setAttribute("disabled","");
        }
        //����ȫΪ��ĸ
        else if(!re_m.test(this.value)){
            pwd_msg.innerHTML='<i class="err"></i>����ȫΪ��ĸ';
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
    //ȷ������
    pwd2.onblur=function(){
        if(this.value!=pwd.value){
            pwd2_msg.innerHTML='<i class="err"></i>�����������벻һ�£�';
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
                alert("�����޸�ʧ��");
            }else{
                window.location.href="changepasswd_success.jsp";
            }
        }
    }
    xmlhttp.open("get","ChangeThePassWordServlet?FirstPW="+pass,"true");
    xmlhttp.send();
}