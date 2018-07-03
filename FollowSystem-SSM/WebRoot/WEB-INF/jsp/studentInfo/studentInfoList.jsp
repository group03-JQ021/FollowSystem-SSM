<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- <%@page import="java.util.List"%> --%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%-- 引入 jQuery 和 Bootstrap --%>
<jsp:include page="/WEB-INF/jsp/snippet/ref.jsp"></jsp:include>
<title>学员基本信息列表</title>
<script src="js/student/studentInfoList.js"></script>

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
<!-- <script type="text/javascript">
	$(function(){
		if("${list}"==""){
			alert("您输入的学员编号不存在,获取不到数据!!!");
		}
		$("#searchStudentByStuId").click(function(){
			//alert($("#searchStudent").val());
			var reg = /^[0-9]*$/;
			if(!reg.test($("#searchStudent").val())){
				alert("请正确输入学员编号!!!");
				location.href="getSubStudent.do";
			} else {
				var stuId = $("#searchStudent").val();
				if(!stuId){
					stuId = -1;
				}
				location.href = "searchStuByStuId.do?stuId="+stuId;
			}
		})
		$("#selPageStu").change(function(){
			
			//alert($(this).val());
			location.href = "getSubStudent.do?pageNum="+$(this).val();
		})
		//批量删除
		$("#allSel").click(function(){
			if($(this).is(':checked')){
				$("[name='subSel']").prop('checked',true);
			} else {
				$("[name='subSel']").prop('checked',false);
			}
		});
		
		//给下面的复选框设置click事件
		 $("[name='subSel']").click(function(){
			var sub_arr = $("[name='subSel']:checked");
			if(sub_arr.length == $("[name='subSel']").length){
				$("#allSel").prop('checked',true);
			}else {
				$("#allSel").prop('checked',false);
			}
		});
		
		 $("#delStudents").click(function(){
			 var delArr = new Array();
		 	$("[name='subSel']:checked").each(function(){
		 		delArr.push($(this).val());
		 	});
		 	var flag = confirm("确定删除?");
		 	if(flag){
			 	location.href="delStudents.do?stuIdArr="+delArr;
		 	}
		})
		
	})
</script> -->
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
		<h3>学员基本信息列表</h3>
		<form>
			<input type="text" placeholder="请输入学员编号" id="searchStudent">
			<a class="btn btn-primary" id="searchStudentByStuId">查询</a>&nbsp;&nbsp;
			<a class="btn btn-primary" href="getAddStudentPage.do">添加</a>&nbsp;&nbsp;
			<a class="btn btn-danger" id="delStudents">删除</a>
			<table class="table table-striped table-bordered table-hover" align="center" border="1" cellspacing="0">
				<tr>
					<td><input type="checkbox" id="allSel">全选</td>
					<td>学生编号</td>
					<td>学生姓名</td>
					<td>学生性别</td>
					<td>联系电话</td>
					<td>部门名称</td>
				</tr>
				<c:choose>
					<c:when test="${not empty list}">
						<c:forEach var="stu" items="${list}" >
							<tr>
								<td><input type="checkbox" name="subSel" value="${stu.stuId}"></td>
								<td><a href="getStuByStuId.do?stuId=${stu.stuId}">${stu.stuId}</a></td>
								<td>${stu.stuName}</td>
								<td>${stu.sex}</td>
								<td>${stu.telephone}</td>
								<td>${stu.dept.deptName}</td>
							</tr>
						</c:forEach>
					</c:when>
					<c:otherwise>
						获取不到数据
					</c:otherwise>
				</c:choose>
			</table>
			<a href="getSubStudent.do?pageNum=1">首页</a>
			<c:if test="${studentCurrentPage>1}">
				<a href="getSubStudent.do?pageNum=${prePage}">上一页</a>
			</c:if>
			<c:if test="${studentCurrentPage<=1}">
				<a href="javascript:void(0)">上一页</a>
			</c:if>
			<select id="selPageStu">
				<c:forEach var="stu" begin="1" end="${pageCount}" step="1">
						<option value="${stu}" ${stu == studentCurrentPage?"selected":""}>${stu}/${pageCount}</option>
				</c:forEach>
			</select>
			<c:if test="${studentCurrentPage<pageCount}">
				<a href="getSubStudent.do?pageNum=${nextPage}">下一页</a>
			</c:if>
			<c:if test="${studentCurrentPage>=pageCount}">
				<a href="javascript:void(0)">下一页</a>
			</c:if>
			<a href="getSubStudent.do?pageNum=${pageCount}">末页</a>
		</form>
	</div>
</div>
</body>
</html>