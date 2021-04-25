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
				String str = "SELECT * FROM bids";
				//Run the query against the database.
				ResultSet result = stmt.executeQuery(str);
			%>
		<table>
			<tr>
				<td>Bid ID</td>
				<td>Auction ID</td>
				<td>Date</td>
				<td>Time</td>
				<td>Bid Amount</td>
				<td>Username</td>
				<td>Auto Bid</td>					
			</tr>
			<%
			//parse out the results
			while (result.next()) { %>
				<tr>    
					<td><%= result.getString("bidID") %></td>
					<td><%= result.getString("auctionID") %></td>
					<td><%= result.getString("date") %></td>
					<td><%= result.getString("time") %></td>
					<td><%= result.getString("bidAmount") %></td>
					<td><%= result.getString("username") %></td>
					<td><%= result.getString("isAuto") %></td>
				</tr>
				
			<% } %>
				<form method="get" action="deleteBid.jsp">
					<table>
						<tr>    
							<td>Bid ID</td><td><input type="text" name="bidID"></td>
						</tr>

					</table>
					<input type="submit" value="Delete Bid">
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