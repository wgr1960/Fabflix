<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>FabFlix | Movie List</title>

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
	
	<body id="sign_in">
	
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
		</div>
		
		<div class="row">
			<div class="container">
				<div class="col s12">
					<br>
					<h4 class="center-align white-text">Your Search Results:</h4>
					<div class="card grey lighten-3 hoverable">
			            <div class="card-content">
	
							<table class="striped">
						        <thead>
						          <tr>
						              <th data-field="id">ID</th>
						              <th data-field="title"><a class="red-text" href="/fabflix/servlet/SortByTitle?title=true">Title</a></th>
						              <th data-field="year"><a class="red-text" href="/fabflix/servlet/SortByYear?year=true">Year</a></th>
						              <th data-field="director">Director</th>
						              <th data-field="genre">Genre</th>
						              <th data-field="actor">Actor</th>
						          </tr>
						        </thead>
						
						        <tbody>
						          <tr>
									<c:forEach items="${movies}" var="movie">
									  	<tr>
								            <td>${movie.getId()}</td>
								            <td><a class="red-text" href="/fabflix/servlet/MovieHandler?movie=${movie.getTitle()}">${movie.getTitle()}</a></td>
								            <td>${movie.getYear()}</td>
								            <td>${movie.getDirector()}</td>
								            <td>
								            	<c:forEach items="${movie.genre}" var="g">
													<ul>
														<li>${g}</li>
													</ul>
												</c:forEach>
											</td>
								            <td>
								            	<c:forEach items="${movie.actor}" var="a">
													<ul>
														<li>
															<a class="red-text" href="/fabflix/servlet/StarHandler?star=${a}">${a.toString()}</a>
														</li>
													</ul>
												</c:forEach>
											</td>
								        </tr>
							        </c:forEach>
						          </tr>
						        </tbody>
						 	</table>
						 	
						 	<table class="center-align">
						 		<tr>
									<td>
										<a class="red-text" href="/fabflix/servlet/ResultsPaging?pageFlip=prev">Prev</a>
									</td>
									<td>
										<a class="red-text" href="/fabflix/servlet/ResultsPaging?pageFlip=next">Next</a>
									</td>
									<td>
										<table>
											<tr>
												<td><a class="red-text" href="/fabflix/servlet/ResultsPaging?pages=5"> 5</a></td>
												<td><a class="red-text" href="/fabflix/servlet/ResultsPaging?pages=10"> 10</a></td>
												<td><a class="red-text" href="/fabflix/servlet/ResultsPaging?pages=20"> 20</a></td>
												<td><a class="red-text" href="/fabflix/servlet/ResultsPaging?pages=50"> 50</a></td>
												<td><a class="red-text" href="/fabflix/servlet/ResultsPaging?pages=100">
														100</a></td>
											</tr>
										</table>
									</td>
								</tr>
						 	</table>
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