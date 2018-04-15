package com.jspiders.studentsapp.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mysql.jdbc.Driver;
public class Deleteservlet extends HttpServlet
{
		protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException 	{
				resp.setContentType("text/html");
				PrintWriter out=resp.getWriter();
				int regno=Integer.parseInt(req.getParameter("regno"));
				
		System.out.println("mime type set");

			Connection con = null;
			ResultSet rs = null;
			PreparedStatement pstmt = null;
			PreparedStatement pstmt1 = null;
			PreparedStatement pstmt2 = null;
			int count,count1,count2 =0;
			try {
				Driver driverref = new Driver();
				DriverManager.registerDriver(driverref);
				String dburl = "jdbc:mysql://localhost:3306/Becm145_DB?user=root&password=root";
				con = DriverManager.getConnection(dburl);
			
				String query = "delete from students_info  where regno=?";
						
					

			  String query1 =	"delete from students_otherinfo  where regno=? ";
			  String query2=" delete from guardian_info  where regno=? ";//garbage collector call finalize before garbage collected when the space is full or reach level at that time garbage call finalize and then collected
				
				pstmt = con.prepareStatement(query);
				pstmt.setInt(1,regno);
				 count = pstmt.executeUpdate();
				pstmt1 = con.prepareStatement(query1);
				pstmt1.setInt(1,regno);
				count1 = pstmt1.executeUpdate();
				pstmt2 = con.prepareStatement(query2);
				pstmt2.setInt(1,regno);
				count2 = pstmt2.executeUpdate();
				if(count == 1 && count1 == 1 && count2 == 1)
				{
					out.println("<h1>profile ,is deleted</h1>");
				}
				else
				{
					out.println("<h1>failed in deleting profile</h1>");   
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
				if (pstmt != null) {
					pstmt.close();

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



