<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%-- 引入 jQuery 和 Bootstrap --%>
<jsp:include page="/WEB-INF/jsp/snippet/ref.jsp"></jsp:include>
<title>修改评价分项信息</title>
	
	<style type="text/css">
		div.container{
			text-align: center;
			width: 600px;
		}
	</style>
	<script type="text/javascript">
		$(function(){
			$("#back").click(function(){
				location.href = "getJobEOByOptionId.do?optionId=${jobEvaluateOption.optionId}";
			});
			$("#save").click(function() {
				var cnt = 0;
				var tat = $("td input").length;
				$("td input").each(function() {
					if ($(this).val() != "")
						cnt++;
				});

				if (cnt != tat) {
					alert("填写完整后才可保存");
					return false;
				}
				alert("您已添加修改!")
			})
			
		}) 
	</script>
</head>
<body>
	<div class="container">
		<h2>修改评价分项信息</h2>
		<form action="saveJobEO.do" method="post">
			<table class="table table-striped table-bordered table-hover" border="1" align="center" cellspacing="0">
				<tr>
					<td>评价分项编号</td>
					<td>评价分项名称</td>
					<td>评价分项状态</td>
				</tr>
				<tr>
					<td><input type="text" name="optionId" value="${jobEvaluateOption.optionId}" readonly="readonly"></td>
					<td><input type="text" name="optionName" value="${jobEvaluateOption.optionName}"></td>
					<td><input type="text" name="optionState" value="${jobEvaluateOption.optionState}"></td>
				</tr>
			</table>
			<input type="submit" value="保存" id="save" class="btn btn-primary">
			<input type="button" value="返回" id="back" class="btn btn-info">
		</form>	
	</div>
</body>
</html>