package com.jspiders.studentsapp.servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Chat extends HttpServlet {
	@Override
	protected void  doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException 
	{
		PrintWriter out=resp.getWriter();
		String msg=req.getParameter("msg");
		resp.setContentType("text/html");
		System.out.println(msg);
		out.println(msg);
		req.setAttribute("chatconversation",msg);
		
		
	
		
	}
}