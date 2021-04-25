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
		PreparedStatement ps;
			
		//Get parameters from the HTML form at the landingPage.jsp
		String username = request.getParameter("username");
		String auctionID = request.getParameter("auctionID");
		String newBid = request.getParameter("newBid");
		String isAuto = request.getParameter("command");
		
		//Check bid is in valid time frame
		String timeFrame = "select startTime, startDate,endTime,endDate, minIncrement, currentPrice from auction where auctionID = ?";
		ps = con.prepareStatement(timeFrame);
		ps.setString(1, auctionID);
		ResultSet result = ps.executeQuery();
		
		result.next();
			
		//get current date and time
		//=============================================================booty=====================
		DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy-MM-dd"); 
		DateTimeFormatter dtf2 = DateTimeFormatter.ofPattern("HH:mm:ss"); 
		LocalDateTime now = LocalDateTime.now();
		/* System.out.println("These should be same:" + dtf.format(now));
		System.out.println("These should be same:" + dtf.format(now).toString());
		*/
		SimpleDateFormat sdformat = new SimpleDateFormat("yyyy-MM-dd");
		SimpleDateFormat sdformat2 = new SimpleDateFormat("HH:mm:ss");
		Date currDate = sdformat.parse(dtf.format(now));
		Date currTime = sdformat2.parse(dtf2.format(now));
		
		System.out.println("The date is: " + sdformat.format(currDate));
		System.out.println("The time is: " + sdformat2.format(currTime));
		//Run the query against the DB
		//==============================================================================================

		String startTime = result.getString("startTime");
		String startDate = result.getString("startDate");
		String endTime = result.getString("endTime");
		String endDate = result.getString("endDate");
		String minIncrement = (result.getString("minIncrement"));
		String currentPrice = (result.getString("currentPrice"));

		// convert database results to dates

		Date sDate = sdformat.parse(startDate);
		Date eDate = sdformat.parse(endDate);
		Date sTime = sdformat2.parse(startTime);
		Date eTime = sdformat2.parse(endTime);
		
		float cp = Float.parseFloat(currentPrice);
		if ((currDate.compareTo(sDate) > 0 && currDate.compareTo(eDate) < 0 || // check if within time and > cp
				currDate.compareTo(sDate) == 0 && currTime.compareTo(sTime)>0 ||
				currDate.compareTo(eDate) == 0 && currTime.compareTo(eTime)<0)&&
				(cp<Float.parseFloat(newBid))){
		    /* System.out.println("currentDate is within timeframe and greater than current price");
		    System.out.println("currDate: " + currDate);
		    System.out.println("currTime: " + currTime);
		    System.out.println("currPrice: " + currentPrice);
		    System.out.println("newBid: " + newBid);
		     */
		    String insertBid;
			if(isAuto.equals("True")){
				String newBidAmount = String.valueOf(cp+Float.parseFloat(minIncrement));
				
 				insertBid = "INSERT INTO bids (auctionID, date, time, bidAmount, username, isAuto)"+"VALUES (?,curdate(),curtime(),?,?,True),(?,curdate(),curtime(),?,?,False)";
				ps = con.prepareStatement(insertBid);
				ps.setString(1, auctionID);
				ps.setString(2, newBid);
				ps.setString(3, username);
				ps.setString(4, auctionID);
				ps.setString(5, newBidAmount);
				ps.setString(6, username);
				ps.executeUpdate(); 
				
				
				String newAutoBid;
				PreparedStatement autoPS;// = con.prepareStatement(newAutoBid);
				
				// 
				String secondHighestBid = "SELECT username, ifnull(MAX(bidAmount),0) as bidA FROM bids WHERE auctionID = ? AND bidAmount < (SELECT MAX(bidAmount) FROM bids WHERE auctionID = ? and isAuto = True )";
				PreparedStatement secondHighestBidPS = con.prepareStatement(secondHighestBid); 
				secondHighestBidPS.setString(1,auctionID);
				secondHighestBidPS.setString(2,auctionID);
				ResultSet secondHighestBidResult = secondHighestBidPS.executeQuery();
				secondHighestBidResult.next();
				
				float secondHighestAutoBidAmount = Float.parseFloat(secondHighestBidResult.getString("bidA"));
				String nameOfUser = secondHighestBidResult.getString("username");
				System.out.println(secondHighestAutoBidAmount);
				System.out.println(nameOfUser + "\n\n\n");
				
				while((Float.parseFloat(newBidAmount)<secondHighestAutoBidAmount+Float.parseFloat(minIncrement)) && secondHighestAutoBidAmount != 0){
					newBidAmount = String.valueOf(Float.parseFloat(newBidAmount)+Float.parseFloat(minIncrement));		
					System.out.println("newBidAmount: " + newBidAmount);
					newAutoBid = "INSERT INTO bids (auctionID, date, time, bidAmount, username, isAuto)"+"VALUES (?,curdate(),curtime(),?,?,False)";
					autoPS = con.prepareStatement(newAutoBid);
					autoPS.setString(1, auctionID);
					autoPS.setString(2, newBidAmount);
					autoPS.setString(3, nameOfUser);
					autoPS.executeUpdate();

				}
				 
				String newPrice = "update auction " + 
						"set currentPrice = ? "+
						"where auctionID = ?";
				PreparedStatement newPricePS = con.prepareStatement(newPrice);
				newPricePS.setString(1, newBidAmount);
				newPricePS.setString(2, auctionID);
				newPricePS.executeUpdate();
				/*				
				String countBids = "select count(*) from bids where auctionID = ?";
				PreparedStatement countBidsps = con.prepareStatement(countBids);
				countBidsps.setString(1,auctionID);
				ResultSet countBidsResult = countBidsps.executeQuery();
				countBidsResult.next();
				if(Float.parseFloat(countBidsResult.getString("count(*)"))>1){// get 2nd highest
 					String secondHighestBid = "SELECT MAX(bidAmount) FROM bids WHERE auctionID = ? AND bidAmount < (SELECT MAX(bidAmount) FROM bids WHERE auctionID = ? )";
					PreparedStatement secondHighestBidPS = con.prepareStatement(secondHighestBid); 
					secondHighestBidPS.setString(1,auctionID);
					secondHighestBidPS.setString(2,auctionID);
					ResultSet secondHighestBidResult = secondHighestBidPS.executeQuery();
					secondHighestBidResult.next();
					float newCurrentPrice = Float.parseFloat(secondHighestBidResult.getString("MAX(bidAmount)"))+Float.parseFloat(minIncrement);
										
					String newPrice = "update auction " + 
							"set currentPrice = ? "+
							"where auctionID = ?";
					PreparedStatement newPricePS = con.prepareStatement(newPrice);
					newPricePS.setString(1, String.valueOf(newCurrentPrice));
					newPricePS.setString(2, auctionID);
					newPricePS.executeUpdate();
				} 
				*/
			}else{
				insertBid = "INSERT INTO bids (auctionID, date, time, bidAmount, username, isAuto)"+"VALUES (?,curdate(),curtime(),?,?,False)";
				//Create a Prepared SQL statement allowing you to introduce the parameters of the query
				ps = con.prepareStatement(insertBid);
				ps.setString(1, auctionID);
				ps.setString(2, newBid);
				ps.setString(3, username);
				ps.executeUpdate();
				
				String newPrice = "update auction " + 
						"set currentPrice = ? "+
						"where auctionID = ?";
				PreparedStatement newPricePS = con.prepareStatement(newPrice);
				newPricePS.setString(1, newBid);
				newPricePS.setString(2, auctionID);
				newPricePS.executeUpdate();
			}

			//Run the query against the DB
			
			out.print("bid succeeded!");
			response.sendRedirect("showAll.jsp");
		}else{
		    System.out.println("invalid timing OR price is < current price");
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