<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="/WEB-INF/fmt.tld" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%-- 引入 jQuery 和 Bootstrap --%>
<jsp:include page="/WEB-INF/jsp/snippet/ref.jsp"></jsp:include>
<title>学生详细信息</title>

<style type="text/css">
div.container {
	width: 600px;
	text-align: center;
}

table.mt {
	margin-top: 20px;
	/* width:450px; */
}

.prop {
	/*color: red; */
	background-color: #C0C0C0;
}
</style>
<script type="text/javascript">
	$(function() {
		$("#back").click(function() {
			location.href = "getSubStudent.do?pageNum=${studentCurrentPage}"
		})
		$("#edit").click(function() {
			location.href = "editStudent.do?stuId=${stuId}"
		})
	})
</script>
</head>
<body>
	<div class="container">
		<h3>学员详细信息</h3>
		<table class="table table-bordered mt" align="center" border="1"
			cellspacing="0">
			<tr>
				<td class="prop">姓名</td>
				<td>${student.stuName}</td>
				<td class="prop">性別</td>
				<td>${student.sex}</td>
				<td class="prop">民族</td>
				<td>${student.nation}</td>
			</tr>
			<tr>
				<td class="prop">出生年月</td>
				<td><fmt:formatDate value="${student.birthday}" type="both"
						dateStyle="default" timeStyle="default" var="date" /> ${date}</td>
				<%-- <td>${student.birthday}</td> --%>
				<td class="prop">籍貫</td>
				<td>${student.birthPlace}</td>
				<td class="prop">婚否</td>
				<td>${student.marry}</td>
			</tr>
			<tr>
				<td class="prop">联系电话</td>
				<td colspan="2">${student.telephone}</td>
				<td class="prop">身份证号码</td>
				<td colspan="2">${student.idCard}</td>
			</tr>
			<tr>
				<td class="prop">毕业学校</td>
				<td colspan="2">${student.university}</td>
				<td class="prop">专业</td>
				<td colspan="2">${student.major}</td>
			</tr>
			<tr>
				<td class="prop">学员状态</td>
				<td>${student.state}</td>
				<td class="prop">培训班名称</td>
				<td>${student.classDate.className}</td>
				<td class="prop">部门名称</td>
				<td>${student.dept.deptName }</td>
			</tr>
			<tr>
				<td class="prop">备注</td>
				<td colspan="5">${student.note}</td>
			</tr>
		</table>
		<a class="btn btn-primary" id="edit">修改</a>&nbsp;&nbsp; <a
			class="btn btn-info" id="back">返回</a>

	</div>
</body>
</html>