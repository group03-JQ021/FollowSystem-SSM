
$(function () {
  var debug = true;
  // 全选效果
  regCheckAll();

  // 详情
  $("button[name='detail']").click(function(){
    // 功能未实现
    alert("显示用户编号为"+$(this).text() + "的用户详情(功能尚未实现)");
  });

  // // 添加用户
  // $("#addUser").click(function(){
  //   alert("添加用户未实现");
  // });
  // 删除用户
  $("#delUser").click(function(){
    var delArr = new Array();
    $("[name='userIds']:checked").each(function(){
      delArr.push($(this).val());
    });

    if (delArr.length == 0){
      alert("请先选中要删除的用户.");
      return;
    }

    var flag = confirm("确定删除?");
    if(flag){
      var url = "doDelUser.do";
      $.ajax({
        "url":url,
        "type":"POST",
      })

    }

  });

  // 多条件搜索
  $("#doSearch").click(function () {
    var url =  $(this).attr("url"); // 执行搜索的url
    var word = $("#searchInput").val(); // 搜索关键字
    //alert(url+":" + word);
    var href = url+"?"+"word="+ word  + '&currentPage=1';
    //alert(href);
    location.href = href;
    return false;
    // $.ajax({
    //   "url":url,
    //   "type":"POST",
    //   "data":{"word":word},
    //   "error":function(){
    //     if (debug) alert("通信失败:"+url)
    //   },
    //   "success":function (obj){   // 返回的是json对象
    //     if (obj.flag){
    //       alert("ok");
    //       showPage("#tableBody");
    //     }else{
    //       alert(obj.msg);
    //     }
    //   }
    // });
  })

  $("#searchOpt a").click(function(){
    url = $(this).attr("url");
    text = $(this).text();
    $("#doSearch").attr("url", url);
    $("#searchInput").attr("placeholder", text);
  });

})

// 全选效果
function regCheckAll(){

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
}