<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.ResultSet"%>
<!DOCTYPE html>
<html lang="en" >

<head>
  <meta charset="UTF-8">
  <title>CSS Snackables - Week 2</title>
  <link href="https://fonts.googleapis.com/css?family=Open+Sans:400,600" rel="stylesheet">

<meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css">

<jsp:include page="./headerFiles.jsp"></jsp:include>
<link rel="stylesheet" href="./css/style1.css">
  
</head>
<% 
String days = (String) request.getAttribute("days");
%>
<body style="background-image:url(./images/pic1.png)">
	            <div class="profile clearfix" >
              <div class="profile_pic" >
                <img src="images/logonew.png" alt="..." width="150px" />
              </div>
              
            </div>
                                    <!-- price element -->
                        <div class="col-md-3 col-sm-6 col-xs-12">
                          <div class="pricing">
                            <div class="title">
                              <h2>Checkout Ride</h2>

                              
                            </div>
                            <div class="x_content">
                              <div class="">
                                <div class="pricing_features">
                                  <ul class="list-unstyled text-left">
                                  <h2><%= request.getAttribute("carName") %>&emsp;<small><%= request.getAttribute("carType") %></small></h2>
                                    <li><i class="fa fa-check text-success"></i> Car Model: <strong><%= request.getAttribute("carModel") %></strong></li>
                                                        
                                    <li><i class="fa fa-check text-success"></i> <strong>Your Taxi1729 Driver: </strong><%= request.getAttribute("carDriver") %></li>
                                    <li><i class="fa fa-check text-success"></i> Ride Time <strong><%= request.getAttribute("time") %></strong></li>
                                    <li><i class="fa fa-check text-success"></i> <strong>Ride Distance</strong><%= request.getAttribute("dist") %></li>
                                    <li><i class="fa fa-check text-success"></i>Ride Cost <strong> <%= request.getAttribute("carCost") %></strong></li>
                                    
                                    
                                  </ul>
                                </div>
                              </div>

                            </div>
                          </div>
                        </div>
                        <!-- price element -->
    <div align="center">
    <div class="modal__container" >
      <div class="modal__featured">
      <a href="rentRide">
        <button type="button" class="button--transparent button--close" >
          <svg class="nc-icon glyph" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px" width="32px" height="32px" viewBox="0 0 32 32">
            <g><path fill="#ffffff" d="M1.293,15.293L11,5.586L12.414,7l-8,8H31v2H4.414l8,8L11,26.414l-9.707-9.707 C0.902,16.316,0.902,15.684,1.293,15.293z"></path> </g></svg>
          <span class="visuallyhidden">Return to Product Page</span>
        </button></a>
        <div class="modal__circle"></div>
        <img src="https://cloud.githubusercontent.com/assets/3484527/19622568/9c972d44-987a-11e6-9dcc-93d496ef408f.png" class="modal__product" />
      </div>
      <div class="modal__content">
        <h2>Your payment details</h2>

        <form method="POST" action="ridePaymentSuccess">
          <ul class="form-list">
            <li class="form-list__row">
              <label>Name</label>
              <input type="text" name="" required="" />
            </li>
            <li class="form-list__row">
              <label>Card Number</label>
              <div id="input--cc" class="creditcard-icon">
                <input type="text" name="cc_number" required="" />
              </div>
            </li>
            <li class="form-list__row form-list__row--inline">
              <div>
                <label>Expiration Date</label>
                <div class="form-list__input-inline">
                  <input type="text" name="cc_month" placeholder="MM"  />
                  <input type="text" name="cc_year" placeholder="YY"   />
                </div>
              </div>
              <div>
                <label>
                  CVC

                  <a href="#cvv-modal" class="button--transparent modal-open button--info">
                    <svg class="nc-icon glyph" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px" width="16px" height="16px" viewBox="0 0 16 16"><g> <path fill="#35a4fb" d="M8,0C3.6,0,0,3.6,0,8s3.6,8,8,8s8-3.6,8-8S12.4,0,8,0z M8,13c-0.6,0-1-0.4-1-1c0-0.6,0.4-1,1-1s1,0.4,1,1 C9,12.6,8.6,13,8,13z M9.5,8.4C9,8.7,9,8.8,9,9v1H7V9c0-1.3,0.8-1.9,1.4-2.3C8.9,6.4,9,6.3,9,6c0-0.6-0.4-1-1-1 C7.6,5,7.3,5.2,7.1,5.5L6.6,6.4l-1.7-1l0.5-0.9C5.9,3.6,6.9,3,8,3c1.7,0,3,1.3,3,3C11,7.4,10.1,8,9.5,8.4z"></path> </g></svg>
                    <span class="visuallyhidden">What is CVV?</span>
                  </a>
                </label>
                <input type="text" name="cc_cvc" placeholder="123"  />
              </div>
            </li>
            <li class="form-list__row form-list__row--agree">
              <label>
                <input type="checkbox" name="save_cc" checked="checked">
                Save my card for future purchases
              </label>
            </li>
            <li>
              <button type="submit" class="button">Pay Now</button>
            </li>
          </ul>
        </form>
      </div> <!-- END: .modal__content -->
    </div> <!-- END: .modal__container -->
  </div>
        <!-- footer content -->
        <footer>
          <div class="pull-right">
            <p style="color:#F9A602">©2018 All Rights Reserved</p> Taxi 1729
          </div>
          <div class="clearfix"></div>
        </footer>
        <!-- /footer content -->

  

 




</body>
	<script  src="./js/index1.js"></script>
</html>
    