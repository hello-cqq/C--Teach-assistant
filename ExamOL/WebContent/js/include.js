$(document).ready(function(){
//	$(".alter").unbind();
	$(".alter").click(function(){
		if($(this).attr('id')=="1"){
			var power = prompt("请输入权限(0或1):");
			if(power!="0"&&power!="1")alert("请正确输入权限值");
			else{
				$.post(
						"BackAdminSet",
						{
							alternum: $(this).val(),
							pow:power
						},
						function (data, status) {
				        	if(status=='success'){
				        		var databack=eval("("+data+")");
				        		if(databack.result=='1'){
				        			alert("修改成功");
				        			location.reload();
				        		}
				        		else alert("删除失败");
				        	}
				        	else{
				        		alert("请求失败");
				        	}
				        }
				);
			}
		}
		else {
			alert("对不起，你没有该权限");
		}
		
	});
	$(".delete").click(function(){
		if($(this).attr('id')=="1"){
			if(confirm("确定要删除该管理员吗?")){
				$.post(
						"BackAdminSet",
						{
							delnum: $(this).val()
						},
						function (data, status) {
				        	if(status=='success'){
				        		var databack=eval("("+data+")");
				        		if(databack.result=='1'){
				        			alert("删除成功");
				        			location.reload();
				        		}
				        		else alert("删除失败");
				        	}
				        	else{
				        		alert("请求失败");
				        	}
				        }
				);
			}
		}
		else {
			alert("对不起，你没有该权限");
		}
		
	});
	
	$(".add_admin").click(function(){
		var name = $(".inf:eq(0)").val();
		var num = $(".inf:eq(1)").val();
		var pwd =$(".inf:eq(2)").val();
		var power =$(".inf:eq(3)").val();
		if($(this).attr('id')=="1"){
			if(name==""||num==""||pwd==""||power==""||(power!="0"&&power!="1")){
				alert("内容不能为空");
			}
			else{
				$.post(
						"BackAdminSet",
						{
							addname: name,
							addnum:num,
							addpwd:pwd,
							addpower:power
						},
						function (data, status) {
				        	if(status=='success'){
				        		var databack=eval("("+data+")");
				        		if(databack.result=='1'){
				        			alert("添加成功");
				        			location.reload();
				        		}
				        		else if(databack.result=='-1'){
				        			alert("账号已存在");
				        		}
				        		else alert("添加失败");
				        	}
				        	else{
				        		alert("请求失败");
				        	}
				        }
				);
			}
		}
		else alert("对不起，你没有该权限");
	});
	
	$(".delcourse").click(function(){
		if($(this).attr('id')=="1"){
			if(confirm("确定要删除该课程吗?")){
				$.post(
						"BackCourseSet",
						{
							coursenum: $(this).val()
						},
						function (data, status) {
				        	if(status=='success'){
				        		var databack=eval("("+data+")");
				        		if(databack.result=='1'){
				        			alert("删除成功");
				        			location.reload();
				        		}
				        		else alert("删除失败");
				        	}
				        	else{
				        		alert("请求失败");
				        	}
				        }
				);
			}
		}
		else {
			alert("对不起，你没有该权限");
		}
		
	});
	
	$(".addcoursebtn").click(function(){
		var name = $(".c:eq(0)").val();
		var num = $(".c:eq(1)").val();
		var teachernum =$(".c:eq(2)").val();
		var teachername =$(".c:eq(3)").val();
		if($(this).attr('id')=="1"){
			if(name==""||num==""||teachernum==""||teachername==""){
				alert("内容不能为空");
			}
			else{
				$.post(
						"BackCourseSet",
						{
							add_c_name: name,
							add_c_num:num,
							add_c_t_name:teachername,
							add_c_t_num:teachernum
						},
						function (data, status) {
				        	if(status=='success'){
				        		var databack=eval("("+data+")");
				        		if(databack.result=='1'){
				        			alert("添加成功");
				        			location.reload();
				        		}
				        		else if(databack.result=='-1'){
				        			alert("课程编号已存在");
				        		}
				        		else alert("添加失败");
				        	}
				        	else{
				        		alert("请求失败");
				        	}
				        }
				);
			}
		}
		else alert("对不起，你没有该权限");
	});
	
	$(".add_pro_btn").click(function(){
		var pro_title = $("#pro1").val();
		var pro_content = $("#pro2").val();
		var pro_type =$("#pro3").val();
		var pro_dif =$("#pro4 option:selected").val();
		var pro_score =$("#pro5").val();
		if(pro_title==""||pro_content==""||pro_type==""){
			alert("内容不能为空");
		}
		else{
			$.post(
					"BackProblemSet",
					{
						title: pro_title,
						content:pro_content,
						type:pro_type,
						difficult:pro_dif,
						score:pro_score
					},
					function (data, status) {
			        	if(status=='success'){
			        		var databack=eval("("+data+")");
			        		if(databack.result=='1'){
			        			alert("添加成功");
			        			location.reload();
			        		}
			        		
			        		else alert("添加失败");
			        	}
			        	else{
			        		alert("请求失败");
			        	}
			        }
			);
		}
	});
	
	$(".detail_btn").click(function(){
		location.href="detailed.jsp?id="+$(this).val();
	});
	$(".into_course").click(function(){
		location.href="course_test.jsp?name="+$(this).val()+"&id="+$(this).attr('id');
	});
});