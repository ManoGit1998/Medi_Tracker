<%@page import="com.Db.DBConnect"%>
<%@page import="com.dao.DoctorDao"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<%@include file="../component/allCss.jsp"%>


<style type="text/css">
.paint-card {
	box-shadow: 0 0 10px 0 rgba(0, 0, 0, 0.3);
}


body {
	background-image: url("../img/microscope.jpg);
	background-color: #cccccc;
}

</style>
</head>
<body>

	<%@include file="../admin/navbar.jsp"%>

	<c:if test="${  empty adminObj}">
		<c:redirect url="../admin_login.jsp"></c:redirect>
	</c:if>

	<%
	DoctorDao dao = new DoctorDao(DBConnect.getConn());
	%>

	<div class="container p-5">



		<h2 class="text-center" style="color:blue;">Welcome Admin</h2>
		<marquee><b> Have A Great Day</b></marquee>
		<marquee direction="right" behavior="alternate"
			style="border: BLACK 2px SOLID"><b> Choose Avove Option For More</b></marquee><br><br>	
			
			

		<c:if test="${not  empty succMsg }">
			<p class="text-center text-success fs-3">${succMsg }</p>
			<c:remove var="succMsg" scope="session" />
		</c:if>

		<c:if test="${not  empty failedMsg }">
			<p class="text-center text-danger fs-3">${failedMsg }</p>
			<c:remove var="failedMsg" scope="session" />
		</c:if>

		<div class="row">
			<div class="col-md-4">
				<div class="card paint-card">
					<div class="card-body text-center text-success">
						<i class="fa-solid fa-user-doctor fa-3x"></i><br>
						<p class="fs-4 text-center"></p>
						Doctor<br><%=dao.countDoctor()%>
					</div>
				</div>
			</div>


			<div class="col-md-4">
				<div class="card paint-card">
					<div class="card-body text-center text-success">
						<i class="fa-solid fa-user-group fa-3x"></i><br>
						<p class="fs-4 text-center"></p>
						User<br><%=dao.countUser()%>
					</div>
				</div>
			</div>

			<div class="col-md-4">
				<div class="card paint-card">
					<div class="card-body text-center text-success">
						<i class="fa-solid fa-calendar-check fa-3x"></i><br>
						<p class="fs-4 text-center"></p>
						Total Apoentment<br><%=dao.countAppointment()%>
					</div>
				</div>
			</div>

			<div class="col-md-4 p-3">
				<div class="card paint-card" data-bs-toggle="modal"
					data-bs-target="#exampleModal">
					<div class="card-body text-center text-success">
						<i class="fa-solid fa-id-card-clip fa-3x"></i><br>
						<p class="fs-4 text-center"></p>
						Specialist<br><%=dao.countSpecialist()%>
					</div>
				</div>
			</div>
		</div>
	</div>


	<!-- Button trigger modal -->


	<!-- Modal -->
	<div class="modal fade" id="exampleModal" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">


					<form action="../addspecialist" method="post">
						<div class="form-group">
							<label>Enter Special Name</label> <input type="text"
								name="specialname" class="form-control">
						</div>

						<div class="text-center mt-3">
							<button type="submit" class="btn btn-primary">ADD</button>
						</div>

					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-bs-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>
</body>
</html>