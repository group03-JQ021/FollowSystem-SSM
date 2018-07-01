<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %><%@taglib uri="/WEB-INF/fmt.tld" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>修改学员信息</title>
<link href="../css/bootstrap.min.css" rel="stylesheet">
	<script src="js/jquery-3.2.1.min.js"></script>
	<script src="../js/bootstrap.min.js"></script>
	
	 <!-- 最新版本的 Bootstrap 核心 CSS 文件 -->
	 <link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
	
	<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
	<script
		src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"
		integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa"
		crossorigin="anonymous">
	</script>
	<style type="text/css">
		div.container {
			width: 600px;
			text-align: center;
		}
		table{
			margin-top:20px;
			width:250px;
		}
		/* table tr{

			margin-top:20px;
			display:inline-block;/* 设置为行内块级元素,因为margin只对块级元素有效 */
		} */

	</style>
	<script type="text/javascript">
		
		$(function(){
			$("#save").click(function(){
			alert("修改成功!")
		})
	</script>
</head>
<body>
	<div class="container">
		<h3>修改学员信息</h3>
			<form action="saveStudent.do" method="post">
				<table class="table table-striped table-bordered table-hover mt" align="center" border="1" cellspacing="0">
					<tr>
						<td>学员编号：</td>
						<td><input type="text" name="stuId" value="${student.stuId}"></td>
					</tr>
					<tr>
						<td>姓&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;名：</td>
						<td><input type="text" palceholder="请输入学员名字" name="stuName" value="${student.stuName}"></td>
					</tr>
					<tr>
						<td>性&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;别：</td>
						<td>
							<c:if test="${student.sex=='男'}">
								<input type="radio" name="sex" value="男" checked="checked">男
								<input type="radio" name="sex" value="女">女
							</c:if>
							<c:if test="${student.sex=='女'}">
								<input type="radio" name="sex" value="男">男
								<input type="radio" name="sex" value="女" checked="checked">女
							</c:if>
						</td>
					</tr>
					<tr>
						<td>民&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;族：</td>
						<td><input type="text" name="nation"  value="${student.nation}"></td>
					</tr>
					<tr>
						<td>出生年月：</td>
						
						<td>
							<fmt:formatDate value="${student.birthday}"  pattern="yyyy-MM-dd"  var="date" />
							<input type="date" name="birthday"  value="${date}">
						</td>
						
					</tr>
					<tr>
						<td>籍&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;贯：</td>
						<td><input type="text" name="birthPlace"  value="${student.birthPlace}"/></td>
					</tr>
					<tr>
						<td>婚&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;否：</td>
						<td>
							<c:if test="${student.marry=='是'}">	
								<input type="radio" name="marry" value="是" checked="checked">是
								<input type="radio" name="marry" value="否">否
							</c:if>
							<c:if test="${student.marry=='否'}">	
								<input type="radio" name="marry" value="是">是
								<input type="radio" name="marry" value="否" checked="checked">否
							</c:if>
						</td>
					</tr>
					<tr>
						<td>联系电话：</td>
						<td><input type="text" name="telephone"  value="${student.telephone}"></td>
					</tr>
					<tr>
						<td>身份证号：</td>
						<td><input type="text" name="idCard"  value="${student.idCard}"></td>
					</tr>
					<tr>
						<td>毕业学校：</td>
						<td><input type="text" name="university"  value="${student.university}"></td>
					</tr>
					<tr>
						<td>专&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;业：</td>
						<td><input type="text" name="major"  value="${student.major}"></td>
					</tr>
					<tr>
						<td>学员状态：</td>
						<td><input type="text" name="state"  value="${student.state}"></td>
					</tr>
					<tr>
						<td>班&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;级：</td>
						<td>
							<select name="classId">
								<c:forEach var="classDate" items="${classDateList}">
									<option value="${classDate.classId}">${classDate.className}</option>
								</c:forEach>
							</select>
						</td>
					</tr>
					<tr>
						<td>部&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;门：</td>
						<td>
							<select name="deptId" value="${dept.deptId}">
								<c:forEach var="dept" items="${deptList}">
									<option value="${dept.deptId }">${dept.deptName }</option>
								</c:forEach>
							</select>
						</td>
					</tr>
					<tr>
						<td>备&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;注：</td>
						<td><input type="text" name="note"  value="${student.note}"></td>
					</tr>
					
				</table>
				<!-- <a class="btn btn-primary" type="">保存</a>&nbsp;&nbsp; -->
				<input type="submit" value="保存" class="btn btn-primary">&nbsp;&nbsp;
				<a class="btn btn-info" href="studentInfo/studentDetailInfo">返回</a>
						<!-- <a class="btn btn-primary" id="back">返回</a> -->
			</form>
		</div>
</body>
</html>