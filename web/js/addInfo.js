
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
	var aInput=document.getElementsByTagName("input");
	var sub=aInput[1];
	var nameN=aInput[2];
	var nameR=aInput[3];
	var tel=aInput[6];
	var email=aInput[7];
	var aClass=document.getElementsByClassName("msg");
	var namN_msg=aClass[0];
	var namR_msg=aClass[1];
	var tel_msg=aClass[2];
	var email_msg=aClass[3];

	var case1=true;
	var case2=true;
	var case3=true;
	var case4=true;
	nameN.onfocus=function(){
		namN_msg.style.display="inline-block";
		namN_msg.innerHTML='<i class="ati"></i>1-25个字符，一个汉字为两个字符';
	}
	nameN.onblur=function(){
		if (getLength(this.value)>25) {
			namN_msg.innerHTML='<i class="err"></i>长度超过25个字符！';
			case1=false;
			sub.setAttribute("disabled","");
		}else if (this.value=="") {
			namN_msg.innerHTML='<i class="err"></i>不能为空！';
			case1=false;
			sub.setAttribute("disabled","");
		}else {
			namN_msg.innerHTML='<i class="ok"></i>OK！';
			case1=true;
			if (case1&&case2&&case3&&case4) {
				sub.removeAttribute("disabled");
			}
		}}
	nameR.onfocus=function(){
		namR_msg.style.display="inline-block";
		namR_msg.innerHTML='<i class="ati"></i>4-10个字符，一个汉字为两个字符';
	}
	nameR.onblur=function(){
		var re=/[^\w\u4e00-\u9fa5]/g;
		if (re.test(this.value)) {
			namR_msg.innerHTML='<i class="err"></i>含有非法字符！';
			case2=false;
			sub.setAttribute("disabled","");
		}else if (this.value=="") {
			namR_msg.innerHTML='<i class="err"></i>不能为空！';
			case2=false;
			sub.setAttribute("disabled","");
		}else if (getLength(this.value)<4) {
			namR_msg.innerHTML='<i class="err"></i>长度少于6个字符！';
			case2=false;
			sub.setAttribute("disabled","");
		}else if(getLength(this.value)>10){
			namR_msg.innerHTML='<i class="err"></i>长度超过10个字符！';
			case2=false;
			sub.setAttribute("disabled","");
		}else{
			namR_msg.innerHTML='<i class="ok"></i>OK！';
			case2=true;
			if (case1&&case2&&case3&&case4) {
				sub.removeAttribute("disabled");
			}
		}}
	//手机号
	tel.onfocus=function(){
		tel_msg.style.display="inline-block";
		tel_msg.innerHTML='<i class="ati"></i>请输入有效手机号';
	}
	tel.onblur=function(){
		var t=findStr(tel.value,tel.value[0]);
		var re_t=/^1\d{10}$/;
		if (this.value=="") {
			tel_msg.innerHTML='<i class="err"></i>不能为空！';
			case3=false;
			sub.setAttribute("disabled","");
		}else if (!re_t.test(this.value)||t==this.value.length) {
			tel_msg.innerHTML='<i class="err"></i>请输入有效手机号！';
			case3=false;
			sub.setAttribute("disabled","");
		}else{
			TelAjax();
		}
	}
	//手机号
	email.onfocus=function(){
		email_msg.style.display="inline-block";
		email_msg.innerHTML='<i class="ati"></i>请输入有效的邮箱';
	}
	email.onblur=function(){
		var re_m=/^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;
		if (this.value=="") {
			email_msg.innerHTML='<i class="err"></i>不能为空！';
			case4=false;
			sub.setAttribute("disabled","");
		}else if (!re_m.test(this.value)) {
			email_msg.innerHTML='<i class="err"></i>请输入有效的邮箱！';
			case4=false;
			sub.setAttribute("disabled","");
		}else{
			MailAjax()
		}
	}
	function TelAjax(){
		var xmlhttp;
		var telephone = document.getElementsByName("TelePhone")[0].value;
		if (window.XMLHttpRequest)
		{// code for IE7+, Firefox, Chrome, Opera, Safari
			xmlhttp=new XMLHttpRequest();
		}
		else
		{// code for IE6, IE5
			xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
		}
		xmlhttp.onreadystatechange=function(){
			if(xmlhttp.readyState==4 && xmlhttp.status==200) {
				var x = xmlhttp.responseText;
				if(x=="true"){ //号码可以使用
					tel_msg.innerHTML='<i class="ok"></i>OK!';
					case3=true;
					if (case1&&case2&&case3&&case4) {

						sub.removeAttribute("disabled");
					}
				}else{
					case3=false;
					sub.setAttribute("disabled","");
					tel_msg.innerHTML='<i class="err"></i>此号码已被占用！';
				}
			}
		}
		xmlhttp.open("post","AddInfoTelJudge?telePhone="+telephone,true);
		xmlhttp.send();
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
			if(xmlhttp.readyState==4 && xmlhttp.status==200) {
				var x = xmlhttp.responseText;
				if(x=="true"){
					email_msg.innerHTML='<i class="ok"></i>OK!';
					case4=true;
					if (case1&&case2&&case3&&case4) {

						sub.removeAttribute("disabled");
					}
				}else{
					email_msg.innerHTML='<i class="err"></i>此邮箱已被占用！';
					case4=false;
					sub.setAttribute("disabled","");
				}
			}
		}
		xmlhttp.open("post","AddInfoMailJudge?mail="+mail,"true");
		xmlhttp.send();
	}
}
