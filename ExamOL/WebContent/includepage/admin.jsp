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
	<%String power_str = (request.getParameter("power").equals("1")) ? "一级管理员":"二级管理员" ;%>
		<div class="admin_page">
			<table class="admin_table1">
				<tr>
					<td>姓名：</td>
					<td><%=request.getParameter("name") %></td>
				</tr>
				<tr>
					<td>账号：</td>
					<td><%=request.getParameter("number") %></td>
				</tr>
				<tr>
					<td>权限：</td>
					<td><%=power_str %></td>
				</tr>
			</table>
			<hr style="border-color:black;" />
			<table style="width:100%;margin: auto;text-align: center;" class="tianjia_tab">
				<tr>
					<td><input type="text" class="inf" placeholder="姓名" required="required"/></td>
					<td><input type="text" class="inf" placeholder="账号" required="required"/></td>
					<td><input type="text" class="inf" placeholder="密码" required="required"/></td>
					<td><input type="text" class="inf" placeholder="权限0/1" required="required"/></td>
					<td><button id=<%=request.getParameter("power") %> class="add_admin" style="cursor:pointer;width:60%;height:25px;background-color:brown">添加</button></td>
				</tr>
			</table>
			<hr style="border-color:black;" />
			<h3 style="margin-top:0;font-family:'楷体';">管理员列表</h3>
			<div class="admin_con">
				<table class="admin_list" border="1">
					<tr>
						<td>序号</td>
						<td>姓名</td>
						<td>账号</td>
						<td>权限</td>
						<td>操作</td>
					</tr>
				<% 	Connection c = new DBMessage().ConnectDB(); 
						Statement st = c.createStatement();
						ResultSet rs = st.executeQuery("select * from admin");
						int i =0;
						while(rs.next())
						{
							i++;
				%>
					<tr>
						<td><%=i %></td>
						<td><%=rs.getString("name") %></td>
						<td><%=rs.getString("number") %></td>
						<td><%=rs.getInt("power") %></td>
						<td>
							<button class="alter" id=<%=request.getParameter("power") %> style="background-color: green;" value=<%=rs.getString("number") %>>修改权限</button >
							<button class="delete" id=<%=request.getParameter("power") %> style="background-color: red;" value=<%=rs.getString("number") %>>删除</button>
						</td>
					</tr>
				<% 	} 
						rs.close();
						st.close();
						c.close();
				%>
	
				</table>
			</div>
		</div>
		
</body>
</html>