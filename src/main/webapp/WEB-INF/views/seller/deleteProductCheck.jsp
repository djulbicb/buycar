
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

	<div class="container ">
		<div class="jumbotron">

			<div class="row">
				<div class="col-9">
					<h1>Delete product</h1>
					<p>
						Are you sure you want to <strong>delete</strong> product <strong>${product.productName}</strong>
					</p>
					<form action="${contextPath}/seller/deleteProduct/${product.productId}" method="post">
					<input type="submit" class="btn btn-danger p-3" value="Delete product">
					
					</form>
				<a href="${contextPath}/seller/view/showAll" type="button" class="btn btn-outline-info p-3">Cancel</a>
				
				</div>


				<div class="col-3">
					<img width="100%"
						src="${contextPath}/resources/img/${product.productImages[0].productImgName}">
				</div>
			</div>

		</div>


	</div>
	<jsp:include page="../template/footer.jsp" />

</body>
</html>