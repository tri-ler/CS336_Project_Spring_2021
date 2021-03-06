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
		String username = request.getParameter("adminUsername");
		String password = request.getParameter("adminPassword");
		
		//Make an insert statement for the Sells table:
		String find = "Select * from representatives where username = ? and password = ?";
		
		//Create a Prepared SQL statement allowing you to introduce the parameters of the query
		PreparedStatement ps = con.prepareStatement(find);
		
		//Add parameters of the query. Start with 1, the 0-parameter is the INSERT statement itself
		ps.setString(1, username);
		ps.setString(2, password);
		
		//Run the query against the DB
		ResultSet result = ps.executeQuery();
		result.next();
		String user = result.getString("username");
		String pass = result.getString("password");
		if (user.equals(username) && pass.equals(password)){
			con.close();
			ps.close();
			out.print("Login successful");
			response.sendRedirect("repStart.jsp");
		}else{
			out.print(user.equals(username));
			response.sendRedirect("failedLogin.jsp");
		}
		
		//Close the connection. Don't forget to do it, otherwise you're keeping the resources of the server allocated.
		con.close();
		out.print("Login succeeded!");
		
	} catch (Exception ex) {
		out.print(ex);
		out.print("Login failed :()");
		response.sendRedirect("failedLogin.jsp");
	}
%>
</body>
</html>