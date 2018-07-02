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

<title>添加员工评价</title>

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
	<div align="center" style="margin-top: 50px">
		<c:forEach var="d" items="${date }">
			<c:if test="${d.dateId==param.dateid }">
				<h2>${d.dateName}评价表</h2>
			</c:if>
		</c:forEach>
		<form action="addJobEvaluation.do" id="myForm">
			<input type="hidden" name="dateId" value="${dateid }">
			<input type="hidden" name="stuId" value="${stuid}">
			<input type="hidden" name="optionName" value="${username}">
			<table>
				<tr>
					<td>评价人：</td>
					<td>${username }<br>
					<br></td>					
				</tr>
				<c:set var="scoreId" value="0"></c:set>
				<c:forEach var="l" items="${option}">
					<tr>
						<td>${l.optionName }:</td>
						<td><input name="evaluateScore" class=scores for="${scoreId}"><br>
						<br></td>
						<td class=noscore  id="${scoreId}">
						<span style="position:absolute;">${l.optionName }评分不能为空且只能是0-100.00之间的数字</span><br><br>
						</td>
					</tr>
					<c:set var="scoreId" value="${scoreId+1}"></c:set>
				</c:forEach>
				<tr>
					<td>整体评分分数：</td>
					<td><input name="totalScore"><br><br>
					</td>
					<td class=total>
					<span style="position:absolute;">整体评分分数不能为空且只能是0-100.00之间的数字</span>	<br><br>			
					</td>
				</tr>
				<tr>
					<td>评价(包括主要优点及缺陷):</td>
					<td><textarea rows="2" cols="22" name="jobEvaluateContent">
						 </textarea><br><br>
					</td>
					<td class=concent>
					<span style="position:absolute;">评价不能为空</span><br><br>
					</td>
				</tr>
				<tr>
					<td colspan="2" align="center"><input id="aaa" type="button" onclick="sub()"   value="提交">
						<input type="button" value="取消"
						onclick="javascript:location.href='StudentManage.do?currentpage=${currentPage}'"></td>
				</tr>
			</table>
		</form>
	</div>
</body>
<script type="text/javascript">
	$(document).ready(function() {		
 		$(".noscore").hide();
		$(".scores").blur(function() {
			var id = $(this).attr("for");
			var msg = $("#" + id);	
			var num =$(this).val().trim();
			if (/^\d{1,3}(\.\d\d?)?$/.test(num) && num <= 100) {
				msg.hide();	
			} else {
				msg.show();	
			}
		});
		
		$(".total").hide();
		$("input[name='totalScore']").blur(function(){
			var totalscore = $(this).val().trim()
			if(/^\d{1,3}(\.\d\d?)?$/.test(totalscore) && totalscore <= 100){
				$(".total").hide();
			}else{
				$(".total").show();				
			}
		});
		
		$(".concent").hide();
		$("textarea[name='jobEvaluateContent']").blur(function(){
			if($(this).val().trim()==""){
				$(".concent").show();
			}else{
				$(".concent").hide();
			}
		});
	});
	function sub(){
		var flag = true;
		$(".scores").each(function(){
			var num =$(this).val().trim();
			flag = flag && (/^\d{1,3}(\.\d\d?)?$/.test(num) && num <= 100);
		})
		
		if(flag
			&&	$("input[name='totalScore']").val()!=null &&/^\d{1,3}(\.\d\d?)?$/.test($("input[name='totalScore']").val()) 
					&& $("input[name='totalScore']").val()<= 100 &&$.trim($("textarea[name='jobEvaluateContent']").val())!=""){
			$("#myForm").submit()
		}else{
			alert("请完整填写评价信息")
		}
			
	}
	</script>
		<!-- /*  $("#aaa").click(function(){		
			var score = document.getElementsByName("evaluateScore");
			
			var arr = new Array();
			for(var i = 0;i<score.length;i++){
				if (score[i].value)
					arr.push(score[i].value);	
			}

			/* $.ajax({
				type:'post',
				url:'addJobEvaluation.do',
				data:JSON.stirngfy,
				success:function(data){
					alert(successs);
				},
				error:function(){
					alert(11111);
				} */
			//$("#myForm").submit(); -->

</html>