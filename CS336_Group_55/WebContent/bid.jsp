<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<%@ page import="java.time.LocalDateTime"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="java.util.Date"%>
<%@ page import="java.time.format.DateTimeFormatter"%>


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
		
		//Get parameters from the HTML form at the landingPage.jsp
		String username = request.getParameter("username");
		String auctionID = request.getParameter("auctionID");
		String newBid = request.getParameter("newBid");
		
		//Check bid is in valid time frame
		String timeFrame = "select startTime, startDate,endTime,endDate from auction where auctionID = ?";

		//Create a Prepared SQL statement allowing you to introduce the parameters of the query
		PreparedStatement ps = con.prepareStatement(timeFrame);
		
		//Add parameters of the query. Start with 1, the 0-parameter is the INSERT statement itself
		ps.setString(1, auctionID);
		ResultSet result = ps.executeQuery();
		result.next();
				
		//get current date and time
		DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy-MM-dd"); 
		DateTimeFormatter dtf2 = DateTimeFormatter.ofPattern("HH:mm:ss"); 
		LocalDateTime now = LocalDateTime.now();
		System.out.println("These should be same:" + dtf.format(now));
		System.out.println("These should be same:" + dtf.format(now).toString());
		
		SimpleDateFormat sdformat = new SimpleDateFormat("yyyy-MM-dd");
		SimpleDateFormat sdformat2 = new SimpleDateFormat("HH:mm:ss");
		Date currDate = sdformat.parse(dtf.format(now));
		Date currTime = sdformat2.parse(dtf2.format(now));
		
		System.out.println("The date is: " + sdformat.format(currDate));
		System.out.println("The time is: " + sdformat2.format(currTime));
		//Run the query against the DB

		String startTime = result.getString("startTime");
		String startDate = result.getString("startDate");
		String endTime = result.getString("endTime");
		String endDate = result.getString("endDate");

		// convert database results to dates

		Date sDate = sdformat.parse(startDate);
		Date eDate = sdformat.parse(endDate);
		Date sTime = sdformat2.parse(startTime);
		Date eTime = sdformat2.parse(endTime);
		if (currDate.compareTo(sDate) > 0 && currDate.compareTo(eDate) < 0 ||
				currDate.compareTo(sDate) == 0 && currTime.compareTo(sTime)>0 ||
				currDate.compareTo(eDate) == 0 && currTime.compareTo(eTime)<0){
		    System.out.println("currentDate is within timeframe");
		    System.out.println("currDate: " + currDate);
		    System.out.println("currTime: " + currTime);
			String insertBid = "INSERT INTO bids (auctionID, date, time, bidAmount, username, isAuto)"+"VALUES (?,curdate(),curtime(),?,?,False)";

			//Create a Prepared SQL statement allowing you to introduce the parameters of the query
			ps = con.prepareStatement(insertBid);

			ps.setString(1, auctionID);
			ps.setString(2, newBid);
			ps.setString(3, username);
			

			//Run the query against the DB
			ps.executeUpdate();
			out.print("bid succeeded!");
			response.sendRedirect("showAll.jsp");
		}else{
		    System.out.println("invalid timing for bid");
		}
		 	
		//Close the connection. Don't forget to do it, otherwise you're keeping the resources of the server allocated.
		con.close();
		
		
	} catch (Exception ex) {
		out.print(ex);
//		response.sendRedirect("failedBid.jsp");
	}
%>
</body>
</html>