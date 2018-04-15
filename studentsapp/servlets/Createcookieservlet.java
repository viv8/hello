package com.jspiders.studentsapp.servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Createcookieservlet  extends HttpServlet
{
@Override
protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	Cookie persistent=new  Cookie("iscreated","true");
	
	
	persistent.setMaxAge(7*24*60*60);
	resp.addCookie(persistent);
	Cookie nonpersistent=new Cookie("cookie2","trueno2");
	nonpersistent.setMaxAge(60);//time in seconds
	resp.addCookie(nonpersistent);
	PrintWriter out=resp.getWriter();
	out.println("<h1>cookie is present in the request</h1>");
}
}
