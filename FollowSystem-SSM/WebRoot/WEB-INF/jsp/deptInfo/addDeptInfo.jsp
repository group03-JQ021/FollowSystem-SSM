<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<%-- 引入 jQuery 和 Bootstrap --%>
  	<jsp:include page="/WEB-INF/jsp/snippet/ref.jsp"></jsp:include>
	<title>添加部门详细信息</title>
	
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
			/* display:inline-block;/* 设置为行内块级元素,因为margin只对块级元素有效 */ */
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
				var cnt = 0;
				var tat = $("td input").length;
				$("td input").each(function(){if ($(this).val()!="")cnt++;});

				if (cnt != tat){
					alert("填写完整后才可添加");
					return false;
				}
				alert("您已添加成功!")
			})
		})
	</script>
</head>
<body>
	<div class="container">
		<h3>添加部门信息</h3>
		<form action="addDept.do">
			<table class="table table-striped table-bordered table-hover" align="center" border="1" cellspacing="0">
				<tr>
					<td>部门名称：</td>
					<td><input type="text" name="deptName"></td>
				</tr>
				<tr>
					<td>部门地址：</td>
					<td><input type="text" name="deptAddress"></td>
				</tr>
				
			</table>
			<input type="submit" value="添加" id="addDept" class="btn btn-primary"id="addDept">&nbsp;&nbsp;
			<a class="btn btn-primary" id="backDeptInfoList">返回</a>
		</form>
	</div>
		
</body>
</html>