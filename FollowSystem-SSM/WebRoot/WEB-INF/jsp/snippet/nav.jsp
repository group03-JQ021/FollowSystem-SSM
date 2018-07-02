<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <!-- 导航菜单 -->
  <!-- 目前为空 -->
  <style type="text/css">
    div.container-fluid{
      margin-right:15px;
    }
  </style>
  <script type="text/javascript">
    $(function () {
      $('[data-toggle="tooltip"]').tooltip();
      $('[data-toggle="tooltip"]').mouseout(function(){$(this).tooltip("hide");});
    })
  </script>
  <nav class="navbar navbar-default">
    <div class="container-fluid">
      <button  class="btn btn-default navbar-btn navbar-right" title="程序员小哥正在加班加点实现退出登录功能"
        data-toggle="tooltip" data-placement="bottom"
        ><span class="glyphicon glyphicon-off"></span></button>
    </div>
  </nav>