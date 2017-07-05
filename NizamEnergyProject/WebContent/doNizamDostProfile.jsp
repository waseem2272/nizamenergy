<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="bean.UserBean"%>
<%@page import="java.text.NumberFormat"%>
<%@page import="java.util.Locale"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="bean.SalesManBean"%>
<%@page import="java.util.HashMap"%>
<%@page import="bal.CustomerBal"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Nizam Energy</title>


<!-- ================== BEGIN BASE CSS STYLE ================== -->
<link rel="shortcut icon" href="assets/icons/favicon.png" />
<link
	href="http://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700"
	rel="stylesheet">
<link
	href="assets/plugins/jquery-ui/themes/base/minified/jquery-ui.min.css"
	rel="stylesheet" />
<link href="assets/plugins/bootstrap/css/bootstrap.min.css"
	rel="stylesheet" />
<link href="assets/plugins/font-awesome/css/font-awesome.min.css"
	rel="stylesheet" />
<link href="assets/css/animate.min.css" rel="stylesheet" />
<link href="assets/css/style.min.css" rel="stylesheet" />
<link href="assets/css/style-responsive.min.css" rel="stylesheet" />
<link href="assets/css/theme/default.css" rel="stylesheet" id="theme" />

<link href="assets/plugins/ionicons/css/ionicons.min.css"
	rel="stylesheet" />
<link href="assets/plugins/simple-line-icons/simple-line-icons.css"
	rel="stylesheet" />

<!-- Load jQuery from Google's CDN -->
<!-- Load jQuery UI CSS  -->
<link rel="stylesheet"
	href="http://code.jquery.com/ui/1.10.3/themes/smoothness/jquery-ui.css" />
<link rel="stylesheet"
	href="DateTimepicker/jquery-ui-timepicker-addon.css">
<link rel="stylesheet"
	href="DateTimepicker/jquery-ui-timepicker-addon.min.css">

<link
	href="assets/plugins/bootstrap-combobox/css/bootstrap-combobox.css"
	rel="stylesheet" />
<link href="assets/plugins/bootstrap-select/bootstrap-select.min.css"
	rel="stylesheet" />
<link href="assets/plugins/bootstrap-tagsinput/bootstrap-tagsinput.css"
	rel="stylesheet" />
<link href="assets/plugins/select2/dist/css/select2.min.css"
	rel="stylesheet" />
<link href="assets/plugins/DataTables/css/data-table.css"
	rel="stylesheet" />
<link href="assets/plugins/icheck/skins/line/_all.css" rel="stylesheet" />
<link href="assets/css/mystyle.css" rel="stylesheet" />
<link
	href="assets/plugins/bootstrap-daterangepicker/daterangepicker-bs3.css"
	rel="stylesheet" />
<!-- ================== END BASE CSS STYLE ================== -->

<!-- ================== BEGIN BASE JS ================== -->
<script src="amcharts/amcharts.js" type="text/javascript"></script>
<script src="amcharts/serial.js" type="text/javascript"></script>
<script src="assets/plugins/jquery/jquery-1.9.1.min.js"></script>
<!-- <script src="assets/plugins/pace/pace.min.js"></script -->
<!-- ================== END BASE JS ================== -->



</head>
<!-- <body onload="add()"> -->
<body>
	<%
		UserBean bean = (UserBean) session.getAttribute("email");
		SalesManBean salesman = (SalesManBean) request
				.getAttribute("salesman");
		String primary_phone = CustomerBal.getFormattedPhoneNumber(salesman
				.getPhone_number());
		String secondary_phone = CustomerBal.getFormattedPhoneNumber(salesman
				.getPhone_number2());
		String salesmanSalary = NumberFormat.getNumberInstance(Locale.US)
				.format((salesman.getSallery()));
	%>
	<!-- begin #page-loader -->
	<div id="page-loader" class="fade in">
		<span class="spinner"></span>
	</div>
	<!-- end #page-loader -->

	<!-- begin #page-container -->
	<div id="page-container"
		class="fade page-sidebar-fixed page-header-fixed page-with-light-sidebar page-with-wide-sidebar">

		<!-- begin #header -->
		<%@include file="/doHeader.jsp"%>
		<!-- end #header -->

		<!-- begin #sidebar -->
		<div id="sidebar" class="sidebar">
			<!-- begin sidebar scrollbar -->
			<div data-scrollbar="true" data-height="100%">
				<!-- begin sidebar user -->
				<ul class="nav">
					<li class="nav-profile">
						<div class="image">
							<a href="javascript:;"><img src="assets/img/user-13.jpg"
								alt="" /></a>
						</div>
						<div class="info">
							<%=bean.getUserName()%>
							<small>District Officer </small>
						</div>
					</li>
				</ul>
				<!-- end sidebar user -->
				<!-- begin sidebar nav -->
				<ul class="nav">
					<li class="has-sub "><a href="DistrictOfficerDashboard">
							<i class="fa fa-laptop"></i> <span>Dashboard</span>
					</a></li>

					<li class="has-sub"><a href="LoanRequest"> 
							<i class="icon-note"></i> <span>Loan Request</span> 
							<span class="badge pull-right" id="do_unseen_loan_request_count"></span>
					</a></li>
					<li class="has-sub"><a href="DoWiseAdvanceBooking"><i
							class="fa fa-star"></i><span>Advance Booking</span> <span
							class="badge pull-right" id="do_unseen_bookings_count"></span></a></li>

					<li class="has-sub "><a href="DoAppliances"><i
							class="fa fa-suitcase"></i><span>Pipeline</span></a></li>

					<li class="has-sub"><a href="DoLoanBooks"><i
							class="fa fa-star"></i><span>Loan Books</span></a></li>

					<li class="has-sub active"><a href="javascript:;"> <b
							class="caret pull-right"></b> <i class="fa fa-th"></i> <span>Sales
								Force</span>
					</a>
						<ul class="sub-menu active">
							<li><a href="DoWiseFieldOfficers">Field Officer</a></li>
							<li class="active"><a href="DoWiseNizamDost">Nizam Dost</a></li>
						</ul></li>


					<li class="has-sub"><a href="DoAlarmsPage"> <i
							class="fa fa-star"></i> <span>Live Alerts</span>
					</a></li>
					
					<li class="has-sub"><a href="DoFutureLoanBooks"> <i
							class="fa fa-star"></i> <span>Future Loan Books</span>
					</a></li>
					<!-- begin sidebar minify button -->
					<li><a href="javascript:;" class="sidebar-minify-btn"
						data-click="sidebar-minify"><i class="fa fa-angle-double-left"></i></a></li>
					<!-- end sidebar minify button -->
				</ul>
				<!-- end sidebar nav -->
			</div>
			<!-- end sidebar scrollbar -->
		</div>
		<div class="sidebar-bg"></div>
		<!-- end #sidebar -->


		<!-- begin #content -->
		<div id="content" class="content">
			<!-- begin breadcrumb -->

			<span style="float: left; color: black; margin-top: 2%;"
				class="page-header"><%=salesman.getName()%></span> <span
				style="float: right; margin-left: 9px;"> <a
				href="javascript:;" class="btn btn-lg btn-block btn-success"> <i
					class="fa fa-calendar pull-left"></i>&nbsp;Date Of Joining/<small>
						&nbsp;<%=salesman.getDatejoin()%></small>
			</a> <a href="javascript:;" class="btn btn-lg btn-block btn-success">
					<i class="fa fa-calendar pull-left"></i>&nbsp;Date Of Birth /<small>
						&nbsp;<%=salesman.getDate_of_birth()%></small>
			</a>
			</span>
			<!-- end page-header -->

			<!-- begin row -->
			<div class="row" style="padding-top: 10%">
				<div class="col-md-6">

					<div class="panel panel-inverse">
						<div class="panel-heading">
							<div class="panel-heading-btn"></div>
							<h4 class="panel-title">Nizam Dost Details</h4>
						</div>

						<div class="panel-body">
							<div class="table-responsive" style="font-size: 13px">
								<table class="table">

									<tbody>
										<tr>
											<th >Field Officer</th>
											<td><b><a
													href="doFieldOfficerProfile.jsp?fo_id=<%=salesman.getFoid()%>"><%=salesman.getFoname()%></a></b>
											</td>
										</tr>

										<tr>
											<th >District Officer</th>
											<td><b><%=salesman.getDoname()%></b></td>
										</tr>

										<tr>
											<th >Nizam Dost CNIC</th>
											<td><%=salesman.getCnic()%></td>
										</tr>

										<tr>
											<th >District /Tehsil</th>
											<td><%=salesman.getTahsel()%> /<b><%=salesman.getDistrict_name()%></b></td>

										</tr>
										
										<tr>
											<th >Address</th>
											<td><%=salesman.getAddress()%></td>
										</tr>

										<tr>
											<th >Per Sale Commission</th>
											<%
												if (salesman.getPer_sale() == 0) {
											%>
											<td>N/A</td>
											<%
												} else {
											%>
											<td><%=NumberFormat.getNumberInstance(Locale.US).format(
						Math.round(salesman.getPer_sale()))%><b> PKR</b></td>
											<%
												}
											%>

										</tr>

										<tr>
											<th >Nizam Dost Account No</th>
											<%
												if (salesman.getVle_acount_no() == ""
														|| salesman.getVle_acount_no() == null) {
											%>
											<td>N/A</td>
											<%
												} else {
											%>
											<td><%=salesman.getVle_acount_no()%></td>
											<%
												}
											%>
										</tr>
									</tbody>
								</table>
							</div>
						</div>
					</div>
				</div>

				<div class="col-md-6">
					<div class="panel panel-inverse">
						<div class="panel-heading">
							<div class="panel-heading-btn"></div>
							<h4 class="panel-title">Nizam Dost Details</h4>
						</div>

						<div class="panel-body">
							<div class="table-responsive" style="font-size: 13px">
								<table class="table">
									<tbody>
										<tr>
											<th >Primary Phone</th>
											<td><%=primary_phone%></td>
										</tr>

										<tr>
											<th >Secondary Phone</th>
											<td><%=secondary_phone%></td>
										</tr>

										<tr>
											<th >Salesman Email</th>
											<td><%=salesman.getSalesman_email()%></td>
										</tr>

<!-- 										<tr> -->
<!-- 											<th >Update Profile</th> -->
<!-- 											<td><a -->
<%-- 												href="updateNizamDost.jsp?vleId=<%=salesman.getSalesmanId()%>" --%>
<!-- 												class="btn btn-primary btn-xs pull-left"><b>Update -->
<!-- 														Nizam Dost</b></a></td> -->
<!-- 										</tr> -->
									</tbody>
								</table>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- end row -->
		</div>

		<!-- begin scroll to top btn -->
		<a href="javascript:;"
			class="btn btn-icon btn-circle btn-success btn-scroll-to-top fade"
			data-click="scroll-top"><i class="fa fa-angle-up"></i></a>
		<!-- end scroll to top btn -->
	</div>
	<!-- end page container -->

	<!-- ================== BEGIN BASE JS ================== -->

	<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
	<!-- Load jQuery UI Main JS  -->
	<script src="http://code.jquery.com/ui/1.10.3/jquery-ui.js"></script>
	<script src="DateTimepicker/jquery-ui-timepicker-addon.js"></script>
	<script src="DateTimepicker/jquery-ui-timepicker-addon.min.js"></script>

	<script src="assets/plugins/jquery/jquery-migrate-1.1.0.min.js"></script>
	<script src="assets/plugins/jquery-ui/ui/minified/jquery-ui.min.js"></script>
	<script src="assets/plugins/bootstrap/js/bootstrap.min.js"></script>
	<script src="assets/plugins/slimscroll/jquery.slimscroll.min.js"></script>
	<script src="assets/plugins/jquery-cookie/jquery.cookie.js"></script>
	<script src="assets/plugins/chart-js/chart.js"></script>
	<!-- ================== END BASE JS ================== -->

	<script
		src="assets/plugins/bootstrap-datepicker/js/bootstrap-datepicker.js"></script>

	<script src="assets/plugins/DataTables/js/jquery.dataTables.js"></script>
	<script src="assets/plugins/DataTables/js/dataTables.colVis.js"></script>
	<script src="assets/js/table-manage-colvis.demo.min.js"></script>

	<script
		src="assets/plugins/bootstrap-combobox/js/bootstrap-combobox.js"></script>
	<script src="assets/plugins/bootstrap-select/bootstrap-select.min.js"></script>

	<script src="assets/plugins/select2/dist/js/select2.min.js"></script>
	<script src="assets/js/form-plugins.demo.min.js"></script>
	<!-- ================== END PAGE LEVEL JS ================== -->

	<!-- ================== BEGIN PAGE LEVEL JS ================== -->
	<script src="assets/js/apps.min.js"></script>
	<!-- 	<script src="assets/js/chart-js.demo.min.js"></script> -->
	<!-- ================== END PAGE LEVEL JS ================== -->

	<script src="assets/plugins/icheck/icheck.js"></script>
	<script src="assets/js/myscript.js"></script>

	<script>
		$(document).ready(function() {
			App.init();
		});
	</script>
</body>
</html>