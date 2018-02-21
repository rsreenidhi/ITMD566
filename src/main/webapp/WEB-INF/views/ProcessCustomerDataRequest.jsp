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
        <a href="#">Customer Details</a>
        </div>

<div id="content">
<div>
<label for="name"><b>Customer Name:</b></label>
<% String name = (String)session.getAttribute("FullName");
out.println(name);
 %>
 </div>
<div>
<label for="name"><b>SSN:</b></label>
<% String ssn = (String)session.getAttribute("SSN");
out.println(ssn);
 %>
 </div>
 <div>
 <label for="name"><b>Zip Code:</b></label>
<% String zip = (String)session.getAttribute("zipCode");
out.println(zip);
 %>
</div>

<div>
  <label for="name"><b>Street Address:</b></label>
<% String address = (String)session.getAttribute("address");
out.println(address);
 %>
 </div>
 <div>
  <label for="name"><b>City:</b></label>
<% String city = (String)session.getAttribute("city");
out.println(city);
 %>
 </div>
 <div>
  <label for="name"><b>State:</b></label>
<% String state = (String)session.getAttribute("state");
out.println(state);
 %>
</div>

</div>

</div> 

</center>
</body>
</html>
   