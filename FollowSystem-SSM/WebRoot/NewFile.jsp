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
 <style type="text/css">
      div.container{
    	
        width:600px;
        margin-top:50px;
      }
    </style>
<script src="https://cdn.bootcss.com/jquery/2.1.1/jquery.min.js"></script>
<script
	src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>
    <div class="container">
    <c:forEach var="d" items="${date }">
			<c:if test="${d.dateId==param.dateid }">
				<h2>${d.dateName}评价表</h2>
			</c:if>
		</c:forEach>
      <form class="form-horizontal" action="addJobEvaluation.do?dateid=${dateid } & stuid=${stuid}">         
            <div class="form-group">
              <label for="inputEmail3" class="col-sm-2 control-label">评价人</label>
              <div class="col-sm-6">
                <input type="email" class="form-control" id="inputEmail3" placeholder="石玉龙">
              </div>
              <div class="col-sm-2">
                <p class="text-danger" id="msg">评价人不能为空</p>
              </div>
            </div>
            <div class="form-group">
              <label for="inputPassword3" class="col-sm-2 control-label">评分</label>
              <div class="col-sm-6">
                <input type="password" class="form-control" id="inputPassword3" placeholder="90.12">
              </div>
              <div class="col-sm-2">
                <p class="text-danger" id="msg">评价人不能为空</p>
              </div>
            </div>
            <div class="form-group">
              <div class="col-sm-offset-2 col-sm-6">
                <button type="submit" class="btn btn-primary">提交</button>
                <button type="reset" class="btn btn-primary">重置</button>
              </div>
            </div>
      </form>
    </div>
    
</body>
				
</html>


					<td>评价人：</td>
					<td><input name="optionname"><br>
					<br></td>
					<td class=noname><span style="position:absolute;">评价人不能为空</span></td>
				</tr>
				<c:set var="scoreId" value="0"></c:set>
				<c:forEach var="l" items="${option}">

					<tr>
						<td>${l.optionName }:</td>
						<td><input name="evaluateScore" class=score for="${scoreId}"><br>
						<br></td>
						<td class=noscore  id="${scoreId}">
						<span style="position:absolute;">${l.optionName }评分不能为空且只能是0-100.00之间的数字</span>
						</td>
					</tr>
					<c:set var="scoreId" value="${scoreId+1}"></c:set>
				</c:forEach>
				<tr>
					<td>整体评分分数：</td>
					<td><input name="totalScore"><br><br>
					</td>
					<td class=total>
					<span style="position:absolute;">整体评分分数不能为空且只能是0-100.00之间的数字</span>				
					</td>
				</tr>
				<tr>
					<td>评价(包括主要优点及缺陷):</td>
					<td><textarea rows="2" cols="22" name="jobEvaluateContent">
						 </textarea><br><br>
					</td>
					<td class=concent>
					<span style="position:absolute;">评价不能为空</span>
					</td>
				</tr>
				<tr>
					<td colspan="2" align="center"><input id="aaa" type="submit" value="提交">
						<input type="button" value="取消"
						onclick="javascript:location.href='StudentManage.do'"></td>
				</tr>
			</table>
		</form>
	</div>
	 	