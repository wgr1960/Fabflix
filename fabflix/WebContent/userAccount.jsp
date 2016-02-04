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
		<link type="text/css" rel="stylesheet" href="css/materialize.min.css"  media="screen,projection"/>
		<!--Import custom.css-->
		<link type="text/css" rel="stylesheet" href="css/custom.css"/>
		<!-- Import Material Icons -->
		<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
		
		<!--Let browser know website is optimized for mobile-->
		<meta name="viewport" content="width=device-width, initial-scale=1.0"/>
	</head>
	
	<body id="sign_in">
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
					<h5 class="center-align white-text">Now that you are logged in, search or browse movies.</h5>	    
					<br><br>
					<a class="waves-effect waves-light btn-large red darken-4 valign" href="search.jsp"><i class="material-icons left">search</i>Search</a>
					<br><br>
					<a class="waves-effect waves-light btn-large red darken-4 valign" href="browse.jsp"><i class="material-icons left">view_list</i>Browse</a>
				</div>
			</div>
		</div>
		
		<div class="row">
			<div class="container">
				<div class="col s12">
					<br>
					<h3 class="center-align white-text">You have ${shopping_cart.size()} item(s) in your cart.</h3>
					<div class="card grey lighten-3 hoverable">
			            <div class="card-content">
							<c:set var="cartCount" value="1" scope="page" />
								<table align="center">
									<thead>
							          <tr>
							              <th data-field="title">Title</th>
							              <th data-field="quantity">Quantity</th>
							          </tr>
							        </thead>
									<tbody>
										<tr>
											<td><c:forEach items="${shopping_cart.entrySet()}"
													var="cart_item">
													<c:set var="list_item" value="${cart_item.value }" scope="page"/>
													<tr>
														<td>
															<p>${cartCount} &nbsp; &nbsp; ${cart_item.key}</p>
														</td>
														<td>${cart_item.value.get(1)}</td>
														<td>${list_item.get(1)}</td>
														
													</tr>
													<c:set var="cartCount" value="${cartCount +1 }" scope="page" />
												</c:forEach></td>
										</tr>
										<tr>
											<td><form action="/fabflix/Checkout.jsp">
													<button class="waves-effect waves-light btn-large red darken-4" type="submit" name="action">Checkout
								    					<i class="material-icons right">done</i>
								  					</button>
												</form>
											</td>
										</tr>									
									</tbody>

								</table>
							
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
