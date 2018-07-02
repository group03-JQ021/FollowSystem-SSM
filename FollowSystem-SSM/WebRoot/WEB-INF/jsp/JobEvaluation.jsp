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
<style>
td{
	text-align:center
}
</style>
<body>
		<h2 align="center">金桥学院成长跟踪表</h2>
		<p>
		<p align="right" class="container"><input type="button" value="返回" onclick="javascript:location.href='StudentManage.do?currentpage=${currentPage}'"></p>
	<div class="container" id="con">	
		<table class="table table-bordered table-hover">			
					<tr>
						<td>姓名</td>
						<td>${student.stuName }</td>
						<td>性别</td>						
						<td colspan="3">${student.sex }</td>
						<td>民族</td>
						<td>${student.nation}</td>
						<td colspan="2" rowspan="4"><img src="${student.photo }" width="150px" height="200px" ></td>						
					</tr>
					<tr>
						<td>出生年月</td>
						<td>${student.birthday }</td>
						<td>籍贯</td>
						<td colspan="3">${student.birthPlace }</td>
						<td>婚否</td>
						<td>${student.marry }</td>
					</tr>
					<tr>						
						<td>联系电话</td>
						<td colspan="2">${student.telephone }</td>
						<td colspan="3">身份证号码</td>
						<td colspan="2">${student.idCard }</td>
					</tr>
					<tr>						
						<td>毕业学校</td>
						<td colspan="2">${student.university }</td>
						<td colspan="3">专业</td>
						<td colspan="2">${student.major }</td>
					</tr>
					<tr>
						<td>备注</td>
						<td colspan="9">${student.note }</td>
					</tr>
			<c:if test="${role.roleName eq '教师' ||role.roleName eq '高管'}">					
					<tr>
						<td colspan="10" align="center">培训学校评价</td>

					</tr>
					<tr>
						<td rowspan="2">培训学校</td>
						<td rowspan="2">班期</td>
						<td rowspan="2">评价人</td>
						<td colspan="6">培训期间测试成绩</td>
						<td rowspan="2">整体评价分数</td>
					</tr>
					<tr>
					<c:forEach var="cou" items="${requestScope.course}">
						<td>${cou.courseName }</td>
						</c:forEach>
					</tr>
					<tr>
					<td>学习评价</td>
					<c:forEach var="classes" items="${requestScope.cds }">
						<c:if test="${student.classId==classes.classId }">
							<td>${classes.className }</td>
						</c:if>
					</c:forEach>		
							<td>${schools.evaluatePerson }</td>
					<c:set var="cn" value="0"></c:set>
							<c:forEach var="e" items="${requestScope.score}">							
									<c:if test="${e.courseId == course[cn].courseId}">
										<td>${e.score}</td>																			
									</c:if>
									<c:if test="${e.courseId != course[cn].courseId}">
									<c:forEach begin="${course[cn].courseId}" end="6">
									<c:if test="${e.courseId == course[cn].courseId}">
										<td>${e.score}</td>									
									</c:if>
									<c:if test="${e.courseId != course[cn].courseId}">
									<td></td>									
									</c:if>
									<c:set var="cn" value="${cn+1}"></c:set>
									</c:forEach>
									</c:if>
									<c:set var="cn" value="${cn+1}"></c:set>
							</c:forEach>
							<c:forEach begin="${cn+1}" end="6">
								<td></td>
							</c:forEach>	
							<td>${schools.evaluateScore }</td>					
					</tr>
					<tr>
								<td>评价(包括主要
								<br>优点及缺陷)
								</td>						

							<td colspan="9" align="center">			
								${schools.evaluateContent }</td>													
					</tr>
			</c:if>
	<c:if test="${role.roleName eq '项目经理' ||role.roleName eq '高管'}">
		<c:forEach var="i" items="${requestScope.date}">		
					<tr>
						<td colspan="10">${i.dateName }工作评价</td>

					</tr>
					<tr>
						<td rowspan="2">项目</td>
						<td rowspan="2">员工部门</td>
						<td rowspan="2">评价人</td>
						<td colspan="6" >评价分项</td>
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
					<tr height="100px">
					<c:set var="list" value="true"></c:set>
					<c:forEach var="k" items="${requestScope.list1}" >			
						<c:if test="${k.dateId==i.dateId }">
								<td>评价(包括主要
								<br>优点及缺陷)</td>							
								<td colspan="9">${k.jobEvaluateContent}</td>
								<c:set var="list" value="false"></c:set>
							</c:if>	
						
								</c:forEach>
								<c:if test="${list }">
								<td>评价(包括主要
								<br>优点及缺陷)</td>
							<td colspan="9"></td>									
					</c:if>
					</tr>
			</c:forEach>		
	</c:if>
		</table>
		
	</div>
</body>
</html>
