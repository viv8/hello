package com.jspiders.studentsapp.servlets;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Searchengines  extends HttpServlet 
{
@Override
protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException 
{
	String keyword=req.getParameter("search");
	
	
	String searchengine=req.getParameter("sengine");
	String url="";
	if(searchengine.equals("Google"))
	{
		url="https://www.google.co.in/search?q="+keyword;
	}
	else if(searchengine.equals("Yahoo"))
	{
		url="https://in.search.yahoo.com/search?p="+keyword;
	}
	else 
	{
		url="";
	}
	resp.sendRedirect(url);
	
}


	

}
