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
			String str = "SELECT * FROM `q&a`";
			//Run the query against the database.
			ResultSet result = stmt.executeQuery(str);
		%>
		
	<table>
			<tr>
				<td>Question ID</td>
				<td>Question</td>
				<td>Answer</td>					
			</tr>
			<%
			//parse out the results
			while (result.next()) { %>
				<tr>    
					<td><%= result.getString("qID") %></td>
					<td><%= result.getString("Question") %></td>
					<td><%= result.getString("Answer") %></td>
					<!--
					don't include innitialPrice or secretMin  -->
				</tr>
				
			<% }
			
			%>
			<form method="get" action="repPostQuestion.jsp">
				<table>
					<tr>    
						<td>Type Question</td><td><input type="text" name="question"></td>
					</tr>

				</table>
				<input type="submit" value="Post Question">
			</form>
			<form method="get" action="postAnswer.jsp">
				<table>
					<tr>    
						<td>Type Question ID</td><td><input type="text" name="qID"></td>
					</tr>
					<tr>    
						<td>Type Answer</td><td><input type="text" name="answer"></td>
					</tr>

				</table>
				<input type="submit" value="Post Answer">
			</form>
			<button onclick="window.location='repStart.jsp';"> Return </button>
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