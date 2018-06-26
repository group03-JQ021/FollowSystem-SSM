<%@page import="com.jxdedu.entity.Student"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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

	   <link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://cdn.bootcss.com/jquery/2.1.1/jquery.min.js"></script>
    <script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<style type="text/css">
		.theadColor{
			background-color: #99ccff;
		}
	</style>

  </head>
  
  <body>
    <div class="container">
    	<div >
    		<h2>金桥学院信息表</h2>
    		<input type="text" placeholder="请输入学员姓名" name="">
    		<button class="btn btn-primary ">查询</button>
    	</div>
    	<div>
    		<table class="table table-bordered table-hover" border="1">
    			<thead>
    				<tr class="theadColor">
    					<td rowspan="2">序号</td>
    					<td rowspan="2">姓名</td>
    					<td rowspan="2">性别</td>
    					<td rowspan="2">学校</td>
    					<td rowspan="2">籍贯</td>
    					<td colspan="6"> 培训期间测试成绩</td>
    					<td rowspan="2">学校评价</td>
    					<c:forEach var="i" items="${requestScope.date }">
    					<td rowspan="2">${i.dateName }</td>
    					</c:forEach>
    				</tr>
    				<tr >
    					<c:forEach var="c" items="${requestScope.course }">
    					<td>${c.courseName}</td>
    					</c:forEach>
    					
    				</tr>
    			</thead>
    			<c:if test="${not empty requestScope.stu}">
    			<c:forEach	var="s" items="${requestScope.stu }">
    				<tr>
    					<td></td>
    					<td><a href="showJobEvaluation.do?stuid=${s.stuId}">${s.stuName}</a></td>
    					<td>${s.sex}</td>
    					<td>${s.university }</td>
    					<td>${s.birthPlace }</td>
    					<c:forEach var="e" items="${requestScope.score}"> 
    					<c:if test="${s.stuId==e.stuId}">	    								
	    					<c:if test="${e.score!=0.0 }">
	    					<td>${e.score}</td>	    				
	    					</c:if>
	    					<c:if test="${ e.score==0.0}">
	    					<td>待填写</td>
	    					</c:if>
	    				</c:if>
	    					</c:forEach>
	    				
    						<td>${s.schoolEvaluation.evaluateScore}</td>					
    					<c:forEach var="j" items="${ requestScope.j}" end="${end}">
    					<c:if test="${j.stuId==s.stuId }">
	    						<td>${j.totalScore}</td>
	    					<c:if test="${s.stuId>j.end })">
	    						<td><a href="showJobEvaluation.do?stuid=${s.stuId}">待评价</a></td>
	    						<c:set var="end" value="0"></c:set>
	    					</c:if>
	    				</c:if>
    					</c:forEach>  				
    				</tr> 					
    			</c:forEach>
		</c:if>
				<c:if test="${empty requestScope.stu }">
			<tr>
			<td rowspan="2" colspan="16" align="center">没有相关数据</td>
			</tr>
			</c:if>
    		</table>
    		<a href="getSubStudent.do?currentPage=1">首页</a>
    <a href="getSubStudent.do?currentPage=${prePage }">上一页</a>
  <select id="choice"
    	onchange="location.href='getSubStudent.do?pageNum='+this.value">
    		<c:forEach var="page" begin="1" end="${requestScope.pageCount }" step="1">
    			<c:if test="${page != currentPage }">
    				<option value="${page }">${page }/${pageCount }</option>
    			</c:if>
    			<c:if test="${page == currentPage }">
    				<option value="${page }" selected>${page }/${pageCount }</option>
    			</c:if>
    		</c:forEach>
    	</select>
    <a href="getSubStudent.do?currentPage=${nextPage }">下一页</a>
    <a href="getSubStudent.do?currentPage=${pageCount }">尾页</a>	
    </div>
  </body>
</html>
