<%@page import="com.entity.Doctor"%>
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
<title>Doctor Dash Board</title>
<%@include file="../component/allCss.jsp"%>

<style type="text/css">
.paint-card {
	box-shadow: 0 0 10px 0 rgba(0, 0, 0, 0.3);
}
</style>

</head>
<body>
	<c:if test="${empty doctObj }">
		<c:redirect url="../doctor_login.jsp"></c:redirect>
	</c:if>

	<%@include file="navbar.jsp"%>
	<p class="text-center fs-2">Doctor Dashboard</p>

	<%
	Doctor d = (Doctor) session.getAttribute("doctObj");
	DoctorDao dao = new DoctorDao(DBConnect.getConn());
	%>

	<div class="container p-5">

		<div class="row">
			<div class="col-md-4 offset-md-2">
				<div class="card paint-card">
					<div class="card-body text-center text-success">
						<i class="fa-solid fa-user-doctor fa-3x"></i><br>
						<p class="text-center fs-4">Doctor</p><%=dao.countDoctor()%>

					</div>

				</div>

			</div>



			<div class="col-md-4">
				<div class="card paint-card">
					<div class="card-body text-center text-success">
						<i class="fa-solid fa-circle-check fa-x"></i><br>
						<p class="text-center fs-4">
							Total Appointment <br><%=dao.countAppointmentByDoctorId(d.getId())%></p>

					</div>

				</div>

			</div>

		</div>
	</div>
</body>
</html>