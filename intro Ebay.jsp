<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Welcome to eBay help and support </title>


</head>
<body>

<% out.println("Hello there, Welcome to the eBAy support. How may I assist you?"); %>
<% out.println("Please Provide Log in in Information"); %>

<form method="get" action="eBaylogin.jsp" > 
<!--  create table tag -->
<table>

<tr>

<td>Username </td><td><input type="text" name="username"></td>
</tr>

<tr>

<td>Password</td><td><input type="text" name="password"></td>
</tr>

</table><!-- end table tag -->
<input type="submit" value="Login">
</form>  <!-- end of form tag -->
<br>


	<form method="get" action="signup.jsp">
	<table>
	<tr>    
				<td>Username</td><td><input type="text" name="newUsername"></td>
				</tr>
				<tr>
					<td>Password</td><td><input type="text" name="newPassword"></td>
				</tr>
			</table>
			<input type="submit" value="signup">
		</form>


</body>
</html>