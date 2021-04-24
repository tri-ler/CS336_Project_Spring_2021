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
					<td>start date</td><td><input type="date" name="startDate" placeholder = "YYYY-MM-DD"></td>
				</tr>
				<tr>
					<td>start time</td><td><input type="time" name="startTime" placeholder = "HH:MM:SS"></td>
				</tr>
				<tr>
					<td>name item</td><td><input type="text" name="nameItem" placeholder = "ex: drugs"></td>
				</tr>
				<tr>
					<td>starting price</td><td><input type="number" step="0.01" name="currentPrice" placeholder = "10.01"></td>
				</tr>			</table>
			<input type="submit" value="newListing">
		</form>
	<br>
</body>
</html>