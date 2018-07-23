package com.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
//import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import upload.program.AddClass;
@SuppressWarnings("serial")
public class AddClassServlet extends HttpServlet{
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try {
			String message = "";
			request.setCharacterEncoding("utf-8");

			String classNum = request.getParameter("classnum");
			String studNum = request.getParameter("number");
			int val1 = new AddClass().addClass(studNum,classNum);
			if(val1==1) 
				message="{'state':'³É¹¦','result':'1'}";
			response.setContentType("text/html;charset=utf-8");
			response.getWriter().write(message);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			response.getWriter().write("{'state':'Ê§°Ü','result':'0'}");
		}

	}

}
