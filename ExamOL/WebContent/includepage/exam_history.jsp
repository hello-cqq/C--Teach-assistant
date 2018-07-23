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
		<div style="width:100%;height:100%;">
			<table style="width:100%;text-align:center;">
			<tr>
				<td>序号</td>
				<td>科目</td>
				<td>名称</td>
				<td>时间</td>
				<td>查看</td>
			</tr>
		<% 	Connection c = new DBMessage().ConnectDB(); 
				Statement st = c.createStatement();
				Statement st1 = c.createStatement();
				String number = request.getParameter("number");
				String test_name="";
				String course_num="";
				String course_name="";
				String test_href="";
				String[] q_nums=null;
				ResultSet rs = st.executeQuery("select * from test order by id desc");
				ResultSet rs1 = null;
				int i =0;
				while(rs.next())
				{
					if(number.equals(rs.getString("creator")))
					{
						test_name = rs.getString("name");
						course_num = rs.getString("course");
						rs1 = st1.executeQuery("select name from course where num="+course_num);
						while(rs1.next())
						{
							course_name=rs1.getString("name");
						}
						i++;
						test_href="history_exam_view.jsp?test_id="+rs.getInt("id");
			%>
						<tr>
							<td><%=i %></td>
							<td><%=course_name %></td>
							<td><%=test_name %></td>
							<td><%=rs.getDate("time") %></td>
							<td><a href=<%=test_href %> target="_search">查看</a></td>
						</tr>
			<%	
					}
				}
				rs1.close();
				rs.close();
				st.close();
				st1.close();
				c.close();
			%>
		
		</table>
		</div>
		<script>
		$(document).ready(function(){
			$("button").click(function(){

			});
		});
		</script>
</body>
</html>