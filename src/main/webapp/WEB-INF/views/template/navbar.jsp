<html>
<%@ page isELIgnored="false"%>
<%@ include file="includes.jsp"%>

<c:set var="contextPath" value="${pageContext.request.contextPath}" />


<nav class="navbar navbar-expand-md navbar-dark bg-primary mb-4">
	<div class="container">
		<a class="navbar-brand" href="/buycar/">Buycar</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarColor01" aria-controls="navbarColor01"
			aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>

		<div class="collapse navbar-collapse" id="navbarColor01">
			<ul class="navbar-nav mr-auto">
				<li class="nav-item active"><a class="nav-link" href="#">Home
						<span class="sr-only">(current)</span>
				</a></li>
				<li class="nav-item"><a class="nav-link"
					href="${contextPath}/seller/view/showAll">Products</a></li>
				<li class="nav-item"><a class="nav-link"
					href="${contextPath}/seller/home">Seller</a></li>

			</ul>


			<sec:authentication var="user" property="principal" />

<sec:authorize access="isAnonymous()">
   <div class="btn-group" role="group" aria-label="Basic example">
					<a class="btn btn-primary" href="/buycar/login">Login</a> <a
						class="btn btn-secondary" href="/buycar/register">Register</a>
				</div>	
</sec:authorize>

<sec:authorize access="isAuthenticated()">
				<div class="btn-group" role="group" aria-label="Basic example">
					<a class="btn btn-primary" href="/buycar/profile/showProfile">Hello ${user.username}</a> <a
						class="btn btn-secondary" href="/buycar/logout">Logout</a>
				</div>	
</sec:authorize>



		</div>
	</div>
</nav>





</html>