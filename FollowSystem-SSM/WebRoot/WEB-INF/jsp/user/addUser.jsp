<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
  <%-- 引入 jQuery 和 Bootstrap --%>
  <jsp:include page="/WEB-INF/jsp/snippet/ref.jsp"></jsp:include>

  <title>添加用户|金桥学员跟踪管理系统</title>

  <style type="text/css">
      div.container{
        width:400px;
      }

  </style>
  <script type="text/javascript" src="js/login.js">

  </script>
</head>
<body>
  <!-- 根据前次添加操作, 后台的反馈信息生成反馈消息 -->
  <c:choose>
    <c:when test="${flag}">
      <c:set var="msg" value="添加成功:${user.pwd}"></c:set>
    </c:when>
    <c:otherwise>
      <c:set var="msg" value="添加失败:${user.userName}"></c:set>
    </c:otherwise>
  </c:choose>

  <!-- 导航栏 -->
  <jsp:include page="/WEB-INF/jsp/snippet/nav.jsp"></jsp:include>

  <div class="container">

    <!-- 页面主内容 -->
    <div class="row">

      <div class="col-md-12">
        <form class="form form-horizontal" action="addUser.do" method="post">
          <div class="form-group">
            <label for="userName" class="col-sm-4 control-label">用户名</label>
            <div class="col-sm-8">
              <input type="text" class="form-control" name="userName" id="userName" placeholder="用户名">
            </div>
          </div>
          <div class="form-group">
            <label for="pwd" class="col-sm-4 control-label">初始密码</label>
            <div class="col-sm-8">
              <input type="text" class="form-control" name="pwd" id="pwd" value="u123456">
              <span class="help-block text-info">${msg}</span>
            </div>

          </div>
          <div>

          </div>
          <div class="form-group">
            <div class="col-sm-offset-4 col-sm-8">
              <button type="submit" class="btn btn-primary btn-block" id="submit-btn">提交</button>
              <button type="reset" class="btn btn-primary btn-block" id="reset-btn">重置</button>
            </div>
          </div>


        </form>
      </div>

    </div>
  </div><!-- /div.container -->
</body>
</html>
