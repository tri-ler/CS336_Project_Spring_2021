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
		
		//Get parameters from the HTML form at the HelloWorld.jsp
		String startDate = request.getParameter("startDate");
		String startTime = request.getParameter("startTime");
		String nameItem = request.getParameter("nameItem");
		String currentPrice = request.getParameter("currentPrice");
		String brand = request.getParameter("brand");
		String model = request.getParameter("model");
		String socket = request.getParameter("socket");
		String frequency = request.getParameter("frequency");
		
		
		//Make an insert statement for the Users table:
		String insert = "INSERT INTO cpu(itemID,brand,model,socket,frequency)" + "VALUES (?)";
		
		//Create a Prepared SQL statement allowing you to introduce the parameters of the query
		PreparedStatement ps = con.prepareStatement(insert);
		
		//Add parameters of the query. Start with 1, the 0-parameter is the INSERT statement itself
		ps.setString(1, nameItem);
		
		
		//Run the query against the DB
		ps.executeUpdate();


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