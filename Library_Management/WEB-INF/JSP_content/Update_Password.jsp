<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%@ include file="/html_content/Update_Password_Header.html"%>   
<%@ include file="/html_content/Footer.html"%>  
    
<% if((session.getAttribute("uid")==null) || (session.getAttribute("password")==null)){ 
	response.sendRedirect("http://localhost:8080/Library_Management/login_form");
	} else {
%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Update Password</title>
<link rel="stylesheet" type="text/css" href="css_content/form_style.css">
</head>
<body>
	<form action="http://localhost:8080/Library_Management/update_password_confirm" method="post">
		<fieldset style="border-color: black">
			<legend style="color:Black"><font size="6"><b>Update Password</font></legend>
			<div>
				<table>
					<tr>
						<td><i/>User Id:</td>
						<td><input type="text" name="uid" value=<%= (Integer)session.getAttribute("uid") %> readonly></td>
					</tr>
					
					<tr>
						<td><i/>Old Password:</td>
						<td><input type="password" name="old_pass" placeholder="Enter your Old Password..."></td>
					</tr>
					
					<tr>
						<td><i/>New Password:</td>
						<td><input type="password" name="new_pass" placeholder="Enter your New Password..."></td>
					</tr>
					
					<tr>
						<td><i/>Retype Password:</td>
						<td><input type="password" name="re_pass" placeholder="Retype your New Password..."></td>
					</tr>
										
					<tr>
						<td><input type="submit" name="update" value="Update"></td>
						<td><input type="reset" name="reset" value="Reset"></td>
					</tr>
				</table>
				</div>	
				</fieldset>
		</form>
</body>
</html>
<%	
}
%>