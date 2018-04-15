package com.jspiders.studentsapp.servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class Logoutservlet extends HttpServlet
{
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException 
	{
			resp.setContentType("text/html");
			PrintWriter out=resp.getWriter();
			HttpSession session=req.getSession(false);
			if(session!=null)
			{
				session.invalidate();
				RequestDispatcher dispatcher=null;
				String url="Login1html.html";
				
				dispatcher=req.getRequestDispatcher(url);
				dispatcher.forward(req, resp);
				out.print("sdsdsd");
			
			}
			else {
				out.print("<html>"+"<body>"+"<table border=\"1\"width=\"100%\" >"+"<tr><td> doesnt log out"+"</td></tr>"+"</table>"
    					
			    				+"</body>"+"</html>");
				
			}
			

		}
}







