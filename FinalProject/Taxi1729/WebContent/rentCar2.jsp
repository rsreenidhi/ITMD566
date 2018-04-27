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


                      <span class="section">Car Description </span>

                      <div class="item form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="name"><strong>Car: </strong>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                        <% String imagePath = rs.getString("car_image"); %>
                        
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" name="car" for="name"><%=rs.getString("car_brand") %><small>&emsp;<%=rs.getString("car_model") %> </small>
                      		
                          </label>
                          <input  type="hidden" name="hidden_Car" value=<%=rs.getString("car_brand") %>>
                          <input  type="hidden" name="hidden_model" value=<%=rs.getString("car_model") %>>
                          <img src="<%=imagePath %>" width="150px"/>
                          <input type="hidden" name="hidden_path" value= <%=imagePath %>>
                        </div>
                      </div>
                      <div class="item form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="name"><strong>Car Type: </strong>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">

                        <label class="control-label col-md-3 col-sm-3 col-xs-12" name="carType" for="name"><%=rs.getString("car_type") %> 
                      		
                          </label>
                                                    <input  type="hidden" name="hidden_car_type" value=<%=rs.getString("car_type") %>>
                        </div>
                      </div>
                      <div class="item form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="email">Color: 
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <label class="control-label col-md-3 col-sm-3 col-xs-12" name="color" for="name"><%=rs.getString("car_color") %>
                          </label>
                          <input  type="hidden" name="hidden_car_color" value=<%=rs.getString("car_color") %>>
                        </div>
                      </div>
                      <div class="item form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" >Rent <small>per day:</small>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <label class="control-label col-md-3 col-sm-3 col-xs-12 rent" name="rent"  for="name">$<%=rs.getInt("car_cost") %>
                        	</label>
                        	<input  type="hidden" name="hidden_car_cost" value=<%=rs.getString("car_cost") %>>
                        </div>
                      </div>
                      <div class="item form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="number">Insurance <small>per day:</small>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                        
                        	 <label class="control-label col-md-3 col-sm-3 col-xs-12 insurance" name="insurance"  for="name">$<%=rs.getInt("insurance_cost") %>
                        	</label>
                        	<input  type="hidden" name="hidden_car_insurance" value=<%=rs.getString("insurance_cost") %>>
                        </div>
                      </div>
                      <div class="item form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="number"><h2>Number of Days: </h2>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                        
                        	 <label class="control-label col-md-3 col-sm-3 col-xs-12 " name="days" for="name"><%=request.getAttribute("days") %>
                        	</label>
                        	<input  type="hidden" name="hidden_car_days" value=<%=days%>>
                        </div>
                      </div>
  				
                       <div class="item form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="number">Final Cost:
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                        	
                        <label class="control-label col-md-3 col-sm-3 col-xs-12 finalCost" name="finalCost" for="name">
                        	</label>
                        	<input  type="hidden" class="car_finalCost" name="hidden_car_finalCost" value=<%=days%>>

                        </div>
                      </div>

                      <div class="ln_solid"></div>
                      <div class="form-group">
                        <div class="col-md-6 col-md-offset-3">
                          <button type="submit" class="btn btn-primary">Cancel</button>
                          <button  type="submit" class="btn btn-success">Submit</button>
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
	hidden_finalCost[i].innerHTML = ((rents[i] * <%=days%>) + (insurances[i] * <%=days%>));
}
</script>

</html>