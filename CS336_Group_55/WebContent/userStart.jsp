<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
    
<!--Import some libraries that have classes that we need -->
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<%--
- account stuff
	- logout
	- delete
- buy/sell stuff
	- show items
	- search items
	- bid items
	- set alerts
	- see bids
	- create auction

 --%>
<body>
	<br>
		<form method="get" action="newListing.jsp">
			<table>
				<tr>    
					<td>Username</td><td><input type="text" name="username"></td>
				</tr>
				<tr>
					<td>Password</td><td><input type="text" name="password"></td>
				</tr>
			</table>
			<input type="submit" value="Login">
		</form>
	<br>
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
	<br>
	<br>
		<form action="/abc.jsp">
      	Birthday:
      	<input type="datetime-local" id="birthdaytime" name="birthdaytime">
      	<input type="submit">
    </form>
	<br>
	<button onclick="window.location='representativeLoginPage.jsp';"> Representative Login Page </button>
</body>
</html>