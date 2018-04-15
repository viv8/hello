<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@ include file="/html_content/Add_Book_Header.html"%>   
<%@ include file="/html_content/Footer.html"%>

<% if((session.getAttribute("uid")==null) || (session.getAttribute("password")==null)){ 
	response.sendRedirect("http://localhost:8080/Library_Management/login_form");
	} else {
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Lib Home Page/ Book Info Page</title>
<link rel="stylesheet" type="text/css" href="css_content/form_style.css">
</head>
<body>
	<form action="" method="get">
		<fieldset style="border-color: black">
			<legend style="color:Black"><font size="6"><b>Book Information</font></legend>
			<div>
				<table>
					
					<tr>
						<td><i/>Book Id:</td>
						<td><input type="text" name="book_id" placeholder="Enter the Book Id.."></td>
					</tr>
					
					<tr>
						<td><i/>Book Name:</td>
						<td><input type="text" name="book_name" placeholder="Enter the Book Name..."></td>
					</tr>
					
					<tr>
						<td><i/>Book Author:</td>
						<td><input type="text" name="book_author" placeholder="Enter the Book Author..."></td>
					</tr>
					
					<tr>
						<td><i/>Edition:</td>
						<td><input type="text" name="edition" placeholder="Enter the edition..."></td>
					</tr>
					
					<tr>
						<td><i/>Section:</td>
						<td><input type="text" name="section" placeholder="Enter the section..."></td>
					</tr>
					
					<tr>
						<td><i/>No. of Books:</td>
						<td><input type="text" name="no_of_books" placeholder="Enter the no. of Books..."></td>
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