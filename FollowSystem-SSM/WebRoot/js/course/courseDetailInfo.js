$(function(){
	$("#back").click(function(){
	location.href = "getSubCourse.do?pageNum=${courseCurrentPage}"
	})
	$("#edit").click(function(){
		location.href = "editCourse.do?courseId=${courseId}"; 
	})
})
