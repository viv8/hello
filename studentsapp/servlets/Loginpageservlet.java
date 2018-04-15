package com.jspiders.studentsapp.servlets;



import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mysql.jdbc.Driver;
public class Loginpageservlet extends HttpServlet
{
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException 
		{
				resp.setContentType("text/html");
				PrintWriter out=resp.getWriter();
				
				
		System.out.println("mime type set");

        String value="";
		Cookie[] receivedcookie=req.getCookies();
		if(receivedcookie==null)
		{
			out.println("<h1>cookie is  not present in the request</h1>");
		}
		else {
			out.println("<h1>cookie is "+ " present in the request</h1>");
			for(Cookie receive:receivedcookie)
			{
			if((receive.getName()).equals("regno"))
			{
		 value=receive.getValue();
		 //out.print(regno);
			break;
			}
		}
		}
			
				
				out.println("<html>"
		                    +"<body>"
				            +"<form  method="+"post"+" action=http://localhost:8080/studentsApp/loginall >"
				    		+"<fieldset width=\"100%\">"
				    	    +"<legend>Students Login </legend>"
				    		+"<table>"
				    		+"<tr>"
				    		+"<td>Registration No:</td>"
				    		+"<td><input type=text name=regno  value="+value+"  ></td>"
				    		+"</tr>"
				    		+"<tr>"
				    		+"<td>Password:</td>"
				    		+"<td><input type=password name=pass placeholder=PASSWORD></td>"
				    		+"</tr>"
				    		+"<tr>"
				    		+"<td></td>"
				    		+"<td><input type=checkbox name=remember value=checked>Remember Me</td>-->"
				    		+"</tr>"
				    		+"<tr>"
				    	    +"<td><input type=submit name=login value=Login></td>"
				    	    +"<td><input type=reset name=formreset value=Reset></td>"
				    	    +"</tr>"
				    		+"</table>"
				    		+"</fieldset>"
				    	    +"</form>"
				            +"</body>"
				            +"</html>");
		}
}




