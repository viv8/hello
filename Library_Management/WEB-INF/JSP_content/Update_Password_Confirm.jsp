<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@ include file="/html_content/Update_Password_Header.html"%>   
<%@ include file="/html_content/Footer.html"%>  
    
<%@ page import="java.sql.*" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="java.io.IOException" %>
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
		String old_pass= request.getParameter("old_pass");
		String new_pass= request.getParameter("new_pass");
		String re_pass= request.getParameter("re_pass");
%>
<%if(old_pass.equals(session.getAttribute("password")) && new_pass.equals(re_pass)){
	String query = "update user_details set Password=? where uid="+uid;
	pstmt = con.prepareStatement(query);
	pstmt.setString(1, new_pass);
	count= pstmt.executeUpdate();
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Update Password Result</title>
</head>
<body>
<%if(count==1){ %>
	<h1 style="color:red; text-align:center;">Successfully Updated...</h1>
	<br><br>
	<h2><a href="http://localhost:8080/Library_Management/update_password_details">Click Here</a> to see details!!!</h2>
	<%session.setAttribute("password", new_pass); %>
<%} else { %>
	<h1 style="color:red; text-align:center;">Unable to update...</h1>
	<br><br>
	<h2><a href="http://localhost:8080/Library_Management/update_password">Click Here</a> to try again!!!</h2>
<%} %>


<%} else { %>
	<h1 style="color:red; text-align:center;">Unable to update. Password Mismatch...</h1>
	<br><br>
	<h2><a href="http://localhost:8080/Library_Management/update_password">Click Here</a> to try again!!!</h2>
<%} %>
</body>
</html>
<%
}
%>