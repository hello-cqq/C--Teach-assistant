package com.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
//import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import upload.program.AdminSet;
@SuppressWarnings("serial")
public class BackAdminSet extends HttpServlet{
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try {
			String message = "";
			request.setCharacterEncoding("utf-8");
			String number = request.getParameter("delnum");
			
			String alternum = request.getParameter("alternum");
			String power = request.getParameter("pow");
			
			String addnum = request.getParameter("addnum");
			String addname = request.getParameter("addname");
			String addpwd = request.getParameter("addpwd");
			String addpower= request.getParameter("addpower");
			if(number!=null){
				int val1 = new AdminSet().adminDelete(number);
				if(val1==1) 
					message="{'state':'成功','result':'1'}";
			}
			if(alternum!=null){
				int val2 = new AdminSet().powerEdit(alternum,power);
				if(val2==1) 
					message="{'state':'成功','result':'1'}";
			}
			if(addnum!=null){
				int val3 = new AdminSet().addAdmin(addname,addnum,addpwd,addpower);
				if(val3==1) 
					message="{'state':'成功','result':'1'}";
				if(val3==-1) 
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
