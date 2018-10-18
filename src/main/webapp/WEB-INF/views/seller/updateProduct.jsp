
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
		<h1>Add product</h1>
		<p>Add information about the product</p>

		<form:form 
		action="${contextPath}/seller/addProduct"
		modelAttribute="product" enctype="multipart/form-data">

			<div class="form-group">
				<label for="name">Product name</label>
				<form:errors path="productName" cssClass="#ff0000" />
				<form:input path="productName" id="name" class="form-control" />
			</div>

			<div class="row">
				<div class="col">
					<div class="form-group">
						<label for="year">Product Year</label>
						<form:errors path="productYear" cssClass="#ff0000" />
						<form:input type="number" path="productYear" id="year" class="form-control" />
					</div>
				</div>

				<div class="col">


					<div class="form-group">
						<label class="control-label">Input addons</label>
						<div class="form-group">
							<div class="input-group">
								<div class="input-group-prepend">
									<span class="input-group-text">$</span>
								</div>
								<input type="number" class="form-control" />
							</div>
						</div>
					</div>


				</div>
			</div>
			<div class="form-group">
				<label for="price">Product Description</label>
				<form:errors path="productPrice" cssClass="#ff0000" />
				<form:input path="productPrice" id="price" class="form-control" />
			</div>

			<div class="form-group">
				<label for="description">Product Description</label>
				<form:errors path="productDescription" cssClass="#ff0000" />
				<form:textarea path="productDescription" id="description"
					class="form-control" />
			</div>


<c:forEach items="${product.productImages}" var="image">
    <div>
    <img height="200" src="${contextPath}/resources/img/${image.productImgName}">
    </div>
</c:forEach>



			<div class="form-group">
				<label for="productImageFile">Upload product images</label><br>
				<form:input id="productImageFile" path="productImageFile" type="file"
					class="btn btn-primary" multiple="true"></form:input>
					<hr>
					<input type="submit" value="submit" class="btn btn-lg text-white btn-primary">
				<a href="<c:url value='/admin'/>" class="btn btn-lg">Cancel</a>
			</div>
		</form:form>
	</div>
	<jsp:include page="../template/footer.jsp" />

</body>
</html>