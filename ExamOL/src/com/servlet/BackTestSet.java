package com.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
//import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import upload.program.TestSet;
@SuppressWarnings("serial")
public class BackTestSet extends HttpServlet{
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try {
			String message = "";
			request.setCharacterEncoding("utf-8");
			String testname = request.getParameter("test_title");
			String coursenum = request.getParameter("num");
			String pronum= request.getParameter("pro_nums");
			int val = new TestSet().addTest(testname,pronum,coursenum);
			if(val==1) 
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
