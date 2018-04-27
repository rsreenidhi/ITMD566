<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="java.sql.ResultSet"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Taxi1729 | Accept Rent</title>
<jsp:include page="./headerFiles.jsp"></jsp:include>
</head>
<body>
<body class="nav-md">

	<div class="container body">
		<div class="main_container">

			<jsp:include page="./sidebarAdmin.jsp"></jsp:include>
			<jsp:include page="./topNav.jsp"></jsp:include>

			<!-- page content -->
			<div class="right_col" role="main">
				<div class="">
					<div class="page-title">
						<div class="title_left">
							<h3>
								Rent Requests
							</h3>
						</div>


					</div>

					<div class="clearfix"></div>


	
            <div class="row">
              <div class="col-md-12 col-sm-12 col-xs-12">
                <% ResultSet rs = (ResultSet) request.getAttribute("rentrequests"); %>
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
					<form class="form-horizontal form-label-left" method="POST" action="saveRent" >


                    <div class="col-md-5 col-sm-5 col-xs-12" style="border:0px solid #e5e5e5;">

                    



                      <div class="item form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="name"><strong><h2>Car Type: </h2></strong>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">

                        <label class="control-label col-md-3 col-sm-3 col-xs-12" name="carType" for="name"><h2><%=rs.getString("car_type") %></h2> 
                      		
                          </label>
                           <input  type="hidden" name="hidden_car_type" value=<%=rs.getString("car_type") %>>
                           <input  type="hidden" name="hidden_Car" value=<%=rs.getString("car_brand") %>>
                         	<input type="hidden" name="hidden_id" value=<%=rs.getString("car_user") %>>
                        </div>
                      </div>

                      <br />

                      <div class="">
                        <div class="product_price">
                          

                                           <div class="item form-group">
                        <label class="control-label col-md-6 col-sm-6 col-xs-12 price" for="number">Final Cost:
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                        	
                        <label class="control-label col-md-6 col-sm-6 col-xs-12 finalCost price" name="finalCost" for="name"><h2><%=rs.getString("car_cost") %></h2> 
                        	</label>
                        	<input  type="hidden" class="car_finalCost" name="hidden_car_finalCost" value=<%=rs.getString("car_cost") %> >

                        </div>
                      </div>
                          <br>
                        </div>
                      </div>

                      <div class="">
                      		
                          <button  type="submit" class="btn btn-success btn-lg">Accept</button>
                    
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


</html>