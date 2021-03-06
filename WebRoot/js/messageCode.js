   $('#code').blur(function () {           // 失去焦点
	   $('.operate').hide();
	   $('.operate').attr('disabled',true);
        var span = $('#code').next('span');
		var name = $("#name").val();
		var code = $("#code").val();
		var queryString = "name="+name+"&code="+code;
        $.ajax({
 		   type: "POST",
 		   dataType:"json",
 		   url: "/checkSms",
 		   async: true,       //将AJAX设为同步
 		   data:queryString,
 		   success: function(data){
 			   if($('#code').val()==""){
 				   $('#code').val('请输入验证码');
 				   return
 			   }
 			  if(data){            //验证码输入匹配正确
				   if (span.size() <= 0) {
						 $('#code').after('<span><img src="../images/icon_pass.png"></span>');
						 $('.operate').attr('disabled',false);   //将解锁按钮打开
						 $('.operate').show();
						} else {
							    span.html('').html('<img src="../images/icon_pass.png">');
							   }
				   return
			   }
			   else{             //验证码输入匹配不正确
				   if (span.size() <= 0) {
						 $('#code').after('<span><img src="../images/icon_error.png"></span>');
						} else {
							    span.html('').html('<img src="../images/icon_error.png">');
							   }
				   return
			   }
 		   },
        });
    $('#code').focus(function () {
    	$('.operate').attr('disabled',true);
    	$('.operate').hide();
        var span = $('#code').next('span');
        $('#code').val('');
        if ($('#code').val(''))   // 获取焦点时且输入框值为空的时候
            span.remove();
    });
 });
