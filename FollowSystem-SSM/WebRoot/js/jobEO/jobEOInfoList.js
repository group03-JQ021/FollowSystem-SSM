$(function() {
	// 选择页数监听
	$("#selPage").change(function() {
		location.href = "getSubJobEO.do?pageNum=" + $(this).val();
	})
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

	$("#searchJobEOByDeptId").click(function() {
		/* alert($("#search").val()); */

		var reg = /^[0-9]*$/;
		if (!reg.test($("#search").val())) {
			alert("请您正确输入评价分项编号!!!");
			location.href = "getSubJobEO.do";
		} else {
			var optionId = $("#search").val();
			if (!optionId) {
				optionId = -1;
			}
			location.href = "searchJobEOByDeptId.do?optionId=" + optionId;
		}
	})
	$("#delJobEO").click(function() {
		var delArr = new Array();
		$("[name='subSel']:checked").each(function() {
			delArr.push($(this).val());
		});
		var flag = confirm("确定删除?");
		if (flag) {
			location.href = "delJobEO.do?optionIdArr=" + delArr;
		}
	})

})
