

<html lang="en">
<head>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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

<style type="text/css">
.card-title {
	font-size: 1em;
	text-align: center;
	display: block;
}
</style>

<script src="https://code.jquery.com/jquery-3.3.1.min.js"
	integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
	crossorigin="anonymous"></script>

</head>
<body>

	<jsp:include page="template/navbar.jsp" />




	<div class="container">

		<div class="blockquote text-left">
			<h2 class="mb-0 h3">View products</h2>
			<p class="text-muted lead font-weight-light">Pick category</p>
		</div>

		<%@page import="com.bo.buycar.model.product.ProductCategory"%>
		<c:set var="productCategories" value="<%=ProductCategory.values()%>" />

		<div class="btn-group mb-1 d-flex" role="group" aria-label="">
			<c:forEach var="pCat" items="${productCategories}">
				<a class="btn btn-primary w-100 m-1"
					href="${contextPath}/?productCategory=${pCat}">${pCat}</a>
			</c:forEach>
			<a class="btn btn-info w-100 m-1" href="${contextPath}">Reset</a>
			</button>


		</div>




		<p>${ad.product.productName}</p>
		<p>${ad.seller.username}</p>


		<div class="container">
			<div class="row">

				<c:forEach items="${advertisments}" var="advert">

					<div class="col-sm-3 mb-2 m-0 p-1 d-flex align-items-stretch">
						<div class="card">

							<c:choose>
								<c:when test="${not empty advert.product.productImages[0]}">
								<a href="/buycar/show?ad=${advert.advertismentId}">
									<img class="card-img-top img-fluid"
										src="${contextPath}/resources/img/${advert.product.productImages[0].productImgName}"
										alt="Card image cap">
										</a>
								</c:when>
								<c:otherwise>
								<a href="/buycar/show?ad=${advert.advertismentId}">
									<img class="card-img-top img-fluid"
										src="${contextPath}/resources/img/noimage.jpg"></a>
									<img class="card-img-top img-fluid"
										src="${contextPath}/resources/img/noimage.jpg">
								</c:otherwise>
							</c:choose>




							<div class=" card-body d-flex flex-column card-block p-2">
							
								<h4 class="card-title"><a href="/buycar/show?ad=${advert.advertismentId}">${advert.product.productName}</a></h4>



								<div style="margin-top: auto;" class="align-self-end w-100">
									<div class="btn-group mb-1 d-flex" role="group" aria-label="">


										<button class="btnAddToCart btn btn-block btn-primary"
											data-advertisment-id="${advert.advertismentId}">Add
											to cart</button>









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



		<div class="row">
			<div class="col-lg-6 offset-lg-3 py-5 d-flex">
				<ul class="pagination mx-auto">
					<li class="page-item disabled"><a class="page-link" href="#"
						aria-label="Previous"> <span aria-hidden="true">«</span> <span
							class="sr-only">Previous</span>
					</a></li>

					<c:forEach var="i" begin="1" end="${pageList.totalPageCount+1}">
						<li class="page-item"><a class="page-link"
							href="${contextPath}?${productCategory}&page=${i-1}">${i-1}</a></li>

					</c:forEach>

					<li class="page-item"><a class="page-link" href="#"
						aria-label="Next"> <span aria-hidden="true">»</span> <span
							class="sr-only">Next</span>
					</a></li>
				</ul>
			</div>
		</div>




	</div>

	<br>
	<br>
	<br>



	<jsp:include page="template/footer.jsp" />


	<script type="text/javascript">
		var btnClicked;
		$('.btnAddToCart').on('click', function(event) {

			var id = $(this).attr('data-advertisment-id');
			btnClicked = $(this);
			var retMsg = null;

			$.ajax({
				type : "POST",
				dataType : "json",
				url : "http://localhost:8080/buycar/rest/cart/add/" + id,
				dataType : "text",
				success : function(data) {
					var msg = data;
					console.log(msg);
					ajaxCallBack(msg);
				}
			});

		});

		function ajaxCallBack(retString) {
			console.log(retString);
			console.log(btnClicked);
			btnClicked.text(retString);
		}
	</script>

</body>
</html>






