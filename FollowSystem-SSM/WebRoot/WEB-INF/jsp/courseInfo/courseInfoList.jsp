<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<%-- 引入 jQuery 和 Bootstrap --%>
  	<jsp:include page="/WEB-INF/jsp/snippet/ref.jsp"></jsp:include>
	<title>培训课程信息列表</title>
	
	<script src="js/course/courseInfoList.js"></script>
	
	
	<style type="text/css">
		div.container {
			width: 600px;
			text-align: center;
		}
		table{
			margin-top:20px;
			width:500px;
		}
	</style>
</head>
<body>
<div style="width: 100% ;height:700px;"  >
	<div style="float: left;">
		<dl>
			<dt><h3>基本信息维护</h3></dt>
			<dd><h5><a href="getSubJobEO.do">工作评价分项信息</a></h5></dd>
			<dd><h5><a href="getSubCourse.do">课程信息</a></h5></dd>
			<dd><h5><a href="getSubDept.do">组织部门信息</a></h5></dd>
			<dd><h5><a href="getSubStudent.do">学员基本信息</a></h5></dd>
			<!-- <dd><h5>培训成绩信息</h5></dd> -->
		</dl>
		
	</div>
	<div class="container">
		<h3>培训课程信息列表</h3>
		<input type="text" placeholder="请输入课程编号" id="searchCourse">
		<a class="btn btn-primary" id="searchCourseByCourseId">查询</a>
		<a class="btn btn-primary" href="getAddCoursePage.do">添加</a>
		<a class="btn btn-danger" id="delCourse">删除</a>
		<table class="table table-striped table-bordered table-hover" align="center" border="1" cellspacing="0">
			<tr>
				<td><input type="checkbox" id="allSel">全选</td>
				<td>课程编号</td>
				<td>课程名称</td>
				<td>课程状态</td>
			</tr>
			<c:choose>
				<c:when test="${not empty list}">
					<c:forEach var="course" items="${list}">
						<tr>
							<td><input type="checkbox" name="subSel" value="${course.courseId}"></td>
							<td><a href = getCourseByCourseId.do?courseId=${course.courseId}>${course.courseId}<a></td>
							<td>${course.courseName}</td>
							<td>${course.courseState}</td>
						</tr>
					</c:forEach>
				</c:when>
				<c:otherwise>
					获取不到数据
				</c:otherwise>
			</c:choose>
		</table>
			<a href="getSubCourse.do?pageNum=1">首页</a>
			<c:if test="${courseCurrentPage>1}">
				<a href="getSubCourse.do?pageNum=${prePage}">上一页</a>
			</c:if>
			<c:if test="${courseCurrentPage<=1}">
				<a href="javascript:void(0)">上一页</a>
			</c:if>
			<select id="selPageCourse">
				<c:forEach var="course" begin="1" end="${pageCount}" step="1">
						<option value="${course}" ${course == courseCurrentPage?"selected":""}>${course}/${pageCount}</option>
				</c:forEach>
			</select>
			<c:if test="${courseCurrentPage<pageCount}">
				<a href="getSubCourse.do?pageNum=${nextPage}">下一页</a>
			</c:if>
			<c:if test="${courseCurrentPage>=pageCount}">
				<a href="javascript:void(0)">下一页</a>
			</c:if>
			<a href="getSubCourse.do?pageNum=${pageCount}">末页</a>
	</div>
</div>
</body>
</html>