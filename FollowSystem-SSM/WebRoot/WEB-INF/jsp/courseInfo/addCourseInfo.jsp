<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<%-- 引入 jQuery 和 Bootstrap --%>
  	<jsp:include page="/WEB-INF/jsp/snippet/ref.jsp"></jsp:include>
	<title>添加课程信息</title>
	<!-- <script src="js/course/addCourseInfo.js"></script> -->
	
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
			$("#backCourseInfoList").click(function(){
				location.href="getSubCourse.do?pageNum=${courseCurrentPage}"
			})
		})
		
		$(function(){
			$("#addCourse").click(function(){
				var cnt = 0;
				var tat = $("td input").length;
				$("td input").each(function(){if ($(this).val()!="")cnt++;});

				if (cnt != tat){
					alert("填写完整后才可添加");
					return false;
				}
				alert("您已添加成功!")
				/* setTimeout(function(){alert('您已添加成功!')},4000); */
			})
		})
	</script>
</head>
<body>
	<div class="container">
		<h3>添加课程信息</h3>
		<form action="addCourse.do">
			<table class="table table-striped table-bordered table-hover" align="center" border="1" cellspacing="0">
				<tr>
					<td>课程名称：</td>
					<td><input type="text" name="courseName"></td>
				</tr>
				<tr>
					<td>课程状态：</td>
					<td><input type="text" name="courseState"></td>
				</tr>
			</table>
			<input type="submit" value="添加" class="btn btn-primary"id="addCourse">&nbsp;&nbsp;
			<a class="btn btn-primary" id="backCourseInfoList">返回</a>
		</form>
	</div>
</body>
</html>