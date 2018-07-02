<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>添加部门详细信息</title>
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
		div.container {
			width: 600px;
			text-align: center;
		}
		table{
			margin-top:20px;
			width:250px;
		}
		table tr{
			margin-top:20px;
			display:inline-block;/* 设置为行内块级元素,因为margin只对块级元素有效 */
		}
	</style>
	<script type="text/javascript">
		$(function(){
			$("#backDeptInfoList").click(function(){
				location.href="getSubDept.do?pageNum=${deptCurrentPage}"
			})
		})
		
		$(function(){
			$("#addDept").click(function(){
				alert("您已添加成功!")
				/* setTimeout(function(){alert('您已添加成功!')},4000); */
			})
		})
	</script>
</head>
<body>
	<div class="container">
		<h3>添加部门信息</h3>
		<form action="addDept.do">
			<table class="center-block info active">
				<tr>
					<td>部门名称：</td>
					<td><input type="text" name="deptName"></td>
				</tr>
				<tr>
					<td>部门地址：</td>
					<td><input type="text" name="deptAddress"></td>
				</tr>
				<tr>
					<td colspan="2">
						<input type="submit" value="添加" class="btn btn-primary"id="addDept">&nbsp;&nbsp;
						<a class="btn btn-primary" id="backDeptInfoList">返回</a>
					</td>
				</tr>
			</table>
			
		</form>
	</div>
		
</body>
</html>