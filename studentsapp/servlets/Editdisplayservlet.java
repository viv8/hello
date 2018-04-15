package com.jspiders.studentsapp.servlets;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.mysql.jdbc.Driver;
public class Editdisplayservlet  extends HttpServlet{

	
@Override
			protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
				// 1)get data
				int regno = Integer.parseInt(req.getParameter("regno"));
				System.out.println("regno" + regno);
				
				// 2)use jdbc to insert data
				resp.setContentType("text/html");
				PrintWriter out = resp.getWriter();
				System.out.println("mime type set");
				Connection con = null;
				PreparedStatement pstmt = null;
				PreparedStatement pstmt1 = null;
				PreparedStatement pstmt2 = null;
				ResultSet rs=null;
				ResultSet rs1=null;
				ResultSet rs2=null;
				// steps of jdbc

				try {
					Driver driverref = new Driver();
					DriverManager.registerDriver(driverref);
					String dburl = "jdbc:mysql://localhost:3306/Becm145_DB?user=root&password=root";
					con = DriverManager.getConnection(dburl);
					String query = "select * from students_info where regno=?";
					String query1 = "select * from guardian_info where regno=?";
					String query2 = "select * from students_otherinfo where regno=?";
					pstmt = con.prepareStatement(query);
					pstmt.setInt(1, regno);
					rs = pstmt.executeQuery();
					pstmt1 = con.prepareStatement(query1);
					pstmt1.setInt(1, regno);
					rs1 = pstmt1.executeQuery();
					pstmt2 = con.prepareStatement(query2);
					pstmt2.setInt(1, regno);
					rs2 = pstmt2.executeQuery();
					
					if(rs.next()&&rs1.next()&&rs2.next())
				{
					regno=rs.getInt("regno");
				   String fname = rs.getString("firstname");
					String mname =rs.getString("middlename");
					String lname = rs.getString("lastname");
					String gfname = rs1.getString("gfirstname");
					String gmname = rs1.getString("gmiddlename");
					String glname = rs1.getString("glastname");
					String isadmin =rs2.getString("isadmin");
					String password = rs2.getString("password");		
					out.println("<html>"
							+"<head>"
							+"</head>"+"<body>"
							+"<form action=http://localhost:8080/studentsApp/Editdeleteservlet method="+"post"+">"

						    +"<fieldset width=400px>"
							+"<legend>Update Profile</legend>"
							+"<table width=100%>"
							+ "<tr>"
						    +"<td>Register No :</td>"
						    +"<td><input type=text name=regno value="+regno+"></td>"
						    +"</tr>"  
					        +"<tr>"
						    +"<td>First Name :</td>"
						    +"<td><input type=text name=fnm value="+fname+"></td>"
						    +"</tr>"
						    +"<tr>"
						    + "<td>Middle Name :</td>"
						    +"<td><input type=text name=mnm value="+mname+"></td>"
						    +"</tr>"
							+"<tr>"
						    + "<td>Last Name :</td>"
						    +"<td><input type=text name=lnm value="+lname+"></td>"
						    +"</tr>"
							+"<tr>"
						    + "<td>Guardian First Name :</td>"
						    +"<td><input type=text name=gfn value="+gfname+"></td>"
						    +"</tr>"
						    +"<tr>"
							+ "<td>Guardian Middle Name :</td>"
						    +"<td><input type=text name=gmn value="+gmname+"></td>"
						    +"</tr>"
							+"<tr>"
						    +"<td>Guardian Last Name :</td>"
						    +"<td><input type=text name=gln value="+glname+"></td>"
							+"</tr>" 
							+"<tr>"
							+"<td>is Admin :</td>"
						    +"<td><input type=text name=admin value="+isadmin+"></td>"
							+"</tr><tr><td>Password :</td><td><input type=Password name=pass value="+password+"></td></tr>"  			
							+"<tr><td></td><!---<td><input type=checkbox name=remember value=checked>Remember Me</td> -->"
							+"</tr><tr><td><input type=submit name=Update value=Update></td></tr><table></fieldset></form></body></html>");
					
				   		
				    
				}else {
					System.err.println("regno not found");
				}
	    	    		     
				} catch (Exception e) {
					e.printStackTrace();
					out.println("your profile creation was unsuccessful");
					out.println(e.getMessage());

				} finally {
					System.out.println("close all jdbc objects");
				}

				try {
					if (con != null) {
						con.close();
					}
					if (pstmt != null) {
						pstmt.close();

					}

				}

				catch (SQLException e) {
					e.printStackTrace();
				}

			}
		}


