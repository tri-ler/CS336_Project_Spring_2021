<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<h2>CPU</h2>
		<form method="get" action="newCPUListing.jsp">
			<table>
				<tr>    
					<td>start date</td><td><input type="date" name="startDate" placeholder = "YYYY-MM-DD"></td>
				</tr>
				<tr>
					<td>start time</td><td><input type="time" name="startTime" placeholder = "HH:MM:SS"></td>
				</tr>
				<tr>
					<td>name item</td><td><input type="text" name="nameItem" placeholder = "ex: Intel i7-6700"></td>
				</tr>
				<tr>
					<td>starting price</td><td><input type="number" step="0.01" name="currentPrice" placeholder = "10.01"></td>
				</tr>
				<tr>
					<td>brand</td><td><input type="text" name="brand" placeholder = "intel"></td>
				</tr>	
				<tr>
					<td>model</td><td><input type="text" name="model" placeholder = "i7-6700"></td>
				</tr>
				<tr>
					<td>socket</td><td><input type="text" name="socket" placeholder = "LGA2011"></td>
				</tr>
				<tr>
					<td>frequency</td><td><input type="text" name="frequency" placeholder = "3.4Ghz"></td>
				</tr>			
			</table>
			<input type="submit" value="Create New CPU Listing">
		</form>
</body>
</html>