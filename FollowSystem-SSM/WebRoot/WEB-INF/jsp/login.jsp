<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
  <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <title>登录|金桥学员跟踪管理系统</title>

    <!-- Bootstrap -->
    <link href="css/bootstrap.min.css" rel="stylesheet">

    <!-- HTML5 shim 和 Respond.js 是为了让 IE8 支持 HTML5 元素和媒体查询（media queries）功能 -->
    <!-- 警告：通过 file:// 协议（就是直接将 html 页面拖拽到浏览器中）访问页面时 Respond.js 不起作用 -->
    <!--[if lt IE 9]>
      <script src="https://cdn.bootcss.com/html5shiv/3.7.3/html5shiv.min.js"></script>
      <script src="https://cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

    <!-- jQuery (Bootstrap 的所有 JavaScript 插件都依赖 jQuery，所以必须放在前边) -->
    <script src="js/jquery-3.2.1.min.js"></script>
    <!-- 加载 Bootstrap 的所有 JavaScript 插件。你也可以根据需要只加载单个插件。 -->
    <script src="js/bootstrap.min.js"></script>

  <!-- 自定义代码与样式 -->
  <script src="js/customized.js"></script>
  <link rel="stylesheet" href="css/customize.css">

  <style type="text/css">
    #login-container{
      width: 300px;
    }
    #login-container div[class*=tab-content]{
      min-height:220px;

    }

    /*border:solid 1px red;*/
    #logo-container{
      margin-top:80px;
      /*border:solid 1px red;*/
    }
    #logo-container img{
      height:90px;
    }

  </style>
  <script type="text/javascript">
    $(function () {
      // 启用js插件: 弹出框
      $('[data-toggle="popover"]').popover();

      // 表单输入域都得非空
      $("input[required]").blur(function () {
          if ($(this).val() == ""){
              $(this).popover("show");
              $(this).parent().addClass("has-error");
          }else{
              $(this).parent().removeClass("has-error").addClass("has-success");
              $(this).addClass("glyphicon glyphicon-ok");
          }
      }).focus(function() {
          $(this).popover("hide");
      });


    });
  </script>
</head>

<body>
<div class="container">
  <!-- 导航菜单 -->
  <!-- 目前为空 -->
  <nav class="navbar navbar-inverse"></nav>
  <!-- 页面主内容 -->
  <div class="row">
    <div class="col-md-3"></div>
    <!-- logo图片 -->
    <div class="col-md-5" id="logo-container" >
      <img src="img/logo.png" alt="">
    </div>
    <!-- 登录框 -->
    <div class="col-md-4" id="login-container">
      <ul class="nav nav-tabs nav-justified">
        <li class="active"><a data-toggle="tab" href="#menu1">账号密码登录</a></li>
        <!-- <li class="disabled" title="抱歉, 功能尚不可用"><a  data-toggle="tab" href="#menu2">快速登录</a></li> -->
        <li><a  data-toggle="tab" href="#menu2">快速登录</a></li>
      </ul>
      <div class="tab-content panel panel-default">
        <div id="menu1" class="tab-pane fade in active panel-body ">
            <form class="form" action="login.do" method="post">
                <div class="form-group has-feedback">
                    <label class="sr-only" for="userName">用户名:</label>
                    <!-- 表单属性, required, HTML5新增, 表示必须填写该字段, 如果有未填写的required表单向,
                      点击提交按钮时, 浏览器会提示, 并拒绝提交 -->
                    <!-- autofocus 是 h5 新增属性, 用于加载页面后自动聚焦 -->
                    <input class="form-control" type="text" id="userName" name="loginName"  placeholder="输入用户名"
                       title="请输入用户名" required
                       data-toggle="popover" data-trigger="manual" data-placement="left">
                    <!-- <span class="glyphicon glyphicon-ok form-control-feedback" aria-hidden="true"></span> -->

                </div>
                <div class="form-group has-feedback">
                    <label class="col sr-only">密码:</label>
                    <!-- pttern 是h5新增属性,用于验证表单元素的输入内容, pattern 是 JavaScript 中的正则表达式语法
                        默认, 当提交表单时, 浏览器执行验证; 若验证失败, 则浏览器拒绝提交, 并给出提示;
                        title 属性的值被用作提示信息; 如果没有, 浏览器将使用默认提示.
                    -->

                    <input class="form-control" type="password" name="loginPassword" placeholder="输入登录密码"
                      required pattern="[\w@*$]{3,21}"
                      data-toggle="popover"  data-content="密码长度6~21位, 仅允许数字字母下划线@*$" data-trigger="manual" data-placement="left">
                </div>
                <div class="form-group has-feedback">
                  <div class="checkbox">
                    <label>
                      <input type="checkbox" name="remember">记住我
                    </label>
                  </div>

                </div>
                <div class="form-group has-feedback">
                    <button type="submit" class="btn btn-primary btn-block">登录</button>
                </div>
            </form>
        </div>
        <div id="menu2" class="tab-pane fade panel-body">
          <p>快速登录暂未实现</p>
        </div>
      </div>
    </div>

  </div>


</body>
</html>
