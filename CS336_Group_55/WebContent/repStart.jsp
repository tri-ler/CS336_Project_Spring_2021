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
		<h1>Create New Representative Account</h1>
				<form method="get" action="repSignUp.jsp">
					<table>
						<tr>    
							<td>Username</td><td><input type="text" name="adminUsername"></td>
						</tr>
						<tr>
							<td>Password</td><td><input type="text" name="adminPassword"></td>
						</tr>
						<tr>
							<td>New Representative's Username</td><td><input type="text" name="newRepUsername"></td>
						</tr>
						<tr>
							<td>New Representative's Password</td><td><input type="text" name="newRepPassword"></td>
						</tr>
					</table>
				<input type="submit" value="Login">
		</form>
		<h1>Show Items Available</h1>
			<h2>Select which items to view</h2>
				<button onclick="window.location='showAll.jsp';"> All Items </button>
				<button onclick="window.location='showCPU.jsp';"> CPU </button>
				<button onclick="window.location='showGPU.jsp';"> GPU </button>
				<button onclick="window.location='showHDD.jsp';"> Hard Drive </button>
		<h1>Total Earnings</h1>
				<button onclick="window.location='earnings.jsp':"> Show earnings </button>
		<h1>Show Bids</h1>
		<h1>Show Auctions</h1>
		<h1>Show Questions</h1>
	<br>

</body>
</html>