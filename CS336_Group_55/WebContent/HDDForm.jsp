<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<h2>Hard Drive</h2>
		<form method="get" action="newHDDListing.jsp">
			<table>
				<tr>    
					<td>start date</td><td><input type="date" name="startDate" placeholder = "YYYY-MM-DD"></td>
				</tr>
				<tr>
					<td>start time</td><td><input type="time" name="startTime" placeholder = "HH:MM:SS"></td>
				</tr>
				<tr>
					<td>name item</td><td><input type="text" name="nameItem" placeholder = "ex: Samsung Evo 970 Pro"></td>
				</tr>
				<tr>
					<td>starting price</td><td><input type="number" step="0.01" name="currentPrice" placeholder = "10.01"></td>
				</tr>
				<tr>
					<td>brand</td><td><input type="text" name="brand" placeholder = "Samsung"></td>
				</tr>	
				<tr>
					<td>model</td><td><input type="text" name="model" placeholder = "EVO 970"></td>
				</tr>
				<tr>
					<td>color</td><td><input type="text" name="color" placeholder = "Black"></td>
				</tr>
				<tr>
					<td>capacity</td><td><input type="text" name="capacity" placeholder = "1 TB"></td>
				</tr>			
			</table>
			<input type="submit" value="Create New HardDrive Listing">
		</form>
</body>
</html>