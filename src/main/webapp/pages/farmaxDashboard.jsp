<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta name="description" content="">
	<meta name="author" content="">
	
	<title>Farmax Pharmacy</title>
	
	<!-- jQuery -->
	<script type ="text/javascript" src="resources/javascript/vendor/jquery/jquery.min.js"></script>
	
	<!-- Bootstrap Core CSS -->
	<link href="resources/css/vendor/bootstrap/css/bootstrap.css" rel="stylesheet">
	
	<!-- MetisMenu CSS -->
	<link href="resources/css/vendor/metisMenu/metisMenu.css" rel="stylesheet">
	
	<!-- Custom CSS -->
	<link href="resources/css/template/css/sb-admin-2.css" rel="stylesheet">
	
	<!-- Custom Fonts -->
	<link href="resources/css/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
	
	<!-- Canvas JS -->
	<script src="resources/javascript/vendor/charts/canvasjs.min.js"></script>
	
	<!-- Bootstrap Core JavaScript -->
	<script type ="text/javascript" src="resources/javascript/vendor/bootstrap/js/bootstrap.min.js"></script>
	
	<!-- Metis Menu Plugin JavaScript -->
	<script type ="text/javascript" src="resources/javascript/vendor/metisMenu/metisMenu.min.js"></script>
	
	<!-- Morris Charts JavaScript -->
	<script type ="text/javascript" src="resources/javascript/vendor/raphael/raphael.js"></script>
</head>

<body>
	<div id="wrapper">
	<!-- Navigation -->
	<nav class="navbar navbar-default navbar-static-top" role="navigation" style="margin-bottom: 0">
		<!-- /.navbar-header -->
		<div class="navbar-header">
			<button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
				<span class="sr-only">Toggle navigation</span>
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="index.html">Farmax Pharmacy</a>
		</div>
		<!-- /.navbar-header -->
	
		<!-- /.dropdown -->
		<ul class="nav navbar-top-links navbar-right">
			<!-- /.dropdown -->
			<li class="dropdown">
				<a class="dropdown-toggle" data-toggle="dropdown" href="#">
					<i class="fa fa-user fa-fw"></i> <i class="fa fa-caret-down"></i>
				</a>
				<ul class="dropdown-menu dropdown-user">
					<li>
						<a href="#"><i id="m_user" class="fa fa-user fa-fw"></i> User</a>
					</li>
					</li>
					<li>
						<a href="#"><i id="m_cart" class="fa fa-dashboard fa-fw"></i> Cart</a>
					</li>					
					<li class="divider"></li>
					<li>
						<a href="login.html"><i id="m_logout" class="fa fa-sign-out fa-fw"></i> Logout</a>
					</li>
				</ul>
				<!-- /.dropdown-user -->
			</li>
			<!-- /.dropdown -->
		</ul>
		<!-- /.navbar-top-links -->
	
		<div class="navbar-default sidebar" role="navigation">
			<div class="sidebar-nav navbar-collapse">
				<ul class="nav" id="side-menu">
					<li class="sidebar-search">
						<div class="input-group custom-search-form">
							<input id="searchText" type="text" class="form-control" placeholder="Search file name...">
							<span class="input-group-btn">
								<button id ="fileSearch" class="btn btn-default" type="button">
									<i class="fa fa-search"></i>
								</button>
							</span>
						</div>
						<!-- /input-group -->
					</li>
					<li id="dashboard">
						<a href="#"><i  class="fa fa-dashboard fa-fw"></i> Dashboard</a>
					</li>
					<li>
						<a href="javascript:me.dashboard.getCatalogDetails();"><i id="catalog" class="fa fa-dashboard fa-fw"></i> Catalog</a>
					</li>
									<li>
						<a href="#"><i id="user" class="fa fa-dashboard fa-fw"></i> User</a>
					</li>
									<li>
						<a href="#"><i id="checkout" class="fa fa-dashboard fa-fw"></i> Checkout</a>
					</li>
				</ul>
			</div>
			<!-- /.sidebar-collapse -->
		</div>
		<!-- /.navbar-static-side -->
	</nav>
			
			
	<div id="page-wrapper">
		<div class="row">
			<div class="col-lg-12">
				<h1 id="pageHeader" class="page-header"></h1>
			</div>
			<!-- /.col-lg-12 -->
		</div>
		<!-- /.row -->
		<div id="dashboardDiv" class="row">
			<div class="col-lg-3 col-md-6">
				<div class="panel panel-primary">
					<div class="panel-heading">
						<div class="row">
							<div class="col-xs-3">
								<i class="fa fa-upload fa-5x"></i>
							</div>
							<div class="col-xs-9 text-right">
								<div class="huge"><span id="currentMonthSaving"></span></div>
								<div><span id="currentMonthSavingHdr"></span></div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="col-lg-3 col-md-6">
				<div class="panel panel-green">
					<div class="panel-heading">
						<div class="row">
							<div class="col-xs-3">
								<i class="fa fa-tasks fa-5x"></i>
							</div>
							<div class="col-xs-9 text-right">
								<div class="huge"><span id="currentMonthEarning"></span></div>
								<div><span id="currentMonthEarningHdr"></span></div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="col-lg-3 col-md-6">
				<div class="panel panel-yellow">
					<div class="panel-heading">
						<div class="row">
							<div class="col-xs-3">
								<i class="fa fa-minus-circle fa-5x"></i>
							</div>
							<div class="col-xs-9 text-right">
								<div class="huge"><span id="totalOwed"></span></div>
								<div><span id="totalOwedHdr"></span></div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="col-lg-3 col-md-6">
				<div class="panel panel-red">
					<div class="panel-heading">
						<div class="row">
							<div class="col-xs-3">
								<i class="fa fa-money fa-5x"></i>
							</div>
							<div class="col-xs-9 text-right">
								<div class="huge"><span id="currentMonthExpenses"></span></div>
								<div><span id="currentMonthExpensesHdr"></span></div>
							</div>
						</div>
					</div>
	
				</div>
			</div>
		</div>
		
		<div id="catalogDiv" class="row">
		<div class="col-lg-3 col-md-6">
			<div class="panel panel-primary">
				<div class="panel-heading">
					<div class="row">
						<div class="col-xs-3">
							<i class="fa fa-upload fa-5x"></i>
						</div>
						<div class="col-xs-9 text-right">
							<div class="huge"><span id="currentMonthSaving"></span></div>
							<div><span id="currentMonthSavingHdr"></span></div>
						</div>
					</div>
				</div>
			</div>
		</div>
		
		
	</div>
	<!-- /#page-wrapper -->

</div>

<script type ="text/javascript">

$(document).ready(function() {
	console.log("\tdashboard.jsp");
	
	$.ajax({ 
		url : "resources/javascript/system/dashboard.js",
		dataType : "script",
		cache : true		
	}).done(function(){ 
		console.log("inside done....");
		me.dashboard.onload();
	});

	/*
	$('#catalog').click(function(){
		console.log("Catalog link clicked");
	});
	$('#user').click(function(){
		console.log("user link clicked");
	});
	$('#checkout').click(function(){
		console.log("checkout link clicked");
	});
	$('#m_user').click(function(){
		console.log("m_user link clicked");
	});
	$('#m_cart').click(function(){
		console.log("m_cart link clicked");
	});				
	$('#m_logout').click(function(){
		console.log("m_logout link clicked");
	});
	*/
});


</script>

</body>

</html>