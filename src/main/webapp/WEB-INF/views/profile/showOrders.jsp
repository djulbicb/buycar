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


		<c:forEach items="${orders}" var="order">
			<div>

				<div class="card border-light mb-3 ">
					<div class="card-header bg-light">
						
							<div class="">Order id: ${order.id} | Order date: ${order.orderDate}</div>
						
					</div>
					<div class="card-body">


						<table class="table table-hover table-sm">
							<thead>
								<tr>
									<th scope="col">#</th>
									<th scope="col">Product name</th>
									<th scope="col">Quontity</th>
									<th scope="col">Price</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${order.cartItems}" var="cartItem"
									varStatus="i">
									<tr class="">
										<th scope="row">${i.index+1}</th>
										<td>${cartItem.advertisment.product.productName}</td>
										<td>${cartItem.quontity}</td>
										<td>${cartItem.advertisment.product.productPrice}$</td>
									</tr>
								</c:forEach>
								<tr class="table-light">
									<td></td>
									<td></td>
									<td>Total value:</td>
									<td>${order.totalValue}$</td>
								</tr>
							</tbody>
						</table>








					</div>
				</div>


			</div>
		</c:forEach>



	</div>
	<!-- CONTAINER END -->


	<jsp:include page="../template/footer.jsp" />
</body>
</html>
