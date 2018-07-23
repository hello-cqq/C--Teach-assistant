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
	<div class="problem_page">
		<table cellspacing="1">
			<tr>
				<td>标题</td>
				<td><input  type="text" id="pro1"/></td>
				<td rowspan="4"><textarea id="pro2">题目内容</textarea></td>
			</tr>
			<tr>
				<td>类型</td>
				<td><input  type="text" id="pro3"/></td>
				
			</tr>
			<tr>
				<td>难度</td>
				<td><select class="difficulty" id="pro4">
							<option value="1">简单</option>
							<option value="2">中等</option>
							<option value="3">较难</option>
							<option value="4">难</option>
						</select>
				</td>
			</tr>
			<tr>
				<td>分值</td>
				<td><input type="number" min=1 max=100 value="10" id="pro5"/></td>
			</tr>
		</table>
		<button style="cursor:pointer" class="add_pro_btn">添加到题库</button>
		<hr />
		<div class="tiku">
			<table>
				<tr>
					<td>题号</td>
					<td>题目</td>
					<td>类型</td>
					<td>难度</td>
					<td>分值</td>
					<td>查看</td>
				</tr>
				<% 	Connection c = new DBMessage().ConnectDB(); 
						Statement st = c.createStatement();
						ResultSet rs = st.executeQuery("SELECT * FROM problem order by id desc");
						int dif=0;
						String difficulty="";
						while(rs.next())
						{
							dif=rs.getInt("difficulty");
							switch(dif){
								case 1:
									difficulty="简单";
								break;
								case 2:
									difficulty="中等";
								break;
								case 3:
									difficulty="较难";
								break;
								case 4:
									difficulty="难";
								break;
									
							}
				%>
					<tr>
						<td><%=rs.getInt("id") %></td>
						<td><%=rs.getString("title") %></td>
						<td><%=rs.getString("type") %></td>
						<td><%=difficulty%></td>
						<td><%=rs.getInt("score") %></td>
						<td>
							<button class="detail_btn"  style="background-color: green;" value=<%=rs.getInt("id")%>>详细</button >
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