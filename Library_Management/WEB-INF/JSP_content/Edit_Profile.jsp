<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@ include file="/html_content/Edit_Profile_Header.html"%>   
<%@ include file="/html_content/Footer.html"%>

<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.DriverManager"%>
<%@ page import="java.sql.PreparedStatement"%>
<%@ page import="java.sql.ResultSet"%>
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
<title>Edit Student Profile</title>
<link rel="stylesheet" type="text/css" href="css_content/form_style.css">
</head>
<body>
	<form action="http://localhost:8080/Library_Management/edit_profile_confirm" method="post">
		<fieldset style="border-color: black">
			<legend style="color:Black"><font size="6"><b>Edit Profile</font></legend>
			<div>
			<%if(rs.next()){ %>
				<table>
					<tr>
					<th style="color:red"><u/>STUDENT'S DETAIL:-</th>
					</tr>
					
					<tr>
						<td><i/>User Id:</td>
						<td><input type="text" name="uid" value=<%=rs.getInt("uid") %> readonly></td>
					</tr>
					
					<tr>
						<td><i/>First Name:</td>
						<td><input type="text" name="fname" value=<%=rs.getString("First_Name") %> placeholder="Enter your First Name..."></td>
					</tr>
					
					<tr>
						<td><i/>Last Name:</td>
						<td><input type="text" name="lname" value=<%=rs.getString("Last_Name") %> placeholder="Enter your Last Name..."></td>
					</tr>
					
					<tr>
						<td><i/>Password:</td>
						<td><input type="password" name="pass" value=<%=rs.getString("Password") %> placeholder="Enter your Password..."></td>
					</tr>
										
					<tr>
						<td><i/>Type:</td>
						<td><select name="type" value=<%=rs.getString("type") %>>
								<option value="N">N</option>
								<option value="L">L</option>
								<option value="A">A</option>
							</select></td>
					</tr>
					
					<tr>
						<td><input type="submit" name="submit" value="Submit"></td>
						<td><input type="reset" name="reset" value="Reset"></td>
					</tr>
				</table>
				<%} %>
				</div>	
				</fieldset>
		</form>
</body>
</html>
<%	
}
%>