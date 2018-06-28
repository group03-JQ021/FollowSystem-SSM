<%@page import="com.jxdedu.entity.Student"%>
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

<title>学员信息表</title>

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
<style type="text/css">
.theadColor {
	background-color: #99ccff;
}
</style>

</head>

<body>
	<div class="container">
		<div>
			<h2>金桥学院信息表</h2>
			<input type="text" placeholder="请输入学员姓名" name="">
			<button class="btn btn-primary ">查询</button>
		</div>
		<div>
			<table class="table table-bordered table-hover" border="1">
					<tr class="theadColor">
						<td rowspan="2">序号</td>
						<td rowspan="2">姓名</td>
						<td rowspan="2">性别</td>
						<td rowspan="2">学校</td>
						<td rowspan="2">籍贯</td>
						<td colspan="6" align="center">培训期间测试成绩</td>
						<td rowspan="2">学校评价</td>
						<%--通过循环得到年限--%>
						<c:forEach var="i" items="${requestScope.date }" varStatus="dt">
							<td rowspan="2">${i.dateName }</td>
							<c:set var="ends" value="${dt.count }"></c:set>
						</c:forEach>
					</tr>
					<tr>
						<c:forEach var="c" items="${requestScope.course }">
							<td>${c.courseName}</td>
						</c:forEach>
					</tr>

				
				<c:if test="${not empty requestScope.stu}">
					<c:forEach var="s" items="${requestScope.stu }" varStatus="sta">
						<tr>
							<td>${sta.count}</td>
							<td><a href="showJobEvaluation.do?stuid=${s.stuId}">${s.stuName}</a></td>
							<td>${s.sex}</td>
							<td>${s.university }</td>
							<td>${s.birthPlace }</td>
							
							<!-- 培训期间测试成绩 -->	
							
							<c:set var="cn" value="0"></c:set>
							<c:forEach var="e" items="${requestScope.score}">
								<c:if test="${s.stuId==e.stuId}">								
									<c:if test="${e.courseId == course[cn].courseId}">
										<td>${e.score}</td>																			
									</c:if>
									<c:if test="${e.courseId != course[cn].courseId}">
									<c:forEach begin="${course[cn].courseId}" end="6">
									<c:if test="${e.courseId == course[cn].courseId}">
										<td>${e.score}</td>									
									</c:if>
									<c:if test="${e.courseId != course[cn].courseId}">
									<td>待填写</td>									
									</c:if>
									<c:set var="cn" value="${cn+1}"></c:set>
									</c:forEach>
									</c:if>
									<c:set var="cn" value="${cn+1}"></c:set>
								</c:if>
							</c:forEach>
							<c:forEach begin="${cn+1}" end="6">
								<td>待填写</td>
							</c:forEach>
							
							<c:set var="cn" value="${0}"></c:set>
							<c:set var="list" value="true"></c:set>
							<c:forEach var="sch" items="${requestScope.school }">
								<c:if test="${sch.stuId==s.stuId }">
									<td>${sch.evaluateScore}</td>
									<c:set var="list" value="false"></c:set>
								</c:if>
							</c:forEach>
							<c:if test="${list }">
								<td>待填写</td>
							</c:if>
							<%--得到每年对应的评价总分 --%>
							<c:forEach var="j" items="${ requestScope.j}">
								<c:if test="${j.stuId==s.stuId }">
									<td>${j.totalScore}</td>
									<c:set var="cnt" value="${cnt+1}"></c:set>
								</c:if>
							</c:forEach>
							<%--对未评价的年份设置为待评价 --%>
							<c:forEach begin="${cnt+1}" end="${ends}" varStatus="status">
								<td><a
									href="AddJobEvaluation.jsp?stuid=${s.stuId}&dateid=${status.count+cnt}">待评价</a></td>
							</c:forEach>
							<c:set var="cnt" value="${0}"></c:set>
						</tr>
					</c:forEach>
				</c:if>
				<c:if test="${empty requestScope.stu }">
					<tr>
						<td rowspan="2" colspan="16" align="center">没有相关数据</td>
					</tr>
				</c:if>
			</table>
			<div align="center">
			<a href="getSubStudent.do?currentPage=1">首页</a> <a
				href="getSubStudent.do?currentPage=${prePage }">上一页</a> 
				<select	id="choice"
				onchange="location.href='getSubStudent.do?currentPage='+this.value">
				<c:forEach var="page" begin="1" end="${requestScope.pageCount }"
					step="1">
						<c:if test="${page != currentPage }">
    				<option value="${page }">第${page }页</option>
    			</c:if>
    			<c:if test="${page == currentPage }">
    				<option value="${page }" selected>第${page }页</option>
    			</c:if>
				</c:forEach>
			</select> <a href="getSubStudent.do?currentPage=${nextPage }">下一页</a> <a
				href="getSubStudent.do?currentPage=${pageCount }">尾页</a>
				</div>
		</div>
</body>
</html>
