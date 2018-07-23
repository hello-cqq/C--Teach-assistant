<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="upload.program.*" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<title>首页</title>
		<script src="https://apps.bdimg.com/libs/jquery/1.10.2/jquery.min.js"></script>
		<link rel="stylesheet" href="css/home.css" />
		<script src="js/home.js"></script>
		<% request.setCharacterEncoding("utf-8"); %>
</head>
<body>
	<%int imgNo = (request.getParameter("number")).charAt(1) ;%>
	<%String imgPath =""; %>
	<%if(imgNo%3==0) imgPath="img/head1.jpg";%>
	<%if(imgNo%3==1) imgPath="img/head2.jpg";%>
	<%if(imgNo%3==2) imgPath="img/head3.jpg";%>
	<jsp:include page="program.html"></jsp:include>
	<div class="home_page">
		<div class="personal_info">
			<div class="headimg" ><img src=<%=imgPath %> width="100%" height="100%" /></div>
			<div class="info">
				<table class="info_table" border="1">
					<tr>
						<td colspan="3" style="font-size: 24px;font-family: '楷体';color: ;"><b><i style="color: aqua;">HUST</i> C语言助教平台</b></td>
					</tr>
					<tr>
						<th>姓名</th>
						<th>班级</th>
						<th>学号</th>
					</tr>
					<tr>
						<td><%=request.getParameter("name") %></td>
						<td><%=request.getParameter("banji") %></td>
						<td class="studentnum"><%=request.getParameter("number") %></td>
					</tr>
				</table>
			</div>
		</div>
		<div class="home_menu" style="margin-top:0;">
			<div style="width:100%;height:50%;border-bottom:solid;">
				<div style="width:10%;height:100%;text-align:center;border-right:solid;float:left;position:relative;"><br />课<br />程<br />列<br />表</div>
				<div style="width:89%;height:100%;text-align:center;float:left;position:relative;">
					<table style="width:100%;text-align:center;font-size:16px;" border="1">
					<% 	Connection c = new DBMessage().ConnectDB(); 
							Statement st = c.createStatement();
							ResultSet rs = st.executeQuery("select addclass from user where number="+request.getParameter("number"));
							String[] course_nums=null;
							Statement st1 = c.createStatement();
							ResultSet rs1 = null;
							String courseName="";
							String courseTeacher="";
							while(rs.next())
							{
								course_nums = (rs.getString("addclass")).split(";");
							}
							for(int i=0;i<course_nums.length;i++){
								rs1 = st1.executeQuery("select * from course where num="+course_nums[i]);
								while(rs1.next()){
									courseName = rs1.getString("name");
									courseTeacher = rs1.getString("teacher");
								}
					%>
								<tr>
									<td style="width:25%"><%=(i+1) %></td>
									<td style="width:25%"><%=course_nums[i] %></td>
									<td style="width:25%"><%=courseName %></td>
									<td style="width:25%"><%=courseTeacher %></td>
								</tr>
					<% 
							}
							rs1.close();
							rs.close();
							st1.close();
							st.close();
					%>
						
					</table>
				</div>
			</div>
			<div style="width:100%;height:50%;border-bottom:solid;">
				<div style="width:10%;height:100%;text-align:center;border-right:solid;float:left;position:relative;"><br />考<br />试<br />列<br />表</div>
				<div style="width:89%;height:100%;text-align:center;float:left;position:relative;">
					<table style="width:100%;text-align:center;font-size:16px;" border="1">
					<% 	
							Statement st2 = c.createStatement();
							ResultSet rs2 = null;
							String href ="";
							for(int i=0;i<course_nums.length;i++){
								rs2 = st2.executeQuery("select * from test where course="+course_nums[i]);
								while(rs2.next()){
									href="do.jsp?id="+rs2.getInt("id")+"&student="+request.getParameter("name")+
											"&xuehao="+request.getParameter("number")+"&classroom="+request.getParameter("banji");
					%>
									<tr>
										<td style="width:25%"><%=(i+1) %></td>
										<td style="width:25%"><%=rs2.getString("name") %></td>
										<td style="width:25%"><a href=<%=href %> target="_search">进入</a></td>
									</tr>
								
					<% 	
									break;
								}
							}
							rs1.close();
							rs.close();
							st1.close();
							st.close();
					%>
						
					</table>
				</div>
			</div>
		</div>
		<div class="beizhu" style="margin-top:30px;text-align:center;">
			<input class="searchcourse" type="text" style="height:20px;"/>
			<button class="addclass" style="height:25px;">添加课堂</button>
		</div>
	</div>
	<script>
		$(document).ready(function(){
			$(".addclass").click(function(){
				$.post(
					"AddClassServlet",
					{
						classnum:$(".searchcourse").val(),
						number:$(".studentnum").text()
					},
					function (data, status) {
			        	if(status=='success'){
			        		var databack=eval("("+data+")");
			        		if(databack.result=='1'){
			        			alert("加入课堂成功");
			        			location.reload();
			        		}
			        	}
			        	else{
			        		alert("请求失败");
			        	}
			        }
				);
			});
		});
	</script>
</body>
</html>