<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<%@ page import="java.time.LocalDateTime"%>

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
			String str = "SELECT * FROM auction";
			
			//Run the query against the database.
			ResultSet result = stmt.executeQuery(str);
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
				<td>auction ID</td>
				<td>seller name</td>
				<td>start date</td>
				<td>start time</td>
				<td>min increment</td>
				<td>current price</td>				
				<td>bid</td>				
			</tr>
			<%
			// set up date variables
			SimpleDateFormat sdformat = new SimpleDateFormat("yyyy-MM-dd");
			Date d1 = sdformat.parse("2019-04-15");
			Date d2 = sdformat.parse("2019-08-10");
			System.out.println("The date 1 is: " + sdformat.format(d1));
			System.out.println("The date 2 is: " + sdformat.format(d2));
			if(d1.compareTo(d2) > 0) {
			   System.out.println("Date 1 occurs after Date 2");
			} else if(d1.compareTo(d2) < 0) {
			   System.out.println("Date 1 occurs before Date 2");
			} else if(d1.compareTo(d2) == 0) {
			   System.out.println("Both dates are equal");
			}
			//parse out the results
			while (result.next()) { %>
				<tr>    
					<td><%= result.getString("auctionID") %></td>
					<td><%= result.getString("seller") %></td>
					<td><%= result.getString("startDate") %></td>
					<td><%= result.getString("startTime") %></td>
					<td><%= result.getString("minIncrement") %></td>
					<td><%= result.getString("currentPrice") %></td>
					<td><%= if	 %></td>
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