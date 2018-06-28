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

  <script type="text/javascript">
  $(function () {

    // 详情
    $("button[name='detail']").click(function(){
      // 功能未实现
      alert("显示用户编号为"+$(this).text() + "的用户详情(功能尚未实现)");
    });

    // 全选/全不选
    // 全选和取消全选的复选框
    $("#userIdHook").click(function(){
      var val = $(this).prop("checked");
      $(":checkbox[name=userIds]").each(function(){
        $(this).prop("checked", val);
      });
    });

    //
    $(":checkbox[name=userIds]").click(function(){
      if ($(":checkbox[name=userIds]").length == $(":checked[name=userIds]").length){
        $("#userIdHook").prop("checked", true);
      }else{
        $("#userIdHook").prop("checked", false);
      }
    });

  })

  </script>
</head>
<body>
  <div class="container">
    <div class="page-header">
      <button class="btn btn-default" title="退出系统"><span class="glyphicon glyphicon-off"></span></button>
    </div>
    <div class="row">
      <div class="col-md-3">
        <nav>
          <p>基本信息维护</p>
          <ul class="nav">
            <li>用户信息</li>
            <li>权限信息</li>
          </ul>
        </nav>

      </div>  <!-- /.col-md-3 -->
      <div class="col-md-9">
        <div class="input-group col-md-10">
            <input type="text" class="form-control" placeholder="Search for...">
            <div class="input-group-btn">
              <button class="btn btn-default">Go</button>
              <button class="btn btn-default dropdown-toggle" data-toggle="dropdown"><span class="caret"></span></button>
              <ul class="dropdown-menu">
                <li><button class="btn btn-default">按姓名搜索</button></li>
                <li><button class="btn btn-default">按ID搜索</button></li>
              </ul>
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
        <div class="pagination">

        </div>
      </div> <!-- /.col-md-9 -->
    </div> <!-- /.row -->
  </div> <!-- /.container -->

</body>
</html>