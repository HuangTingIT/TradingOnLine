
var goods=document.getElementsByName("newslist");
function selAll(){
    var sel=document.getElementsByClassName("allselect");
    var sel1=sel[0];
    var sel2=sel[1];
    var selca=true;
    for (var i = goods.length - 1; i >= 0; i--) {
        if (goods[i].checked==false) {
            selca=false;
        }
    }
    if (selca==true) {
        sel1.checked=true;
        sel2.checked=true;
    }else{
        sel1.checked=false;
        sel2.checked=false;
    }
}
function delbut(){
    var del=document.getElementById("jz2");
    var delspan=document.getElementById("jz1");
    var selbut=false;
    var count=0;
    for (var i = goods.length - 1; i >= 0; i--) {
        if (goods[i].checked==true) {
            selbut=true;
            count+=1;
        }
    }
    if (selbut) {
        del.style.display="block";
        delspan.style.display="none";
    }else{
        del.style.display="none";
        delspan.style.display="block";
    }
    return count;
}

window.onload= function(){
    var sel=document.getElementsByClassName("allselect");
    var sel1=sel[0];
    var sel2=sel[1];
    var goods=document.getElementsByName("newslist");
    var del=document.getElementById("jz2");
    var delspan=document.getElementById("jz1");
    var insel=document.getElementById("invert");
    var num=document.getElementById("shuliang");
    selAll();
    delbut();
    sel1.onclick=function(){
        if (sel1.checked==true) {
            for (var i = goods.length - 1; i >= 0; i--) {
                goods[i].checked=true;
            }
            num.innerHTML= goods.length;
            sel2.checked=true;
            del.style.display="block";
            delspan.style.display="none";
        }
        else{
            for (var i = goods.length - 1; i >= 0; i--) {
                goods[i].checked=false;
            }
            num.innerHTML= 0;
            sel2.checked=false;
            del.style.display="none";
            delspan.style.display="block";
        }
        insel.checked=false;
    }
    sel2.onclick=function(){
        if (sel2.checked==true) {
            for (var i = goods.length - 1; i >= 0; i--) {
                goods[i].checked=true;
            }
            num.innerHTML= goods.length;
            sel1.checked=true;
            del.style.display="block";
            delspan.style.display="none";
        }
        else{
            for (var i = goods.length - 1; i >= 0; i--) {
                goods[i].checked=false;
            }
            num.innerHTML= 0;
            sel1.checked=false;
            del.style.display="none";
            delspan.style.display="block";
        }
        insel.checked=false;
    }
    insel.onclick=function(){
        var dispy=false;
        var selc=true;
        for (var i = goods.length - 1; i >= 0; i--) {
            if (goods[i].checked==false) {
                goods[i].checked=true;
                dispy=true;
            } else{
                goods[i].checked=false;
                dispy=false;
            }
        }
        if (dispy) {
            del.style.display="block";
            delspan.style.display="none";
            selAll();
        }else{
            del.style.display="none";
            delspan.style.display="block";
            sel1.checked=false;
            sel2.checked=false;
        }
        selAll();
        num.innerHTML=delbut();
    }
    for (var i = goods.length - 1; i >= 0; i--) {
        goods[i].onclick=function(){
            delbut();
            selAll();
            num.innerHTML=delbut();
            insel.checked=false;
        }
    }
}