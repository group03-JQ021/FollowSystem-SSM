    var dbgFlag = true; // 有些信息, 只在调试时输出.
    var userNameChecked = false;

    $(function () {
      $('[data-toggle="popover"]').popover();
      // 用户名验证
      regCheckLoginName();
      // 密码验证
      regCheckPassword();
      // 登录按钮监听
      regSubmit($("#submit-btn"));
      // 重置按钮
      regReset($("#reset-btn"))
    });

    function regCheckLoginName() {
      $("#loginName").blur(function(){
        var groupEle = $("#user-name-group");
        var iconEle = $("#user-name-icon");
        var userName = $.trim($(this).val()); // 获取用户名
        $(this).val(userName);

        clearIcon(groupEle, iconEle);
        userNameChecked = false;

        // 用户名检验
        if (userName == ""){  // 用户名不能为空
          popMsg($(this), '请输入用户名');  // 给出提示信息

        }else {
          url = "checkUserName.do";
          $.ajax({
            "url":url,
            "type":"POST",
            "data":{"userName":userName},
            "error":function(){
              if (dbgFlag)console.log("通信失败" + url);

            },
            "success":function(data){

              if (data){ // 有此用户
                userNameChecked = true;
                okIcon(groupEle, iconEle);
              }else{      // 查无此人
                userNameChecked = false;
                popMsg($("#loginName"), "用户"+ userName +"不存在");
                errorIcon(groupEle, iconEle);
              }
            }
          });
        }
        }).focus(function () {  //隐藏弹出框
          $(this).popover('hide');
        });
    }
    function regCheckPassword() {

      $("#password").blur(function(){
        var groupEle = $("#password-group");
        var iconEle = $("#password-icon");
        // 密码验证通过和失败后各自的行为
        // 显示图标(一个绿色的对号)
        function successAction(){ okIcon(groupEle, iconEle);}
        function errorAction(){ popMsg($("#password"), "密码错误!"); errorIcon(groupEle, iconEle);}
        function resetAction() {  clearIcon(groupEle, iconEle);}
        checkPassword($(this),resetAction,  successAction, errorAction);
      }).focus(function () {
        $(this).popover('hide');
      });
    }

    function regSubmit($submit){
      $submit.click(function(){
        var groupEle = $("#password-group");
        var iconEle = $("#password-icon");
        function resetAction() {
          clearIcon(groupEle, iconEle);
        }
        // 密码验证通过和失败后各自的行为
        function successAction(){
          // 显示图标(一个绿色的对号)
          okIcon(groupEle, iconEle);
        }
        function errorAction(){
          popMsg($("#password"), "密码错误!");
          errorIcon(groupEle, iconEle);
          return false;
        }
        //checkUserName();
        checkPassword($("#password"),resetAction, successAction, errorAction);


      });
    }

    function regReset($resetBtn) {
      $resetBtn.click(function () {
        // 关闭所有弹出框
        $('input[data-toggle="popover"]').popover("hide");
        // 清除所有背景色, 移除所有图标
        $('div.form-group').removeClass("has-error has-success");
        $('span.form-control-feedback').removeClass("glyphicon-ok glyphicon-remove")
      });
    }
    function checkPassword($password,resetAction,  successAction, errorAction) {
      // 参数
      var password = $password.val();
      var userName = $("#loginName").val();
      userName = $.trim(userName);
      resetAction();
      if (password == ""){  // 密码不能为空
        popMsg($password,  "密码不能为空");   // 弹出框提示

      }else if (!/[\w@*$]{6,21}/.test(password)){  // 密码要符合格式
        popMsg($password, "密码长度6~21位, 仅允许数字字母下划线@*$");
      }else if (userNameChecked){  // 用回那个已经验证通过时, 到服务器端验证,
        var url = "checkLogin.do"
        $password.popover("hide");
        $.ajax({
          "url":url,
          "type":"POST",
          "data":{"userName":userName,"password":password},
          "error":function (data) {
            if (dbgFlag){
              console.log("通信失败"+url);
            }
          },
          "success":function (data) {
            if (data){
              successAction();
            }else{
              errorAction();
            }
          }
        });
      }
    }
    // 简单辅助函数
    function popMsg(ele, msg){ ele.attr('data-content', msg);ele.popover('show');}
    // 显示图标(一个绿色的对号)
    function okIcon(groupEle, iconEle){ groupEle.addClass("has-success");iconEle.addClass("glyphicon-ok");}
    function errorIcon(groupEle, iconEle){ groupEle.addClass("has-error");iconEle.addClass("glyphicon-remove");}
    function clearIcon(groupEle, iconEle){
      groupEle.removeClass("has-error has-success");
      iconEle.removeClass("glyphicon-remove glyphicon-ok");
    }