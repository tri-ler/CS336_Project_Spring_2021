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
		String answer = request.getParameter("answer");
		
		String insert = "UPDATE `q&a` SET `answer` = '?' WHERE (`qID` = '?');";
		
		PreparedStatement ps = con.prepareStatement(insert);
		ps.setString(1, answer);
		ps.setString(2, );
		ps.executeUpdate();
		con.close();
		response.sendRedirect("repQuestions.jsp");
		
	} catch (Exception ex) {
		out.print(ex);
		out.print("Sign-Up failed :()");
	}
%>
</body>
</html>