<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>FabFlix</title>

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
	        		<li><a href="/fabflix/index.html?logout=true">Log Out</a></li>
		      </ul>
		      <ul class="side-nav" id="mobile-demo">
	        		<li><a href="/fabflix/Checkout.jsp">Checkout</a></li>
	        		<li><a href="/fabflix/servlet/Login?cart=true">Shopping Cart</a></li>
	        		<li><a href="/fabflix/search.jsp">Search</a></li>
	        		<li><a href="/fabflix/index.html?logout=true">Log Out</a></li>
		      </ul>
		    </div>
		  </nav>	

		<div class="row">
			<div class="container">
				<div class="col s12">
					<br><br>
					<h1>${movies.get(0).getTitle()}</h1>
 					<div class="col s6">
 						<div class="card hoverable">
			            	<div class="card-image">
			              		<img height="400px" width="220px" alt="Movie Poster" src="${movies.get(0).getBanner_url()}">
			            	</div>
			            	<div class="card-action">
			            	<c:set var="Title" value="${movies.get(0).getTitle()}" scope="page" />
			              		<form action="/fabflix/servlet/Login" method="GET">
								<span>In Cart: ${shopping_cart.get(Title)} &nbsp; &nbsp; &nbsp; &nbsp;</span>
									<input type="hidden" name="_addCartItem" value="true" />
									<input type="hidden" name="_title" value="${movies.get(0).getTitle()}" />
									<input type="hidden" name="_movieID" value = "${movies.get(0).getId()}" />
									<input type="text" name="_quantity" value="1" />
									<button class="waves-effect waves-light btn-large red darken-2" type="Submit">Add To Cart</button>
								</form>
			            	</div>
			          	</div>	
 					</div>
 					
   					<div class="col s5 offset-s1">
				      <table class="white-text">
				        <thead>
				          <tr>
				              <th data-field="overview">Overview</th>
				          </tr>
				        </thead>
				
				        <tbody>
				          <tr>
				            <td>Movie ID:</td>
				            <td>${movies.get(0).getId()}</td>
				          </tr>
				          <tr>
				            <td>Title:</td>
				            <td>${movies.get(0).getTitle()}</td>
				          </tr>
				          <tr>
				            <td>Year:</td>
				            <td>${movies.get(0).getYear()}</td>
				          </tr>
				          <tr>
				            <td>Director:</td>
				            <td>${movies.get(0).getDirector()}</td>
				          </tr>
				          <tr>
				            <td>Movie Trailer:</td>
				            <td><a href="${movies.get(0).getTrailer_url()}">Watch</a></td>
				          </tr>
				          <tr>
				            <td>Genres:</td>
				            <td>
							<ul>
								<!--  GILLIAN FIX THIS TO link to the browse BY GENRE  -->
								<c:forEach items="${movies.get(0).genre}" var="gen">
									<li><a href="/fabflix/servlet/BrowseGenre?genre=${gen}">${gen}</a></li>
								</c:forEach>
							</ul></td>
				          </tr>
				          <tr>
				            <td>Actors:</td>
				            <td>							
				            	<ul>
									<c:forEach items="${movies.get(0).actor}" var="actor">
										<li><a href="/fabflix/servlet/StarHandler?star=${actor}">
												${actor.toString()}</a></li>
									</c:forEach>
								</ul>
							</td>
				          </tr>
				        </tbody>
				      </table>
 					</div>
				</div>
			</div>
		</div>
				
    	<script type="text/javascript" src="https://code.jquery.com/jquery-2.1.1.min.js"></script>
    	<script type="text/javascript" src="/fabflix/js/materialize.min.js"></script>
    	<script type="text/javascript" src="/fabflix/js/custom.js"></script>
	
	</body>
</html>