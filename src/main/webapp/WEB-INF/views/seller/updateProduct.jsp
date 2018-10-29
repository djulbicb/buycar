
<html lang="en">
<head>
<%@page import="com.bo.buycar.model.product.ProductCategory"%>
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
<link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">

<script
  src="https://code.jquery.com/jquery-3.3.1.min.js"
  integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
  crossorigin="anonymous"></script>

</head>
<body>

	<jsp:include page="../template/navbar.jsp" />

	<div class="container">
		<h1>Update product</h1>
		<p>Add information about the product</p>

		<form:form action="${contextPath}/seller/updateProduct/${ad.advertismentId}"
			modelAttribute="product" enctype="multipart/form-data" method="POST">

			<form:hidden path="productId" id="productId" class="form-control"
				value="${product.productId}" />
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
				<form:input id="productImageFile" path="productImageFile" accept=".jpg"
					type="file" class="btn btn-primary" multiple="true"></form:input>
				<hr>
				<input type="submit" value="submit"
					class="btn btn-lg text-white btn-primary"> <a
					href="<c:url value='/seller/view/showAll'/>" class="btn btn-lg">Cancel</a>
			</div>

		</form:form>


		<div class="row">
			<c:forEach items="${product.productImages}" var="image">
				<div class="col-3  p-1">
				
				<div class="border rounded over-flow position-relative bg-muted" id="image-div-${image.productImgId}">
			
				<span class="position-absolute"><button class="btnDelImage p-2 m-2 btn btn-primary" data-img-id="${image.productImgId}"><i class="fa fa-times"></i></button></span>
				
				<img
						height="200"
						src="${contextPath}/resources/img/${image.productImgName}">
				</div>
				
				</div>
					
			</c:forEach>
		</div>

	</div>
	
	
<br><br><br><br>
<script type="text/javascript">

$('.btnDelImage').on('click', function(event){
     $.ajax({ 
         type: "GET",
         dataType: "json",
         url: "http://localhost:8080/buycar/rest/productImage/get/40",
         success: function(data){        
            console.log(data);
         }
     });

     var id=$(this).attr('data-img-id');
     
     console.log(id);

     var imageDiv = $("#image-div-"+id);
     console.log(imageDiv); // .animate({opacity:0})
     imageDiv.fadeOut( "slow", function() {
    	 imageDiv.css('visibility','visible');
         $.ajax({ 
             type: "DELETE",
             dataType: "json",
             url: "http://localhost:8080/buycar/rest/productImage/delete/" + id,
             success: function(data){        
                console.log(data);
                
             }
         });
    	 
    	  });
     

     
});

function deleteImage(event) {
	//console.log(event);	
	

	   
}
</script>

	<jsp:include page="../template/footer.jsp" />
</body>
</html>