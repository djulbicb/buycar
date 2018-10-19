
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

</head>
<body>

	<jsp:include page="../template/navbar.jsp" />

	<div class="container">

<a href="${contextPath}/seller/addProduct" class="btn btn-block bg-primary">Add product</a>
		<h1>All products</h1>
		<p>Edit your products</p>
		<c:forEach items="${products}" var="product">

			<div class="card mb-3">
				<div class="card-body">

					<div class="row">
						<div class="col-9">
							<h4 class="card-title">${product.productName}</h4>
							<h6 class="card-subtitle mb-2 text-muted">Date created:
								2018-10-10</h6>
							<p class="card-text">${product.productDescription}</p>
							<hr>
							<a href="${contextPath}/seller/updateProduct/${product.productId}" class="card-link btn btn-lg text-white btn-primary">Edit
								product</a> <a href="${contextPath}/seller/deleteProduct/${product.productId}" class="card-link">Delete product</a>

						</div>
						<div class="col-3">
							<img width="100%" src="${contextPath}/resources/img/${product.productImages[0].productImgName}">
						</div>
					</div>
				</div>

			</div>
		</c:forEach>

	</div>
	

	
	<jsp:include page="../template/footer.jsp" />

</body>
</html>