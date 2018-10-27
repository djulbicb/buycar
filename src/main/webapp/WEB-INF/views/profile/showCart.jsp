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

<style type="text/css">
table {
	text-align: center;
}
</style>

</head>
<body>

	<jsp:include page="../template/navbar.jsp" />

	<div class="container">



		<h1>Place an order</h1>
		<p>Pick card and place an order</p>


		<form:form action="/buycar/profile/placeOrder" modelAttribute="order"
			method="POST" class="p-4 bg-light">

			<div class="row justify-content-start">

				<div class="col-10 offset-md-1">

					<small>User:</small>
					<div class="input-group mb-2">
						<div class="form-control">${user.firstName} ${user.lastName}</div>

						<div class="input-group-append">
							<button disabled="disabled" class="btn border bg-light disabled">
								<i class="fa fa-credit-card"></i>
							</button>
						</div>
					</div>

					<small>Pick credit card:</small>

					<div class="form-group p-0 mb-2">
						<form:select id="cardNumber" class="form-control w-100"
							path="cardType">
							<c:forEach items="${user.cards}" var="card">
								<form:option value="${card.cardId}">${card.cardNumber}</form:option>
							</c:forEach>
						</form:select>

					</div>
					
					<small>Current balance:</small>
					<div class="input-group mb-2">
						<div id="balance" class="form-control">200$</div>

						<div class="input-group-append">
							<button disabled="disabled" class="btn border bg-light disabled">
								<i class="far fa-money-bill-alt"></i>
							</button>
						</div>
					</div>

					<div class="row mb-3">
						<div class="col-6">
							<small>Street:</small>
							<div class="form-control">${user.street}</div>
						</div>
						<div class="col-6">
							<small>Country, City:</small>
							<div class="form-control">${user.country},${user.city}</div>
						</div>
					</div>

					<div class="row">
						<div class="col">
							<input class="btn btn-block btn-info" type="submit"
								value="Place order" />
						</div>
						<div class="col">
							<a class="btn btn-block btn-outline-primary" href="/buycar/profile/showProfile">Cancel</a>
						</div>
					</div>
				</div>
			</div>
		</form:form>








		<hr>



		<h1>View cart</h1>
		<p>All product currently in cart</p>

		<table class=" table table-hover">
			<thead class="border">
				<tr>
					<th scope="col">#</th>
					<th scope="col">Product name</th>
					<th scope="col">Quontity</th>
					<th scope="col">Delete</th>
					<th scope="col">Price</th>

				</tr>
			</thead>
			<tbody>

				<c:forEach items="${cartItems}" var="cartItem" varStatus="loop">
					<tr>
						<th scope="row">${loop.index+1}</th>
						<td>${cartItem.advertisment.product.productName}</td>
						<td>${cartItem.quontity}</td>

						<td><button class="btn btn-block btn-outline-info">Delete</button></td>
						<td>${cartItem.advertisment.product.productPrice}$</td>
					</tr>
				</c:forEach>
			</tbody>

			<tfoot class="bg-light">
				<tr>
					<td scope="col"></td>
					<td scope="col"></td>
					<td scope="col"></td>
					<td scope="col">Total:</td>
					<td scope="col">${total}$</td>

				</tr>
			</tfoot>
		</table>



	</div>


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

