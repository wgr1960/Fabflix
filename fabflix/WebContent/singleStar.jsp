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
					<h1 class="white-text">${star.getFirst_name()}</h1>
 					<div class="col s6">
 						<div class="card hoverable">
			            	<div class="card-image">
			              		<img height="400px" width="220px" alt="Star Poster" src="${star.getPhoto_url()}">
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
				            <td>Star ID:</td>
				            <td>${star.getId()}</td>
				          </tr>
				          <tr>
				            <td>First Name:</td>
				            <td>${star.getFirst_name()}</td>
				          </tr>
				          <tr>
				            <td>Last Name:</td>
				            <td>${star.getLast_name()}</td>
				          </tr>
				          <tr>
				            <td>DOB:</td>
				            <td>${star.getDob()}</td>
				          </tr>
				          <tr>
				            <td>Films:</td>
				            <td>
							<ul>
								<c:forEach items="${star.moviesStarredIn}" var="movie">
									<ul>
										<li><a
											href="/fabflix/servlet/MovieHandler?movie=${movie}">
												${movie}</a></li>
									</ul>
								</c:forEach>
							</ul></td>
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