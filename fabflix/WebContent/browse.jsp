<%-- 
	<p align="center"> Please choose a browsing option.</p>
	<br>
		<table border="10" width="300px" align="center">
			<td>
				<h3 align="center">
					<a href="browsegenre.jsp"> Browse by Genre </a>
				</h3>
			</td>
			<td>
				<h3 align="center">
					<a href="browsetitle.jsp"> Browse by Title </a>
				</h3>
			</td>
		</table>

</body>
</html> --%>



<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>FabFlix | Browse</title>

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
			<div class="container valign-wrapper">
				<div class="col s12">
					<br><br>
					<h5 class="center-align white-text valign">Please choose a browsing option:</h5>
					<br><br>
					<a class="waves-effect waves-light btn-large red darken-4 valign" href="browsetitle.jsp"><i class="material-icons left">sort_by_alpha</i>Title</a>
					<br><br>
					<a class="waves-effect waves-light btn-large red darken-4 valign" href="browsegenre.jsp"><i class="material-icons left">library_books</i>Genre</a>
				</div>
			</div>
		</div>
				
    	<script type="text/javascript" src="https://code.jquery.com/jquery-2.1.1.min.js"></script>
    	<script type="text/javascript" src="js/materialize.min.js"></script>
    	<script type="text/javascript" src="js/custom.js"></script>
	
	</body>
</html>