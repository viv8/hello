<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%@ include file="/html_content/Search_User_Header.html"%>   
<%@ include file="/html_content/Footer.html"%>  
  
<% if((session.getAttribute("uid")==null) || (session.getAttribute("password")==null)){ 
	response.sendRedirect("http://localhost:8080/Library_Management/login_form");
	} else { 
%>      
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Search User</title>
<link rel="stylesheet" type="text/css" href="css_content/form_style.css">
</head>
<body>
	<form action="http://localhost:8080/Library_Management/search_result" method="get">
		<fieldset style="border-color: black">
			<legend style="color:Black"><font size="6"><b>Search User</b></font></legend>
			<div>
				<table>
					<tr>
						<td><i>User Id:</i></td>
						<td><input type="text" name="uid" placeholder="Enter User Id.."></td>
						<td><input type="submit" name="submit" value="Submit"></td>
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