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
			
		//Get parameters from the HTML form at the landingPage.jsp
		String username = request.getParameter("username");
		String auctionID = request.getParameter("auctionID");
		String newBid = request.getParameter("newBid");
		String isAuto = request.getParameter("command");
		
		//Check bid is in valid time frame
		String timeFrame = "select startTime, startDate,endTime,endDate, minIncrement from auction where auctionID = ?";

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
		String minIncrement = (result.getString("minIncrement"));

		// convert database results to dates

		Date sDate = sdformat.parse(startDate);
		Date eDate = sdformat.parse(endDate);
		Date sTime = sdformat2.parse(startTime);
		Date eTime = sdformat2.parse(endTime);
		
		// get current price
		String currPrice = "select currentPrice from auction where auctionID = ?";

		//Create a Prepared SQL statement allowing you to introduce the parameters of the query
		PreparedStatement currPricePS = con.prepareStatement(currPrice);
		
		//Add parameters of the query. Start with 1, the 0-parameter is the INSERT statement itself
		currPricePS.setString(1, auctionID);
		ResultSet currPriceResults = currPricePS.executeQuery();
		currPriceResults.next();
		float cp = Float.parseFloat(currPriceResults.getString("currentPrice"));
		if ((currDate.compareTo(sDate) > 0 && currDate.compareTo(eDate) < 0 || // check if within time and > cp
				currDate.compareTo(sDate) == 0 && currTime.compareTo(sTime)>0 ||
				currDate.compareTo(eDate) == 0 && currTime.compareTo(eTime)<0)&&
				(cp<Float.parseFloat(newBid))){
		    System.out.println("currentDate is within timeframe and greater than current price");
		    System.out.println("currDate: " + currDate);
		    System.out.println("currTime: " + currTime);
		    System.out.println("currPrice: " + cp);
		    System.out.println("newBid: " + newBid);
		    
		    String insertBid;
			if(isAuto.equals("True")){
				insertBid = "INSERT INTO bids (auctionID, date, time, bidAmount, username, isAuto)"+"VALUES (?,curdate(),curtime(),?,?,True)";
				// insert the bid
				ps = con.prepareStatement(insertBid);
				ps.setString(1, auctionID);
				ps.setString(2, newBid);
				ps.setString(3, username);
				ps.executeUpdate();
				
				// fill in bidlist
				ArrayList<String> bidList = new ArrayList<String>();
				String getBidList = "select bidAmount from bids where auctionID = ? and isAuto = True and bidAmount >= ? + ?";
				ps = con.prepareStatement(getBidList);
				ps.setString(1, auctionID);
				ps.setString(2, currPriceResults.getString("currentPrice"));
				ps.setString(3, minIncrement);
				ResultSet bidlistResults = ps.executeQuery();
				while(bidlistResults.next()){
					bidList.add(bidlistResults.getString("bidAmount"));
				}
				String newAutoBid;
				PreparedStatement autoPS;// = con.prepareStatement(newAutoBid);
				/* while(bidList.size()>1){
					newAutoBid = 
					
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
				} */
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