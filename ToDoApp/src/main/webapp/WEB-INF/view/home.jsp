<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>

<!doctype html>
<html lang="en">
<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- Bootstrap CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">

<title><c:out value="${name } : ToDo-List"></c:out></title>
</head>
<body>

	<div class="container mt-3">
		<h2 align="center">~ T O D O - L I S T ~</h2>
		<hr>

		<c:if test="${not empty msg }">
			<div class="alert alert-success">
				<b><c:out value="${msg }"></c:out></b>
			</div>
		</c:if>

		<div class="row mt-5">
			<div class="col-md-3">
				<h3 align="center">Options</h3>

				<div class="list-group">
					<button class="list-group-item list-group-item-action active"
						type="button" aria-current="true">Menu</button>

					<a href='<c:url value='/add'></c:url>'
						class="list-group-item list-group-item-action list-group-item-danger">Add
						ToDo..</a> <a href='<c:url value='/home'></c:url>'
						class="list-group-item list-group-item-action list-group-item-warning">View
						ToDo's..</a>

				</div>

			</div>

			<div class="col-md-9">

				<c:if test="${name=='Home'}">
					<h2 align="center">All T-O-D-O's</h2>

					<c:forEach items="${todos }" var="t">
						<div class="card mt-2">
							<div class="card-body">
								<h3>
									<c:out value="${t.todoTitle }"></c:out>
								</h3>
								<p>
									<c:out value="${t.todoContent}"></c:out>
								</p>
								<c:out value="${t.todoDate }"></c:out>
								
								<div class="d-grid gap-2 d-md-flex justify-content-md-end">
								
								<a class="btn btn-warning" href="/updateItems" role="button">Edit</a>
								<a class="btn btn-danger" href="#" role="button">Delete</a>
								
								</div>
								
							</div>
						</div>
					</c:forEach>
				</c:if>


				<c:if test="${name=='Add' }">
					<h2 align="center">Add T-O-D-O</h2>
					<form:form action="saveTodo" method="post" modelAttribute="todo">

						<div class="form-group">
							<form:input path="todoTitle" cssClass="form-control"
								placeholder="Enter the title" />
						</div>
						<br>
						<div class="form-group">
							<form:textarea path="todoContent" cssClass="form-control"
								placeholder="Add.." cssStyle="height:270px" />
						</div>
						<br>
						<div class="container" align="center">
							<button class="btn btn-outline-success">Done</button>
						</div>
					</form:form>
				</c:if>
				
				



			</div>

		</div>
	</div>







	<!-- Option 1: Bootstrap Bundle with Popper -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
		crossorigin="anonymous"></script>

	<!-- Option 2: Separate Popper and Bootstrap JS -->
	<!--
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
    -->
</body>
</html>