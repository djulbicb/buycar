
<html lang="en">
  <head>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ page isELIgnored="false"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

    <meta name="description" content="">
    <title>Carousel Template for Bootstrap</title>
	<meta name="author" content="">
    <link rel="icon" href="../../../../favicon.ico">
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<link href="<c:url value='/resources/app/css/sandstone/bootstrap.min.css'/>" rel="stylesheet">
	
</head>
<body>
	
<jsp:include page="template/navbar.jsp" />

<div class="container">
<div class="blockquote text-left">
			<h2 class="mb-0 h3">View products</h2>
			<p class="text-muted lead font-weight-light">Pick category</p>
		</div>


</span> <span class="btn-group" role="group" aria-label="Basic example">
			<button class="btn disabled" disabled="disabled">
				<i class="fa fa-plus" aria-hidden="true"></i>
			</button> <a class="btn btn-primary" href="${contextPath}/seller/addProduct">Add
				Product</a>
		</span>
		
		</span> <span class="btn-group" role="group" aria-label="Basic example">
			<button class="btn disabled" disabled="disabled">
				<i class="fa fa-plus" aria-hidden="true"></i>
			</button> <a class="btn btn-primary" href="${contextPath}/seller/addProduct">Add
				Product</a>
		</span>
		
		</span> <span class="btn-group" role="group" aria-label="Basic example">
			<button class="btn disabled" disabled="disabled">
				<i class="fa fa-plus" aria-hidden="true"></i>
			</button> <a class="btn btn-primary" href="${contextPath}/seller/addProduct">Add
				Product</a>
		</span>
</div>
<jsp:include page="template/footer.jsp" />

  </body>
</html>