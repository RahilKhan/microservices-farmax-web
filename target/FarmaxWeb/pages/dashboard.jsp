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
