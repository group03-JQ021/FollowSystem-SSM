<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="zh-CN" dir="ltr">
<head>
  <meta charset="UTF-8" />
  <%-- 引入 jQuery 和 Bootstrap --%>
  <jsp:include page="/WEB-INF/jsp/snippet/ref.jsp"></jsp:include>

  <title>管理员</title>

  <style type="text/css">
    div.container{
      width:800px;
    }
    table tr *{
      text-align: center;
    }

  </style>
  <script type="text/javascript" src="js/paging-show-user.js"></script>


</head>
<body>
  <!-- 顶部导航栏 -->
  <jsp:include page="/WEB-INF/jsp/snippet/nav.jsp"></jsp:include>

  <div class="container">
    <div class="row">
      <!-- 侧边栏菜单 -->
      <div class="col-md-3">
        <jsp:include page="/WEB-INF/jsp/snippet/menu.jsp"></jsp:include>
      </div>  <!-- /.col-md-3 -->
      <div class="col-md-9">
        <div class="input-group">
            <input type="text" class="form-control" placeholder="按姓名(模糊)搜索..." id="searchInput" >

            <!-- 模糊搜索 -->
            <div class="input-group-btn">
              <button class="btn btn-default" id="doSearch" url="fuzzySearchByName.do">Go</button>
              <button class="btn btn-default dropdown-toggle" data-toggle="dropdown"><span class="caret"></span></button>
              <ul class="dropdown-menu" id="searchOpt">
                <li><a href="javascript:void(0)" class="active" url="fuzzySearchByName.do">按姓名(模糊)搜索</a></li>
                <li><a href="javascript:void(0)" url="searchById.do">按ID(精准)搜索</a></li>
                <li><a href="javascript:void(0)" url="fuzzySearchByTelePhone.do">按手机号(模糊)搜索</a></li>
                <li><a href="javascript:void(0)" url="fuzzySearchByEamail">按电子邮件(模糊)搜索</a></li>
              </ul>
              <!-- 增删操作 -->
              <button class="btn btn-primary" title="添加新用户" id="addUser">添加</button>
              <button class="btn btn-danger" title="删除选中用户" id="delUser">删除</button>
            </div>
        </div>

        <!-- 用户信息列表 -->
        <table class="table table-bordered table-striped table-hove">

          <tr>
            <th><input type="checkbox" id="userIdHook">全选</th>
            <th>用户编号</th><th>用户姓名</th><th>部门编号</th>
          </tr>
          <c:forEach var="it"  items="${list}">
            <tr>
              <td><input type="checkbox" name="userIds" value="${it.userId}"></td>
              <td><button class="btn btn-link" name="detail">${it.userId}</button></td>
              <td>${it.userName}</td>
              <td>${it.deptno}</td>
            </tr>
          </c:forEach>
        </table>
        <!-- 分页 -->
        <div class="text-center">
          <jsp:include page="/WEB-INF/jsp/snippet/pagination.jsp"></jsp:include>
        </div>
      </div> <!-- /.col-md-9 -->
    </div> <!-- /.row -->
  </div> <!-- /.container -->

</body>
</html>