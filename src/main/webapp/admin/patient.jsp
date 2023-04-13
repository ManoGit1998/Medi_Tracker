<%@page import="com.entity.Doctor"%>
<%@page import="com.dao.DoctorDao"%>
<%@page import="com.entity.Appointment"%>
<%@page import="java.util.List"%>
<%@page import="com.Db.DBConnect"%>
<%@page import="com.dao.AppointmentDao"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin Patient View</title>
<%@include file="../component/allCss.jsp"%>


<style type="text/css">
 .paint-card {
	box-shadow: 0 0 10px 0 rgba(0, 0, 0, 0.3);
 


body {
	background-image: url("../img/bacteria.png");
	background-color: #cccccc;
}

</style>

</head>
<body>
	<%@include file="../admin/navbar.jsp"%>



	<div class="col-md-12 p-5">
		<div class="card paint-card">
			<div class="card-body">
				<p class="text-center fs-3">Patient Details</p>

				<table class="table">
					<thead>



						<tr>
							<th scope="col">Full Name</th>
							<th scope="col">Gender</th>
							<th scope="col">Age</th>
							<th scope="col">Appointment</th>
							<th scope="col">Email</th>
							<th scope="col">Mob No</th>
							<th scope="col">Disease</th>
							<th scope="col">Doctor Name</th>
							<th scope="col">Address</th>
							<th scope="col">Status</th>


						</tr>
					</thead>

					<tbody>
					<%
					AppointmentDao dao2=new AppointmentDao(DBConnect.getConn());
					DoctorDao dao=new DoctorDao(DBConnect.getConn());
					List<Appointment> list=dao2.getAllAppointment();
					for(Appointment ap :list){
						Doctor d = dao.getDoctorById(ap.getDoctorId());
					%>
						
						<tr>
							<td><%=ap.getFullName() %></td>
							<td><%=ap.getGender() %></td>
							<td><%=ap.getAge() %></td>
							<td><%=ap.getAppoinDate() %></td>
							<td><%=ap.getEmail() %></td>
							<td><%=ap.getPhno() %></td>
							<td><%=ap.getDiseases() %></td>
							<td><%="" %></td>
							<td><%=ap.getAddress() %></td>
							<td><%=ap.getStatus() %></td>
						</tr>
						
					<%}
					%>
					
						

					</tbody>


				</table>
			</div>
		</div>
	</div>

</body>
</html>