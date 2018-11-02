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

</head>
<body>

	<jsp:include page="../template/navbar.jsp" />

	<div class="container">



		<form:form method="POST" class="jumbotron jumbotron-fluid"
			action="${contextPath}/profile/addCard" modelAttribute="card">

			<div class="row">
				<div class="col-8 offset-2">

					<h3>Enter card information:</h3>
					<form:hidden path="balance" id="balance" class="form-control" value="0"/>

					<form:errors path="cardNumber" cssClass="form-error text-alert" />
					${usernameError}
					<label class="m-0" for="name">Card number:</label>
					<div class="form-group">
						<div class="input-group mb-2">
						
							<form:input required="required" class="form-control" placeholder="XX-XXXXXXXX-XXX"
								id="cardNumber" name="cardNumber" path="cardNumber" />

						</div>
					</div>







					<div class="row">
						<div class="col-6">
							<form:errors path="monthExpire" cssClass="form-error text-alert" />
							<div class="form-group">
								<label class="m-0" for="name">Month:</label>
								<div class="input-group mb-2">

									<form:input type="number" class="form-control" min="1" max="12"
										placeholder="monthExpire" id="monthExpire" name="monthExpire"
										path="monthExpire" />

								</div>
							</div>
						</div>
						<div class="col-6">
							<form:errors path="yearExpire" cssClass="form-error text-alert" />
							<div class="form-group">
								<label class="m-0" for="name">Year:</label>
								<div class="input-group mb-2">

									<form:input type="number" class="form-control" min="2018"
										placeholder="yearExpire" id="yearExpire" name="yearExpire"
										path="yearExpire" />

								</div>
							</div>
						</div>
					</div>

					<%@page import="com.bo.buycar.model.card.CardType"%>
					<c:set var="cardTypes" value="<%=CardType.values()%>" />

					<div class="form-group">
						<label for="name">Product category:</label>
						<div>
							<c:forEach var="cardType" items="${cardTypes}">
							<span class="border rounded mr-2 p-2">
							<form:radiobutton cssClass="border " path="cardType"
									label="${cardType}" value="${cardType}" />
							</span>
								
							</c:forEach>
							<br />
							<form:errors path="cardType" cssClass="form-error" />
						</div>
					</div>


					<div class="row">
						<div class="col">
							<input class="btn btn-block btn-info" type="submit"
								value="Add card" />
						</div>
						<div class="col">
							<a class="btn btn-block btn-outline-primary" href="/buycar/profile/showProfile">Cancel</a>
						</div>
					</div>
		</form:form>




	</div>


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