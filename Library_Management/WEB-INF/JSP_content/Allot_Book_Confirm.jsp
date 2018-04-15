<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.DriverManager"%>
<%@ page import="java.sql.PreparedStatement"%>
<%@ page import="java.sql.SQLException"%>
<%@ page import="java.sql.Date"%>
<%@ page import="java.text.ParseException" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.io.IOException"%>
<%@ page import="com.mysql.jdbc.Driver"%> 

<%@ include file="/html_content/Allot_Book_Header.html"%>   
<%@ include file="/html_content/Footer.html"%>
    
<%
	if((session.getAttribute("uid")==null) || (session.getAttribute("password")==null)){ 
		response.sendRedirect("http://localhost:8080/Library_Management/login_form");
		} else {
%>  
    
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
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		java.util.Date date = null;
		try {
			date = format.parse(request.getParameter("taken_date"));
		} catch (ParseException e) {
			e.printStackTrace();
		}
		
		Date taken_date = new Date(date.getTime());
		
		String query = "insert into book_allot (uid, book_id, book_taken_date) values (?, ?, ?)";
		pstmt = con.prepareStatement(query);
		pstmt.setInt(1, Integer.parseInt(request.getParameter("uid")));
		pstmt.setInt(2, Integer.parseInt(request.getParameter("book_id")));
		pstmt.setDate(3, taken_date);
		
		count=pstmt.executeUpdate();
%>    

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Allot Book Confirmation</title>
</head>
<body>
	<% if(count==1){ %>
	<h1 style="color:red; text-align:center;">Successfully alloted the book...</h1>
	<br><br>
	<h2><a href="http://localhost:8080/Library_Management/allot_book">Click Here</a> to allot new record!!!</h2>
	<%} else { %>
	<h1 style="color:red; text-align:center;">Unable to allot the book...</h1>
	<br><br>
	<h2><a href="http://localhost:8080/Library_Management/allot_book">Click Here</a> to allot again!!!</h2>
	<%} %>
</body>
</html>
<%
}
%>