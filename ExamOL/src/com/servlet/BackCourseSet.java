package com.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
//import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import upload.program.CourseSet;
@SuppressWarnings("serial")
public class BackCourseSet extends HttpServlet{
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try {
			String message = "";
			request.setCharacterEncoding("utf-8");
			String delnum = request.getParameter("coursenum");
			
			
			String addnum = request.getParameter("add_c_num");
			String addname = request.getParameter("add_c_name");
			String teachername = request.getParameter("add_c_t_name");
			String teachernum= request.getParameter("add_c_t_num");
			if(delnum!=null){
				int val1 = new CourseSet().courseDelete(delnum);
				if(val1==1) 
					message="{'state':'成功','result':'1'}";
			}
			if(addnum!=null){
				int val2 = new CourseSet().addCourse(addname,addnum,teachername,teachernum);
				if(val2==1) 
					message="{'state':'成功','result':'1'}";
				if(val2==-1) 
					message="{'state':'成功','result':'-1'}";
			}
			response.setContentType("text/html;charset=utf-8");
			response.getWriter().write(message);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			response.getWriter().write("{'state':'失败','result':'0'}");
		}

	}

}
