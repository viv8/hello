<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@ include file="/html_content/Return_Book_Header.html"%>   
<%@ include file="/html_content/Footer.html"%>  

<% if((session.getAttribute("uid")==null) || (session.getAttribute("password")==null)){ 
	response.sendRedirect("http://localhost:8080/Library_Management/login_form");
	} else {
%>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Return Book</title>
<link rel="stylesheet" type="text/css" href="css_content/form_style.css">
</head>
<body>
	<form action="http://localhost:8080/Library_Management/return_book_confirm" method="get">
		<fieldset style="border-color: black">
			<legend style="color:Black"><font size="6"><b>Return Book</font></legend>
			<div>
				<table>
					<tr>
						<td><i/>User Id:</td>
						<td><input type="text" name="uid" placeholder="Enter User Id.."></td>
					</tr>
					
					<tr>
						<td><i/>Book Id:</td>
						<td><input type="text" name="book_id" placeholder="Enter Book Id.."></td>
					</tr>
					
					<tr>
						<td><i/>Return Date:</td>
						<td><input type="date" name="return_date" placeholder="mm/dd/yyyy"></td>
					</tr>
					
					<tr>
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