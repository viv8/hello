<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%session = request.getSession(false);
if (session != null) {
	session.invalidate();
} %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Logout</title>
</head>
<body>
	<%request.getRequestDispatcher("/WEB-INF/JSP_content/Login.jsp").include(request, response); %>
	<h1 style="color:red">Successfully logout!!!</h1>
</body>
</html>