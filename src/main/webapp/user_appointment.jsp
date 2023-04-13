
<%@page import="java.util.List"%>
<%@page import="com.entity.Doctor"%>
<%@page import="com.Db.DBConnect"%>
<%@page import="com.dao.DoctorDao"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>User Appointment</title>
<%@include file="component/allCss.jsp"%>
<style type="text/css">
.paint-card {
	box-shadow: 0 0 8px 0 rgba(0, 0, 0, 0.3);
}

.backImg {
	background: linear-gradient(rgba(0, 0, 0, .4), rgba(0, 0, 0, .4)),
		url("img/hospital-2.jpg");
	height: 20vh;
	width: 100%;
	background-size: cover;
	background-repeat: no-repeat;
}
</style>

</head>
<body>
	<%@include file="component/navbar.jsp"%>

	<div class="container-fluid backImg p-5">
		<p class="text-center fs-2 text-white"></p>
	</div>

	<div class="container p-3">
		<div class="row">
			<!-- <div class="col-md-6 p-5">
				<img alt="" src="img/surgery.jpg">
			</div> -->

			<div class="col-md-6 p-5 ml-2 ">
				<img alt="" src="img/doctor-3.png" height="85%" width="80%.jpg">
			</div>

			<div class="col-md-6">
				<div class="card paint-card">
					<div class="card-body">
						<p class="text-center fs-3">User Appointment</p>

						<c:if test="${not  empty succMsg }">
							<p class="text-center text-success fs-4">${succMsg }</p>
							<c:remove var="succMsg" scope="session" />
						</c:if>


						<c:if test="${not  empty failedMsg }">
							<p class="text-center text-danger fs-4">${failedMsg }</p>
							<c:remove var="failedMsg" scope="session" />
						</c:if>

						<form class="row g-3" action="addAppointment" method="post">
							<input type="hidden" name="userid" value="${userObj.id }">

							<div class="col-md-6">
								<label for="inputemail4" class="form-lable">Full Name</label> <input
									type="text" required class="form-control" name="fullname">
							</div>

							<div class="col-md-6">
								<label>Gender</label><select class="form-control" name="gender"
									required>
									<option value="male">Male</option>
									<option value="female">Female</option>
								</select>
							</div>


							<div class="col-md-6">
								<label for="inputemail4" class="form-lable">Age</label> <input
									type="number" required class="form-control" name="age">
							</div>

							<div class="col-md-6">
								<label for="inputemail4" class="form-lable">Appointment
									Date</label> <input type="date" required class="form-control"
									name="appoint_date">
							</div>



							<div class="col-md-6">
								<label for="inputemail4" class="form-lable">Email</label> <input
									type="email" required class="form-control" name="email">
							</div>

							<div class="col-md-6">
								<label for="inputemail4" class="form-lable">Phone Number</label>
								<input type="text" required class="form-control" name="phno">
							</div>

							<div class="col-md-6">
								<label for="inputemail4" class="form-lable">Diseases</label> <input
									type="text" required class="form-control" name="diaseases">
							</div>


							<div class="col-md-6">
								<label for="inputemail4" class="form-lable">Doctor</label><select
									class="form-control" name="doct" required>
									<option value="">---Select---</option>
									<%
									DoctorDao dao = new DoctorDao(DBConnect.getConn());
									List<Doctor> list = dao.getAllDoctor();
									for (Doctor d : list) {
									%>
									<option value="<%=d.getId()%>"><%=d.getFullname()%>(<%=d.getSpecialist()%>)
									</option>
									<%
									}
									%>



								</select>
							</div>



							<div class="col-md-12">
								<label>Full Address</label>
								<textarea required name="address" class="form-control" rows="3"
									cols=""></textarea>
							</div>



							<c:if test="${empty userObj}">
								<a href="user_login.jsp"
									class="col-md-6 offset-md-3 btn btn-success">Submit</a>
							</c:if>

							<c:if test="${not empty userObj}">
								<button class="col-md-6 offset-md-3 btn btn-success">Submit</button>
							</c:if>

						</form>


					</div>

				</div>

			</div>


		</div>

	</div>
	<%@include file="component/footer.jsp" %>

</body>
</html>