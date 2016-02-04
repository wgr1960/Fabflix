<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>FabFlix | Search</title>

		<!--Import Google Icon Font-->
		<link href="http://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
		<!--Import materialize.css-->
		<link type="text/css" rel="stylesheet" href="/fabflix/css/materialize.min.css"  media="screen,projection"/>
		<!--Import custom.css-->
		<link type="text/css" rel="stylesheet" href="/fabflix/css/custom.css"/>
		<!-- Import Material Icons -->
		<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
		
		<!--Let browser know website is optimized for mobile-->
		<meta name="viewport" content="width=device-width, initial-scale=1.0"/>
	</head>
	
	<body id="create_account">
	
		  <nav>
		    <div class="nav-wrapper red darken-4">
		      <a href="#!" class="brand-logo"><img id="logo" src="/fabflix/img/fabflix.png"/></a>
		      <a href="#" data-activates="mobile-demo" class="button-collapse"><i class="material-icons">menu</i></a>
		      <ul class="right hide-on-med-and-down">
	        		<li><a href="/fabflix/Checkout.jsp">Checkout</a></li>
	        		<li><a href="/fabflix/servlet/Login?cart=true">Shopping Cart</a></li>
	        		<li><a href="/fabflix/search.jsp">Search</a></li>
	        		<li><a href="/fabflix/browse.jsp">Browse</a></li>
	        		<li><a href="/fabflix/index.html?logout=true">Log Out</a></li>
		      </ul>
		      <ul class="side-nav" id="mobile-demo">
	        		<li><a href="/fabflix/Checkout.jsp">Checkout</a></li>
	        		<li><a href="/fabflix/servlet/Login?cart=true">Shopping Cart</a></li>
	        		<li><a href="/fabflix/search.jsp">Search</a></li>
	        		<li><a href="/fabflix/browse.jsp">Browse</a></li>
	        		<li><a href="/fabflix/index.html?logout=true">Log Out</a></li>
		      </ul>
		    </div>
		  </nav>		
	
		<div class="row">
		</div>
	
		<div class="row">
			<div class="container">
				<div class="col s8 offset-s2">
					<h4 class="center-align white-text">Search Movies, Select the Options Below:</h4>
					<div class="card grey lighten-3 hoverable">
			            <div class="card-content">
							<form action="servlet/SearchMovies" method="GET" class="center-align">
								<h4> Enter information about the actor:</h4>
		      					<div class="row">
		        					<div class="input-field col s10 offset-s1">
		          						<input placeholder="Will" id="fname" name="fname" type="text" >
		          						<label for="fname">First Name</label>
		        					</div>
		      					</div>	
		      					<div class="row">
		        					<div class="input-field col s10 offset-s1">
		          						<input placeholder="Smith" id="lname" name="lname" type="text">
		          						<label for="lname">Last Name</label>
		        					</div>
		      					</div>		    	
		      					<h4> Enter information about the film:</h4>
		      					<div class="row">
		        					<div class="input-field col s10 offset-s1">
		          						<input placeholder="Jurassic Park" id="title" name="title" type="text">
		          						<label for="title">Title</label>
		        					</div>
		      					</div>	
		      					
		      					<div class="row">
		        					<div class="input-field col s10 offset-s1">
		          						<input placeholder="1992" id="year" name="year" type="text">
		          						<label for="year">Year</label>
		        					</div>
		      					</div>	
		      					
		      					<div class="row">
		        					<div class="input-field col s10 offset-s1">
		          						<input placeholder="Steven Spielberg" id="director" name="director" type="text">
		          						<label for="fname">Director</label>
		        					</div>
		      					</div>	      					
		      					
		      					<button class="waves-effect waves-light btn-large red darken-4" type="submit" name="action">Submit
		    						<i class="material-icons right">send</i>
		  						</button>
									
						    </form>
						</div>
					</div>
				</div>
			</div>
		</div>
	
		
    	<script type="text/javascript" src="https://code.jquery.com/jquery-2.1.1.min.js"></script>
    	<script type="text/javascript" src="/fabflix/js/materialize.min.js"></script>
    	<script type="text/javascript" src="/fabflix/js/custom.js"></script>
	
	</body>
</html>
