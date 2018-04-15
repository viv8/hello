package com.jspiders.studentsapp.servlets;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mysql.jdbc.Driver;
public class Loginservletshowall  extends HttpServlet

{


	@Override
		protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

			int regno = Integer.parseInt(req.getParameter("regno"));
			String password = req.getParameter("pass");
			String ischecked=req.getParameter("remember"
					+ "");
					if(ischecked!=null)
					{
						
					
			Cookie create=new  Cookie("regno",""+regno);
			resp.addCookie(create);
					}
			PrintWriter out = resp.getWriter();
			Connection con = null;
			ResultSet rs = null;
			PreparedStatement prdstmt = null;
			
		
			try {
				Driver driverref = new Driver();
				DriverManager.registerDriver(driverref);
				String dburl = "jdbc:mysql://localhost:3306/Becm145_DB?user=root&password=root";
				con = DriverManager.getConnection(dburl);
				String query = "select * from students_info si,students_otherinfo so,guardian_info gi"
					+ " where si.regno=so.regno and so.regno=gi.regno and so.regno=? and so.password=?";
				
				prdstmt = con.prepareStatement(query);
				prdstmt.setInt(1, regno);
				prdstmt.setString(2, password);
				rs = prdstmt.executeQuery();
                RequestDispatcher dispatcher=null;
				
				dispatcher=req.getRequestDispatcher("allinone.html");
				dispatcher.include(req, resp);
				
				String output="";
				if (rs.next()) {
					HttpSession session=req.getSession();
					
					System.out.println("login is successful");
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
		    		   System.out.println("gfnm:"+gfnm);
		    		  
		    		   System.out.println("gmnm:"+gmnm);
		    		   System.out.println("gln:"+glnm);
		    		   out.print("<html>"+"<body>"+"<table border=\"1\"width=\"100%\" >"+"<tr><td>First Name</td><td>Middle Name</td><td>Last Name</td> </tr>"+"<tr><td>"+ fnm+"</td><td>"+ mnm+"</td><td> "+lnm+"</td><td> "+admin+"</td><td> "+passw+"</td><td> "+gfnm+"</td><td> "+gmnm+"</td><td> "+glnm+"</td> </tr>"+"</table>"
		    					
		    				+"</body>"+"</html>");
		    		  // RequestDispatcher dispatcher=null;
						
						dispatcher=req.getRequestDispatcher("footer.html");
						dispatcher.include(req, resp);
		    		   if(admin.equals("Y"))
		    		   {
		    			   out.println("<a href=\"./allstudent\">)click here</a>to view all students details");
		    		   }
					
				} else {
					out.println("<h1>failed to login.please provide valid credentials");
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

