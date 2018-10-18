
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
<link href="<c:url value='/resources/app/css/style.css'/>"
	rel="stylesheet">

</head>
<body>

	<jsp:include page="../template/navbar.jsp" />

	<div class="container">
		<h1>Update product</h1>
		<p>Add information about the product</p>

				<form:form action="${contextPath}/seller/updateProduct"
			modelAttribute="product" enctype="multipart/form-data" method="POST">

	<form:hidden path="productId" id="productId" class="form-control"
					value="${product.productId}" />
			<div class="form-group">
				<label for="name">Product name:</label>
				<form:input path="productName" id="name" class="form-control mb-1" />
				<form:errors path="productName" cssClass="form-error text-alert" />
			</div>

			<div class="row">
				<div class="col">
					<div class="form-group">
						<label for="year">Product Year</label> 

						<form:input type="number" path="productYear" id="year"
							required="true" class="form-control mb-1" />
						<form:errors path="productYear" cssClass="form-error" />
					</div>
				</div>

				<div class="col">


					<div class="form-group">
						<label class="control-label">Input price</label> 
						<div class="form-group">
							<div class="input-group mb-1 ">
								<div class="input-group-prepend">
									<span class="input-group-text">$</span>
								</div>
								<form:input path="productPrice" id="price" type="number" class="form-control" min="0" step="any"
									required="true" />
									
								
							</div>
							<form:errors path="productPrice" cssClass="form-error" />
						</div>
						
					</div>


				</div>
			</div>


			<div class="form-group">
				<label for="description">Product Description</label>
				
				<form:textarea path="productDescription" id="description"
					class="form-control mb-1" />
					<form:errors path="productDescription" cssClass="form-error" />
			</div>



			<div class="form-group">
				<label for="productImageFile">Upload product images</label><br>
				<form:input id="productImageFile" path="productImageFile"
					type="file" class="btn btn-primary" multiple="true"></form:input>
				<hr>
				<input type="submit" value="submit"
					class="btn btn-lg text-white btn-primary"> <a
					href="<c:url value='/admin'/>" class="btn btn-lg">Cancel</a>
			</div>
			
			<c:forEach items="${product.productImages}" var="image">
    <div>
    <img height="200" src="${contextPath}/resources/img/${image.productImgName}">
    </div>
</c:forEach>
		</form:form>






			
	</div>
	<jsp:include page="../template/footer.jsp" />

</body>
</html>