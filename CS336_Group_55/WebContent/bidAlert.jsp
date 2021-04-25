<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<%@ page import="java.time.LocalDateTime"%>
<%@ page import="java.util.Date"%>
<%@ page import="java.time.format.DateTimeFormatter"%>
<%@ page import="java.text.SimpleDateFormat"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>Insert title here</title>
	</head>
	<body>
		<% try {
	
			//Get values from the form
			String username = request.getParameter("username");
			//Get the database connection
			ApplicationDB db = new ApplicationDB();	
			Connection con = db.getConnection();		
			
			//Nothing to get
			
			//Make a SELECT query from the auction table 
			String str = "SELECT auction.auctionID, computerpart.partName, auction.startDate, auction.startTime, auction.endDate, auction.endTime, auction.currentPrice, auction.secretMin, IF(bids.auctionID = t1.auctionID AND bids.username = t1.username, true, false) AS isWinning " 
			+ "FROM auction, auctioning, computerpart, bids, (SELECT auctionID, username, max(bidAmount) FROM bids GROUP BY auctionID) t1 "
			+ "WHERE auction.auctionID = auctioning.auctionID AND computerpart.itemID = auctioning.itemID AND auction.auctionID = bids.auctionID AND t1.auctionID = bids.auctionID AND bids.username = ?";
			
			//Create a Prepared SQL statement allowing you to introduce the parameters of the query
			PreparedStatement ps = con.prepareStatement(str);
			
			//Add parameters of the query. Start with 1, the 0-parameter is the INSERT statement itself
			ps.setString(1, username);
			
			//Run the query against the database.
			ResultSet result = ps.executeQuery();
		%>
			
		<!--  Make an HTML table to show the results in: -->
	<table>
<%-- 		<tr>    
			<td>Name</td>
			<td>
				<%if (entity.equals("beers"))
					out.print("Manufacturer");
				else
					out.print("Address");
				%>
			</td>
		</tr> --%>
			<tr>
				<td> auction ID |</td>
				<td> partName |</td>
				<td> start date |</td>
				<td> start time |</td>
				<td> end date |</td>
				<td> end time |</td>
				<td> current price |</td>
				<td> reserve |</td>
				<td> Winning?</td>							
			</tr>
			<%
			//parse out the results
			while (result.next()) { %>
				<tr>    
					<td><%= result.getString("auctionID") %></td>
					<td><%= result.getString("partName") %></td>
					<td><%= result.getString("startDate") %></td>
					<td><%= result.getString("startTime") %></td>
					<td><%= result.getString("endDate") %></td>
					<td><%= result.getString("endTime") %></td>
					<td><%= result.getString("currentPrice") %></td>
					<td><%= result.getString("isWinning") %></td>
					<!--
					don't include innitialPrice or secretMin  -->
				</tr>
				

			<% }
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