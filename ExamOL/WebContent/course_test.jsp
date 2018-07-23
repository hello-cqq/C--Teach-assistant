<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="upload.program.*" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<title>后台</title>
		<script src="https://apps.bdimg.com/libs/jquery/1.10.2/jquery.min.js"></script>
		<link rel="stylesheet" href="css/course_test.css" />
		<% request.setCharacterEncoding("utf-8"); %>
	</head>
	<body>
		<div class="test">
			<div class="test_form">
				<p><%= request.getParameter("name") %></p>
				<hr />
				<br />
				<input id="test_title" type="text" placeholder="考试名称" required="required"/><br /><br /><br />
				<button id="save_test_btn" value=<%= request.getParameter("id") %>>发布考试</button>
			</div>
			<div class="pro_base">
				<table>
					<tr>
						<td>选择</td>
						<td>题号</td>
						<td>题目</td>
						<td>分值</td>
					</tr>
					<% 	Connection c = new DBMessage().ConnectDB(); 
							Statement st = c.createStatement();
							ResultSet rs = st.executeQuery("SELECT * FROM problem order by id desc");
							
							while(rs.next())
							{
								
					%>
						<tr>
							<td><input type="checkbox" name="problem" value=<%=rs.getInt("id") %>></td>
							<td><%=rs.getInt("id") %></td>
							<td><%=rs.getString("title") %></td>
							<td><%=rs.getInt("score") %></td>
						</tr>
					<% 	} 
							rs.close();
							st.close();
							c.close();
					%>
			</table>
			</div>
		</div>
		<script>
			$(document).ready(function(){
				$("#save_test_btn").click(function(){
					
					var allpro_num="";
					for(var i=0;i<$("[name='problem']").length;i++){
						if($("[name='problem']")[i].checked){
							allpro_num+=($("[name='problem']")[i].value+";");
						}
					}
					var course_num= $(this).val();
					var title = $("#test_title").val();
					if(title==""||allpro_num==""){
						alert("内容不能为空");
					}
					else{
						$.post(
								"BackTestSet",
								{
									test_title: title,
									pro_nums:allpro_num,
									num:course_num
								},
								function (data, status) {
						        	if(status=='success'){
						        		var databack=eval("("+data+")");
						        		if(databack.result=='1'){
						        			alert("发布成功");
						        			location.reload();
						        		}
						        		
						        		else alert("发布失败");
						        	}
						        	else{
						        		alert("请求失败");
						        	}
						        }
						);
					}
				});
			});
		</script>
	</body>
</html>