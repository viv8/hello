package com.jspiders.studentsapp.servlets;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mysql.jdbc.Driver;

public class Viewallstudentdelete extends HttpServlet
{
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException 
	{
			resp.setContentType("text/html");
			PrintWriter out=resp.getWriter();
			
	System.out.println("mime type set");

		Connection con = null;
		ResultSet rs = null;
		Statement stmt = null;
		
		try {
			Driver driverref = new Driver();
			DriverManager.registerDriver(driverref);
			String dburl = "jdbc:mysql://localhost:3306/Becm145_DB?user=root&password=root";
			con = DriverManager.getConnection(dburl);
		
			String query = "select * from students_info si,students_otherinfo so,guardian_info gi"
					+ " where si.regno=so.regno and so.regno=gi.regno";
			
			stmt = con.createStatement();
			rs = stmt.executeQuery(query);
			
			 out.println("<html>"
					     
			            + "<body>"
	  		      
	  		     + "<table border=\"1\"width=\"100%\" >"
	  		     +"<tr ><th>Regno</th><th>First Name</th><th>Middle Name</th><th>Last Name</th><th>Is Admin</th><th>Password</th><th>Gfirst Name</th><th>Gmiddle Name</th><th>GLast Name</th><th>Delete</th> </tr>");
			 while(rs.next()) 
			{
				
				int regno=rs.getInt("regno");//Integer.parseInt(req.getParameter("regno"));
				String fnm=rs.getString("firstname");
	    		   String mnm=rs.getString("middlename");
	    		   String lnm=rs.getString("lastname");
	    		   String admin=rs.getString("isadmin");
	    		   String passw=rs.getString("password");
	    		   String gfnm=rs.getString("gfirstname");
	    		   String gmnm=rs.getString("gmiddlename");
	    		   String glnm=rs.getString("glastname");
	    		   out.println("<tr><td>"  
	    		    		 + regno
	    	    		     +"</td><td>"
	    	    		     + fnm
	    	    		     +"</td><td> "
	    	    		     +mnm
	    	    		     +"</td><td>"
	    	    		     +lnm
	    	    		     +"</td><td>"
	    	    		     +admin
	    	    		     +"</td><td>"
	    	    		     +passw
	    	    		     +"</td><td>"
	    	    		     +gfnm
	    	    		     +"</td><td>"
	    	    		     +gmnm
	    	    		     +"</td><td>"
	    	    		     +glnm
	    	    		     +"</td>"+"<td>"
	    	    		    
	    	    		    +"<a href=\"./deleteservlet?regno="
	    	    		     +regno
	    	    		     + "\">Delete</a>"
	    	    		     + "</td>"+"</tr>");
	    	    		    
	    	    		     
	    	    		     
	    	    		    
	    	 }
			out.print("</table>"
	   		     +"</body>"		
	   			 +"</html>");
		} catch (Exception e) {
			e.printStackTrace();

		} finally {
			System.out.println("close all jdbc objects");
		}

		try {
			if (con != null) {
				con.close();
			}
			if (stmt != null) {
				stmt.close();

			}
			if (rs != null) {
				rs.close();

			}
		}

		catch (SQLException e) {
			e.printStackTrace();
		}

	}

	}


