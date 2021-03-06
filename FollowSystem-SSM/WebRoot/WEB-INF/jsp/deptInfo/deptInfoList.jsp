<%@page language="java" contentType="text/html; charset=UTF-8"
		pageEncoding="UTF-8"%><%@page import="com.jxdedu.entity.Dept"%>

<%@page import="java.util.List"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<%-- 引入 jQuery 和 Bootstrap --%>
  	<jsp:include page="/WEB-INF/jsp/snippet/ref.jsp"></jsp:include>
	<title>部门基本信息列表</title>
	
	<script src="js/dept/deptInfoList.js"></script>
		
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
		$(document).ready(function(){
			//查询id
			$("#searchDeptByDeptId").click(function(){
				/* alert($("#search").val()); */
				
				var reg = /^[0-9]*$/;
				if(!reg.test($("#search").val())){
					alert("请您正确输入部门编号!!!");
					location.href="getSubDept.do";
				} else {
					var deptId = $("#search").val();
					if (!deptId){
						deptId = -1;
					}
					location.href="searchDeptByDeptId.do?deptId=" + deptId;
				}
			}); 
			//模糊查询
			/* $("#searchDeptByDeptId").click(function(){
				var deptName = $("#search").val();
				location.href="fuzzySearchDeptByDeptName.do?deptName=" + deptName+"&pageNum=" +1;
			}); */
			
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
			
			$("#delDept").click(function(){
				 var delArr = new Array();
			 	$("[name='subSel']:checked").each(function(){
			 		delArr.push($(this).val());
			 	});
			 	var flag = confirm("确定删除?");
			 	if(flag){
				 	location.href="delDept.do?deptIdArr="+delArr;
			 	}
			})
			
			//选择页数监听
			$("#selPage").change(function(){
				location.href="getSubDept.do?pageNum="+$(this).val();
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
		<h2>组织部门信息列表</h2>
		<input type="text" placeholder="请输入部门编号" id="search" name="${search}"> 
		<a class="btn btn-primary" id="searchDeptByDeptId">查询</a>&nbsp;&nbsp;
		<a class="btn btn-primary" href="getAddDeptPage.do">添加</a>&nbsp;&nbsp;
		<a class="btn btn-danger"  id="delDept" >删除</a>&nbsp;&nbsp;
		<!-- <button type="button" class="btn btn-danger" data-toggle="modal" id="delDept" data-target="#myModal">&nbsp;&nbsp; -->
		<table class="table table-striped table-bordered table-hover" align="center" border="1" cellspacing="0">
			<tr>
				<td><input type="checkbox" id="allSel">全选</td>
				<td>部门编号</td>
				<td>部门名称</td>
				<td>部门地址</td>
			</tr>
			<!-- 表格数据是动态生成的，需要根据后台传来的数据而决定 -->
			<c:choose>
				<c:when test="${not empty list}">
					<%-- ${list} --%>
					<c:forEach var="it" items="${list}">
						<tr>
							<td> <input type="checkbox" name="subSel" value="${it.deptId}"></td>
							<td><a href="getDeptByDeptId.do?deptId=${it.deptId}">${it.deptId}</a></td>
							<td>${it.deptName}</td>
							<td>${it.deptAddress}</td>
						</tr>
					</c:forEach>
				</c:when>
				<c:otherwise>
					没有数据
				</c:otherwise>
			</c:choose>
			
		</table>
		<a href="getSubDept.do?pageNum=1">首页</a> 
		<c:if test="${deptCurrentPage>1}">
			<a href="getSubDept.do?pageNum=${prePage }">上一页</a>
		</c:if>
		<c:if test="${deptCurrentPage<=1}">
			<a href="javascript:void(0)">上一页</a>
		</c:if>
		<select id="selPage">
			<c:forEach var="i" begin="1" end="${pageCount}" step="1" >
				<option value="${i}" ${i == deptCurrentPage?"selected":""} >${ i}/${pageCount}</option>
			</c:forEach>
		</select>
		<c:if test="${deptCurrentPage<pageCount}">
			<a href="getSubDept.do?pageNum=${nextPage}">下一页</a> 
		</c:if>
		<c:if test="${deptCurrentPage>=pageCount}">
			<a href="javascript:void(0)">下一页</a> 
		</c:if>
		<a href="getSubDept.do?pageNum=${pageCount}">末页</a>
	</div>
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">

	${delMsg}
</div>
</body>
</html>
