<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%-- 引入 jQuery 和 Bootstrap --%>
<jsp:include page="/WEB-INF/jsp/snippet/ref.jsp"></jsp:include>
<title>部门详情</title>


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