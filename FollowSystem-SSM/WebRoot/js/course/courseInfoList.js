$(function(){
			$("#selPageCourse").change(function(){
			location.href = "getSubCourse.do?pageNum="+$(this).val();
			});
			$("#allSel").click(function(){
				if($(this).is(':checked')){
					$("[name='subSel']").prop('checked',true);
				} else {
					$("[name='subSel']").prop('checked',false);
				}
			});
			
			//给下面的复选框设置click事件
			 $("[name='subSel']").click(function(){
				var sub_arr = $("[name='subSel']:checked");
				if(sub_arr.length == $("[name='subSel']").length){
					$("#allSel").prop('checked',true);
				}else {
					$("#allSel").prop('checked',false);
				}
			});
			
			
			 if("${list}"==""){
				alert("您输入的学员编号不存在,获取不到数据!!!");
			}
			$("#searchCourseByCourseId").click(function(){
				//alert($("#searchStudent").val());
				var reg = /^[0-9]*$/;
				if(!reg.test($("#searchCourse").val())){
					alert("请正确输入学员编号!!!");
					location.href="getSubCourse.do";
				} else {
					var courseId = $("#searchCourse").val();
					if(!courseId){
						courseId = -1;
					}
					location.href = "searchCourseByCourseId.do?courseId="+courseId;
				}
			})
			
			$("#delCourse").click(function(){
			 	var delArr = new Array();
		 		$("[name='subSel']:checked").each(function(){
		 			delArr.push($(this).val());
		 		});
		 		var flag = confirm("确定删除?");
		 		if(flag){
			 		location.href="delCourse.do?courseIdArr="+delArr;
		 		}
			})
		});