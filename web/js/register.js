
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
	var aName=aInput[1];
	var tel=aInput[2];
	var email=aInput[3];
	var pwd=aInput[4];
	var pwd2=aInput[5];
	var sub=aInput[6];
	var aP=document.getElementsByTagName('p');
	var name_msg=aP[0];
	var tel_msg=aP[1];
	var email_msg=aP[2];
	var pwd_msg=aP[3];
	var pwd2_msg=aP[4];
	var count=document.getElementById('count');
	var aEm=document.getElementsByTagName('em');
	var name_length=0;

	var case1=false;
	var case2=false;
	var case3=false;
	var case4=false;
	var case5=false; //�����������ӵ�

	//�û���

	aName.onfocus=function(){
		name_msg.style.display="block";
		name_msg.innerHTML='<i class="ati"></i>4-25���ַ���һ������Ϊ�����ַ�'
	}

	aName.onkeyup=function(){
		count.style.visibility="visible";
		name_length=getLength(this.value);
		count.innerHTML=name_length+"���ַ�";
		if (name_length==0) {
			count.style.visibility="hidden";
		};
	}
	aName.onblur=function(){
		//���зǷ��ַ�
		name_length=getLength(this.value);
		var re=/[^\w\u4e00-\u9fa5]/g;
		if (re.test(this.value)) {
			name_msg.innerHTML='<i class="err"></i>���зǷ��ַ���';
			case1=false;
			sub.setAttribute("disabled","");
		}
		//����Ϊ��
		else if(this.value==""){
			name_msg.innerHTML='<i class="err"></i>����Ϊ�գ�';
			case1=false;
			sub.setAttribute("disabled","");
		}
		//���ȳ���25���ַ�
		else if(name_length>25){
			name_msg.innerHTML='<i class="err"></i>���ȳ���25���ַ�';
			case1=false;
			sub.setAttribute("disabled","");
		}
		//��������6���ַ�
		else if(name_length<4){
			name_msg.innerHTML='<i class="err"></i>��������4���ַ�';
			case1=false;
			sub.setAttribute("disabled","");
		}
		//ok
		else{
			name_msg.innerHTML='<i class="ok"></i>OK!';
			//alert("2");
			case1=true;
			// alert("1");
			if (case1&&case2&&case3&&case4&&case5) {

				sub.removeAttribute("disabled");
			}
		}
	}
	//�ֻ���
	tel.onfocus=function(){
		tel_msg.style.display="block";
		tel_msg.innerHTML='<i class="ati"></i>��������Ч�ֻ���';
	}
	tel.onblur=function(){
		var t=findStr(tel.value,tel.value[0]);
		var re_t=/^[1]\d{10}/g;
		if (this.value=="") {
			tel_msg.innerHTML='<i class="err"></i>����Ϊ�գ�';
			case2=false;
			sub.setAttribute("disabled","");
		}else if (!re_t.test(this.value)||t==this.value.length) {
			tel_msg.innerHTML='<i class="err"></i>��������Ч�ֻ��ţ�';
			case2=false;
			sub.setAttribute("disabled","");
		}else{
			TelAjax();
		}
	}
	//����
	email.onfocus=function(){
		email_msg.style.display="block";
		email_msg.innerHTML='<i class="ati"></i>��������Ч��������Ա��һ�����ʱʹ�á�';
	}
	email.onblur=function(){
		var re_m=/^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;
		if (this.value=="") {
			email_msg.innerHTML='<i class="err"></i>����Ϊ�գ�';
			case5=false;
			sub.setAttribute("disabled","");
		}else if (!re_m.test(this.value)) {
			email_msg.innerHTML='<i class="err"></i>��������Ч�����䣡';
			case5=false;
			sub.setAttribute("disabled","");
		}else{
			MailAjax();
		}
	}
	//����
	pwd.onfocus=function(){
		pwd_msg.style.display="block";
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
			pwd2_msg.style.display="block";
		}
		else{
			aEm[1].className="";
			pwd2.setAttribute("disabled","");
			pwd2_msg.style.display="none";
		}
		//����10���ַ���ǿ��
		if(this.value.length>10&&m!=this.value.length&&re_n.test(this.value)&&re_m.test(this.value)){
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
			case3=false;
			sub.setAttribute("disabled","");
		}
		//��������ͬ���ַ�
		else if (m==this.value.length) {
			pwd_msg.innerHTML='<i class="err"></i>��������ͬ���ַ�';
			case3=false;
			sub.setAttribute("disabled","");
		}
		//����ӦΪ6-16���ַ�
		else if(this.value.length<6||this.value.length>16){
			pwd_msg.innerHTML='<i class="err"></i>����ӦΪ6-16���ַ�';
			case3=false;
			sub.setAttribute("disabled","");
		}
		//����ȫΪ����
		else if (!re_n.test(this.value)) {
			pwd_msg.innerHTML='<i class="err"></i>����ȫΪ����';
			case3=false;
			sub.setAttribute("disabled","");
		}
		//����ȫΪ��ĸ
		else if(!re_m.test(this.value)){
			pwd_msg.innerHTML='<i class="err"></i>����ȫΪ��ĸ';
			case3=false;
			sub.setAttribute("disabled","");
		}
		//OK!
		else{
			pwd_msg.innerHTML='<i class="ok"></i>OK!';
			case3=true;
			if (case1&&case2&&case3&&case4&&case5) {

				sub.removeAttribute("disabled");
			}
		}
	}
	//ȷ������
	pwd2.onblur=function(){
		if(this.value!=pwd.value){
			pwd2_msg.innerHTML='<i class="err"></i>�����������벻һ�£�';
			case4=false;
			sub.setAttribute("disabled","");
		}
		else{
			pwd2_msg.innerHTML='<i class="ok"></i>OK!';
			case4=true;
			if (case1&&case2&&case3&&case4&&case5) {
				sub.removeAttribute("disabled");
			}
		}
	}

	function TelAjax(){
		var xmlhttp;
		var Tel =document.getElementsByName("userTelePhone")[0].value;
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
				var judge = xmlhttp.responseText;
				if(judge=="true"){
					tel_msg.innerHTML='<i class="ok"></i>OK!';
					case2=true;
					if (case1&&case2&&case3&&case4&&case5) {
						sub.removeAttribute("disabled");
					}
				}else if(judge=="false"){
					tel_msg.innerHTML='<i class="err"></i>�˺����ѱ�ռ�ã�';
					case2=false;
					sub.setAttribute("disabled","");
				}
			}
		}
		xmlhttp.open("post","TelJudge?Tel="+Tel,true);
		xmlhttp.send();
	}
	function MailAjax(){
		var xmlhttp;
		var mail = email.value;
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
					email_msg.innerHTML='<i class="ok"></i>OK!';
					case5=true;
					if (case1&&case2&&case3&&case4&&case5) {
						sub.removeAttribute("disabled");
					}
				}else{ //�ҵ��ظ�����
					email_msg.innerHTML='<i class="err"></i>�������ѱ�ռ�ã�';
					case5=false;
					sub.setAttribute("disabled","");
				}
			}
		}
		xmlhttp.open("post","AddInfoMailJudge?mail="+mail,"true");
		xmlhttp.send();
	}
}