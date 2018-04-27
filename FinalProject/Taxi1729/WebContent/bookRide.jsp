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
									action="bookRide" novalidate>


									<span class="section">Where do you want us to take you?</span>

									<div class="item form-group">
										<label class="control-label col-md-3 col-sm-3 col-xs-12"
											for="name">From <span class="required">*</span>
										</label>
										<div class="col-md-6 col-sm-6 col-xs-12">
											<input id="from" class="form-control col-md-7 col-xs-12"
												data-validate-length-range="6" data-validate-words="2"
												name="from" placeholder="ORigin Address" required="required"
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


</html>