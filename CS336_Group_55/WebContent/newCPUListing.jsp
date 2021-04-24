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
		String seller = request.getParameter("seller");
		String increment = request.getParameter("minIncrement");
		String initialPrice = request.getParameter("initialPrice");
		String reserve = request.getParameter("reserve");
		//System.out.println("startDate: " + startDate);
		
		//Insert Value into computerPart
		String insert = "INSERT INTO computerPart(partName)" + "VALUES (?)";
		PreparedStatement ps = con.prepareStatement(insert);
		ps.setString(1, nameItem);
		ps.executeUpdate();
		
		
		/* Testing last insert ID
		insert = "select last_insert_id()";
		ps = con.prepareStatement(insert);
		ResultSet result = ps.executeQuery();
		result.next();
		String last_id = result.getString("last_insert_id()");
		System.out.println(last_id);
		*/
		
		// Get the itemID value
		String select = "SELECT last_insert_id()";
		ps = con.prepareStatement(select);
		ResultSet result = ps.executeQuery();
		result.next();
		String itemID = result.getString("last_insert_id()");
		
		//Insert Value into CPU
		insert = "INSERT INTO cpu(itemID,brand,model,socket,frequency)" + "VALUES (?,?,?,?,?)";
		ps = con.prepareStatement(insert);
		ps.setString(1, itemID);
		ps.setString(2, brand);
		ps.setString(3, model);
		ps.setString(4, socket);
		ps.setString(5, frequency);
		ps.executeUpdate();
		
		//Insert Value in to Auction
		insert = "INSERT INTO auction(seller, startTime, startDate, minIncrement, currentPrice, initialPrice, secretMin)" + "VALUES (?,?,?,?,?,?,?)";
		ps = con.prepareStatement(insert);
		ps.setString(1, seller);
		ps.setString(2, startTime);
		ps.setString(3, startDate);
		ps.setString(4, increment);
		ps.setString(5, initialPrice);
		ps.setString(6, initialPrice);
		ps.setString(7, reserve);
		ps.executeUpdate();
		
		// Get the auctionID value
		select = "SELECT last_insert_id()";
		ps = con.prepareStatement(select);
		result = ps.executeQuery();
		result.next();
		String auctionID = result.getString("last_insert_id()");
		
		//Insert Value into Auctioning
		insert = "INSERT INTO auctioning(itemID,auctionID)" + "VALUES (?,?)";
		ps = con.prepareStatement(insert);
		ps.setString(1,itemID);
		ps.setString(2,auctionID);
		ps.executeUpdate();
		
		//Close the connection. Don't forget to do it, otherwise you're keeping the resources of the server allocated.
		con.close();
		response.sendRedirect("successfullSignUp.jsp");
		
	} catch (Exception ex) {
		out.print(ex);
		out.print("Sign-Up failed :()");
		//response.sendRedirect("failedSignUp.jsp");
	}
%>
</body>
</html>