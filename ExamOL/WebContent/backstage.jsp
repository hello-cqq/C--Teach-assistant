<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<title>后台</title>
		<script src="https://apps.bdimg.com/libs/jquery/1.10.2/jquery.min.js"></script>
		<link rel="stylesheet" href="css/backstage.css" />
		<link rel="stylesheet" href="css/include.css" />
		<script src="js/backstage.js"></script>
		<script src="js/include.js"></script>
		<% request.setCharacterEncoding("utf-8"); %>
	</head>
	<body>
	<%	String name = request.getParameter("name");
			String number = request.getParameter("number");
			String power = request.getParameter("power");
	%>
		<div class="back_page">
			<h1 style="font-family: '楷体';">后台管理页面</h1>
			<div class="caidan">
				<ul>
					<li id="1">管理员</li>
					<li id="2">课程&考试</li>
					<li id="3">题库</li>
					<li id="4">考试</li>
					<li id="5">考试记录</li>
					<li id="6">提交记录</li>
					<li id="7">成绩</li>
					<li id="8">退出</li>
				</ul>
			</div>
			<div class="back_content">
				<div id="01" class="content">
					<jsp:include page="includepage/admin.jsp"></jsp:include>
				</div>
				<div id="02" class="content">
					<jsp:include page="includepage/course.jsp"></jsp:include>
				</div>
				<div id="03" class="content">
					<jsp:include page="includepage/problem.jsp"></jsp:include>
				</div>
				<div id="04" class="content">
					<jsp:include page="includepage/exam.jsp"></jsp:include>
				</div>
				<div id="05" class="content">
					<jsp:include page="includepage/exam_history.jsp"></jsp:include>
				</div>
				<div id="05" class="content">5</div>
				<div id="06" class="content">6</div>
				<div id="07" class="content">7</div>
				<div id="08" class="content">8</div>
			</div>
		</div>
		
	</body>
</html>
