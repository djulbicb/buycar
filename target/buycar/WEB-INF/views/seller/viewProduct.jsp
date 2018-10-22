
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
	
<jsp:include page="../template/navbar.jsp" />

<h2>Hello World Baby!</h2>
${product}

<c:forEach items="${product.productImages}" var="image">
    <div>
    <img src="${contextPath}/resources/img/${image.productImgName}">
    </div>
</c:forEach>


<jsp:include page="../template/footer.jsp" />

  </body>
</html>