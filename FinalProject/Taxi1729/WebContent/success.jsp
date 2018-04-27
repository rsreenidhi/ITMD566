<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.ResultSet"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <!-- Meta, title, CSS, favicons, etc. -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>Taxi 1729 | My Trips</title>
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

  <body class="nav-md">
    <div class="container body">
      <div class="main_container">
        
		<jsp:include page="./sidebar.jsp"></jsp:include>
      	<jsp:include page="./topNav.jsp"></jsp:include>

        <!-- page content -->
        <div class="right_col" role="main">
        
        <% if(session.getAttribute("payment") != null){
				int message = (int)(session.getAttribute("payment"));
				if(message == 1){ %>
					<div class="alert success">
						<span class="closebtn" onclick="this.parentElement.style.display='none';">&times;</span> 
						<strong>Success!</strong> Ride Payment Successful.
					</div>
				<% }else if(message == 2)
				{ %>
					<div class="alert success">
						<span class="closebtn" onclick="this.parentElement.style.display='none';">&times;</span> 
						<strong>Success!</strong> Rent Payment Successful.
					</div>
				<%}else if(message == 2)
				{%>
					<div class="alert warning">
						<span class="closebtn" onclick="this.parentElement.style.display='none';">&times;</span> 
						<strong>Oops!</strong> Incorrect username and / or password!
				</div>
				<%}
	session.setAttribute("payment", null);
}%>
        
          <div class="">
            <div class="page-title">
              <div class="title_left">
                <h3>My Trips <small>Complete trip History!</small></h3>
              </div>

              <div class="title_right">
                <div class="col-md-5 col-sm-5 col-xs-12 form-group pull-right top_search">
                  <div class="input-group">
                    <input type="text" class="form-control" placeholder="Search for...">
                    <span class="input-group-btn">
                      <button class="btn btn-default" type="button">Go!</button>
                    </span>
                  </div>
                </div>
              </div>
            </div>

            <div class="clearfix"></div>

            <div class="row">
           


              <div class="col-md-12 col-sm-12 col-xs-12">
                <div class="x_panel">
               
                  <div class="x_content">
                    
                    <table id="datatable-buttons" class="table table-striped table-bordered">
                      <thead>
                        <tr>
                          <th>Trip Id</th>
                          <th>Date</th>
                          <th>Driver</th>
                          <th>Fare</th>
                          <th>Car</th>
                          <th>Service Type</th>
                          <th>Rating</th>
                        </tr>
                      </thead>
						<%
							ResultSet rs = (ResultSet) request.getAttribute("tripHistory");
                    		
						%>

                      <tbody>
                        <% 	while(rs.next()){ %>	
                        	<tr>
                        		<td><%= rs.getInt("trip_id") %></td>
                        		<td><%= rs.getDate("trip_date") %></td>
                        		<td><%= rs.getString("trip_driver") %></td>
                        		<td>$<%= rs.getDouble("trip_fare") %></td>
                        		<td><%= rs.getString("trip_car") %></td>
                        		<td><%= rs.getString("service_type") %></td>
                        		<td><%= rs.getFloat("trip_rating") %></td>
                        	</tr>
                        <% } %>
                       
                      </tbody>
                    </table>
                  </div>
                </div>
              </div>

  

    

            </div>
          </div>
        </div>
        <!-- /page content -->

        <!-- footer content -->
        <footer>
          <div class="pull-right">
            <p style="color:#F9A602">©2018 All Rights Reserved</p> Taxi 1729
          </div>
          <div class="clearfix"></div>
        </footer>
        <!-- /footer content -->
      </div>
    </div>

   

  </body>
</html>