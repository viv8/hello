package com.jspiders.studentsapp.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.PreparedStatement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mysql.jdbc.Driver;

public class Searchservlet extends HttpServlet
{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		int regno = Integer.parseInt(req.getParameter("regno"));
		PrintWriter out = resp.getWriter();
		Connection con = null;
		ResultSet rs = null;
		PreparedStatement  prdstmt = null;
		String output;
		RequestDispatcher dispatcher=null;
		try {
			Driver driverref = new Driver();
			DriverManager.registerDriver(driverref);
			String dburl = "jdbc:mysql://localhost:3306/Becm145_DB?user=root&password=root";
			con = DriverManager.getConnection(dburl);
			//String query = "select * from students_info si,students_otherinfo so,guardian_info gi"
				//	+ " where si.regno=so.regno and so.regno=gi.regno and so.regno=? and so.password=?";
			String query = "select * from students_info si,students_otherinfo so,guardian_info gi"
					+ " where si.regno=so.regno and so.regno=gi.regno and gi.regno=?";
			

			prdstmt = con.prepareStatement(query);
			prdstmt.setInt(1, regno);
			
			rs = prdstmt.executeQuery();
			HttpSession session=req.getSession(false);
			if(session==null)
			{
				out.println("<html>"  
   		    		 + "<body>"
   	    		     +"<p font color=green> the session id is not created</p>"
   	    		     +"</body>"
   	    		     
   	    		     +"</html>");
				
				String url="Login1html.html";
				dispatcher=req.getRequestDispatcher(url);
				dispatcher.forward(req, resp);
				
			}
			else if(session!=null)
			{
			
			
			dispatcher=req.getRequestDispatcher("allinone.html");
			dispatcher.include(req, resp);
			
			 output="";
			if (rs.next()) {
				
				regno=rs.getInt("regno");
				String fnm=rs.getString("firstname");
	    		   String mnm=rs.getString("middlename");
	    		   String lnm=rs.getString("lastname");
	    		   String admin=rs.getString("isadmin");
	    		   String passw=rs.getString("password");
	    		   String glnm=rs.getString("glastname");
	    		   String gmnm=rs.getString("gmiddlename");
	    		   String gfnm=rs.getString("gfirstname");
	    		   System.out.println("regno:"+regno);
	    		   System.out.println("fnm:"+fnm);
	    		   System.out.println("mnm:"+mnm);
	    		   System.out.println("lnm:"+lnm);
	    		   
	    		   System.out.println("admin:"+admin);
	    		   System.out.println("password:"+passw);
	    		   System.out.println("gln:"+glnm);
	    		   System.out.println("gmnm:"+gmnm);
	    		   System.out.println("gfnm:"+gfnm);
	    		   output="<html>"+"<body>"+"<table border=\"1\"width=\"100%\" >"+"<tr><td>First Name</td><td>Middle Name</td><td>Last Name</td> </tr>"+"<tr><td>"+ fnm+"</td><td>"+ mnm+"</td><td> "+lnm+"</td> </tr>"+"</table>"
	    					
	    				+"</body>"+"</html>";
	    		   out.println(output);
				
	    		 //  RequestDispatcher dispatcher=null;
					
					dispatcher=req.getRequestDispatcher("footer.html");
					dispatcher.include(req, resp);
			} 
			}else{
				output="<html>"+"<body>"+"<h1>data is not available</h1>"+"</body>"+"</html>";
				out.println(output);
			}
		} catch (Exception e) {
			e.printStackTrace();

		} finally {
			System.out.println("close all jdbc objects");
		}

		try {
			if (con != null) {
				con.close();
			}
			if (prdstmt != null) {
				prdstmt.close();

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

