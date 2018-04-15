package com.jspiders.studentsapp.servlets;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.mysql.jdbc.Driver;

public class Editdeleteservlet extends HttpServlet
{
	@Override
		protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
			// 1)get data
			int regno = Integer.parseInt(req.getParameter("regno"));
			
			String fname = req.getParameter("fnm");
			String mname = req.getParameter("mnm");
			String lname = req.getParameter("lnm");
			String gfname = req.getParameter("gfn");
			String gmname = req.getParameter("gmn");
			String glname = req.getParameter("gln");
			String admin = req.getParameter("admin");
			String password = req.getParameter("password");
			
			System.out.println("regno" + regno);
			System.out.println("fname" + fname);
			System.out.println("mname" + mname);
			System.out.println("lname" + lname);
			System.out.println("gfname" + gfname);
			System.out.println("gmname" + gmname);
			System.out.println("glname" + glname);
			System.out.println("password" + password);
			System.out.println("option" + admin);
			// 2)use jdbc to insert data
			resp.setContentType("text/html");
			PrintWriter out = resp.getWriter();
			System.out.println("mime type set");
			Connection con = null;
			PreparedStatement pstmt1 = null;
			PreparedStatement pstmt2 = null;
			PreparedStatement pstmt3 = null;
			// steps of jdbc

			try {
				Driver driverref = new Driver();
				DriverManager.registerDriver(driverref);
				String dburl = "jdbc:mysql://localhost:3306/Becm145_DB?user=root&password=root";
				con = DriverManager.getConnection(dburl);

				String query = "update students_info set firstname=?,middlename=?,lastname=?"+"where regno=?";
			    String query1 ="update guardian_info set gfirstname=?,gmiddlename=?,glastname=?"+"where regno=?";
				String query2 ="update students_otherinfo set isadmin=?,password=?" + " where regno=? ";

				pstmt1 = con.prepareStatement(query);
				
				pstmt1.setString(1, fname);
				pstmt1.setString(2, mname);
				pstmt1.setString(3, lname);
				pstmt1.setInt(4, regno);
				int count = pstmt1.executeUpdate();
				System.out.println("prepared statement 1 executed:(value)" + count);
				pstmt2 = con.prepareStatement(query1);
				
				pstmt2.setString(1, gfname);
				pstmt2.setString(2, gmname);
				pstmt2.setString(3, glname);
				pstmt2.setInt(4, regno);
				int count1 = pstmt2.executeUpdate();
				System.out.println("prepared statement 2 executed:(value)" + count1);
				pstmt3 = con.prepareStatement(query2);
				        
					pstmt3.setString(1, admin);
					pstmt3.setString(2, password);
					pstmt3.setInt(3, regno);
					int count2 = pstmt3.executeUpdate();
				
				

				System.out.println("prepared statement 3 executed:(value)" + count2);
				if (count > 0 && count1 > 0 && count2 > 0) {
					out.println("profile has been updated");
				} else {
					out.println("failed in updating....");
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
				if (pstmt1 != null) {
					pstmt1.close();

				}

			}

			catch (SQLException e) {
				e.printStackTrace();
			}

		}
	}

