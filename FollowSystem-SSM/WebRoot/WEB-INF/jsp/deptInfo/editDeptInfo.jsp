<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>修改部门详情信息</title>
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
	<!-- <script type="text/javascript">
		$(function(){
			$("#save").click(function(){
				location.href="getDeptByDeptId.do"
			})
			
		})
		$("#save").click(function(){
			alert("修改成功!")
		})
	</script> -->
</head>
<body>
<div class="container">
		<h2>修改部门详情信息</h2>
		<form action="saveDept.do" method="post">
			<table class="table table-striped table-bordered table-hover" border="1" align="center" cellspacing="0">
				<tr>
					<td>部门编号</td>
					<td>部门名称</td>
					<td>部门地址</td>
				</tr>
				<tr>
					<td><input name="deptId" value="${dept.deptId}" readonly="readonly"></td>
					<td><input name="deptName" value="${dept.deptName}"></td>
					<td><input name="deptAddress" value="${dept.deptAddress}"></td>
				</tr>
			</table>
			<input type="submit" value="保存" id="save" class="btn btn-primary">
		</form>	
	</div>
</body>
</html>