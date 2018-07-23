$(document).ready(function(){
	$("#student").css('border-bottom','solid');
	$("#student").css('color','red');
	$("#student").click(function(){
		$(this).css('border-bottom','solid');
		$(this).css('color','red');
		$("#teacher").css('border-bottom','none');
		$("#teacher").css('color','black');
		$(".form-container div:eq(1)").hide();
		$(".form-container div:eq(0)").show();
		$(".login-form").css('background-color','blueviolet');
	});
	$("#teacher").click(function(){
		$(this).css('border-bottom','solid');
		$(this).css('color','red');
		$("#student").css('border-bottom','none');
		$("#student").css('color','black');
		$(".form-container div:eq(0)").hide();
		$(".form-container div:eq(1)").show();
		$(".login-form").css('background-color','sandybrown');
	});
	
	$("#student-login").click(function(){
		var num = $("#student-num").val();
		var pwd = $("#student-pwd").val();
		if(num!=""&&pwd!=""){
			$.post(
				"UserLogin",
				{
					student_num: num,
					student_pwd: pwd
				},
				function (data, status) {
		        	if(status=='success'){
		        		var databack=eval("("+data+")");
		        		if(databack.result=='1'){
		        			location.href="home.jsp?name="+databack.name+"&number="+databack.number+
		        				"&banji="+databack.class+"&addclass="+databack.addclass;
		        		}
		        		else if(databack.result=='-1') alert("账号或密码不存在");
		        		else if(databack.result=='0') alert("登录失败，出现异常");
		        	}
		        	else{
		        		alert("请求失败");
		        	}
		        }
			);
		}
		else alert("请正确填写登录信息");
		
	});
	
	$("#teacher-login").click(function(){
		var num = $("#teacher-num").val();
		var pwd = $("#teacher-pwd").val();
		if(num!=""&&pwd!=""){
			$.post(
				"AdminLogin",
				{
					teacher_num: num,
					teacher_pwd: pwd
				},
				function (data, status) {
		        	if(status=='success'){
		        		var databack=eval("("+data+")");
		        		if(databack.result=='1'){
		        			location.href="backstage.jsp?name="+databack.name+"&number="+databack.number+
	        				"&power="+databack.power;
		        		}
		        		else if(databack.result=='-1') alert("账号或密码不存在");
		        		else if(databack.result=='0') alert("登录失败，出现异常");
		        	}
		        	else{
		        		alert("请求失败");
		        	}
		        }
			);
		}
		else alert("信息不能为空");
	});
});
