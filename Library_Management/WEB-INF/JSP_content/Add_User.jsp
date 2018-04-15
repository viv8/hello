<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@ include file="/html_content/Add_User_Header.html"%>   
<%@ include file="/html_content/Footer.html"%>  


<% if((session.getAttribute("uid")==null) || (session.getAttribute("password")==null)){ 
	response.sendRedirect("http://localhost:8080/Library_Management/login_form");
	} else { 
%>   

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Add New User</title>
<link rel="stylesheet" type="text/css" href="css_content/form_style.css">
</head>
<body>
	<form action="http://localhost:8080/Library_Management/new_user" method="post">
		<fieldset style="border-color: black">
			<legend style="color:Black"><font size="6"><b>New Registration</b></font></legend>
			<div>
				<table>
					<tr>
					<th style="color:red"><u>USER DETAIL:-</u></th>
					</tr>
					
					<tr>
						<td><i>User Id:</i></td>
						<td><input type="text" name="uid" placeholder="Enter your User Id.."></td>
					</tr>
					
					<tr>
						<td><i>First Name:</i></td>
						<td><input type="text" name="fname" placeholder="Enter your First Name..."></td>
					</tr>
					
					<tr>
						<td><i>Last Name:</i></td>
						<td><input type="text" name="lname" placeholder="Enter your Last Name..."></td>
					</tr>
					
					<tr>
						<td><i>Password:</i></td>
						<td><input type="password" name="pass" placeholder="Enter your Password..."></td>
					</tr>
										
					<tr>
						<td><i>Type:</i></td>
						<td><select name="type">
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
				</div>	
				</fieldset>
		</form>
</body>
</html>
<%	
}
%>