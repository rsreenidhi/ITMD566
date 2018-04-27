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
<% 
int days = ((Long)request.getAttribute("days")).intValue();
%>
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
								Rent Cars <small>Its your car!</small>
							</h3>
						</div>


					</div>

					<div class="clearfix"></div>

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
										action="rentCar">


										<span class="section">When do you want the car?</span>


										<div class="col-md-4">
											Date Range

											<fieldset>
												<div class="control-group">
													<div class="controls">
														<div class="input-prepend input-group">
															<span class="add-on input-group-addon"><i
																class="glyphicon glyphicon-calendar fa fa-calendar"></i></span>
															<input type="text" style="width: 200px"
																name="reservation" id="reservation" class="form-control"
																value="04/26/2018 - 04/28/2018" />
														</div>
													</div>
												</div>
											</fieldset>

										</div>



										<div class="form-group">
											<div class="col-md-6 col-md-offset-3">
												<button type="submit" class="btn btn-primary">Cancel</button>
												<button id="send" type="submit" class="btn btn-success">Book</button>
											</div>
										</div>
									</form>
								</div>
							</div>
						</div>
					</div>
	
            <div class="row">
              <div class="col-md-12 col-sm-12 col-xs-12">
                <% ResultSet rs = (ResultSet) request.getAttribute("availbleRentCars"); %>
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
					<form class="form-horizontal form-label-left" method="POST" action="rentPayment" >
                    <div class="col-md-7 col-sm-7 col-xs-12">
                      <div class="product-image">
                      <% String imagePath = rs.getString("car_image"); %>
                           <img src="<%=imagePath %>" />
                          <input type="hidden" name="hidden_path" value= <%=imagePath %>>
                      </div>

                    </div>

                    <div class="col-md-5 col-sm-5 col-xs-12" style="border:0px solid #e5e5e5;">

                      <h3 class="prod_title"><%=rs.getString("car_brand") %><small>&emsp;<%=rs.getString("car_model") %> </small></h3>

                      <p>BMW, Ferrari, Merc are one of the top brand cars available for rent.</p>
                      <br />

                      <div class="">
                        <h2>Available Colors</h2>
                        <ul class="list-inline prod_color">
                          <li>
                            <p>Green</p>
                            <div class="color bg-green"></div>
                          </li>
                          <li>
                            <p>Blue</p>
                            <div class="color bg-blue"></div>
                          </li>
                          <li>
                            <p>Red</p>
                            <div class="color bg-red"></div>
                          </li>
                          <li>
                            <p>Orange</p>
                            <div class="color bg-orange"></div>
                          </li>

                        </ul>
                      </div>
                      <br />

                      <div class="item form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="name"><strong><h2>Car Type: </h2></strong>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">

                        <label class="control-label col-md-3 col-sm-3 col-xs-12" name="carType" for="name"><h2><%=rs.getString("car_type") %></h2> 
                      		
                          </label>
                           <input  type="hidden" name="hidden_car_type" value=<%=rs.getString("car_type") %>>
                           <input  type="hidden" name="hidden_Car" value=<%=rs.getString("car_brand") %>>
                          <input  type="hidden" name="hidden_model" value=<%=rs.getString("car_model") %>>
                        </div>
                      </div>
                       <div class="item form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="email"><h2>Color: </h2>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <label class="control-label col-md-3 col-sm-3 col-xs-12" name="color" for="name"><h2><%=rs.getString("car_color") %> </h2>
                          </label>
                          <input  type="hidden" name="hidden_car_color" value=<%=rs.getString("car_color") %>>
                        </div>
                      </div>
                      <br />

                      <div class="">
                        <div class="product_price">
                          
                                               <div class="item form-group">
                        <label class="control-label col-md-6 col-sm-6 col-xs-12" >Rent <small>per day:</small>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <label class="control-label col-md-6 col-sm-6 col-xs-12 rent" name="rent"  for="name">$<%=rs.getInt("car_cost") %>
                        	</label>
                        	<input  type="hidden" name="hidden_car_cost" value=<%=rs.getString("car_cost") %>>
                        </div>
                      </div>
                        <div class="item form-group">
                        <label class="control-label col-md-6 col-sm-6 col-xs-12" for="number">Insurance <small>per day:</small>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                        
                        	 <label class="control-label col-md-6 col-sm-6 col-xs-12 insurance" name="insurance"  for="name">$<%=rs.getInt("insurance_cost") %>
                        	</label>
                        	<input  type="hidden" name="hidden_car_insurance" value=<%=rs.getString("insurance_cost") %>>
                        </div>
                      </div>
                       <div class="item form-group">
                        <label class="control-label col-md-6 col-sm-6 col-xs-12" for="number">Number of Days: 
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                        
                        	 <label class="control-label col-md-6 col-sm-6 col-xs-12 " name="days" for="name"><%=request.getAttribute("days") %>
                        	</label>
                        	<input  type="hidden" name="hidden_car_days" value=<%=request.getAttribute("days") %>>
                        </div>
                      </div>
                                           <div class="item form-group">
                        <label class="control-label col-md-6 col-sm-6 col-xs-12 price" for="number">Final Cost:
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                        	
                        <label class="control-label col-md-6 col-sm-6 col-xs-12 finalCost price" name="finalCost" for="name">
                        	</label>
                        	<input  type="hidden" class="car_finalCost" name="hidden_car_finalCost" >

                        </div>
                      </div>
                          <br>
                        </div>
                      </div>

                      <div class="">
                      		
                          <button  type="submit" class="btn btn-success btn-lg">Get this for Ride</button>
                    
                      </div>

                      <div class="product_social">
                        <ul class="list-inline">
                          <li><a href="#"><i class="fa fa-facebook-square"></i></a>
                          </li>
                          <li><a href="#"><i class="fa fa-twitter-square"></i></a>
                          </li>
                          <li><a href="#"><i class="fa fa-envelope-square"></i></a>
                          </li>
                          <li><a href="#"><i class="fa fa-rss-square"></i></a>
                          </li>
                        </ul>
                      </div>

                    </div>


  
                    </form>
                  </div>
                </div>
                <%} %>
              </div>
            </div>


				</div>
			</div>
			<!-- /page content -->

			<!-- footer content -->
			<footer>
			<div class="pull-right">
				<p style="color: #F9A602">©2018 All Rights Reserved Taxi 1729</p>
			</div>
			<div class="clearfix"></div>
			</footer>
			<!-- /footer content -->
		</div>
	</div>



</body>
<script type="text/javascript">


finalCost = document.getElementsByClassName("finalCost");
hidden_finalCost = document.getElementsByClassName("car_finalCost");
rent = document.getElementsByClassName("rent");
var rents = [];

for (var i = 0; i < rent.length; i++) {
	var temp = rent[i].innerHTML.split("$");
	rents[i] = temp[1];
	
}
var insurances = [];
insurance = document.getElementsByClassName("insurance");
for (var i = 0; i < insurance.length; i++) {
	var temp2 = insurance[i].innerHTML.split("$");
	insurances[i] = temp2[1];
	
}

for (var i = 0; i < finalCost.length; i++) {
	finalCost[i].innerHTML = "$" + ((rents[i] * <%=days%>) + (insurances[i] * <%=days%>));
	hidden_finalCost[i].value = ((rents[i] * <%=days%>) + (insurances[i] * <%=days%>));
}
</script>

</html>