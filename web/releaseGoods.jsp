<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %><%--
  Created by IntelliJ IDEA.
  User: HuangTing
  Date: 2015/12/13
  Time: 16:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html" pageEncoding="GBK" %>

<html>
<head>
    <title>发布商品</title>
    <link href="css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
    <link href="css/style.css" rel="stylesheet" type="text/css" media="all" />
    <script src="js/release.js"></script>
    <link rel="stylesheet" href="css/global-min.css">
    <!-- S GLOBAL CSS -->
    <link rel="stylesheet" href="css/publish-min.css">

    <!--//theme-style-->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link rel="icon" href="images/icon.png" type="image/png" sizes="16x16">
    <meta name="description" content="你来我往——吉林大学商品交易平台，为师生提供商品交易（含二手交易）、求购商品等信息，充分满足其种类多、规模小的特点。你来我往，吉大人及时、便捷、安全的商品交易平台！">
    <meta name="keywords" content="吉大，吉大二手，吉大2手，吉大二手交易，吉大闲置，吉大交换，吉大商品市场，吉大跳骚，你来我往" />
    <script src="js/aler.js" type="text/javascript"></script>
    <script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
    <!--fonts-->
    <link href='http://fonts.useso.com/css?family=Lato:100,300,400,700,900' rel='stylesheet' type='text/css'>
    <link href='http://fonts.useso.com/css?family=Vollkorn:400,700' rel='stylesheet' type='text/css'>
    <style>
        #files1 .btn {
            background-color: #FFFF99;
            color: #aaa;
        }
        #files1 .btn:hover{
            background-color: #fd0;
            color: #fff;
        }
    </style>
</head>
<body>
<!--header-->
<script type="text/javascript">
    function addFile(){
        var count = document.getElementsByName("file1").length;
        if(document.getElementsByName("file1")[count-1].value==""){
            alert("请先在已有选择文件按钮处添加图片");
        }else{
            var upFile = '<a class=btn_addPic href="javascript:void(0);"><br><br><input class="filePrew" title="支持jpeg、png格式，文件小于5M" tabIndex="3" type="file" size="3" name="file1" accept="image/jpeg,image/png"></a>';
            document .getElementById ("files").insertAdjacentHTML("beforeEnd",upFile);
            var ss = document.getElementsByName("file1").length;
            if(ss>1){ //当存在多余一个文件选择按钮时方可点击删除键
                document.getElementById("delPic").disabled=false;
            }
        }
    }

    function deleteFile(){
        var file = document .getElementById ("files").lastChild;
        if(file == null)
            return;
        file = document .getElementById ("files").lastChild; //移除换行符<br>所以要移两次
        document .getElementById ("files").removeChild(file); //如果在表格里面不加<br>就自动换行的，可以去掉，自己把握
        if(ss<=1){ //如果选择文件按钮只剩下一个则不允许删除，即上传商品至少上传一张图片
            document.getElementById("delPic").disabled=true;
        }
    }
</script>


<jsp:include page="header.jsp"/>

<div class="container" id="container">
    <div id="page">
        <div id="content" class="publish-content">

            <div id="pub-nav">
                <ul>
                    <li class="active">
                        <a href="#page">发布商品</a>
                    </li>
                </ul>
            </div>

            <form id="J_PublishForm"  action="ReleaseGoodsServlet"
                  method="post" enctype="multipart/form-data">
                <fieldset>

                    <div id="form-bd">
                        <div class="control-group ">
                            <label class="control-label" for="title"> <strong>标题</strong>
                            </label>
                            <div class="controls">
                                <div class="input-wrap">
                                    <input id="title" type="text" class="input title" name="name" value="" required="required" />
                                    <p id="1" class="msg"> <i class="ati"></i>
                                        请再输入一次
                                    </p>
                                </div>
                            </div>
                        </div>
                        <div class="control-group ">
                            <label class="control-label">
                                <strong>种类</strong>
                            </label>
                            <div class="controls">
                                <div class="input-wrap">
                                    <input  type="text" class="input title" name="category" value="" required="required"/>
                                    <p id="2" class="msg"> <i class="ati"></i>
                                        请再输入一次
                                    </p>
                                </div>
                            </div>

                        </div>
                        <div class="control-group ">
                            <label class="control-label">
                                <strong>数量</strong>
                            </label>
                            <div class="controls">
                                <div class="input-wrap">
                                    <input  type="text" class="input title" name="num" value="" required="required"/>
                                    <p id="3" class="msg"> <i class="ati"></i>
                                        请再输入一次
                                    </p>
                                </div>
                            </div>
                        </div>

                        <input type="hidden" name="_fm.i._0.it" value="b"/>

                        <div id="J_Price"  >
                            <div class="control-group ">
                                <label class="control-label" for="price">
                                    <strong>价格</strong>
                                </label>
                                <div class="controls">
                                    <div class="input-wrap input-append">
                                        <input id="price" type="text" class="input J_PriceCheck" name="price" value="" data-min="0.01"  required="required"/>
                                        <p id="4" class="msg add-on"> <i class="ati"></i>
                                            请再输入一次
                                        </p>
                                    </div>
                                </div>
                            </div>


                        </div>


                        <div class="control-group ">
                            <label class="control-label">
                                <strong>校区</strong>
                            </label>
                            <div class="controls">
                                <div class="input-wrap">
                                    <!--<input  type="text" class="input title" name="address" value="" required="required"/>-->
                                    <select class="input J_PriceCheck" name="address">
                                        <option ></option>
                                        <option >南区</option>
                                        <option >南岭</option>
                                        <option >新民</option>
                                        <option >朝阳</option>
                                        <option >南湖</option>
                                        <option >和平</option>
                                    </select>
                                    <p id="5" class="msg"> <i class="ati"></i>
                                        请再输入一次
                                    </p>
                                </div>
                            </div>
                        </div>


                        <div class="control-group ">
                            <label class="control-label">
                                <strong>图片</strong>
                            </label>
                            <div class="controls" id="files1">
                                <div class="input-wrap" id="files">
                                    <input class="filePrew" title="支持jpeg、png格式，文件小于5M" tabIndex="3" type="file" size="3" name="file1" accept="image/jpeg,image/png">
                                </div>
                                <input id="addPic" type="button" class="btn btn-green btn-publish" value="添加图片" onclick="addFile()" >
                                <input id="delPic" class="btn btn-green btn-publish" type="button" value="删除图片" onclick="deleteFile()" disabled="">
                            </div>
                        </div>

                        <div class="control-group ">
                            <label class="control-label">
                                <strong>宝贝描述</strong>
                                <br/>
                                <!--<span class="optional">选填</span>-->
                            </label>
                            <div class="controls">
                                <div id="J_ItemDescWrapper" class="nice-textarea">
                                    <textarea id="J_ItemDesc"  data-first="true"  class="item-desc-textarea ks-editor-textarea" data-maxlength="25000" data-msgbox-id="J_MsgBoxDesc" name="_fm.i._0.de" value="" required="required"></textarea>
                                    <p id="7" class="msg"> <i class="ati"></i>
                                        请再输入一次
                                    </p>
                                </div>
                            </div>
                        </div>

                        <input name='_tb_token_' type='hidden' value='Yd8nQubnyHn448'>
                        <input type="hidden" id="J_UserId" name="_fm.i._0.u" value="1921625535"/>
                        <input type="hidden" id="J_ItemId" name="_fm.i._0.i" value="525346265609"/>
                        <input type="hidden" id="J_Edit" name="_fm.i._0.is" value="false"/>
                        <input type="hidden" name="_fm.i._0.s" value="pc"/>
                        <input type="hidden" name="_fm.i._0.isf" value="true"/>
                        <input type="hidden" name="src" value=""/>
                        <input type="hidden" name="action" value="itemAction"/>
                        <input type="hidden" name="event_submit_do_publish" value="1"/>
                        <input type="hidden" name="themeId" value=""/>


                        <input type="hidden" id="durexParam" name="durexParam" value="">
                        <input type="hidden" id="durexParam_needcheck" name="needcheck" value="false">
                        <input type="hidden" id="durexParam_ischecked" name="ischecked" value="">

                        <input type="hidden" id="durexParam_param" name="Param" value="">
                        <div class="control-group">
                            <div class="controls">
                                <button id="tijiao" class="btn btn-green btn-publish" type="submit" name="event_submit_do_publish" disabled="" onclick="return fabu()">立刻发布</button>
              <span class="notradetype">
              </span>
                            </div>
                        </div>
                    </div>
                </fieldset>
            </form>

    <textarea id="J_EditTPL" class="hidden">
      <ul style="line-height: 22px; color: #999;">
          <li>
              1. 使用时长：
              <br/>
              例如 - 2011购买使用至今，已经有两年时间
          </li>
          <li>
              2. 新旧程度描述：
              <br/>
              例如 - 保护得很好，基本没有什么硬伤
          </li>
          <li>
              3. 存在的问题：
              <br/>
              例如 - 完好，没有任何问题
          </li>
          <li>
              4. 到手时间/有效期/适用条件：
              <br/>
              例如 - 2012年买的，现在已经使用了一年多了
          </li>
      </ul>
      <b class="arrow"></b>
    </textarea>

        </div>
        <script type="text/javascript">var cnzz_protocol = (("https:" == document.location.protocol) ? " https://" : " http://");document.write(unescape("%3Cspan id='cnzz_stat_icon_1252911424'%3E%3C/span%3E%3Cscript src='" + cnzz_protocol + "w.cnzz.com/q_stat.php%3Fid%3D1252911424' type='text/javascript'%3E%3C/script%3E"));</script>

        <div class="clearfix"> </div>
    </div>
</div>
<!---->
<div class="footer">
    <div class="container"><p class="footer-grid" id="footer-grid">
        ——·吉林大学商品交易平台·——
        <br>Copyright &copy; 2015.JLU.You come I go.</p>

    </div>  <!--
                 <script type="text/javascript">
                        $(document).ready(function() {
                            /*
                            var defaults = {
                                containerID: 'toTop', // fading element id
                                containerHoverID: 'toTopHover', // fading element hover id
                                scrollSpeed: 1200,
                                easingType: 'linear'
                            };
                            */

                            $().UItoTop({ easingType: 'easeOutQuart' });

                        });
                    </script>
                <a href="#" id="toTop" style="display: block;"> <span id="toTopHover" style="opacity: 1;"> </span></a>-->
</div>


</body>
</html>
