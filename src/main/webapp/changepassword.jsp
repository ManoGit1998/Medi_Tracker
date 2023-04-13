<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Change Password</title>
<%@include file="component/allCss.jsp"%>

<style type="text/css">
.paint-card {
	box-shadow: 0 0 10px 0 rgba(0, 0, 0, 0.3);
}
</style>
</head>
<body>

	<%@include file="component/navbar.jsp"%>
	
	
	<c:if test="${empty userObj }">
	<c:redirect url="user_login.jsp"></c:redirect>
	</c:if>

	<div class="container p-4">
		<div class="row">
			<div class="col-md-4 offset-md-4">
				<div class="card paint-card">
					<div class="card-body">
						<p class="fs-4 text-center">Change Password</p>


						<c:if test="${not  empty succMsg }">
							<p class="text-center text-success fs-3">${succMsg }</p>
							<c:remove var="succMsg" scope="session" />
						</c:if>


						<c:if test="${not  empty failedMsg }">
							<p class="text-center text-danger fs-3">${failedMsg }</p>
							<c:remove var="failedMsg" scope="session" />
						</c:if>

						<form action="changepassword" method="post">
							<div class="mb-3">
								<label>Enter New Password</label> <input type="text" required
									name="newpassword"  class="form-control">
							</div>

							<div class="mb-3">
								<label>Enter Old Password</label> <input type="text" required
									name="oldpassword" class="form-control">
							</div>
							
							<input type="hidden" value="${userObj.id}" name="uid">
		
							<button type="submit"
								class="btn btn-success text-white col-md-12">Change
								Password</button>

						</form>
					</div>
				</div>
			</div>

		</div>

	</div>

</body>
</html>