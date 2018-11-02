<%@ include file="../template/includes.jsp"%>
<html lang="en">
<head>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ page isELIgnored="false"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<meta name="description" content="">
<title>Carousel Template for Bootstrap</title>
<meta name="author" content="">
<link rel="icon" href="../../../../favicon.ico">
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link
	href="<c:url value='/resources/app/css/sandstone/bootstrap.min.css'/>"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.1.0/css/all.css"
	integrity="sha384-lKuwvrZot6UHsBSfcMvOkWwlCMgc0TaWr+30HWe3a4ltaBwTZhyTEggF5tJv8tbt"
	crossorigin="anonymous">


<style>
/*
[class*="col-"] {
    background-clip: padding-box;
    border: 1.4em solid transparent;
   
}
.border-light {
     border-color: transparent !important;
}*/
h2 {
	font-weight: lighter;
}
</style>

</head>
<body>

	<jsp:include page="../template/navbar.jsp" />

	<div class="container">


		<div class="card text-white bg-info mb-3">
			<div class="card-header">Hello ${user.username}!</div>
			<div class="card-body">
				<h4 class="card-title">Information</h4>
				<p class="card-text">View your personal info here.</p>
			</div>
		</div>



		<div class="btn-group mb-1 d-flex" role="group" aria-label="">
			<a class="btn btn-primary w-100 m-1"
				href="${contextPath}/seller/view/showAll">Sell products</a> <a
				class="btn btn-primary w-100 m-1"
				href="${contextPath}/profile/addCard">Add Card</a> <a
				class="btn btn-primary w-100 m-1"
				href="${contextPath}/profile/showCart">Show Cart</a> <a
				class="btn btn-info w-100 m-1" href="${contextPath}/profile/showOrders">View orders</a>
		</div>



		<!-- CREDIT CARDS START -->
		<div class="container">
			<h2 class="card-title text-center">Credit cards:</h2>
			<hr>




			<div class="row">



				<c:forEach items="${user.cards}" var="card">


					<div class="border border-light rounded col-6">

						<div class="card-header">${card.cardType}</div>
						<div class="card-body">
							<small>Card number:</small>
							<div class="input-group mb-1">
								<div class="form-control">${card.cardNumber}</div>

								<div class="input-group-append">
									<button disabled="disabled"
										class="btn border bg-light disabled">
										<i class="fa fa-credit-card"></i>
									</button>
								</div>



							</div>
							<small>Expires:</small>


							<div class="d-flex mb-1">
								<div class="border rounded p-2 w-40">${card.monthExpire}</div>
								<div class="p-2 w-20">/</div>
								<div class="border rounded p-2 w-100">${card.yearExpire}</div>
							</div>
							
							<div class="d-flex p-0 m-0">
								<div class="ml-auto">
								<form method="post" action="${contextPath}/profile/deleteCard/${card.cardId}">
								<input class="btn btn-link" type="submit" value="Delete Card">
									</form>
								</div>
							</div>


						</div>

					</div>

				
				</c:forEach>



			</div>

			<!-- CREDIT CARDS END -->






		</div>
		<!-- CONTAINER END -->


		<jsp:include page="../template/footer.jsp" />
		<script
			src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"
			integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy"
			crossorigin="anonymous"></script>
		<script
			src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.bundle.min.js"
			integrity="sha384-pjaaA8dDz/5BgdFUPX6M/9SUZv4d12SUPF0axWc+VRZkx5xU3daN+lYb49+Ax+Tl"
			crossorigin="anonymous"></script>
		<script src="https://code.jquery.com/jquery-3.3.1.min.js"
			integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
			crossorigin="anonymous"></script>
</body>
</html>