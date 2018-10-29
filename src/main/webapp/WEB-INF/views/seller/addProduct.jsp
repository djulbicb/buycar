
<%@page import="com.bo.buycar.model.product.ProductCategory"%>
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
		<h1>Add product</h1>
		<p>Add information about the product</p>

		<form:form action="${contextPath}/seller/addProduct"
			modelAttribute="product" enctype="multipart/form-data">

			<div class="form-group">
				<label for="name">Product name:</label>
				<form:input path="productName" id="name" class="form-control mb-1" />
				<form:errors path="productName" cssClass="form-error text-alert" />
			</div>
			<c:set var="productCategories" value="<%=ProductCategory.values()%>" />
			<div class="form-group">
				<label for="name">Product category:</label>
				<c:forEach var="pCat" items="${productCategories}">
					<form:radiobutton cssClass="m-1" path="productCategory"
						label="${pCat.name}" value="${pCat}" />
				</c:forEach><br/>
				<form:errors path="productCategory" cssClass="form-error" />
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
								<form:input path="productPrice" id="price" type="number"
									class="form-control" min="0" step="any" required="true" />


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
				<form:input id="productImageFile" path="productImageFile"  accept=".jpg"
					type="file" class="btn btn-primary" multiple="true" required="true"></form:input>
				<hr>
				<input type="submit" value="submit"
					class="btn btn-lg text-white btn-primary"> <a
					href="<c:url value='/admin'/>" class="btn btn-lg">Cancel</a>
			</div>
		</form:form>
	</div>
	<jsp:include page="../template/footer.jsp" />

</body>
</html>