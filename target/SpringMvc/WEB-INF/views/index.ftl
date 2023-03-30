
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>

<link rel="stylesheet" href="./resources/library/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="./resources/css/login.css">
</head>
<body>
	<div class="container">
		<div class="wrapper">
			<div class="title">
				<span>Login</span>
			</div>
			<form id="Login_form" name="Login_form" action="LoginController"
				method="POST">
				<div class="row">
					<i class="fas fa-user"></i> <input type="text" id="email"
						name="email" placeholder="Email" required>
				</div>
				<div class="row">
					<i class="fas fa-lock"></i> <input type="password" name="password"
						placeholder="Password" required>
				</div>
				<div class="row button">
					<input type="submit" value="Login" onclick="Login_form.submit()">
				</div>

				<div class="signup-link">
					Not a member?<a href="Registration">Signup now</a>
				</div>
			</form>
			<span id="msg" style="color: red"></span>
		</div>
	</div>


</body>
</html>