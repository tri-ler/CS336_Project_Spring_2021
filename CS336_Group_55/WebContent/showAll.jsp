<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<%@ page import="java.time.LocalDateTime"%>
<%@ page import="java.util.Date"%>
<%@ page import="java.time.format.DateTimeFormatter"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>Insert title here</title>
	</head>
	<body>
		<% try {
	
			//Get the database connection
			ApplicationDB db = new ApplicationDB();	
			Connection con = db.getConnection();		

			//Create a SQL statement
			Statement stmt = con.createStatement();
			
			//Nothing to get
			
			//Make a SELECT query from the auction table 
			String str = "SELECT * FROM auction an, auctioning ag, computerpart cp WHERE an.auctionID = ag.auctionID and ag.itemID = cp.itemID";
			
			//Run the query against the database.
			ResultSet result = stmt.executeQuery(str);
		%>
			
		<!--  Make an HTML table to show the results in: -->
	<table>

			<tr>
				<td>auction ID</td>
				<td>seller name</td>
				<td>item name</td>
				<td>start date</td>
				<td>start time</td>
				<td>end date</td>
				<td>end time</td>
				<td>min increment</td>
				<td>current price</td>							
			</tr>
			<%
			//parse out the results
			while (result.next()) { %>
				<tr>    
					<td><%= result.getString("an.auctionID") %></td>
					<td><%= result.getString("an.seller") %></td>
					<td><%= result.getString("cp.partName") %></td>
					<td><%= result.getString("an.startDate") %></td>
					<td><%= result.getString("an.startTime") %></td>
					<td><%= result.getString("an.endDate") %></td>
					<td><%= result.getString("an.endTime") %></td>
					<td><%= result.getString("an.minIncrement") %></td>
					<td><%= result.getString("an.currentPrice") %></td>
					<!--
					don't include innitialPrice or secretMin  -->
				</tr>
				
			<% }%>
			<form method="get" action="bid.jsp">
				<table>
					<tr>    
						<td>auction id</td><td><input type="text" name="auctionID"></td>
					</tr>
					<tr>
						<td>username</td><td><input type="text" name="username"></td>
					</tr>
					<tr>
						<td>newBid</td><td><input type="number" step=0.01 name="newBid"></td>
					</tr>
					<tr>
						<td>Is this an autobid?</td><td><input type="radio" name="command" value="True"></td>
					</tr>
					<tr>
						<td>Is this NOT an autobid?</td><td><input type="radio" name="command" value="False"></td>
					</tr>
				</table>
				<input type="submit" value="Bid!">
			</form>
			
			<%
			//close the connection.
			db.closeConnection(con);
			%>
		</table>

			
		<%} catch (Exception e) {
			out.println(e);
			out.println("you done goofed somehow");
		}%>
	

	</body>
</html>