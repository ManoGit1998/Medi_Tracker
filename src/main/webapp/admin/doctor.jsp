<%@page import="com.entity.Doctor"%>
<%@page import="com.dao.DoctorDao"%>
<%@page import="java.util.List"%>
<%@page import="com.entity.Specialist"%>
<%@page import="com.Db.DBConnect"%>
<%@page import="com.dao.SpecialistDao"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
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
	background-image: url("../img/surgery.jpg");
	background-color: #cccccc;
}
</style>

</head>
<body>
	<%@include file="navbar.jsp"%>

	<div class="container-fluid p-3">
		<div class="row">
			<div class="col-md-5 offset-md-4">
				<div class="card paint-card">
					<div class="card-body">
					
					
					<p class="text-center fs-3">Add Doctor</p>



						<c:if test="${not  empty succMsg }">
							<p class="text-center text-success fs-3">${succMsg }</p>
							<c:remove var="succMsg" scope="session" />
						</c:if>

						<c:if test="${not  empty failedMsg }">
							<p class="text-center text-danger fs-3">${failedMsg }</p>
							<c:remove var="failedMsg" scope="session" />
						</c:if>

						<form action="../add_doctor" method="post">
							<div class="mb-3">
								<label class="form-lable">Full Name</label> <input type="text"
									required name="fullname" class="form-control">
							</div>

							<div class="mb-3">
								<label class="form-lable">DOB</label> <input type="date"
									required name="dob" class="form-control">
							</div>


							<div class="mb-3">
								<label class="form-lable">Qualification</label> <input
									type="text" required name="quali" class="form-control">
							</div>

							<div class="mb-3">
								<label class="form-lable">Specialist</label> <select type="text"
									required name="special" class="form-control">
									<option>---Select---</option>

									<%
									SpecialistDao dao = new SpecialistDao(DBConnect.getConn());
									List<Specialist> list = dao.getAllSpecialist();
									for (Specialist s : list) {
									%>

									<option><%=s.getSpecialistName()%></option>
									<%
									}
									%>


								</select>
							</div>



							<div class="mb-3">
								<label class="form-lable">Email</label> <input type="text"
									required name="email" class="form-control">
							</div>


							<div class="mb-3">
								<label class="form-lable">Mob No</label> <input type="text"
									required name="mobno" class="form-control">
							</div>


							<div class="mb-3">
								<label class="form-lable">Pasword</label> <input type="text"
									required name="password" class="form-control">
							</div>

							<div class="text-center mt-3">
								<button type="submit" class="btn btn-primary">ADD</button>
							</div>

						</form>

					</div>

				</div>

			</div>




		</div>

	</div>

</body>
</html>