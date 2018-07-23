<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="upload.program.*" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<title></title>
		<script src="https://apps.bdimg.com/libs/jquery/1.10.2/jquery.min.js"></script>
		
		<% request.setCharacterEncoding("utf-8"); %>
</head>
<body>
	<div class="course_page">
		<table class="mycoursetable">
			<caption>我的课堂</caption>
			<tr>
				<td>序号</td>
				<td>课程</td>
				<td>编号</td>
				<td>操作</td>
			</tr>
			<% 	Connection c = new DBMessage().ConnectDB(); 
					Statement st = c.createStatement();
					ResultSet rs = st.executeQuery("select * from course where teachnum="+request.getParameter("number"));
					int i =0;
					while(rs.next())
					{
						i++;
			%>
				<tr>
					<td><%=i %></td>
					<td><%=rs.getString("name") %></td>
					<td><%=rs.getString("num") %></td>
					<td>
						<button  class="into_course" style="background-color: green;" id=<%=rs.getString("num") %> value=<%=rs.getString("name") %>>进入课堂</button >
					</td>
				</tr>
			<% 	} 
			%>
		</table>
		<hr style="border-color:black;" />
		<table class="allcoursetable">
			<caption>课程列表</caption>
			<tr>
				<td>序号</td>
				<td>课程</td>
				<td>编号</td>
				<td>教师</td>
				<td>操作</td>
			</tr>
			<% 
	
			rs = st.executeQuery("select * from course");
					int j =0;
					while(rs.next())
					{
						j++;
			%>
				<tr>
					<td><%=j %></td>
					<td><%=rs.getString("name") %></td>
					<td><%=rs.getString("num") %></td>
					<td><%=rs.getString("teacher") %></td>
					<td>
						<button  class="delcourse" value=<%=rs.getString("num") %> id=<%=request.getParameter("power") %> style="background-color: red;">删除课程</button >
					</td>
				</tr>
			<% 	} 
					rs.close();
					st.close();
					c.close();
			%>
		</table>
		<hr style="border-color:black;" />
		<table class="addcourse">
			<tr>
				<td>课程名称</td>
				<td>编号</td>
				<td>教师账号</td>
				<td>教师</td>
			</tr>
			<tr>
				<td><input type="text" class="c" placeholder="课程名称" required="required"/></td>
				<td><input type="text" class="c" placeholder="编号" required="required"/></td>
				<td><input type="text" class="c" placeholder="教师账号" required="required"/></td>
				<td><input type="text" class="c" placeholder="教师名字" required="required"/></td>
			</tr>
		</table>
		<button style="cursor:pointer" class="addcoursebtn"  id=<%=request.getParameter("power") %>>添加课程</button >
	</div>
</body>
</html>