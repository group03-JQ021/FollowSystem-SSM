<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<% String contextPath= request.getContextPath();%>
<script type="text/javascript">
  $(function () {
    $('[data-toggle="dropdown"').dropdown();
  })
</script>
<nav>
  <div class="dropdown">
    <button class="btn btn-default dropdown-toggle" data-toggle="dropdown">基本信息维护<span class="caret"></span></button>
    <ul class="dropdown-menu">
      <li><a href="pagingShowUser.do">用户信息</a></li>
      <li><a href="pagingShowPrivilege.do">权限信息</a></li>
    </ul>
  </div>

</nav>