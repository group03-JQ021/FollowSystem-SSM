<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<%-- 引入 jQuery 和 Bootstrap --%>
  	<jsp:include page="/WEB-INF/jsp/snippet/ref.jsp"></jsp:include>
	<title>修改部门详情信息</title>
	
	<style type="text/css">
		div.container{
			text-align: center;
			width: 600px;
		}
	</style>
	<script type="text/javascript">
		$(function(){
			$("#back").click(function(){
				location.href = "getDeptByDeptId.do?deptId=${deptId}";
			})
			$("#save").click(function(){
				var cnt = 0;
				var tat = $("td input").length;
				$("td input").each(function(){if ($(this).val()!="")cnt++;});

				if (cnt != tat){
					alert("填写完整后才可保存");
					return false;
				}
				alert("您已修改成功!")
				/* setTimeout(function(){alert('您已添加成功!')},4000); */
			})
			
		}) 
	</script>
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
					<td><input type="text" name="deptId" value="${dept.deptId}" readonly="readonly"></td>
					<td><input type="text" name="deptName" value="${dept.deptName}"></td>
					<td><input type="text" name="deptAddress" value="${dept.deptAddress}"></td>
				</tr>
			</table>
			<input type="submit" value="保存" id="save" class="btn btn-primary">
			<input type="button" value="返回" id="back" class="btn btn-info">
		</form>	
		</form>	
	</div>
</body>
</html>