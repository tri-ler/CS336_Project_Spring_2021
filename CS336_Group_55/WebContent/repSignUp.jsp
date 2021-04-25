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
		String repUsername = request.getParameter("newRepUsername");
		String repPassword = request.getParameter("newRepPassword");
		
		if ((username.equals("admin")) && (password.equals("admin"))) {
			
			//Make an insert statement for the representatives table:
			String insert = "INSERT INTO representatives(username, password)" + "VALUES (?,?)";
			
			PreparedStatement ps = con.prepareStatement(insert);
			ps.setString(1, repUsername);
			ps.setString(2, repPassword);
			ps.executeUpdate();
			con.close();
			response.sendRedirect("repStart.jsp");
		}
		else {
			out.print("Please sign in with admin account");
		}
		
	} catch (Exception ex) {
		out.print(ex);
		out.print("Sign-Up failed :()");
	}
%>
</body>
</html>