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

</head>
<body>

	<jsp:include page="../template/navbar.jsp" />

	<div class="container">
		<h1>Enter your credentials</h1>
		<form action="/buycar/login" method="POST">
			<table>
				<tr>
					<td>Username:</td>
					<td><input type="text" name="username" /></td>
				</tr>
				<tr>
					<td>Password:</td>
					<td><input type="password" name="password" /></td>
				</tr>
				<tr>
					<td colspan="2" align="right"><input type="submit"
						value="Login" /></td>
				</tr>
			</table>
		</form>
		<font color="red"> <span>${sessionScope["SPRING_SECURITY_LAST_EXCEPTION"].message}</span>
		</font>

	</div>


	<jsp:include page="../template/footer.jsp" />

</body>
</html>