

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>FabFlix | Browse Title</title>

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
				<p class="center-align white-text">Enter a title to browse:</p>
				
					   	<div class="row">
	   						<div class="col s12">
	   							<a class="red-text" href="/fabflix/servlet/BrowseTitle?title=0"><h5 class="red-text">0</h5></a> |
	   							<a class="red-text" href="/fabflix/servlet/BrowseTitle?title=1"><h5 class="red-text">1</h5></a> | 
	   							<a class="red-text" href="/fabflix/servlet/BrowseTitle?title=2"><h5 class="red-text">2</h5></a> |
	   							<a class="red-text" href="/fabflix/servlet/BrowseTitle?title=3"><h5 class="red-text">3</h5></a> | 
	   							<a class="red-text" href="/fabflix/servlet/BrowseTitle?title=4"><h5 class="red-text">4</h5></a> |
	   							<a class="red-text" href="/fabflix/servlet/BrowseTitle?title=5"><h5 class="red-text">5</h5></a> | 
	   							<a class="red-text" href="/fabflix/servlet/BrowseTitle?title=6"><h5 class="red-text">6</h5></a> |
	   							<a class="red-text" href="/fabflix/servlet/BrowseTitle?title=7"><h5 class="red-text">7</h5></a> |	   								   							
	   							<a class="red-text" href="/fabflix/servlet/BrowseTitle?title=8"><h5 class="red-text">8</h5></a> |
	   							<a class="red-text" href="/fabflix/servlet/BrowseTitle?title=9"><h5 class="red-text">9</h5></a> | 
	   							<a class="red-text" href="/fabflix/servlet/BrowseTitle?title=A"><h5 class="red-text">A</h5></a> |
	   							<a class="red-text" href="/fabflix/servlet/BrowseTitle?title=B"><h5 class="red-text">B</h5></a> | 
	   							<a class="red-text" href="/fabflix/servlet/BrowseTitle?title=C"><h5 class="red-text">C</h5></a> |
	   							<a class="red-text" href="/fabflix/servlet/BrowseTitle?title=D"><h5 class="red-text">D</h5></a> | 
	   							<a class="red-text" href="/fabflix/servlet/BrowseTitle?title=E"><h5 class="red-text">E</h5></a> |
	   							<a class="red-text" href="/fabflix/servlet/BrowseTitle?title=F"><h5 class="red-text">F</h5></a> |
	   	   						<a class="red-text" href="/fabflix/servlet/BrowseTitle?title=G"><h5 class="red-text">G</h5></a> |
	   							<a class="red-text" href="/fabflix/servlet/BrowseTitle?title=H"><h5 class="red-text">H</h5></a> | 
	   							<a class="red-text" href="/fabflix/servlet/BrowseTitle?title=I"><h5 class="red-text">I</h5></a> |
	   							<a class="red-text" href="/fabflix/servlet/BrowseTitle?title=J"><h5 class="red-text">J</h5></a> | 
	   							<a class="red-text" href="/fabflix/servlet/BrowseTitle?title=K"><h5 class="red-text">K</h5></a> |
	   							<a class="red-text" href="/fabflix/servlet/BrowseTitle?title=L"><h5 class="red-text">L</h5></a> | 
	   							<a class="red-text" href="/fabflix/servlet/BrowseTitle?title=M"><h5 class="red-text">M</h5></a> |
	   							<a class="red-text" href="/fabflix/servlet/BrowseTitle?title=N"><h5 class="red-text">N</h5></a> |	   								   							
	   							<a class="red-text" href="/fabflix/servlet/BrowseTitle?title=O"><h5 class="red-text">O</h5></a> |
	   							<a class="red-text" href="/fabflix/servlet/BrowseTitle?title=P"><h5 class="red-text">P</h5></a> | 
	   							<a class="red-text" href="/fabflix/servlet/BrowseTitle?title=Q"><h5 class="red-text">Q</h5></a> |
	   							<a class="red-text" href="/fabflix/servlet/BrowseTitle?title=R"><h5 class="red-text">R</h5></a> | 
	   							<a class="red-text" href="/fabflix/servlet/BrowseTitle?title=S"><h5 class="red-text">S</h5></a> |
	   							<a class="red-text" href="/fabflix/servlet/BrowseTitle?title=T"><h5 class="red-text">T</h5></a> | 
	   							<a class="red-text" href="/fabflix/servlet/BrowseTitle?title=U"><h5 class="red-text">U</h5></a> |
	   							<a class="red-text" href="/fabflix/servlet/BrowseTitle?title=V"><h5 class="red-text">V</h5></a> |	   		
								<a class="red-text" href="/fabflix/servlet/BrowseTitle?title=W"><h5 class="red-text">W</h5></a> |
	   							<a class="red-text" href="/fabflix/servlet/BrowseTitle?title=X"><h5 class="red-text">X</h5></a> | 
	   							<a class="red-text" href="/fabflix/servlet/BrowseTitle?title=Y"><h5 class="red-text">Y</h5></a> |
	   							<a class="red-text" href="/fabflix/servlet/BrowseTitle?title=Z"><h5 class="red-text">Z</h5></a>					
	   						</div>
	   					</div>

			</div>
		</div>
				
    	<script type="text/javascript" src="https://code.jquery.com/jquery-2.1.1.min.js"></script>
    	<script type="text/javascript" src="/fabflix/js/materialize.min.js"></script>
    	<script type="text/javascript" src="/fabflix/js/custom.js"></script>
	
	</body>
</html>