$(function(){
		if("${list}"==""){
			alert("您输入的学员编号不存在,获取不到数据!!!");
		}
		$("#searchStudentByStuId").click(function(){
			//alert($("#searchStudent").val());
			var reg = /^[0-9]*$/;
			if(!reg.test($("#searchStudent").val())){
				alert("请正确输入学员编号!!!");
				location.href="getSubStudent.do";
			} else {
				var stuId = $("#searchStudent").val();
				if(!stuId){
					stuId = -1;
				}
				location.href = "searchStuByStuId.do?stuId="+stuId;
			}
		})
		$("#selPageStu").change(function(){
			
			//alert($(this).val());
			location.href = "getSubStudent.do?pageNum="+$(this).val();
		})
		//批量删除
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
		
		 $("#delStudents").click(function(){
			 var delArr = new Array();
		 	$("[name='subSel']:checked").each(function(){
		 		delArr.push($(this).val());
		 	});
		 	var flag = confirm("确定删除?");
		 	if(flag){
			 	location.href="delStudents.do?stuIdArr="+delArr;
		 	}
		})
		
	})