<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>添加学生评价</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<link rel="stylesheet"
	href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css">
<style type="text/css">
.noname, .noscore,.total,.concent{
	color: red;
}
</style>
<script src="https://cdn.bootcss.com/jquery/2.1.1/jquery.min.js"></script>
<script
	src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>
	<div align="center" style="margin-top: 200px">
				<h2>培训学校评价表</h2>
		<form action="addSchoolScore.do" id="myform">
		<input type="hidden" name="stuId" value="${stuid}">
		<input type="hidden" name="evaluatePerson" value="${username }">
			<table>
				<tr>
					<td>评价人：</td>
					<td>${username }<br>
					<br></td>
					<tr>
					<td>整体评分分数：</td>
					<td><input name="evaluateScore"><br><br>
					</td>
					<td class=total>
					<span style="position:absolute;">整体评分只能是0-100.00之间的数字</span>	<br><br>			
					</td>
				</tr>
				<tr>
					<td>评价(包括主要优点及缺陷):</td>
					<td><textarea rows="2" cols="22" name="evaluateContent">
						 </textarea><br><br>
					</td>
					<td class=concent>
					<span style="position:absolute;">评价不能为空</span><br><br>
					</td>
				</tr>
				<tr>
					<td colspan="2" align="center"><input type="button" onclick="sub()" value="提交">
						<input type="button" value="取消"
						onclick="javascript:location.href='StudentManage.do?currentpage=${currentPage}'"></td>
				</tr>		
			</table>
			${msg }
		</form>
	</div>
</body>
<script type="text/javascript">	
$(document).ready(function(){
		$(".total").hide();
		$("input[name='evaluateScore']").blur(function(){
			var totalscore = $(this).val().trim()
			if((/^\d{1,3}(\.\d\d?)?$/.test(totalscore) && totalscore <= 100)){
				$(".total").hide();
			}else{
				$(".total").show();		
			}
		});	
		$(".concent").hide();
		$("textarea[name='evaluateContent']").blur(function(){
			if($(this).val().trim()==""){
				$(".concent").show();
			}else{
				$(".concent").hide();
			}
		});
	});
	
	function sub(){
		
		if((/^\d{1,3}(\.\d\d?)?$/.test($("input[name='evaluateScore']").val()) && $("input[name='evaluateScore']").val() <= 100)
				&&$("textarea[name='evaluateContent']").val().trim()!=""){
					$("#myform").submit()
				}else{
					alert("请按要求正确填写信息")
				}
	}
</script>
</html>