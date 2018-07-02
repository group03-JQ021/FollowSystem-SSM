<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<nav aria-label="Page navigation">
  <ul class="pagination pagination-lg">
    <!-- 上一页 -->
    <!-- 当当前页为第一页时禁用 -->
    <c:choose>
      <c:when test="${pagingStatus.currentPage!=1}">
        <li>
          <a href="pagingShowUser.do?currentPage=${pagingStatus.currentPage - 1}" aria-label="Previous">
            <span aria-hidden="true">&laquo;</span>
          </a>
        </li>
      </c:when>
      <c:otherwise>
        <li class="disabled" >
          <span aria-label="Previous">
            <span aria-hidden="true">&laquo;</span>
          </span>
        </li>
      </c:otherwise>
    </c:choose>

    <c:forEach var ="i" begin="${pagingStatus.navBegin}" end="${pagingStatus.navEnd-1}" step="1">
      <c:choose>
        <c:when test="${i!=pagingStatus.currentPage}">
           <li>
            <a href="pagingShowUser.do?currentPage=${i}" aria-label="Previous">${i}</a>
          </li>
        </c:when>
        <c:otherwise>
          <li class="active">
            <a href="javascript:void(0)">
              <span aria-label="Previous">${i}</span>
            </a>
          </li>
        </c:otherwise>
      </c:choose>
    </c:forEach>

    <!-- 下一页 -->
    <!-- 当当前页为最后一页时禁用 -->
    <c:choose>
      <c:when test="${pagingStatus.currentPage != pagingStatus.pageCount}">
        <li>
          <a href="pagingShowUser.do?currentPage=${pagingStatus.currentPage + 1}" aria-label="Previous">
            <span aria-hidden="true">&raquo;</span>
          </a>
        </li>
      </c:when>
      <c:otherwise>
        <li class="disabled" >
          <span aria-label="Previous">
            <span aria-hidden="true">&raquo;</span>
          </span>
        </li>
      </c:otherwise>
    </c:choose>

  </ul>
</nav>