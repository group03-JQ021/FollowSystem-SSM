<%@page language="java" contentType="text/html; charset=UTF-8"
		pageEncoding="UTF-8"%><%@page import="com.jxdedu.entity.Dept"%>

<%@page import="java.util.List"%>
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
<script type="text/javascript">
	$(document).ready(function(){
		//模糊查询
		$("#fuzzySearchDept").click(function(){
			var deptId = $("#search").val;
			location.href="fuzzySearchDept.do?deptId="${deptId}
		});
		
		$("#allSel").click(function(){
			if($(this).is(':checked')){
				$("[name='subSel']").prop('checked',true);
			} else {
				$("[name='subSel']").prop('checked',false);
			}
		});
		
		//给下面的复选框设置click事件
		 $("[name='subSel']").click(function(){
			var sub_arr = $("[name='subSel']:checked");
			if(sub_arr.length == $("[name='subSel']").length){
				$("#allSel").prop('checked',true);
			}else {
				$("#allSel").prop('checked',false);
			}
		});
		
		//选择页数监听
		$("#selPage").change(function(){
			location.href="getSubDept.do?pageNum="+$(this).val();
		})
	}) 
</script>
</head>

<body>
	<div class="container">
		<h2>组织部门信息列表</h2>
		<input type="text" placeholder="请输入部门编号" id="search" name="${search}"> 
		<a class="btn btn-primary" id="fuzzySearchDept">查询</a>&nbsp;&nbsp;
		<a class="btn btn-primary" href="getAddDeptPage.do">添加</a>&nbsp;&nbsp;
		<a class="btn btn-danger" id="">删除</a>&nbsp;&nbsp;
		
		<table class="table table-striped table-bordered table-hover" align="center" border="1" cellspacing="0">
			<tr>
				<td><input type="checkbox" id="allSel">全选</td>
				<td>部门编号</td>
				<td>部门名称</td>
				<td>部门地址</td>
			</tr>
			<!-- 表格数据是动态生成的，需要根据后台传来的数据而决定 -->
			<c:choose>
				<c:when test="${not empty list}">
					<%-- ${list} --%>
					<c:forEach var="it" items="${list}">
						<tr>
							<td> <input type="checkbox" name="subSel" value="${it.deptId}"></td>
							<td><a href="getDeptByDeptId.do?deptId=${it.deptId}">${it.deptId}</a></td>
							<td>${it.deptName}</td>
							<td>${it.deptAddress}</td>
						</tr>
					</c:forEach>
				</c:when>
				<c:otherwise>
					没有数据
				</c:otherwise>
			</c:choose>
			
		</table>
			<a href="getSubDept.do?pageNum=1">首页</a> 
			<a href="getSubDept.do?pageNum=${prePage }">上一页</a>
			<select id="selPage">
				<c:forEach var="i" begin="1" end="${pageCount}" step="1" >
					<option value="${i}" ${i == deptCurrentPage?"selected":""} >${ i}/${pageCount}</option>
				</c:forEach>
			</select>
		<a href="getSubDept.do?pageNum=${nextPage}">下一页</a> 
			<a href="getSubDept.do?pageNum=${pageCount }">末页</a>
	</div>
</body>
