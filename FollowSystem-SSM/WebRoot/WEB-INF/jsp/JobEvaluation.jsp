<%@page import="com.jxdedu.entity.Student"%>
<%@page import="com.jxdedu.entity.JobEvaluation"%>
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

<title>员工评价表</title>

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
	<div class="container" id="con">
		<form action="AddJobEvaluntion.do"></form>	
		<table class="table table-bordered table-hover">	
		<c:forEach var="i" items="${requestScope.date}">		
					<tr>
						<td colspan="10" align="center">${i.dateName }工作评价</td>

					</tr>
					<tr>
						<td rowspan="2">项目</td>
						<td rowspan="2">员工部门</td>
						<td rowspan="2">评价人</td>
						<td colspan="6" align="center">评价分项</td>
						<td rowspan="2">整体评价分数</td>
					</tr>
					<tr>
					<%--具体的评分分项 --%>
						<c:forEach var="j" items="${requestScope.option}">						
								<td>${j.optionName}</td>
						</c:forEach>
					</tr>
					<tr >
						<td>工作评价</td>
						<c:forEach var="dept" items="${requestScope.dept }">
						<td>${dept.deptName }</td>
						</c:forEach>
						<%--评价人 --%>
						<c:set var="l" value="true"></c:set>
						<c:forEach var="s" items="${requestScope.list1}">
						<c:if test="${s.dateId==i.dateId }">			
									<td>${s.evaluatePerson }</td>
									<c:set var="l" value="false"></c:set>
						</c:if>									
						</c:forEach>
						<c:if test="${l }">
						<td></td>
						</c:if>
						<%--评分分项对应的得分 --%>
						<c:set var="li" value="true"></c:set>
						<c:forEach var="j" items="${requestScope.list}"  >
							<c:if test="${j.dateId==i.dateId}">
										<td>${j.evaluateScore}</td>
										<c:set var="li" value="false"></c:set>
							</c:if>
							</c:forEach>
							<c:if test="${li }">
							<c:forEach begin="1" end="6">
						<td></td>
						</c:forEach>
						</c:if>
						<%--总分数 --%>
						<c:set var="lis" value="true"></c:set>
						<c:forEach var="k" items="${requestScope.list1}" >
						<c:if test="${k.dateId==i.dateId }">
									<td>${k.totalScore }</td>
									<c:set var="lis" value="false"></c:set>
								</c:if>	
								</c:forEach>
									<c:if test="${lis }">
						<td></td>
						</c:if>
					</tr>
					<tr>
					<c:set var="list" value="true"></c:set>
					<c:forEach var="k" items="${requestScope.list1}" >			
						<c:if test="${k.dateId==i.dateId }">
								<td>评价（包括主要优点及缺陷）</td>							
								<td colspan="9" align="center">${k.jobEvaluateContent}</td>
								<c:set var="list" value="false"></c:set>
							</c:if>	
						
								</c:forEach>
								<c:if test="${list }">
								<td>评价（包括主要优点及缺陷）</td>
							<td colspan="9" align="center"></td>									
					</c:if>
					</tr>
						</c:forEach>		
				
		</table>
		
	</div>
</body>
</html>
