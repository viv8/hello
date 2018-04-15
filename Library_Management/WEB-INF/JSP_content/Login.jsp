<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Login page</title>
<link rel="stylesheet" type="text/css" href="css_content/form_style.css">
<link rel="stylesheet" type="text/css" href="css_content/home_page.css">
</head>
<body>
<h1 class="title">LIBRARY MANAGEMENT SYSTEM</h1>
<form action="http://localhost:8080/Library_Management/login" method="post">
	<div>
		<fieldset style="border: none">
			<legend style="color:Black"><font size="6"><b>Login</b></font></legend>
				<table>
					<tr>
						<td><i>User Id:</i></td>
						<td><input type="text" name="uid" placeholder="Enter your User Id.." required></td>
					</tr>
					
					<tr>
						<td><i>Password:</i></td>
						<td><input type="password" name="pass" placeholder="Enter your Password..." required></td>
					</tr>
							
					<tr>
						<td><i>Remember Me:</i></td>
						<td><input type="checkbox" name="remember" checked></td>
					</tr>
										
					<tr>
						<td><input type="submit" name="login" value="Login"></td>
					</tr>
				</table>
				</div>	
				</fieldset>
		</form>
</body>
</html>