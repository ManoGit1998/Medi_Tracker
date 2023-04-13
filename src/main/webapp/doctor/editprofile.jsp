<%@page import="com.Db.DBConnect"%>
<%@page import="com.entity.Specialist"%>
<%@page import="java.util.List"%>
<%@page import="com.dao.SpecialistDao"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Edit Doctor</title>

<%@include file="../component/allCss.jsp"%>

<style type="text/css">
.paint-card {
	box-shadow: 0 0 10px 0 rgba(0, 0, 0, 0.3);
}
</style>
</head>
<body>
	<%@include file="navbar.jsp"%>


	<div class="container p-4">
		<div class="row">
			<div class="col-md-4">
				<div class="card paint-card">
					<div class="card-body">
						<p class="fs-4 text-center">Change Password
						<p>


							<c:if test="${not  empty succMsg }">
								<p class="text-center text-success fs-3">${succMsg }</p>
								<c:remove var="succMsg" scope="session" />
							</c:if>


							<c:if test="${not  empty failedMsg }">
								<p class="text-center text-danger fs-3">${failedMsg }</p>
								<c:remove var="failedMsg" scope="session" />
							</c:if>
						<form action="../doctpasschange" method="post">
							<div class="mb-3">
								<label>Enter New Password</label> <input type="text" required
									name="newpassword" class="form-control">
							</div>

							<div class="mb-3">
								<label>Enter Old Password</label> <input type="text" required
									name="oldpassword" class="form-control">
							</div>

							<input type="hidden" value="${doctObj.id}" name="uid">

							<button type="submit"
								class="btn btn-success text-white col-md-12">Change
								Password</button>

						</form>
					</div>
				</div>
			</div>

			<div class="col-md-5 offset-md-2">
				<div class="card paint-card">
					<div class="card-body">
						<p class="fs-4 text-center">Edit Doctor Profile</p>
						
						<c:if test="${not  empty succMsgd }">
								<p class="text-center text-success fs-3">${succMsgd }</p>
								<c:remove var="succMsgd" scope="session" />
							</c:if>


							<c:if test="${not  empty failedMsgd }">
								<p class="text-center text-danger fs-3">${failedMsgd }</p>
								<c:remove var="failedMsgd" scope="session" />
							</c:if>

						<form action="../editdocprofile" method="post">
							<div class="mb-3">
								<label class="form-lable">Full Name</label> <input type="text"
									required name="fullname" class="form-control"
									value="${doctObj.fullname }">
							</div>

							<div class="mb-3">
								<label class="form-lable">DOB</label> <input type="date"
									required name="dob" class="form-control"
									value="${doctObj.dob }">
							</div>


							<div class="mb-3">
								<label class="form-lable">Qualification</label> <input
									type="text" required name="quali" class="form-control"
									value="${doctObj.qualification }">
							</div>

							<div class="mb-3">
								<label class="form-lable">Specialist</label> <select type="text"
									required name="special" class="form-control">
									<option>${doctObj.specialist }</option>

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
									readonly required name="email" class="form-control"
									value="${doctObj.email }">
							</div>


							<div class="mb-3">
								<label class="form-lable">Mob No</label> <input type="text"
									required name="mobno" class="form-control"
									value="${doctObj.mobno }">
							</div>
							<input type="hidden" value="${doctObj.id}" name="id">

							<div class="text-center mt-3">
								<button type="submit" class="btn btn-primary">Update</button>
							</div>

						</form>


					</div>

				</div>

			</div>

		</div>

	</div>



</body>
</html>