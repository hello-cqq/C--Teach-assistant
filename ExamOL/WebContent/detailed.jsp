<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="upload.program.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%@ page import="java.util.Scanner" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<title>后台</title>
		<script src="https://apps.bdimg.com/libs/jquery/1.10.2/jquery.min.js"></script>
		<link rel="stylesheet" href="css/detailed.css" />
		<% request.setCharacterEncoding("utf-8"); %>
	</head>
	<body>
	<%	int pro_id = new Integer(request.getParameter("id"));
			Connection c = new DBMessage().ConnectDB(); 
			Statement st = c.createStatement();
			ResultSet rs = st.executeQuery("SELECT * FROM problem where id="+pro_id);
			int dif=0;
			String difficulty="";
			int pro_score=0;
			String pro_title="";
			String pro_type="";
			String pro_content="";
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
				pro_title=rs.getString("title");
				pro_type=rs.getString("type");
				pro_score=rs.getInt("score");
			}
			rs.close();
			st.close();
			c.close();
			try{
				Scanner sc  = new Scanner(new File("E:/Examol/Problem/"+pro_id+"/problem.txt"));
				while(sc.hasNextLine()){
					pro_content+=sc.nextLine();
				}
				sc.close();
			}
			catch(Exception e){
				pro_content="";
			}
	%>
		<div class="detail_page">
			<div class="pro_head">
				<div style="float:left;">题号：<%=pro_id %></div>
				<div style="float:right;">类型：<%=pro_type %></div>
				<div style="float:right;">难度：<%=difficulty %></div>
			</div>
			<h2 style="text-align:center;font-family:'楷体';"><%=pro_title %></h2>
			<div style="width:80%;height:180px;"><%=pro_content %></div>
			<hr />
			<h3>测试用例</h3>
			<div style="width:50%;height:180px;float:left;position:relative;text-align:center;">
			<h3>input</h3>
				<ol>
					<%	
						try{
							File inputf= new File("E:/Examol/Problem/"+pro_id+"/input");
							Scanner sc_in= null;
							String input_data="";
							if(inputf.exists()){
								File[] input_file_list = inputf.listFiles();
								if(input_file_list!=null){
									for(int i=0;i<input_file_list.length;i++){
										sc_in=new Scanner(input_file_list[i]);
										while(sc_in.hasNextLine()){
											input_data+=(sc_in.nextLine()+";");
										}
					%>
										<li style="text-align:center;"><%=input_data %></li>
					<%
										input_data="";
									}
								}
							}
							sc_in.close();
						}
						catch(Exception e){
							
						}
					%>
				</ol>
			</div>
			<div style="width:50%;height:180px;float:left;position:relative;text-align:center;">
			<h3>output</h3>
				<ol>
					<%	
						try{
							File outputf= new File("E:/Examol/Problem/"+pro_id+"/output");
							Scanner sc_out= null;
							String output_data="";
							if(outputf.exists()){
								File[] output_file_list = outputf.listFiles();
								if(output_file_list!=null){
									for(int i=0;i<output_file_list.length;i++){
										sc_out=new Scanner(output_file_list[i]);
										while(sc_out.hasNextLine()){
											output_data+=(sc_out.nextLine()+";");
										}
					%>
										<li style="text-align:center;"><%=output_data %></li>
					<%
										output_data="";
									}
								}
							}
							sc_out.close();
						}
						catch(Exception e){
							
						}
					%>
				</ol>
			</div>
			<hr />
		</div>
	</body>
</html>