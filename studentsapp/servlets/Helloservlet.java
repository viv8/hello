package com.jspiders.studentsapp.servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;


import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Helloservlet extends HttpServlet

{
public Helloservlet()
{
	System.out.println("servlet object created");
}
public void init() throws ServletException
{
	System.out.println("servlet is being intialized or initialization happens");
}
protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException 	{
	System.out.println("REQUEST GOT IT");
	resp.setContentType("text/html");
	PrintWriter out=resp.getWriter();
	
	out.println("<h1>helloworld</h1>");
}

public void destroy()
{
	System.out.println("cache deleted or servlet will be destroyed");
}


}