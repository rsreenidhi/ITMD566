<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
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
										action="rentCar" >


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
																	name="reservation" id="reservation"
																	class="form-control" value="04/26/2018 - 04/28/2018" />
															</div>
														</div>
													</div>
												</fieldset>
											
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