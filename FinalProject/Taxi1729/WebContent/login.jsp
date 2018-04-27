<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- Meta, title, CSS, favicons, etc. -->
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>Taxi 1729 | Login</title>

<jsp:include page="./headerFiles.jsp"></jsp:include>
<style>
.alert {
    padding: 20px;
    background-color: #f44336;
    color: white;
    opacity: 1;
    transition: opacity 0.6s;
    margin-bottom: 15px;
}

.alert.success {background-color: #4CAF50;}
.alert.info {background-color: #2196F3;}
.alert.warning {background-color: #ff9800;}

.closebtn {
    margin-left: 15px;
    color: white;
    font-weight: bold;
    float: right;
    font-size: 22px;
    line-height: 20px;
    cursor: pointer;
    transition: 0.3s;
}

.closebtn:hover {
    color: black;
}
</style>
</head>

<body class="login" style="background-image:url(./images/background.png)">
	<div>
		<a class="hiddenanchor" id="signup"></a> <a class="hiddenanchor"
			id="signin"></a>
<% if(session.getAttribute("success") != null){
	int message = (int)(session.getAttribute("success"));
	if(message ==0){ %>
		<div class="alert">
			<span class="closebtn" onclick="this.parentElement.style.display='none';">&times;</span> 
			<strong>Error!</strong> Could Not Register! Try different username
	</div>
	<% }else if(message == 1)
	{ %>
		<div class="alert success">
			<span class="closebtn" onclick="this.parentElement.style.display='none';">&times;</span> 
			<strong>Success!</strong> Registraion Successfull! You can login now.
	</div>
	<%}else if(message == 2)
	{%>
		<div class="alert warning">
			<span class="closebtn" onclick="this.parentElement.style.display='none';">&times;</span> 
			<strong>Oops!</strong> Incorrect username and / or password!
	</div>
	<%}
	session.invalidate();
}%>
	
	
			
		<div class="login_wrapper">
			<div class="animate form login_form">
				<section class="login_content">
					<form method="POST" action="login">
						
							<img src="./images/logonew.png" width="150px" />
						
						<div>
							<input type="text" name="user_name" class="form-control" placeholder="Username"
								required />
						</div>
						<div>
							<input type="password" name="password" class="form-control"
								placeholder="Password" required />
						</div>
						<div>
							
								<input type="submit" class="btn btn-primary" value="Log in"/>
								
						</div>

						<div class="clearfix"></div>

						<div class="separator">
							<p class="change_link">
								New to site? <a href="#signup" class="to_register"> Create
									Account </a>
							</p>

							<div class="clearfix"></div>
							<br />

							<div>
								<h1>
									<i class="fa fa-taxi"></i> Taxi 1729
								</h1>
								<p style="color:#F9A602">©2018 All Rights Reserved</p>
							</div>
						</div>
					</form>
				</section>
			</div>

			<div id="register" class="animate form registration_form">
				<section class="login_content">
					<form method="POST" action="register">
						<img src="./images/logonew.png" width="150px" />

						<div>
							<input type="text" class="form-control" placeholder="First Name"
								required name="firstname" />
						</div>
												<div>
							<input type="text" class="form-control" placeholder="Last Name"
								required name="lastname" />
						</div>
			
						<div>
							<input type="email" class="form-control" placeholder="Email"
								required name="email" />
						</div>
												<div>
							<input type="text" class="form-control" placeholder="User Name"
								required name="username" />
						</div>
						<div>
							<input type="password" class="form-control"
								placeholder="Password" required name="password" />
						</div>
						<div>
							
							<input type="submit" class="btn btn-primary" value="Create Account"/>
						</div>

						<div class="clearfix"></div>

						<div class="separator">
							<p class="change_link">
								Already a member ? <a href="#signin" class="to_register">
									Log in </a>
							</p>

							<div class="clearfix"></div>
							<br />

							<div>
								<h1>
									<i class="fa fa-taxi"></i> Taxi 1729
								</h1>
								<p style="color:#F9A602">©2018 All Rights Reserved</p>
							</div>
						</div>
					</form>
				</section>
			</div>
		</div>
	</div>
</body>
</html>

