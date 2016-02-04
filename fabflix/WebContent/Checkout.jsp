<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>FabFlix | New Customer</title>

		<!--Import Google Icon Font-->
		<link href="http://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
		<!--Import materialize.css-->
		<link type="text/css" rel="stylesheet" href="css/materialize.min.css"  media="screen,projection"/>
		<!--Import custom.css-->
		<link type="text/css" rel="stylesheet" href="css/custom.css"/>
		<!-- Import Material Icons -->
		<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
		
		<!--Let browser know website is optimized for mobile-->
		<meta name="viewport" content="width=device-width, initial-scale=1.0"/>
	</head>
	
	<body id="checkout">
	
		  <nav>
		    <div class="nav-wrapper red darken-4">
		      <a href="#!" class="brand-logo"><img id="logo" src="img/fabflix.png"/></a>
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
			<div class="container">
				<div class="col s8 offset-s2">
					<br><br>
					<h2 class="center-align white-text"> ${_checkoutErrorMessage }</h2>
					<h3 class="center-align white-text">Enter the information below, please:</h3>
					<p class="center-align white-text">Enter the information below, to create a new account:</p>
					<div class="card grey lighten-3 hoverable">
			            <div class="card-content">					
							<form action="/fabflix/servlet/NewAccount" method="POST" class="center-align">
		      					<div class="row">
		        					<div class="input-field col s10 offset-s1">
		          						<input id="fname" name="fname" type="text">
		          						<label for="fname">First Name</label>
		        					</div>
		      					</div>	
		      					<div class="row">
		        					<div class="input-field col s10 offset-s1">
		          						<input id="lname" name="lname" type="text">
		          						<label for="lname">Last Name</label>
		        					</div>
		      					</div>		
		      					<div class="row">
		        					<div class="input-field col s10 offset-s1">
		          						<input id="cardnum" name="cardnum" type="text">
		          						<label for="cardnum">Credit Card</label>
		        					</div>
		      					</div>	
		      					<div class="row">
		        					<div class="input-field col s10 offset-s1">
		          						<input id="exp" name="exp" type="text">
		          						<label for="exp">Exp</label>
		        					</div>
		      					</div>      							      					
		      					<input type="hidden" name="checkout" value="true" />
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
    	<script type="text/javascript" src="js/materialize.min.js"></script>
    	<script type="text/javascript" src="js/custom.js"></script>
	
	</body>
</html>