<%@page import="org.omg.CORBA.Request"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@ include file="/html_content/Search_Book_Header.html"%>   
<%@ include file="/html_content/Footer.html"%>  

<%@ page import="java.sql.*" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="java.io.IOException" %>
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
		int book_id = Integer.parseInt(request.getParameter("book_id"));
		String query = "select * from book_info where book_id=?";
		pstmt = con.prepareStatement(query);
		pstmt.setInt(1,book_id);
		rs = pstmt.executeQuery();
%> 

    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Search Book Result</title>
<link rel="stylesheet" type="text/css" href="css_content/table.css">
</head>
<body>
<%if(rs.next()){ %>	
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
		
					<tr style="text-align: center">
					<td><%=rs.getInt("book_id") %></td>
					<td><%=rs.getString("book_name")%></td>
					<td><%=rs.getString("book_author") %></td>
					<td><%=rs.getInt("edition") %></td>
					<td><%=rs.getInt("no_of_books") %></td>
					<td><%=rs.getString("section") %></td>
					</tr>
				
				</table>
				</div>	
		</fieldset>
		<%} else {%>
		<h1 style="color:red; text-align:center;">Book Not Found...</h1>
		<br><br>
		<h2><a href="http://localhost:8080/Library_Management/search_book">Click Here</a> to search again!!!</h2>
	<%} %>
</body>
</html>