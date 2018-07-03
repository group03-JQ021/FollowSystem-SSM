<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<%-- 引入 jQuery 和 Bootstrap --%>
  	<jsp:include page="/WEB-INF/jsp/snippet/ref.jsp"></jsp:include>
	<title>评价分项信息列表</title>
	<script src="js/jobEO/jobEOInfoList.js"></script>
		
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
	<script type="text/javascript">
		$(function(){
			//选择页数监听
			$("#selPage").change(function(){
				location.href="getSubJobEO.do?pageNum="+$(this).val();
			})
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
			
			 $("#searchJobEOByDeptId").click(function(){
				/* alert($("#search").val()); */
					
				var reg = /^[0-9]*$/;
				if(!reg.test($("#search").val())){
					alert("请您正确输入评价分项编号!!!");
					location.href="getSubJobEO.do";
				} else {
					var optionId = $("#search").val();
					if (!optionId){
						optionId = -1;
					}
					location.href="searchJobEOByDeptId.do?optionId=" + optionId;
				}
			})
			$("#delJobEO").click(function(){
				var delArr = new Array();
			 	$("[name='subSel']:checked").each(function(){
			 		delArr.push($(this).val());
			 	});
			 	var flag = confirm("确定删除?");
			 	if(flag){
				 	location.href="delJobEO.do?optionIdArr="+delArr;
			 	}			
			})
			
				
		})
	</script>
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
		<h3>工作评价分项信息</h3>
		<input type="text" placeholder="请输入评价分项编号" id="search">&nbsp;&nbsp;
		<a class="btn btn-primary" id="searchJobEOByDeptId">查询</a>&nbsp;&nbsp;
		<a class="btn btn-primary" href="getAddJobEOPage.do">添加</a>&nbsp;&nbsp;
		<a class="btn btn-danger" id="delJobEO">删除</a>
		
		<table class="table table-striped table-bordered table-hover" align="center" border="1" cellspacing="0">
			<tr>
				<td><input type="checkbox" id="allSel">全选</td>
				<td>评价分项编号</td>
				<td>评价分项名称</td>
				<td>评价分项状态</td>
			</tr>
			<c:choose>
				<c:when test="${not empty list}">
					<c:forEach var="jobEO" items="${list}">
						<tr>
							<td><input type="checkbox" name="subSel" value="${jobEO.optionId}"></td>
							<td><a href="getJobEOByOptionId.do?optionId=${jobEO.optionId}">${jobEO.optionId}</a></td>
							<td>${jobEO.optionName}</td>
							<td>${jobEO.optionState}</td>
						</tr>
					</c:forEach>
				</c:when>
				<c:otherwise>
					没有获取到数据
				</c:otherwise>
			</c:choose>
		</table>
		<a href="getSubJobEO.do?pageNum=1">首页</a>
		<c:if test="${jobEOCurrentPage > 1}">
			<a href="getSubJobEO.do?pageNum=${prePage}">上一页</a>
		</c:if>
		<c:if test="${jobEOCurrentPage <= 1}">
			<a href="javascript:void(0)">上一页</a>
		</c:if>
		<select id="selPage">
			<c:forEach var="i" begin="1" end="${pageCount}" step="1">
				<option value="${i}" ${i == jobEOCurrentPage?"selected":""}> ${i}/${pageCount} </option>
			</c:forEach>
		</select>
		<c:if test="${jobEOCurrentPage < pageCount}">
			<a href="getSubJobEO.do?pageNum=${nextPage}">下一页</a>
		</c:if>
		<c:if test="${jobEOCurrentPage >= pageCount}">
			<a href="javascript:void(0)">下一页</a>
		</c:if>
		<a href="getSubJobEO.do?pageNum=${pageCount}">末页</a>
	</div>
	<!-- <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"> -->

	${delMsg}
</div>
</div>
</body>
</html>