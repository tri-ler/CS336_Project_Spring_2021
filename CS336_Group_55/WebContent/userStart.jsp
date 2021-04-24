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
		<h1>Create New Listing</h1>
			<h2>Select which item type to create</h2>
				<button onclick="window.location='CPUForm.jsp';"> CPU </button>
				<button onclick="window.location='GPUForm.jsp';"> GPU </button>
				<button onclick="window.location='HDDForm.jsp';"> Hard Drive </button>
		<h1>Show Items Available</h1>
			<h2>Select which items to view</h2>
				<button onclick="window.location='showAll.jsp';"> All Items </button>
				<button onclick="window.location='showCPU.jsp';"> CPU </button>
				<button onclick="window.location='showGPU.jsp';"> GPU </button>
				<button onclick="window.location='showHDD.jsp';"> Hard Drive </button>
	<br>

</body>
</html>