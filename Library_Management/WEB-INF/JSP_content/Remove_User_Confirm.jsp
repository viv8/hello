<%@page import="org.omg.CORBA.Request"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    
<%@ include file="/html_content/Remove_User_Header.html"%>   
<%@ include file="/html_content/Footer.html"%>  

<%@ page import="java.sql.*" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="java.io.IOException" %>
<%@ page import="com.mysql.jdbc.Driver"%>

<%!
	Connection con = null;
	PreparedStatement pstmt = null;
	int count = 0;
	
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
		int uid = Integer.parseInt(request.getParameter("uid"));	
		String query = "delete from user_details where uid=?";
		pstmt = con.prepareStatement(query);
		pstmt.setInt(1,uid);
		count = pstmt.executeUpdate();
%> 

    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Search User Result</title>
<link rel="stylesheet" type="text/css" href="css_content/table.css">
</head>
<body>
<% if(count==1){ %>
<h1 style="color:red">Successfully Deleted!!!</h1>
<%} else { %>
<h1 style="color:red">Unable to Delete. Please try again!!!</h1>
<%} %>
</body>
</html>