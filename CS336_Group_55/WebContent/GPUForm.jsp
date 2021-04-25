<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<h2>GPU</h2>
		<form method="get" action="newGPUListing.jsp">
			<table>
				<tr>    
					<td>Start Date</td><td><input type="date" name="startDate" placeholder = "YYYY-MM-DD"></td>
				</tr>
				<tr>
					<td>Start Time</td><td><input type="time" name="startTime" placeholder = "HH:MM:SS"></td>
				</tr>
				<tr>
					<td>End Date</td><td><input type="date" name="endDate" placeholder = "YYYY-MM-DD"></td>
				</tr>
				<tr>
					<td>End Time</td><td><input type="time" name="endTime" placeholder = "HH:MM:SS"></td>
				</tr>
				<tr>
					<td>Listing Title</td><td><input type="text" name="nameItem" placeholder = "ex: Nvidia RTX 3090"></td>
				</tr>
				<tr>
					<td>Brand</td><td><input type="text" name="brand" placeholder = "ex: Nvidia"></td>
				</tr>	
				<tr>
					<td>Model</td><td><input type="text" name="model" placeholder = "ex: RTX 3090"></td>
				</tr>
				<tr>
					<td>Color</td><td><input type="text" name="color" placeholder = "ex: Gray"></td>
				</tr>
				<tr>
					<td>Seller Username</td><td><input type="text" name="seller" placeholder = "ex: user1"></td>
				</tr>
				<tr>
					<td>Minimum Increment</td><td><input type="text" name="minIncrement" placeholder = "ex: 1"></td>
				</tr>
				<tr>
					<td>Starting Price</td><td><input type="text" name="initialPrice" placeholder = "ex: 5"></td>
				</tr>	
				<tr>
					<td>Reserve</td><td><input type="text" name="reserve" placeholder = "ex: 10"></td>
				</tr>		
			</table>
			<input type="submit" value="Create New GPU Listing">
		</form>
		<button onclick="window.location='userStart.jsp';"> Return </button>
</body>
</html>