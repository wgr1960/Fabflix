<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>FabFlix | Browse Genre</title>

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
	
	<body id="checkout">
	
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
			<div class="container valign-wrapper center-align">
				<div class="col s12">
				<br><br>
				<h5 class="center-align white-text">Now browsing by title</h5>
				<p class="center-align white-text">Enter a genre to browse:</p>
				<form method="GET" action="/fabflix/servlet/BrowseGenre">
   					<div class="row">
	   					<div class="input-field col s8 offset-s2 center-align">
	   					<a class="white-text" href="/fabflix/servlet/movieList.jsp"> Shopping Cart</a>
	   					
	   					<div class="row">
	   						<div class="col s12">
	   							<h5 class="red-text">A</h5>
								<a class="white-text" href="/fabflix/servlet/BrowseGenre?genre=Action">Action</a><br>
							    <a class="white-text" href="/fabflix/servlet/BrowseGenre?genre=Adventure" >Adventure</a><br>
							    <a class="white-text" href="/fabflix/servlet/BrowseGenre?genre=advanture" >Advanture</a><br>
							    <a class="white-text" href="/fabflix/servlet/BrowseGenre?genre=Animation" >Animation</a><br>
							    <a class="white-text" href="/fabflix/servlet/BrowseGenre?genre=Arts" >Arts</a>   							
	   						</div>
	   					</div>



	   					<div class="row">
	   						<div class="col s12">
	   							<h5 class="red-text">B</h5>
						    	<a class="white-text" href="/fabflix/servlet/BrowseGenre?genre=Biography" >Biography</a> 							
	   						</div>
	   					</div>
	   					
	   					
	   					<div class="row">
	   						<div class="col s12">
	   							<h5 class="red-text">C</h5>
							    <a class="white-text" href="/fabflix/servlet/BrowseGenre?genre=Classic" >Classic</a><br>
							    <a class="white-text" href="/fabflix/servlet/BrowseGenre?genre=Comedy" >Comedy</a><br>
							    <a class="white-text" href="/fabflix/servlet/BrowseGenre?genre=Commedy" >Commedy</a><br>
							    <a class="white-text" href="/fabflix/servlet/BrowseGenre?genre=Coming-of-Age-Drama" >Coming-of-Age-Drama</a><br>
							    <a class="white-text" href="/fabflix/servlet/BrowseGenre?genre=Crime" >Crime</a>								
	   						</div>
	   					</div>	   					
	   					
	   					<div class="row">
	   						<div class="col s12">
	   							<h5 class="red-text">D</h5>
							    <a class="white-text" href="/fabflix/servlet/BrowseGenre?genre=Detective" >Detective</a><br>
							    <a class="white-text" href="/fabflix/servlet/BrowseGenre?genre=Documentary" >Documentary</a><br>
							    <a class="white-text" href="/fabflix/servlet/BrowseGenre?genre=Drama" >Drama</a>							
	   						</div>
	   					</div>		   					

	   					<div class="row">
	   						<div class="col s12">
	   							<h5 class="red-text">E</h5>
							    <a class="white-text" href="/fabflix/servlet/BrowseGenre?genre=Epics/Historial" >Epics/Historial</a><br>
							    <a class="white-text" href="/fabflix/servlet/BrowseGenre?genre=epics" >Epics</a>						
	   						</div>
	   					</div>	

	   					<div class="row">
	   						<div class="col s12">
	   							<h5 class="red-text">F</h5>
							    <a class="white-text" href="/fabflix/servlet/BrowseGenre?genre=Family" >Family</a><br>
							    <a class="white-text" href="/fabflix/servlet/BrowseGenre?genre=Fantasy" >Fantasy</a><br>
							    <a class="white-text" href="/fabflix/servlet/BrowseGenre?genre=Film-Noir" >Film-Noir</a><br>
							    <a class="white-text" href="/fabflix/servlet/BrowseGenre?genre=Foreign" >Foreign</a>					
	   						</div>
	   					</div>	


	   					<div class="row">
	   						<div class="col s12">
	   							<h5 class="red-text">G</h5>
							    <a class="white-text" href="/fabflix/servlet/BrowseGenre?genre=Gangster" >Gangster</a>					
	   						</div>
	   					</div>	
	   					
	   					<div class="row">
	   						<div class="col s12">
	   							<h5 class="red-text">H</h5>
						    	<a class="white-text" href="/fabflix/servlet/BrowseGenre?genre=History" >History</a><br>
						    	<a class="white-text" href="/fabflix/servlet/BrowseGenre?genre=Horror" >Horror</a>	   						</div>
	   					</div>

	   					<div class="row">
	   						<div class="col s12">
	   							<h5 class="red-text">I</h5>
						    	<a class="white-text" href="/fabflix/servlet/BrowseGenre?genre=Indie" >Indie</a>
   						</div>

	   					<div class="row">
	   						<div class="col s12">
	   							<h5 class="red-text">J</h5>
						    	<a class="white-text" href="/fabflix/servlet/BrowseGenre?genre=James Bond" >James Bond</a>
   						</div>
   							   					
	   					<div class="row">
	   						<div class="col s12">
	   							<h5 class="red-text">K</h5>
						    	<a class="white-text" href="/fabflix/servlet/BrowseGenre?genre=Kid" >Kid</a>
   						</div>
  
	   					<div class="row">
	   						<div class="col s12">
	   							<h5 class="red-text">L</h5>
						    	<a class="white-text" href="/fabflix/servlet/BrowseGenre?genre=Love" >Love</a>
   						</div>	
   						 							   					
	   					<div class="row">
	   						<div class="col s12">
	   							<h5 class="red-text">M</h5>
						    	<a class="white-text" href="/fabflix/servlet/BrowseGenre?genre=Music" >Music</a><br>
						    	<a class="white-text" href="/fabflix/servlet/BrowseGenre?genre=Musical" >Musical</a><br>
						    	<a class="white-text" href="/fabflix/servlet/BrowseGenre?genre=Mystery" >Mystery</a>   						</div>
	   					</div>


	   					<div class="row">
	   						<div class="col s12">
	   							<h5 class="red-text">R</h5>
						    	<a class="white-text" href="/fabflix/servlet/BrowseGenre?genre=Roman" >Roman</a><br>
						    	<a class="white-text" href="/fabflix/servlet/BrowseGenre?genre=Romance" >Romance</a>
   						</div>						    
						   
						    
	   					<div class="row">
	   						<div class="col s12">
	   							<h5 class="red-text">S</h5>
						    	<a class="white-text" href="/fabflix/servlet/BrowseGenre?genre=Sci-Fi" >Sci-Fi</a><br>
						    	<a class="white-text" href="/fabflix/servlet/BrowseGenre?genre=SCI/FI" >SCI/FI</a><br>
						    	<a class="white-text" href="/fabflix/servlet/BrowseGenre?genre=SciFi" >SciFi</a><br>
						    	<a class="white-text" href="/fabflix/servlet/BrowseGenre?genre=Sport" >Sport</a><br>
						    	<a class="white-text" href="/fabflix/servlet/BrowseGenre?genre=Suspense" >Suspense</a><br>
						    	<a class="white-text" href="/fabflix/servlet/BrowseGenre?genre=Spy" >Spy</a>
   						</div>		
 
 	   					<div class="row">
	   						<div class="col s12">
	   							<h5 class="red-text">W</h5>
						    	<a class="white-text" href="/fabflix/servlet/BrowseGenre?genre=Tragedy" >Tragedy</a><br>
						    	<a class="white-text" href="/fabflix/servlet/BrowseGenre?genre=Thriller" >Thriller</a>
   						</div>	
   						  						
 	   					<div class="row">
	   						<div class="col s12">
	   							<h5 class="red-text">W</h5>
						    	<a class="white-text" href="/fabflix/servlet/BrowseGenre?genre=War" >War</a><br>
						    	<a class="white-text" href="/fabflix/servlet/BrowseGenre?genre=Western" >Western</a>
   						</div>	

						 </div>
   					</div>	
   					<button class="waves-effect waves-light btn-large red darken-4" type="submit" name="action">Search
    					<i class="material-icons right">send</i>
  					</button>					
				</form>
				</div>
			</div>
		</div>
		
				
    	<script type="text/javascript" src="https://code.jquery.com/jquery-2.1.1.min.js"></script>
    	<script type="text/javascript" src="/fabflix/js/materialize.min.js"></script>
    	<script type="text/javascript" src="/fabflix/js/custom.js"></script>
	
	</body>
</html>