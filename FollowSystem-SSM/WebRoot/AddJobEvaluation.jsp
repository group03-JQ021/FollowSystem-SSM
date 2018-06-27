<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>添加员工评价</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<link rel="stylesheet"
	href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css">
	
<script src="https://cdn.bootcss.com/jquery/2.1.1/jquery.min.js"></script>
<script
	src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>
<div align="center" style="margin-top:50px">
<c:forEach var="d" items="${date }">
<c:if test="${d.dateId==param.dateid }">
<h2>${d.dateName}</h2>
</c:if>
</c:forEach>
<form action="addJobEvaluation.do">
<table>
<tr><td> 评价人：</td><td><input name="optionname"><p></td></tr>
 <c:forEach var="l" items="${option}">
 <tr><td>${l.optionName }:</td><td><input name="evaluateScore"><p></td></tr>
 </c:forEach>
 <tr><td>整体评分分数：</td><td><input name="totalScore"><p></td></tr>
 <tr> <td>评价(包括主要优点及缺陷):</td><td><textarea rows="2" cols="22" name="jobEvaluateContent">
 </textarea><p></td></tr>
 <tr>
 	<td colspan="2" align="center">
 		<input type="submit" value="提交">
  		<input type="button" value="取消" onclick="javascript:location.href='studentManage.do'">
  	</td>
  </tr>
  </table>
</form>
</div>
</body>
</html>