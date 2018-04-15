package com.jspiders.studentsapp.servlets;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mysql.jdbc.Driver;

public class Createprofileservlet extends HttpServlet {
	// out.println for clientside browser//system.out.println for serverside means
	// server console when you start0..0//
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// 1)get data
		int regno = Integer.parseInt(req.getParameter("register"));
		// String regno=req.getParameter("register");
		String fname = req.getParameter("firstname");
		String mname = req.getParameter("middlename");
		String lname = req.getParameter("lastname");
		String gfname = req.getParameter("gfirstname");
		String gmname = req.getParameter("gmiddlename");
		String glname = req.getParameter("glastname");
		String password = req.getParameter("pass");
		String option = req.getParameter("boolean");
		System.out.println("regno" + regno);
		System.out.println("fname" + fname);
		System.out.println("mname" + mname);
		System.out.println("lname" + lname);
		System.out.println("gfname" + gfname);
		System.out.println("gmname" + gmname);
		System.out.println("glname" + glname);
		System.out.println("password" + password);
		System.out.println("option" + option);
		// 2)use jdbc to insert data
		resp.setContentType("text/html");
		PrintWriter out = resp.getWriter();
		System.out.println("mime type set");
		RequestDispatcher dispatcher=null;
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

			String query = "insert into students_info" + "(regno,firstname,middlename,lastname)" + " values(?,?,?,?)";
			String query2 = "insert into students_otherinfo" + "(regno,isadmin,password)" + " values(?,?,?)";
			String query1 = " insert into guardian_info" + "(regno,gfirstname,gmiddlename,glastname)"
					+ " values(?,?,?,?)";

			pstmt1 = con.prepareStatement(query);
			pstmt1.setInt(1, regno);
			pstmt1.setString(2, fname);
			pstmt1.setString(3, mname);
			pstmt1.setString(4, lname);
			int count = pstmt1.executeUpdate();
			System.out.println("prepared statement 1 executed:(value)" + count);
			pstmt2 = con.prepareStatement(query1);
			pstmt2.setInt(1, regno);
			pstmt2.setString(2, gfname);
			pstmt2.setString(3, gmname);
			pstmt2.setString(4, glname);
			int count1 = pstmt2.executeUpdate();
			System.out.println("prepared statement 2 executed:(value)" + count1);
			pstmt3 = con.prepareStatement(query2);
			pstmt3.setInt(1, regno);
			pstmt3.setString(3, password);
			if(option.equals("Yes"))
				pstmt3.setString(2, "Y");
			else
				pstmt3.setString(2, "N");
			int count2 = pstmt3.executeUpdate();// out.println(e.getmessage());
			System.out.println("prepared statement 3 executed:(value)" + count2);
			if (count == 1 && count1 == 1 && count2 == 1) {
				dispatcher=req.getRequestDispatcher("allinone.html");
				dispatcher.include(req, resp);
				out.println("successfully inserted in studentinfo table");
			} else {
				dispatcher=req.getRequestDispatcher("allinone.html");
				dispatcher.include(req, resp);
				out.println("failed inserted in studentinfo table");
			}
		} catch (Exception e) {
			e.printStackTrace();
			dispatcher=req.getRequestDispatcher("allinone.html");
			dispatcher.include(req, resp);
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
