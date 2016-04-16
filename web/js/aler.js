window.alert = function(str)
{
    var shield = document.createElement("DIV");
    shield.id = "shield";
    shield.style.position = "absolute";
    shield.style.left = "0px";
    shield.style.top = "0px";
    shield.style.width = "100%";
    shield.style.height = document.body.scrollHeight+"px";
    //弹出对话框时的背景颜色
    shield.style.background = "rgba(255,255,255,0.5)";
    shield.style.textAlign = "center";
    shield.style.zIndex = "250";
    //背景透明 IE有效
    shield.style.filter = "alpha(opacity=5)";
    var alertFram = document.createElement("DIV");
    alertFram.id="alertFram";
    alertFram.style.position = "fixed";
    alertFram.style.left = "50%";
    alertFram.style.top = "40%";
    alertFram.style.marginLeft = "-225px";
    alertFram.style.marginTop = "-75px";
    alertFram.style.width = "400px";
    alertFram.style.height = "180px";
    alertFram.style.background = "#fff";
    alertFram.style.textAlign = "center";
    alertFram.style.lineHeight = "200px";
    alertFram.style.zIndex = "3000";
    strHtml = "<ul style='list-style:none;margin:0px;padding:0px;width:100%;border-radius: 15px 15px 0 0;'>\n";
    strHtml += " <li style='background:#ff4500;text-align:left;padding-left:10px;font-size:14px;font-weight:bold;height:25px;line-height:25px;border:1px solid #ff4500;border-radius: 15px 15px 0 0;'>";
    strHtml += " <img src='images/logo.icon.png' style='height:24px;width:24px;margin-top:-2px;'>";
    strHtml += " <img src='images/logo.word.png' style='height:20px;width:75px;margin-top:-3px;margin-left:-7px'>";
    strHtml += "</li>\n";
    strHtml += " <li style='background:#F8F8FF;text-align:center;font-size:20px;height:150px;line-height:1.5em;padding-top:10%;padding:10% 5% 0; border-left:1px solid #F9CADE;border-right:1px solid #F9CADE;font-family:KaiTi_GB2312,STKaiti ,STXingkai,FZShuTi '>"+str+"</li>\n";
    strHtml += " <li style='background:#FDEEF4;text-align:center;font-weight:bold;height:30px;line-height:25px; border:1px solid #F9CADE;border-radius: 0 0 15px 15px;'><input type='button' id='aler' value='确 定' onclick='doOk()' style='background:#ff4500;border-radius: 5px;height:30px;width:60px;border:1px solid #ff4500;font-size:14px;margin:0;padding:0;color:#fff;margin-top:-1px;'/></li>\n";
    strHtml += "</ul>\n";
    alertFram.innerHTML = strHtml;
    document.body.appendChild(alertFram);
    document.body.appendChild(shield);
    this.doOk = function(){
        alertFram.style.display = "none";
        shield.style.display = "none";
    }
    alertFram.focus();
    document.body.onselectstart = function(){return false;};
}