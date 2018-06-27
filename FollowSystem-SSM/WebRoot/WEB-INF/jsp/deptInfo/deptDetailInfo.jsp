<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>部门详情</title>
<link href="../css/bootstrap.min.css" rel="stylesheet">
<script src="js/jquery-3.2.1.min.js"></script>
<script src="../js/bootstrap.min.js"></script>

 <!-- 最新版本的 Bootstrap 核心 CSS 文件 -->
 <link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">

<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
<script
	src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"
	integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa"
	crossorigin="anonymous">
</script>

<style type="text/css">
	div.container{
		text-align: center;
		width: 600px;
	}
</style>
<script type="text/javascript">
	$(function(){
		$("#back").click(function(){
			location.href="getSubDept.do?pageNum=${deptCurrentPage}"
			
		})
		$("#edit").click(function(){
			location.href="editDept.do?deptId=${deptId}"
		})
	})
</script>
</head>
<body>
	<div class="container">
		<h2>部门详情信息</h2>	
		<table class="table table-striped table-bordered table-hover" border="1" align="center" cellspacing="0">
			<tr>
				<td>部门编号</td>
				<td>部门名称</td>
				<td>部门地址</td>
			</tr>
			<tr>
				<td>${dept.deptId}</td>
				<td>${dept.deptName}</td>
				<td>${dept.deptAddress}</td>
			</tr>
		</table>
		<input type="button" value="修改" id="edit" class="btn btn-primary">
		<input type="button" value="返回" id="back" class="btn btn-info">
	</div>
</body>
</html>