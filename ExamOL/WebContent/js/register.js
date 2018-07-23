$(document).ready(function(){
	$("#register").click(function(){
		var name = $("#regname").val();
		var num = $("#regnum").val();
		var banji = $(".banji option:selected").val();
		var pwd = $("#regpwd").val();
		if(name==""||num==""||pwd==""){
			alert("内容不能为空");
		}
		else{
			$.post(
				"Register",
				{
					name:name,
					xuehao:num,
					mima:pwd,
					banji:banji
				},
				function (data, status) {
		        	if(status=='success'){
		        		var databack=eval("("+data+")");
		        		if(databack.result=='1'){
		        			alert("注册成功，请前往登录");
		        			location.href="index.html";
		        		}
		        		else if(databack.result=='-1') alert("账号已存在");
		        		else if(databack.result=='0') alert("注册失败，出现异常");
		        	}
		        	else{
		        		alert("请检查网络连接是否正确");
		        	}
		        }
			);
		}
	});
});