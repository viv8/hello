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
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpServlet;
import com.mysql.jdbc.Driver;

public class Updatepasswordd  extends HttpServlet
{
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("text/html");
		PrintWriter out=resp.getWriter();
		RequestDispatcher dispatcher=null;
		Connection con=null;
		PreparedStatement pstmt=null;
		int count=0;
		int regno = Integer.parseInt(req.getParameter("regno"));
		String oldpasswd=req.getParameter("passwd");
		String newpasswd1=req.getParameter("npassed1");
		String newpasswd2=req.getParameter("npasswd2");
		if(newpasswd1.equals(newpasswd2))
		{
           
			
			dispatcher=req.getRequestDispatcher("allinone.html");
			dispatcher.include(req, resp);
			out.println("<h1>the new passwords are  matching</h1>");
		}
		else {
			dispatcher=req.getRequestDispatcher("allinone.html");
			dispatcher.include(req, resp);
			out.println("<h1>the new passwords are not matching</h1>");
		}
		

		try
		{
			Driver driverref=new Driver();
			DriverManager.registerDriver(driverref);
			String dburl="jdbc:mysql://localhost:3306/Becm145_DB?user=j2ee&password=j2ee";
			con= DriverManager.getConnection(dburl);
			String query="update  Students_otherinfo set password=? where regno=? and password=?";
			pstmt =con.prepareStatement(query);
			pstmt.setString(1,newpasswd1);
			pstmt.setInt(2,regno);

			pstmt.setString(3,oldpasswd);
			count=pstmt.executeUpdate();
			if(count>0)
			{
				out.println("<h1>success in updating password ,is changed</h1>");
			}
			else
			{
				out.println("<h1>failed in updating password, is  not changed</h1>");   
			}
		}
		catch(SQLException e)
		{

			e.printStackTrace(); 
		}
		finally {
			try {
				if(con!=null)

					con.close();
				if(pstmt!=null)

					pstmt.close();
			}


			catch
			(SQLException e)
			{
				e.printStackTrace();
			}
		}
	}

}
	
