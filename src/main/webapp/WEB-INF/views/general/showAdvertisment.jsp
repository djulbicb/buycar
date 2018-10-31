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
.productPrice{
font-weight: bold;
}

</style>

</head>
<body>

	<jsp:include page="../template/navbar.jsp" />

	<div class="container">
		<!-- justify-content-center -->
		<div class="row"> 

			<div class="col-8 mb-3 offset-2">
				<div id="carouselExampleIndicators" class="carousel slide"
					data-ride="carousel">
					<ol class="carousel-indicators">
						<c:forEach items="${product.productImages}" var="image"
							varStatus="i">
							<li data-target="#carouselExampleIndicators" data-slide-to="${i}"
								class="${i.index==0 ? 'active' : ''}"></li>
						</c:forEach>
					</ol>
					<div class="carousel-inner border rounded">

						<c:forEach items="${product.productImages}" var="image"
							varStatus="i">
							<div
								class="${i.index==0 ? 'carousel-item active' : 'carousel-item'}">
								<img class="d-block w-100"
									src="/buycar/resources/img/${image.productImgName}"
									alt="Second slide">
							</div>
						</c:forEach>
					</div>
					<a class="carousel-control-prev" href="#carouselExampleIndicators"
						role="button" data-slide="prev"> <span
						class="carousel-control-prev-icon" aria-hidden="true"></span> <span
						class="sr-only">Previous</span>
					</a> <a class="carousel-control-next" href="#carouselExampleIndicators"
						role="button" data-slide="next"> <span
						class="carousel-control-next-icon" aria-hidden="true"></span> <span
						class="sr-only">Next</span>
					</a>
				</div>

			</div>
			
		</div>

<div class="card border-primary mb-3">
  <div class="card-header p-2 pl-4 m-0">
  Price: <span class="productPrice">${advertisment.product.productPrice}$</span> | ${advertisment.product.productCategory}
  
  </div>
  <div class="card-body">
    <h4 class="card-title">${advertisment.product.productName}</h4>
    <p class="card-text">${advertisment.product.productDescription}</p>
  </div>
</div>

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