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
    <title>������Ʒ</title>
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
    <meta name="description" content="���������������ִ�ѧ��Ʒ����ƽ̨��Ϊʦ���ṩ��Ʒ���ף������ֽ��ף�������Ʒ����Ϣ���������������ࡢ��ģС���ص㡣���������������˼�ʱ����ݡ���ȫ����Ʒ����ƽ̨��">
    <meta name="keywords" content="���󣬼�����֣�����2�֣�������ֽ��ף��������ã����󽻻���������Ʒ�г���������ɧ����������" />
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
            alert("����������ѡ���ļ���ť�����ͼƬ");
        }else{
            var upFile = '<a class=btn_addPic href="javascript:void(0);"><br><br><input class="filePrew" title="֧��jpeg��png��ʽ���ļ�С��5M" tabIndex="3" type="file" size="3" name="file1" accept="image/jpeg,image/png"></a>';
            document .getElementById ("files").insertAdjacentHTML("beforeEnd",upFile);
            var ss = document.getElementsByName("file1").length;
            if(ss>1){ //�����ڶ���һ���ļ�ѡ��ťʱ���ɵ��ɾ����
                document.getElementById("delPic").disabled=false;
            }
        }
    }

    function deleteFile(){
        var file = document .getElementById ("files").lastChild;
        if(file == null)
            return;
        file = document .getElementById ("files").lastChild; //�Ƴ����з�<br>����Ҫ������
        document .getElementById ("files").removeChild(file); //����ڱ�����治��<br>���Զ����еģ�����ȥ�����Լ�����
        if(ss<=1){ //���ѡ���ļ���ťֻʣ��һ��������ɾ�������ϴ���Ʒ�����ϴ�һ��ͼƬ
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
                        <a href="#page">������Ʒ</a>
                    </li>
                </ul>
            </div>

            <form id="J_PublishForm"  action="ReleaseGoodsServlet"
                  method="post" enctype="multipart/form-data">
                <fieldset>

                    <div id="form-bd">
                        <div class="control-group ">
                            <label class="control-label" for="title"> <strong>����</strong>
                            </label>
                            <div class="controls">
                                <div class="input-wrap">
                                    <input id="title" type="text" class="input title" name="name" value="" required="required" />
                                    <p id="1" class="msg"> <i class="ati"></i>
                                        ��������һ��
                                    </p>
                                </div>
                            </div>
                        </div>
                        <div class="control-group ">
                            <label class="control-label">
                                <strong>����</strong>
                            </label>
                            <div class="controls">
                                <div class="input-wrap">
                                    <input  type="text" class="input title" name="category" value="" required="required"/>
                                    <p id="2" class="msg"> <i class="ati"></i>
                                        ��������һ��
                                    </p>
                                </div>
                            </div>

                        </div>
                        <div class="control-group ">
                            <label class="control-label">
                                <strong>����</strong>
                            </label>
                            <div class="controls">
                                <div class="input-wrap">
                                    <input  type="text" class="input title" name="num" value="" required="required"/>
                                    <p id="3" class="msg"> <i class="ati"></i>
                                        ��������һ��
                                    </p>
                                </div>
                            </div>
                        </div>

                        <input type="hidden" name="_fm.i._0.it" value="b"/>

                        <div id="J_Price"  >
                            <div class="control-group ">
                                <label class="control-label" for="price">
                                    <strong>�۸�</strong>
                                </label>
                                <div class="controls">
                                    <div class="input-wrap input-append">
                                        <input id="price" type="text" class="input J_PriceCheck" name="price" value="" data-min="0.01"  required="required"/>
                                        <p id="4" class="msg add-on"> <i class="ati"></i>
                                            ��������һ��
                                        </p>
                                    </div>
                                </div>
                            </div>


                        </div>


                        <div class="control-group ">
                            <label class="control-label">
                                <strong>У��</strong>
                            </label>
                            <div class="controls">
                                <div class="input-wrap">
                                    <!--<input  type="text" class="input title" name="address" value="" required="required"/>-->
                                    <select class="input J_PriceCheck" name="address">
                                        <option ></option>
                                        <option >����</option>
                                        <option >����</option>
                                        <option >����</option>
                                        <option >����</option>
                                        <option >�Ϻ�</option>
                                        <option >��ƽ</option>
                                    </select>
                                    <p id="5" class="msg"> <i class="ati"></i>
                                        ��������һ��
                                    </p>
                                </div>
                            </div>
                        </div>


                        <div class="control-group ">
                            <label class="control-label">
                                <strong>ͼƬ</strong>
                            </label>
                            <div class="controls" id="files1">
                                <div class="input-wrap" id="files">
                                    <input class="filePrew" title="֧��jpeg��png��ʽ���ļ�С��5M" tabIndex="3" type="file" size="3" name="file1" accept="image/jpeg,image/png">
                                </div>
                                <input id="addPic" type="button" class="btn btn-green btn-publish" value="���ͼƬ" onclick="addFile()" >
                                <input id="delPic" class="btn btn-green btn-publish" type="button" value="ɾ��ͼƬ" onclick="deleteFile()" disabled="">
                            </div>
                        </div>

                        <div class="control-group ">
                            <label class="control-label">
                                <strong>��������</strong>
                                <br/>
                                <!--<span class="optional">ѡ��</span>-->
                            </label>
                            <div class="controls">
                                <div id="J_ItemDescWrapper" class="nice-textarea">
                                    <textarea id="J_ItemDesc"  data-first="true"  class="item-desc-textarea ks-editor-textarea" data-maxlength="25000" data-msgbox-id="J_MsgBoxDesc" name="_fm.i._0.de" value="" required="required"></textarea>
                                    <p id="7" class="msg"> <i class="ati"></i>
                                        ��������һ��
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
                                <button id="tijiao" class="btn btn-green btn-publish" type="submit" name="event_submit_do_publish" disabled="" onclick="return fabu()">���̷���</button>
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
              1. ʹ��ʱ����
              <br/>
              ���� - 2011����ʹ�������Ѿ�������ʱ��
          </li>
          <li>
              2. �¾ɳ̶�������
              <br/>
              ���� - �����úܺã�����û��ʲôӲ��
          </li>
          <li>
              3. ���ڵ����⣺
              <br/>
              ���� - ��ã�û���κ�����
          </li>
          <li>
              4. ����ʱ��/��Ч��/����������
              <br/>
              ���� - 2012����ģ������Ѿ�ʹ����һ�����
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
        ���������ִ�ѧ��Ʒ����ƽ̨������
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
