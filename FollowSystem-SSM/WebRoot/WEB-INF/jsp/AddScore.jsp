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
		<form action="addScore.do" id="myform">
		<input type="hidden" name="stuId" value="${stuid}">
		<input type="hidden" name="courseId" value="${course.courseId}">
			${course.courseName}:<input type="text" name="score"><br><br>
			<p class=noscore><span style="position:absolute;">${l.optionName }评分不能为空且只能是0-100.00之间的数字</span></p>
				<p>	<input type="button" onclick="sub()" value="提交">
						<input type="button" value="取消"
						onclick="javascript:location.href='StudentManage.do?currentpage=${currentPage}'">								
			${msg }
		</form>
	</div>
</body>
<script type="text/javascript">	
$(document).ready(function(){

$(".noscore").hide();
$("input[name='score']").blur(function(){
	var score = $(this).val().trim()
	if(/^\d{1,3}(\.\d\d?)?$/.test(score) && score <= 100){
		$(".noscore").hide();
	}else{
		$(".noscore").show();				
	}
});
});
	function sub(){
		
		if((/^\d{1,3}(\.\d\d?)?$/.test($("input[name='score']").val()) && $("input[name='score']").val() <= 100)){
					$("#myform").submit()
				}else{
					alert("请正确填写信息")
				}
	}
</script>
</body>
</html>