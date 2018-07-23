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
	<div style="width:60%;height:100%;text-align:center;margin:auto;">
		
		<% 	Connection c = new DBMessage().ConnectDB(); 
				Statement st = c.createStatement();
				String exam_id = request.getParameter("test_id");
				String test_name="";
				String[] q_nums=null;
				ResultSet rs = st.executeQuery("select * from test where id="+exam_id);
				while(rs.next())
				{
					test_name = rs.getString("name");
					q_nums = rs.getString("q_num").split(";");
				}
		%>
		<h3><%=test_name %></h3>
		<table style="width:100%;text-align:center;font-size:16px;margin:auto;">
				<tr>
					<td>题号</td>
					<td>题目</td>
					<td>类型</td>
					<td>难度</td>
					<td>分值</td>
					<td>查看</td>
				</tr>
				<% 	
						int dif=0;
						String difficulty="";
						for(int i=0;i<q_nums.length;i++)
						{
							rs = st.executeQuery("SELECT * FROM problem where id="+new Integer(q_nums[i]));
							while(rs.next()){
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
				<% 	
						} 	
					}
					rs.close();
					st.close();
					c.close();
				%>
			</table>
	</div>
	<script>
		$(document).ready(function(){
			$(".detail_btn").click(function(){
				location.href="detailed.jsp?id="+$(this).val();
			});
		})
	</script>
</body>
</html>