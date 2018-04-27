<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="java.sql.ResultSet"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Taxi1729 | Book Ride</title>
<jsp:include page="./headerFiles.jsp"></jsp:include>
</head>
<body>
<body class="nav-md">
	<div class="container body">
		<div class="main_container">

			<jsp:include page="./sidebar.jsp"></jsp:include>
			<jsp:include page="./topNav.jsp"></jsp:include>

			<!-- page content -->
			<div class="right_col" role="main">
				<div class="">
					<div class="page-title">
						<div class="title_left">
							<h3>
								Book Ride <small>Hire a Cab</small>
							</h3>
						</div>


					</div>

					<div class="clearfix"></div>

				</div>

				<div class="row">
					<div class="col-md-12 col-sm-12 col-xs-12">
						<div class="x_panel">
							<div class="x_title">

								<ul class="nav navbar-right panel_toolbox">
									<li><a class="collapse-link"><i
											class="fa fa-chevron-up"></i></a></li>


								</ul>
								<div class="clearfix"></div>
							</div>
							<div class="x_content">

								<form class="form-horizontal form-label-left" method="POST"
									action="bookRide" >

									<span class="section">Where do you want us to take you?</span>

									<div class="item form-group">
										<label class="control-label col-md-3 col-sm-3 col-xs-12"
											for="name">From <span class="required">*</span>
										</label>
										<div class="col-md-6 col-sm-6 col-xs-12">
											<input id="from" class="form-control col-md-7 col-xs-12"
												data-validate-length-range="6" data-validate-words="2"
												name="from" placeholder="Origin Address" required="required"
												type="text">
										</div>
									</div>

									<div class="item form-group">
										<label class="control-label col-md-3 col-sm-3 col-xs-12"
											for="name">To <span class="required">*</span>
										</label>
										<div class="col-md-6 col-sm-6 col-xs-12">
											<input id="to" class="form-control col-md-7 col-xs-12"
												data-validate-length-range="6" data-validate-words="2"
												name="to" placeholder="Destination Address"
												required="required" type="text">
										</div>
									</div>


									<div class="form-group">
										<div class="col-md-6 col-md-offset-3">
											<button type="submit" class="btn btn-primary">Cancel</button>
											<button id="send" type="submit" class="btn btn-success">Submit</button>
										</div>
									</div>
								</form>
							</div>
						</div>
					</div>
				</div>








            <div class="row">
              <div class="col-md-12 col-sm-12 col-xs-12">
                <% ResultSet rs = (ResultSet) request.getAttribute("availbleRideCars"); %>
              	<% while(rs.next()) { %>
                <div class="x_panel">
                  <div class="x_title">
                    <h2><%= rs.getString("car_brand") %> <small><%= rs.getString("car_type") %></small></h2>
                    <ul class="nav navbar-right panel_toolbox">
                      <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
                      </li>

                      <li><a class="close-link"><i class="fa fa-close"></i></a>
                      </li>
                    </ul>
                    <div class="clearfix"></div>
                  </div>
                  <div class="x_content">
					<form class="form-horizontal form-label-left" method="POST" action="ridePayment" >


                    <div class="col-md-5 col-sm-5 col-xs-12" style="border:0px solid #e5e5e5;">

          

 

                      <div class="item form-group">
                        <label class="control-label col-md-6 col-sm-6 col-xs-12" for="name"><strong><h2>Car Type: </h2></strong>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">

                        <label class="control-label col-md-6 col-sm-6 col-xs-12" name="carType" for="name"><h2><%=rs.getString("car_type") %></h2> 
                      		
                          </label>
                           <input  type="hidden" name="hidden_car_type" value=<%=rs.getString("car_type") %>>
                           <input  type="hidden" name="hidden_Car" value=<%=rs.getString("car_brand") %>>
                          
                        </div>
                      </div>

                      <br />

                      <div class="">
                        <div class="product_price">
                          
                                               <div class="item form-group">
                        <label class="control-label col-md-6 col-sm-6 col-xs-12" >Rent <small>per km:</small>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <label class="control-label col-md-6 col-sm-6 col-xs-12 cost" name="rent"  for="name"><%=rs.getString("cost") %>
                        	</label>
                        	<input  type="hidden" name="hidden_car_cost" value=<%=rs.getString("cost") %>>
                        </div>
                      </div>
                       <div class="item form-group">
                        <label class="control-label col-md-6 col-sm-6 col-xs-12" >Distance 
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <label class="control-label col-md-6 col-sm-6 col-xs-12 dist" name="dist"  for="name">
                        	</label>
                        	<input  type="hidden" name="hidden_car_dist" class="dist" >
                        </div>
                      </div>
                       <div class="item form-group">
                        <label class="control-label col-md-6 col-sm-6 col-xs-12" >Time 
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <label class="control-label col-md-6 col-sm-6 col-xs-12 time" name="time"  for="name">
                        	</label>
                        	<input  type="hidden" name="hidden_car_time" class="time" >
                        </div>
                      </div>
                        <div class="item form-group">
                        <label class="control-label col-md-6 col-sm-6 col-xs-12" for="number">Driver 
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                        
                        	 <label class="control-label col-md-6 col-sm-6 col-xs-12 driver" name="driver"  for="name"><%=rs.getString("car_driver") %>
                        	</label>
                        	<input  type="hidden" name="hidden_car_driver" value=<%=rs.getString("car_driver") %>>
                        </div>
                      </div>

                                           <div class="item form-group">
                        <label class="control-label col-md-6 col-sm-6 col-xs-12 price" for="number">Final Cost:
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                        	
                        <label class="control-label col-md-6 col-sm-6 col-xs-12  finalcost price" name="finalCost" for="name">
                        	</label>
                        	<input  type="hidden" class="finalcost" name="hidden_car_finalCost" >

                        </div>
                      </div>
                          <br>
                        </div>
                      </div>

                      <div class="">
                      		
                          <button  type="submit" class="btn btn-success btn-lg">Hire Me</button>
                    
                      </div>

               

                    </div>


  
                    </form>
                  </div>
                </div>
                <%} %>
              </div>
            </div>





			</div>
			<!-- /page content -->

			<!-- footer content -->
			<footer>
			<div class="pull-right">
				<p style="color: #F9A602">©2018 All Rights Reserved</p>
				Taxi 1729
			</div>
			<div class="clearfix"></div>
			</footer>
			<!-- /footer content -->
		</div>
	</div>

</body>
<script type="text/javascript">

<% 
String distance = (String) request.getAttribute("distanceString");
%>

var distanceObject = <%=distance %>;

distance = distanceObject.rows[0].elements[0].distance.value;
var duration = distanceObject.rows[0].elements[0].duration.text;

elements = document.getElementsByClassName("time");


for (var i = 0; i < elements.length; i++) {
    elements[i].innerHTML = duration;
 
    
}

dist =  document.getElementsByClassName("dist");


for (var i = 0; i < dist.length; i++) {
	dist[i].innerHTML = distance/1000 + " Km";
	
}

costElements = document.getElementsByClassName("cost");


finalcostElements = document.getElementsByClassName("finalcost");


for (var i = 0; i < costElements.length; i++) {
	
    var finalCost = Number(costElements[i].innerHTML) * (Number(distance)/1000);
	finalCost = finalCost.toFixed(2);
	
	var theCost = "$" + finalCost;
	
	finalcostElements[i].innerHTML = theCost;
	
}
for (var i = 0; i < costElements.length; i++) {
	costElements[i].innerHTML = "$"+costElements[i].innerHTML;
}

</script>

</html>