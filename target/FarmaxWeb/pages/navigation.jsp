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
	
});


</script>