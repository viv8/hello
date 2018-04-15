package com.jspiders.studentsapp.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class MyFirstServlet extends HttpServlet
{
	public MyFirstServlet()
	{
		System.out.println("servlet container creates object of searchservlet to access nonstatic methods as we extends from httpservlet");
	}
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		Date dateref=new Date();
		String currDate=dateref.toString();
		String fnmval=req.getParameter("fname");
		String lnmval=req.getParameter("lname");
		String htmlRes="<html>"+"<body>"+"<h1 >"+"current date & time is:"+"<font color=\"blue\">"+currDate+"</font>"
				+"</h1>"+"<h1>"+"fname="+
				fnmval+"</h1>"+"<br>"+"<h1>"+"lname="+lnmval+"</h1>"+"</body>"+"</html>";
		
		
		resp.setContentType("text/html");
		PrintWriter out=resp.getWriter();
		
		out.print(htmlRes);
	}

}
