<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@ page errorPage="/add_error" %>
    
<%@ include file="/html_content/Add_User_Header.html"%>   
<%@ include file="/html_content/Footer.html"%>  

<%@ page import="java.sql.*" %>
<%@ page import="java.io.IOException"%>
<%@ page import="com.mysql.jdbc.Driver"%>

<%!
	Connection con = null;
	PreparedStatement pstmt = null;
	int count=0;
	
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
	String query= "insert into user_details values (?, ?, ?, ?, ?)";
	pstmt = con.prepareStatement(query);
	pstmt.setInt(1, Integer.parseInt(request.getParameter("uid")));
	pstmt.setString(2, request.getParameter("fname"));
	pstmt.setString(3, request.getParameter("lname"));
	pstmt.setString(4, request.getParameter("pass"));
	pstmt.setString(5, request.getParameter("type"));
	
	count = pstmt.executeUpdate();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>New User Added</title>
</head>
<body>
<% if(count == 1){
%>
	<h1 style="color:red; text-align:center;">Inserted the elements successfully...</h1>
	<br><br>
	<h2><a href="http://localhost:8080/Library_Management/registration">Click Here</a> to insert another user!!!</h2>

<%} %>
</body>
</html>

