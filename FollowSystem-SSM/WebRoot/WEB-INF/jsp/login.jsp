<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">

    <title>登录页面</title>

	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>

  <body>
    <div align="center" sytle="margin-top:100px">
    	<h3>登录页面</h3>
    	<form action="login.do" method="post">
    		<input placeholder="请输入用户名" name="loginName">
    		<br><br>
			<input placeholder="请输入密码" name="loginPassword">
			<br><br>
			<input type="submit" value="登录">
    	</form>
    	${loginMsg}
    </div>
  </body>
</html>
