package com.jspiders.studentsapp.servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Readcookie extends HttpServlet
{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		PrintWriter out=resp.getWriter();
		
		Cookie[] receivedcookie=req.getCookies();
		if(receivedcookie==null)
		{
			out.println("<h1>cookie is  not present in the request</h1>");
		}
		else {
			out.println("<h1>cookie is "+ " present in the request</h1>");
			for(Cookie receive:receivedcookie)
			{
			String cookiename=receive.getName();
			String cookievalue=receive.getValue();
			out.print(cookiename);
			out.println(cookievalue);
			}
	}

}
}
