<%@ include file="../template/includes.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
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
.no-gutter-card-deck.card-columns {
	column-gap: 1;
}

.no-gutter-card-deck>.card {
	margin: 1;
	
	
}
p {
  text-align: justify;
}
</style>
</head>
<body>
	<sec:authentication var="user" property="principal" />
	<jsp:include page="../template/navbar.jsp" />

	<div class="container">




		<div class="card text-white bg-info mb-3">
			<div class="card-header">Hello ${user.username}!</div>
			<div class="card-body">
				<h4 class="card-title">Sell products</h4>
				<p class="card-text">Products you have added to webshop.</p>
			</div>
		</div>

		<span class="btn-group" role="group" aria-label="Basic example">
			<button class="btn disabled" disabled="disabled">
				<i class="fas fa-cog"></i>
			</button> <a class="btn btn-primary" href="${contextPath}/profile/showProfile">Profile
				settings</a>

		</span> <span class="btn-group" role="group" aria-label="Basic example">
			<button class="btn disabled" disabled="disabled">
				<i class="fa fa-plus" aria-hidden="true"></i>
			</button> <a class="btn btn-primary" href="${contextPath}/seller/addProduct">Add
				Product</a>
		</span>

		<h1 class="mt-2"></h1>
		<p></p>

		<div class="blockquote text-left">
			<h2 class="mb-0 h3">All products.</h2>
			<p class="text-muted lead font-weight-light">Edit your products</p>
		</div>

		<div class="container">
			<div class="row">

				<c:forEach items="${adverts}" var="advert">

					<div class="col-sm-3 mb-2 m-0 p-1 d-flex align-items-stretch">
						<div class="card">

							<c:choose>
								<c:when test="${not empty advert.product.productImages[0]}">
									<img class="card-img-top img-fluid"
										src="${contextPath}/resources/img/${advert.product.productImages[0].productImgName}"
										alt="Card image cap">
								</c:when>
								<c:otherwise>
									<img class="card-img-top img-fluid"
										src="${contextPath}/resources/img/noimage.jpg">
								</c:otherwise>
							</c:choose>




							<div class=" card-body d-flex flex-column card-block p-2">
								<h4 class="card-title mb-1 ">${advert.product.productName}</h4>

								<p class="card-text mb-1 text-justified">${fn:substring(advert.product.productDescription, 0, 70)}...</p>



								<div style="margin-top: auto;" class="align-self-end w-100">
									<div class="btn-group mb-2 d-flex" role="group" aria-label="">

										<a class="btn btn-Primary w-100"
											href="${contextPath}/seller/updateProduct/${advert.advertismentId}">Edit
											product</a>
										<button type="button" class="btn btn-default w-30">
											<a
												href="${contextPath}/seller/deleteProduct/${advert.advertismentId}"><i
												class="fas fa-times"></i></a>
										</button>


									</div>

									<small class="border-top text-muted">last modified:
										${advert.lastModifiedDate}</small>

								</div>


							</div>
						</div>

					</div>

				</c:forEach>

			</div>
		</div>
	</div>
	<br />
	<br />
	<br />

	<jsp:include page="../template/footer.jsp" />
</body>
</html>