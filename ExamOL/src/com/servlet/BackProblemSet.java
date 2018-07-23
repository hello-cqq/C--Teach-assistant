package com.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
//import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import upload.program.ProblemSet;
@SuppressWarnings("serial")
public class BackProblemSet extends HttpServlet{
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try {
			String message = "";
			request.setCharacterEncoding("utf-8");
			
			String pro_title = request.getParameter("title");
			String pro_content = request.getParameter("content");
			String pro_type = request.getParameter("type");
			String pro_dif = request.getParameter("difficult");
			String pro_score= request.getParameter("score");
			if(pro_title!=null){
				int val1 = new ProblemSet().addProblem(pro_content,pro_title,pro_type,pro_dif,pro_score);
				if(val1==1) 
					message="{'state':'³É¹¦','result':'1'}";
			}
			response.setContentType("text/html;charset=utf-8");
			response.getWriter().write(message);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			response.getWriter().write("{'state':'Ê§°Ü','result':'0'}");
		}

	}

}
