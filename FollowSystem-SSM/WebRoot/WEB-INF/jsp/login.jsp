<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
  <%-- 引入 jQuery 和 Bootstrap --%>
  <jsp:include page="/WEB-INF/jsp/snippet/ref.jsp"></jsp:include>

  <title>登录|金桥学员跟踪管理系统</title>

  <style type="text/css">
    .rb{
      border: solid 1px red;
    }
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
    #msg{
      color: red;
      margin-left: 2em;
    }

  </style>
  <script type="text/javascript" src="js/login.js">

  </script>
</head>

<body>
  <!-- 导航栏 -->
  <jsp:include page="/WEB-INF/jsp/snippet/nav.jsp"></jsp:include>

  <div class="container">

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
                  <div class="form-group  has-feedback" id="user-name-group">
                      <label class="sr-only" for="loginName">用户名:</label>
                      <div class="input-group">
                        <span class="input-group-addon"><span class="glyphicon glyphicon-user"></span></span>
                        <!-- 表单属性, required, HTML5新增, 表示必须填写该字段, 如果有未填写的required表单向,
                          点击提交按钮时, 浏览器会提示, 并拒绝提交 -->
                        <!-- autofocus 是 h5 新增属性, 用于加载页面后自动聚焦 -->
                        <input class="form-control" type="text" id="loginName" name="loginName"  placeholder="用户名"
                          required
                          data-toggle="popover" data-content="输入不正确" data-trigger="manual" data-placement="bottom">
                        <!-- <span class="glyphicon glyphicon-ok form-control-feedback" aria-hidden="true"></span> -->
                        <span class="form-control-feedback glyphicon" id="user-name-icon"></span>
                      </div>

                  </div>
                  <div class="form-group" id="password-group">
                    <label class="col sr-only">密码:</label>
                    <div class="input-group has-feedback">
                      <span class="input-group-addon"><span class="glyphicon glyphicon-lock"></span></span>
                      <!-- pttern 是h5新增属性,用于验证表单元素的输入内容, pattern 是 JavaScript 中的正则表达式语法
                          默认, 当提交表单时, 浏览器执行验证; 若验证失败, 则浏览器拒绝提交, 并给出提示;
                          title 属性的值被用作提示信息; 如果没有, 浏览器将使用默认提示.
                      -->
                      <input class="form-control" type="password" name="loginPassword" id="password" placeholder="登录密码"
                        required pattern="[\w@*$]{6,21}"
                        data-toggle="popover"  data-content="密码长度6~21位, 仅允许数字字母下划线@*$"
                        data-trigger="manual" data-placement="bottom">
                      <span class="form-control-feedback glyphicon" id="password-icon"></span>
                    </div>
                  </div>
                  <div class="form-group">
                    <div class="checkbox">
                      <label>
                        <input type="checkbox" name="remember">记住我
                      </label>
                    </div>

                  </div>
                  <div class="form-group has-feedback">
                      <button type="submit" class="btn btn-primary btn-block" id="submit-btn">登录</button>
                      <button type="reset" class="btn btn-primary btn-block" id="reset-btn">重置</button>
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
