<%@page import="org.omg.CORBA.Request"%>
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
	ResultSet rs = null;
	
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
		if (rs!=null) {
			rs.close();
		}
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
%>   

<%
		int uid = (Integer)session.getAttribute("uid");	
		String query = "select * from user_details where uid="+uid;
		pstmt = con.prepareStatement(query);
		rs = pstmt.executeQuery();
%> 

    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Update Password Details</title>
<link rel="stylesheet" type="text/css" href="css_content/table.css">
</head>
<body>
<fieldset style="border-color: black">
			<legend style="color:Black"><font size="6"><b>User Details</font></legend>
			<div>
				<table style="width:100%">
					<tr style="background-color:Black; color:white">
					<th>User Id</th>
					<th>First Name</th>
					<th>Last Name</th>
					<th>Password</th>
					<th>Type</th>
					</tr>
					
					<%if(rs.next()){ %>	
					<tr style="text-align: center">
					<td><%=rs.getInt("uid") %></td>
					<td><%=rs.getString("First_name")%></td>
					<td><%=rs.getString("Last_name") %></td>
					<td><%=rs.getString("Password") %></td>
					<td><%=rs.getString("type") %></td>
					</tr>
				<%} %>
				</table>
				</div>	
		</fieldset>
	<h2><a href="http://localhost:8080/Library_Management/update_password">Click Here</a> to edit again!!!</h2>	
</body>
</html>
<%
}
%>