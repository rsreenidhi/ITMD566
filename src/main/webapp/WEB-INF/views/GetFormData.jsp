<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
   pageEncoding="ISO-8859-1"%>


<!DOCTYPE HTML>
<html>
<head>
<meta name="keywords" content="simple jquery validation html form" />


<title>JSP and Servlet ITMD566 Assignment 2</title>
<style>
*{
	margin:0px;
	padding:0px;
}
body {
    background-color: #f9f9f9;
}
#content { background-color:#f9f9f9; padding:20px;  }
h1 {
   font-family:"Palatino Linotype", "Book Antiqua", Palatino, serif;
}

#header {
    background-color: #00a2d1;
	height:50px;
	text-align:center;
}
#header a
{
	color:#fff;
	text-decoration:none;
	font-size:35px;
	font-family:Tahoma, Geneva, sans-serif;
	position:relative;
}

#register-form {
	background:#fff;
    border: 1px solid #DFDCDC;
    border-radius: 15px 15px 15px 15px;
    display: inline-block;
    margin-bottom: 30px;
    margin-left: 20px;
    margin-top: 10px;
    padding: 25px 50px 10px;
    width: 350px;
	font-family:Tahoma, Geneva, sans-serif;
}

#register-form .fieldgroup {
    display: inline-block;
    padding: 8px 10px;
    width: 340px;
}
fieldset{	border:none; }

#register-form .fieldgroup input{
    margin: 10px 0;
    height: 40px;
	width:100%;
	border:solid #cdcdcd 1px;
	border-radius:3px;
	padding-left:10px;
}

#register-form .submit {
    padding: 10px;
    height: 40px !important;
	background:#00a2d1;
	color:#fff;
	font-weight:bolder;
	border:solid #cdcdcd 1px;
	border-radius:3px;
}

#register-form .fieldgroup label.error {
    color: #FB3A3A;
    display: inline-block;
    font-weight:500;
    padding: 0;
    text-align: left;
}
</style>

<script type="text/javascript">

       $('document').ready(function()
	   { 
            $("#register-form").validate({
                rules: {
                    firstname: "required",
                    lastname: "required",
                    email: {
                        required: true,
                        email: true
                    },
                    password: {
                        required: true,
                        minlength: 8
                    },
                },
                messages: {
                    firstname: "Please enter your firstname",
                    lastname: "Please enter your lastname",
                    password: {
                        required: "Please provide a password",
                        minlength: "Password at least have 8 characters"
                    },
                    email: "Please enter a valid email address"
                },
                submitHandler: function(form) {
                    form.submit();
                }
            });  

});
</script>

</head>
<body>
<center>
<div id="page-wrap">

        <div id="header">
        <a href="#">Assignment 2</a>
        </div>

<div id="content">

<form action="/login" method="post" id="register-form">
    <div id="form-content">
        <fieldset>

            <div class="fieldgroup">
                <input type="text" name="name" placeholder="Customer Name" required/>
            </div>

            <div class="fieldgroup">
                <input type="text" name="SSN" placeholder="SSN" required maxlength="11" minlength="11" />
            </div>
		
			<div class="fieldgroup">
				<input type="number" name="zipCode" placeholder="6-digit Zip Code" required   />
			</div>
			
            <div class="fieldgroup">
 				<input type="email" name="email" placeholder="Your E-mail ID" required/>
            </div>

            <div class="fieldgroup">
               <input type="text" name="address" placeholder="Street Address" required/>
            </div>
			
			<div class="fieldgroup">
               <input type="text" name="city" placeholder="City" required/>
            </div>
            
            <div class="fieldgroup">
            	
    		<label for="state">State</label>
    			<select id="state" name="state">
			      <option value="AL">AL</option>
			      <option value="AK">AK</option>
			      <option value="AZ">AZ</option>
			      <option value="DC">DC</option>
			      <option value="MA">MA</option>
			      <option value="IN">IN</option>
			      <option value="IL">IL</option>
    		</select>
           </div>         
            
			
            <div class="fieldgroup">
                <input type="submit" value="Sign UP" class="submit">
            </div>

        </fieldset>
    </div>
</form>

</div>

</div> 

</center>
</body>
</html>