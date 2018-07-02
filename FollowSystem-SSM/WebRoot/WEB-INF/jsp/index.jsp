<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
  <meta charset="utf-8">
  <%-- 引入 jQuery 和 Bootstrap --%>
  <jsp:include page="/WEB-INF/jsp/snippet/ref.jsp"></jsp:include>

  <title>主页</title>
  <style type="text/css">
    div.container{
      width:400px;
      margin-top:50px;
    }
  </style>
</head>
<body>
<div class="container text-center">
  <div class="btn-group">
    <a class="btn btn-default" href="pagingShowUser.do" >管理员页面</a>
    <a class="btn btn-default" href="getSubDept.do">部门</a>
  </div>

</div>

</body>
</html>
