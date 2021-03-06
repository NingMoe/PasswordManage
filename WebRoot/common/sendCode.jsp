<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8"/>
    <title>Insert title here</title>
</head>
<body>
<script type="text/javascript">
    var wait = 60;   //设置发送间隔时间为60秒
    function time(val) {
        if (wait == 0) {
            val.removeAttribute("disabled");
            $('#name').attr('disabled', false);    // 恢复用户名输入框
            $('#code').attr('disabled', false);   // 将验证码输入框变为可编辑状态
            val.value = "获取验证码";
            wait = 60;
        } else {
            val.setAttribute("disabled", true);
            //$('#name').attr('disabled',true);   // 屏蔽用户名输入框，防止在倒计时当中，用户改变用户名
            $('#code').attr('disabled', false);  // 移除被屏蔽的验证码输入框
            val.value = "重新发送(" + wait + ")";
            wait--;
            setTimeout(function () {
                        time(val);
                    },
                    1000);
        }
    }

    $(".send").click(                   // 点击发送验证码按钮
            function () {
                $('#code').focus();
                time(this);
                var name = $('#name').val();
                var mobile = $('#mobile').val();
                var obj = {name: name, "mobile": mobile};
                $.ajax({
                    type: "POST",
                    dataType: "json",
                    url: "/sendPass",
                    data: obj,
                    async: true,       //将AJAX设为同步
                    success: function (data) {
                        if (data == 'error') {
                            layer.alert('今天密码发送已经超过规定次数，请明天重试，或联系ITS部门！', 2, function () {
                                layer.closeAll();
                            })
                        }
                    }});
            }
    );

</script>
</body>
</html>