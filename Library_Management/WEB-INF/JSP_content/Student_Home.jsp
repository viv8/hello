<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@ include file="/html_content/Student_Header.html"%>   
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
		int count=0;
		String query = "select count(book_id) count from book_allot where uid="+uid;
		pstmt = con.prepareStatement(query);
		rs = pstmt.executeQuery();
		
		while(rs.next()){
			count=rs.getInt("count");
		}
%> 

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Student Home Page</title>
<link rel="stylesheet" type="text/css" href="css_content/table.css">
<style type="text/css">
a {
	text-decoration: none;
}
</style>
</head>
<body>
		<fieldset style="border-color: black">
			<legend style="color:Black"><font size="6"><b>Home Page</font></legend>
			<div>
				<h3>Number of books taken: &nbsp;<a href="http://localhost:8080/Library_Management/student_book_info"><%=count %></a></h3>
				<p><font size="4">Sections</font></p>
				<table style="width:100%">
					<tr>
						<th><a href="http://localhost:8080/Library_Management/section_CS">Computer Science</a></th>
						<th><a href="http://localhost:8080/Library_Management/section_IS">Information Science</a></th>
						<th><a href="http://localhost:8080/Library_Management/section_EE">Electrical & Electronics</a></th>
						<th><a href="http://localhost:8080/Library_Management/section_EC">Electronics & Communication</a></th>
						<th><a href="http://localhost:8080/Library_Management/section_ME">Mechanical</a></th>
					</tr>
				</table>
			</div>	
		</fieldset>
</body>
</html>
<%	
}
%>