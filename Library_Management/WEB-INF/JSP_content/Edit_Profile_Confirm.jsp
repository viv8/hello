<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@ include file="/html_content/Edit_Profile_Header.html"%>   
<%@ include file="/html_content/Footer.html"%>

<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.DriverManager"%>
<%@ page import="java.sql.PreparedStatement"%>
<%@ page import="java.sql.SQLException"%>
<%@ page import="java.io.IOException"%>
<%@ page import="com.mysql.jdbc.Driver"%>

<% if((session.getAttribute("uid")==null) || (session.getAttribute("password")==null)){ 
	response.sendRedirect("http://localhost:8080/Library_Management/login_form");
	} else {
%>  
<%!
	Connection con = null;
	PreparedStatement pstmt = null;
	int count= 0;
	
	public void jspInit(){
		try{
			Driver dref = new Driver();
			DriverManager.registerDriver(dref);
	
			String dbURL = "jdbc:mysql://localhost:3306/BECM14?user=j2ee&password=j2ee";
			con = DriverManager.getConnection(dbURL);
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	public void jspDestroy(){
		try{
		if (con!=null) {
			con.close();
		}
		if (pstmt!=null) {
			pstmt.close();
		}
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
%>   
  
<%
	int uid = (Integer)session.getAttribute("uid");
	
	String query = "update user_details set First_Name=?, Last_Name=?, Password=?, type=? where uid="+uid;
	pstmt = con.prepareStatement(query);
	pstmt.setString(1, request.getParameter("fname"));
	pstmt.setString(2, request.getParameter("lname"));
	pstmt.setString(3, request.getParameter("pass"));
	pstmt.setString(4, request.getParameter("type"));
	count = pstmt.executeUpdate();
 	
%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Edit Profile Result</title>
</head>
<body>
<%if(count==1){ %>
	<h1 style="color:red; text-align:center;">Successfully Updated...</h1>
	<br><br>
	<h2><a href="http://localhost:8080/Library_Management/student_details">Click Here</a> to see details!!!</h2>
<%} else { %>
	<h1 style="color:red; text-align:center;">Unable to update...</h1>
	<br><br>
	<h2><a href="http://localhost:8080/Library_Management/edit_profile">Click Here</a> to try again!!!</h2>
<%} %>
</body>
</html>
<%
}
%>