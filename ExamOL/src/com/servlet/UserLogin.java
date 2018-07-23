package com.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
//import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import upload.program.LoginProgram;

@SuppressWarnings("serial")
public class UserLogin extends HttpServlet{
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try {
			String message = "";
			request.setCharacterEncoding("utf-8");
			String number = request.getParameter("student_num");
			String password = request.getParameter("student_pwd");
			String[] result = new LoginProgram().user_validate(number,password);
			//System.out.println(result[0]+"-"+result[1]);
			if(result[0].equals("1")) 
				message="{'state':'³É¹¦','result':'1','name':'"+result[1]+"','number':'"+result[2]+
				"','class':'"+result[3]+"','addclass':'"+result[4]+"'}";
			else {
				message = "{'state':'Ê§°Ü','result':'-1'}";
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
