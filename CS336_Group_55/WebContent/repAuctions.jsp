<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<%@ page import="java.time.LocalDateTime"%>
<%@ page import="java.util.Date"%>
<%@ page import="java.time.format.DateTimeFormatter"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
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
				String str = "SELECT * FROM auction";
				//Run the query against the database.
				ResultSet result = stmt.executeQuery(str);
			%>
		<table>
			<tr>
				<td>Auction ID</td>
				<td>Seller</td>
				<td>Start Time</td>
				<td>Start Date</td>
				<td>End Time</td>
				<td>End Date</td>
				<td>Minimum Increment</td>	
				<td>Current Price</td>	
				<td>Initial Price</td>	
				<td>Reserve</td>					
			</tr>
			<%
			//parse out the results
			while (result.next()) { %>
				<tr>    
					<td><%= result.getString("auctionID") %></td>
					<td><%= result.getString("seller") %></td>
					<td><%= result.getString("startTime") %></td>
					<td><%= result.getString("startDate") %></td>
					<td><%= result.getString("endTime") %></td>
					<td><%= result.getString("endDate") %></td>
					<td><%= result.getString("minIncrement") %></td>
					<td><%= result.getString("currentPrice") %></td>
					<td><%= result.getString("initialPrice") %></td>
					<td><%= result.getString("secretMin") %></td>
				</tr>
				
			<% } %>
				<form method="get" action="deleteAuction.jsp">
					<table>
						<tr>    
							<td>Auction ID</td><td><input type="text" name="auctionID"></td>
						</tr>

					</table>
					<input type="submit" value="Delete Auction">
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
</body>
</html>