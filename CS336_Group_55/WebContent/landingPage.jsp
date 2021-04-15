<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login Page</title>
</head>
<body>
	out.print("Testing branch stuff");
	out.print("Testing branch stuff2");
	out.print("Testing branch stuff3");
	<br>
		<form method="get" action="login.jsp">
			<table>
				<tr>    
					<td>Username</td><td><input type="text" name="username"></td>
				</tr>
				<tr>
					<td>Password</td><td><input type="text" name="password"></td>
				</tr>
			</table>
			<input type="submit" value="Login">
		</form>
	<br>
	<br>
		<form method="get" action="signup.jsp">
			<table>
				<tr>    
					<td>Username</td><td><input type="text" name="newUsername"></td>
				</tr>
				<tr>
					<td>Password</td><td><input type="text" name="newPassword"></td>
				</tr>
			</table>
			<input type="submit" value="signup">
		</form>
	<br>
	<button onclick="window.location='representativeLoginPage.jsp';"> Representative Login Page </button>
</body>
</html>