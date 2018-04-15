<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@ include file="/html_content/Lib_Header.html"%>   
<%@ include file="/html_content/Footer.html"%>   
    
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.DriverManager"%>
<%@ page import="java.sql.PreparedStatement"%>
<%@ page import="java.sql.ResultSet"%>
<%@ page import="java.sql.SQLException"%>
<%@ page import="java.io.IOException"%>
<%@ page import="com.mysql.jdbc.Driver"%>
    
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
		String query = "select * from book_info";
		pstmt = con.prepareStatement(query);
		rs=pstmt.executeQuery();
		
%> 

<% if((session.getAttribute("uid")==null) || (session.getAttribute("password")==null)){ 
	response.sendRedirect("http://localhost:8080/Library_Management/login_form");
	} else {
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Admin Home Page</title>
<link rel="stylesheet" type="text/css" href="css_content/table.css">
</head>
<body>
		<fieldset style="border-color: black">
			<legend style="color:Black"><font size="6"><b>Book Details</font></legend>
			<div>
				<table style="width:100%">
					<tr style="background-color:Black; color:white">
					<th>Book Id</th>
					<th>Book Name</th>
					<th>Book Author</th>
					<th>Edition</th>
					<th>No. Of Books</th>
					<th>Section</th>
					</tr>
					
				<%while(rs.next()){ %>	
					<tr style="text-align: center">
					<td><%=rs.getInt("book_id") %></td>
					<td><%=rs.getString("book_name")%></td>
					<td><%=rs.getString("book_author") %></td>
					<td><%=rs.getInt("edition") %></td>
					<td><%=rs.getInt("no_of_books") %></td>
					<td><%=rs.getString("section") %></td>
					</tr>
				<%} %>
				</table>
				</div>	
		</fieldset>
</body>
</html>
<%	
}
%> 