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
<body>
	<%
	try {
		
		//Get the database connection
		ApplicationDB db = new ApplicationDB();	
		Connection con = db.getConnection();
		
		
		//Create a SQL statement
		Statement stmt = con.createStatement();
		/*
		//Get parameters from the HTML form at the HelloWorld.jsp
		String nameItem = request.getParameter("nameItem");
		String att1Name = request.getParameter("att1Name");
		String att1Description = request.getParameter("att1Description");
		String att2Name = request.getParameter("att2Name");
		String att2Description = request.getParameter("att2Description");
		String att3Name = request.getParameter("att3Name");
		String att3Description = request.getParameter("att3Description");
		String att4Name = request.getParameter("att4Name");
		String att4Description = request.getParameter("att4Description");
		String currentPrice = request.getParameter("currentPrice");
		String startDate = request.getParameter("startDate");
		String endDate = request.getParameter("endDate");
		// Set IDItem by incrementing the maximum
		// Set userCreated by user who filled out the form
		// Set first highest bidder as the user who filled out the form
		
		//Make an insert statement for the Users table:
		String insert = "INSERT INTO items(IDItem,nameItem,userCreated,att1Name,att1Description,att2Name,att2Description,att3Name,att3Description,att4Name,att4Description,highestBidder,currentPrice,startDate,endDate)" + "VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
		
		//Create a Prepared SQL statement allowing you to introduce the parameters of the query
		PreparedStatement ps = con.prepareStatement(insert);
		
		//Add parameters of the query. Start with 1, the 0-parameter is the INSERT statement itself
		ps.setString(1, username);
		ps.setString(2, password);
		
		
		//Run the query against the DB
		ps.executeUpdate();
		*/

		//Close the connection. Don't forget to do it, otherwise you're keeping the resources of the server allocated.
		con.close();
		response.sendRedirect("successfullSignUp.jsp");
		
	} catch (Exception ex) {
		out.print(ex);
		out.print("Sign-Up failed :()");
		response.sendRedirect("failedSignUp.jsp");
	}
%>
</body>
</html>