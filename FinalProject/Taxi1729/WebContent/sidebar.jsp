<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="itm.iit.edu.service.User"%>
<div class="col-md-3 left_col">
          <div class="left_col scroll-view">
            <div class="navbar nav_title" style="border: 0;" style="text-align:center">
              <a href="#" class="site_title"><i class="fa fa-taxi"></i> <span>Taxi 1729</span></a>
            </div>

            <div class="clearfix"></div>

            <!-- menu profile quick info -->
            <div class="profile clearfix" >
              <div class="profile_pic" >
                <img src="images/logonew.png" alt="..." width="150px" />
              </div>
              
            </div>
             <%
                	User user = (User) session.getAttribute("user");
                %>
            <div class="profile clearfix" style="text-align:center">
              <div class="profile_info" >
                <span ><strong>
               		<%=user.getUserName() %>
                 </strong></span>
                
              </div>
              </div>
            
            <!-- /menu profile quick info -->

            <br />
		<% String home = (String) request.getAttribute("home"); 
			String Ride = (String) request.getAttribute("Ride");
			String Rent = (String) request.getAttribute("Rent");
		%>
            <!-- sidebar menu -->
            <div id="sidebar-menu" class="main_menu_side hidden-print main_menu">
              <div class="menu_section">
                <h3>General</h3>
                <ul class="nav side-menu">
               	
                  <li class=<%=home%>><a href="home"><i class="fa fa-home"></i> Home </a>
                   
                  </li>
                  <li class=<%=Ride %>><a href="bookRide"><i class="fa fa-edit"></i> Book Ride </a>
                  
                  </li>
                  <li class=<%=Rent %>><a href="rentCar"><i class="fa fa-desktop"></i> Rent Car </a>
                 
                  </li>

                  <li><a href="logout"><i class="fa fa-bar-chart-o"></i> Logout</a>
                 
                  </li>
                 
                </ul>
              </div>
         

            </div>
            <!-- /sidebar menu -->

            <!-- /menu footer buttons -->
            <div class="sidebar-footer hidden-small">
              <a data-toggle="tooltip" data-placement="top" title="Settings">
                <span class="glyphicon glyphicon-cog" aria-hidden="true"></span>
              </a>
              <a data-toggle="tooltip" data-placement="top" title="FullScreen">
                <span class="glyphicon glyphicon-fullscreen" aria-hidden="true"></span>
              </a>
              <a data-toggle="tooltip" data-placement="top" title="Lock">
                <span class="glyphicon glyphicon-eye-close" aria-hidden="true"></span>
              </a>
              <a data-toggle="tooltip" data-placement="top" title="Logout" href="login.html">
                <span class="glyphicon glyphicon-off" aria-hidden="true"></span>
              </a>
            </div>
            <!-- /menu footer buttons -->
          </div>
        </div>