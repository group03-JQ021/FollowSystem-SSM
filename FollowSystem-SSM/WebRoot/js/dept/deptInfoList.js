$(document).ready(function() {
	// 查询id
	$("#searchDeptByDeptId").click(function() {
		/* alert($("#search").val()); */

		var reg = /^[0-9]*$/;
		if (!reg.test($("#search").val())) {
			alert("请您正确输入部门编号!!!");
			location.href = "getSubDept.do";
		} else {
			var deptId = $("#search").val();
			if (!deptId) {
				deptId = -1;
			}
			location.href = "searchDeptByDeptId.do?deptId=" + deptId;
		}
	});
	// 模糊查询
	/*
	 * $("#searchDeptByDeptId").click(function(){ var deptName =
	 * $("#search").val();
	 * location.href="fuzzySearchDeptByDeptName.do?deptName=" +
	 * deptName+"&pageNum=" +1; });
	 */

	$("#allSel").click(function() {
		if ($(this).is(':checked')) {
			$("[name='subSel']").prop('checked', true);
		} else {
			$("[name='subSel']").prop('checked', false);
		}
	});

	// 给下面的复选框设置click事件
	$("[name='subSel']").click(function() {
		var sub_arr = $("[name='subSel']:checked");
		if (sub_arr.length == $("[name='subSel']").length) {
			$("#allSel").prop('checked', true);
		} else {
			$("#allSel").prop('checked', false);
		}
	});

	$("#delDept").click(function() {
		var delArr = new Array();
		$("[name='subSel']:checked").each(function() {
			delArr.push($(this).val());
		});
		var flag = confirm("确定删除?");
		if (flag) {
			location.href = "delDept.do?deptIdArr=" + delArr;
		}
	})

	// 选择页数监听
	$("#selPage").change(function() {
		location.href = "getSubDept.do?pageNum=" + $(this).val();
	})

})
