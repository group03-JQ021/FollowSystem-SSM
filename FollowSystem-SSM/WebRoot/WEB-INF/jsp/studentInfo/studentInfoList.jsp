<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- <%@page import="java.util.List"%> --%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>学员基本信息列表</title>
<link href="css/bootstrap.min.css" rel="stylesheet">
<script src="js/jquery-3.2.1.min.js"></script>
<script src="js/bootstrap.min.js"></script>

 <!-- 最新版本的 Bootstrap 核心 CSS 文件 -->
 <link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">

<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
<script
	src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"
	integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa"
	crossorigin="anonymous">
</script>
<style type="text/css">
	div.container {
		width: 600px;
		text-align: center;
	}
	table{
		margin-top:20px;
		width:500px;
	}
</style>
</head>
<body>
	<div class="container">
		<h3>学员基本信息列表</h3>
		<form>
			<input type="text" placeholder="请输入学员编号">
			<a class="btn btn-primary">查询</a>&nbsp;&nbsp;
			<a class="btn btn-primary">添加</a>&nbsp;&nbsp;
			<a class="btn btn-danger">删除</a>
			<table class="table table-striped table-bordered table-hover" align="center" border="1" cellspacing="0">
				<tr>
					<td><input type="checkbox">全选</td>
					<td>学生编号</td>
					<td>学生姓名</td>
					<td>学生性别</td>
					<td>联系电话</td>
					<td>部门名称</td>
				</tr>
				<c:choose>
					<c:when test="${not empty list}">
						<c:forEach var="stu" items="${list}" >
						
							<tr>
								<td><input type="checkbox"></td>
								<td>${stu.stuId}</td>
								<td>${stu.stuName}</td>
								<td>${stu.sex}</td>
								<td>${stu.telephone}</td>
								<td><%-- ${stu.deptName} --%></td>
							</tr>
						</c:forEach>
					</c:when>
					<c:otherwise>
						获取不到数据
					</c:otherwise>
				</c:choose>
			</table>
			<a href="getSubStudent.do?pageNum=1">首页</a>
			<a href="getSubStudent.do?pageNum=${prePage }">上一页</a>
			<select>
				<option>1</option>
				<option>2</option>
			</select>
			<a href="getSubStudent.do?pageNum=${nextPage }">下一页</a>
			<a href="getSubStudent.do?pageNum=${pageCount}">末页</a>
		</form>
	</div>
</body>
</html>