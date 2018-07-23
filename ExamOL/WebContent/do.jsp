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
		<title>首页</title>
		<script src="https://apps.bdimg.com/libs/jquery/1.10.2/jquery.min.js"></script>
		<link rel="stylesheet" href="css/do.css" />
		<% request.setCharacterEncoding("utf-8"); %>
</head>
<body>
	<%
			String getTestId=request.getParameter("id");
			String getStudentName=request.getParameter("student");
			String getXuehao=request.getParameter("xuehao");
			String getClass=request.getParameter("classroom");
			Connection c = new DBMessage().ConnectDB(); 
			Statement st = c.createStatement();
			Statement st1 = c.createStatement();
			String[] all_pro=null;
			ResultSet rs = st.executeQuery("SELECT q_num FROM test where id="+getTestId);
			ResultSet rs1=null;
			Scanner sc=null;
			while(rs.next())
			{
				all_pro = rs.getString("q_num").split(";");
			}
			int dif=0;
			String difficulty="";
			int pro_score=0;
			String pro_title="";
			String pro_type="";
			String pro_content="";
	%>
	<jsp:include page="program.html"></jsp:include>
	<div class="do_page">
		<div  class="pro_div">
			<%
				for(int i=0;i<all_pro.length;i++)
				{
					rs1 = st1.executeQuery("SELECT * FROM problem where id="+new Integer(all_pro[i]));
					while(rs1.next()){
						dif=rs1.getInt("difficulty");
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
					pro_title = rs1.getString("title");
					pro_type= rs1.getString("type");
					pro_score = rs1.getInt("score");
					}
					try{
						sc  = new Scanner(new File("E:/Examol/Problem/"+all_pro[i]+"/problem.txt"));
						while(sc.hasNextLine()){
							pro_content+=sc.nextLine();
						}
					}
					catch(Exception e){
						pro_content="";
					}
		%>
				<div style="width:100%;height:100%;position:relative;" class=<%=(i+1) %> id="cqq">
					<div style="width:100%;height:11.5%;position:relative;">
						<div style="width:100%;height:50%;test-align:center;border-bottom-color:soild white;text-align:center;"><h4><%=(i+1+"."+pro_title) %></h4></div>
						<div style="width:100%;height:50%">
							<table style="width:100%;text-align:center;">
								<tr>
									<td>类型：<%=pro_type %></td>
									<td>分值：<%=pro_score %></td>
									<td>难度：<%=difficulty %></td>
								</tr>
							</table>
						</div>
					</div>
					<div style="width:100%;height:88.5%;background-color:white;position:relative;text-align:left;">
						<%=pro_content %>
					</div>
				</div>	
		<% 
				}
				sc.close();
				rs.close();
				rs1.close();
				st.close();
				st1.close();
				c.close();
		%>
		</div>
		<div class="pro_index" style="text-align:center;">
			<% 
			for(int i=0;i<all_pro.length;i++)
			{
				%>
				<button value=<%=(i+1) %> style="width:30px;height:30px;border-radius:100%;margin-auto;float:center;position:relative;margin-right:15px;margin-top:30px;cursor:pointer;"><%=(i+1) %></button>
				<% 
			}
			%>
		</div>
		<div class="upInf" id=<%=getTestId %>>
			<table style="width:100%;margin-top:20px;text-align:center">
				<tr>
					<td class="inf_td"><%=getXuehao %></td>
					<td class="inf_td"><%=getStudentName %></td>
					<td class="inf_td"><%=getClass %></td>
				</tr>
			</table>
			
			
			
		</div>
		
	</div>
	<script>
		var i=1;
		$(document).ready(function(){
			$(".pro_index button:eq(0)").css('background-color','yellow');
			$(".pro_index button").click(function(){
				$(".pro_index button").css('background-color','white');
				$(this).css('background-color','yellow');
				$("#cqq").hide();
				$("."+$(this).attr('value')).show();
				i=$(this).attr('value');
			});
			
			$(".upload").click(function(){
				var name=timestamp();
				var studentname = $(".inf_td:eq(1)").text();
				var studenthaoma = $(".inf_td:eq(0)").text();
				var studentbanji = $(".inf_td:eq(2)").text();
				var examid = $(".upInf").attr('id');
				console.log(name);
				console.log(editor.getValue());
				$.post(
			        "Code",
			        {
			            code: editor.getValue(),
			            filename:name,
			            banji:studentbanji,
			            num:studenthaoma,
			            examId:examid,
			            tihao:i,
			            name:studentname
			        },
			        function (data, status) {
			            if (status === 'success') {
			                //var arrdata=eval("("+data+")");
			                //alert(data);
			                $(".output").html(data);

			            } else {
			                alert("代码上传失败");
			            }
			        }
			    );
			});
		});
		function timestamp(){  
		     var time = new Date();  
		     var y = time.getFullYear();  
		     var m = time.getMonth()+1;  
		     var d = time.getDate();  
		     var h = time.getHours();  
		     var mm = time.getMinutes();  
		     var s = time.getSeconds();  
		   
		     return ""+y+add0(m)+add0(d)+add0(h)+add0(mm)+add0(s);  
		 }  
		function add0(m){  
		   return m<10?'0'+m : m;  
		}
		var count=1;
		function shensuo(){
			count++;
			$("#console").slideToggle(1);
			if(count%2==0)
			{
				$(".editor").css('height',"102%");
				$(".menubar").css('height',"12%");
				$("#handleImg").attr('src','img/HandleOut.png');
			}
			else {
				$(".editor").css('height',"80%");
				$(".menubar").css('height',"15%");
				$("#handleImg").attr('src','img/HandleIn.png');
			}
		}
	</script>
	
</body>
</html>