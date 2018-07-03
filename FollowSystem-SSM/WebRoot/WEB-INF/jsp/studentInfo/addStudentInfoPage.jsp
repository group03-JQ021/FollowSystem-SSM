<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%-- 引入 jQuery 和 Bootstrap --%>
<jsp:include page="/WEB-INF/jsp/snippet/ref.jsp"></jsp:include>
<title>添加学员信息</title>

<style type="text/css">
div.container {
	width: 650px;
	text-align: center;
}

table.mt {
	margin-top: 20px;
	/* width:450px; */
}

tr td:first-child {
	/* text-align: right; */
	
}

tr td:last-child {
	/* text-align: left; */
	
}
#idCardMsg,#telephoneMsg{
	display:inline-block;
	position:absolute;
	padding-left:5px;
	color: red;
}
</style>
<script type="text/javascript">
	$(function() {
		$("#backStudentInfoList").click(function() {
			location.href = "getSubStudent.do?pageNum=${studentCurrentPage}"
		})
		$("#addStudent").click(function() {
			var cnt = 0;
			var tat = $("td input").length;
			$("td input").each(function() {
				if ($(this).val() != "")
					cnt++;
			});

			if (cnt != tat) {
				alert("填写完整后才可添加");
				return false;
			}
			alert("您已添加成功!")
		})
		$("#backJobEOInfoList").click(function() {
			location.href = "getSubJobEO.do?pageNum=${jobEOCurrentPage}";
		})
		$("#idCard").blur(function(){
			var regIdCard =  /(^\d{18}$)|(^\d{17}(\d|X|x)$)/;
			/* /^\d{18}$/ */
			if (!regIdCard.test($(this).val())) {
				/* alert() */
				$("#idCardMsg").text("身份证号格式不符!");
			} 
		}).click(function(){
			$("#idCardMsg").text("");
		});
		$("#telephone").blur(function(){
			var regIdCard =  /^1[34578]\d{9}$/;
			if (!regIdCard.test($(this).val())) {
				$("#telephoneMsg").text("手机号格式不符!");
			} 
		}).click(function(){
			$("#telephoneMsg").text("");
		});
	})
</script>
</head>
<body>
	<div class="container">
		<h3>添加学员信息</h3>
		<form action="addStudent.do" method="post">
			<table class="table table-striped table-bordered table-hover"
				align="center" border="1" cellspacing="0">
				<tr>
					<td>姓&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;名：</td>
					<td><input type="text" palceholder="请输入学员名字" name="stuName"></td>
				</tr>
				<tr>
					<td>性&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;别：</td>
					<td><input type="radio" name="sex" value="男" checked="checked">男
						<input type="radio" name="sex" value="女">女</td>
				</tr>
				<tr>
					<td>民&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;族：</td>
					<td><input type="text" name="nation"></td>
				</tr>
				<tr>
					<td>出生年月：</td>
					<td><input type="date" name="birthday"></td>
				</tr>
				<tr>
					<td>籍&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;贯：</td>
					<td><input type="text" name="birthPlace" /></td>
				</tr>
				<tr>
					<td>婚&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;否：</td>
					<td><input type="radio" name="marry" value="是">是 <input
						type="radio" name="marry" value="否" checked="checked">否</td>
				</tr>
				<tr>
					<td>联系电话：</td>
					<td><input type="text" name="telephone" id="telephone"><span id="telephoneMsg"></td>
				</tr>
				<tr>
					<td>身份证号：</td>
					<td><input type="text" name="idCard" id="idCard"><span id="idCardMsg"></td>
				</tr>
				<tr>
					<td>毕业学校：</td>
					<td><input type="text" name="university"></td>
				</tr>
				<tr>
					<td>专&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;业：</td>
					<td><input type="text" name="major"></td>
				</tr>
				<tr>
					<td>学员状态：</td>
					<td><input type="text" name="state"></td>
				</tr>
				<tr>
					<td>班&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;级：</td>
					<td><select name="classId">
							<c:forEach var="classDate" items="${classDateList}">
								<option value="${classDate.classId}">${classDate.className}</option>
							</c:forEach>
					</select></td>
				</tr>
				<tr>
					<td>部&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;门：</td>
					<td><select name="deptId">
							<c:forEach var="dept" items="${deptList}">
								<option value="${dept.deptId }">${dept.deptName }</option>
							</c:forEach>
					</select></td>
				</tr>
				<tr>
					<td>备&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;注：</td>
					<td><input type="text" name="note"></td>
				</tr>

			</table>
			<input type="submit" value="添加" class="btn btn-primary"
				id="addStudent">&nbsp;&nbsp; <a class="btn btn-primary"
				id="backStudentInfoList">返回</a>
		</form>
	</div>
</body>
</html>