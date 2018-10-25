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

		<form action="/buycar/login" method="POST"
			class="jumbotron jumbotron-fluid">

			<div class="row">
				<div class="col-8 offset-2">
					<h3 class="">Enter login:</h3>

					<c:if test="${not empty msg}">
						<div class="alert alert-dismissible alert-info">
							<button type="button" class="close" data-dismiss="alert">&times;</button>
							${msg}
						</div>
					</c:if>

					<div class="form-group">
						<div class="input-group mb-2">
							<div class="input-group-prepend">
								<div class="input-group-text">
									<i class="fa fa-user text-info"></i>
								</div>
							</div>
							<input type="text" class="form-control" id="username"
								name="username" placeholder="Username" required>
						</div>
					</div>

					<div class="form-group">
						<div class="input-group mb-2">
							<div class="input-group-prepend">
								<div class="input-group-text">
									<i class="fa fa-key text-info"></i>
								</div>
							</div>
							<input type="text" class="form-control" id="password"
								name="password" placeholder="Password" required />
						</div>
					</div>

					<div class="row">
						<div class="col">
							<input class="btn btn-block btn-info" type="submit" value="Login" />
						</div>
						<div class="col">
							<a class="btn btn-block btn-outline-primary"
								href="/buycar/register">Register</a>
						</div>
					</div>


				</div>
			</div>
		</form>






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