<%@page import="java.sql.Connection"%>
<%@page import="com.Db.DBConnect"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<%@include file="component/allCss.jsp"%>

<title>Home Page</title>

<style type="text/css">
.paint-card {
	box-shadow: 0 0 10px 0 rgba(0, 0, 0, 0.3);
}

</style>

</head>
<body>
	<%@include file="component/navbar.jsp"%>



	<div id="carouselExampleIndicators" class="carousel slide"
		data-bs-ride="carousel">
		<div class="carousel-indicators">
			<button type="button" data-bs-target="#carouselExampleIndicators"
				data-bs-slide-to="0" class="active" aria-current="true"
				aria-label="Slide 1"></button>
			<button type="button" data-bs-target="#carouselExampleIndicators"
				data-bs-slide-to="1" aria-label="Slide 2"></button>
			<button type="button" data-bs-target="#carouselExampleIndicators"
				data-bs-slide-to="2" aria-label="Slide 3"></button>
		</div>
		<div class="carousel-inner">
			<div class="carousel-item active">
				<img src="img/hospital-1.jpg" class="d-block w-100" alt="..."
					height="500px">
			</div>
			<div class="carousel-item">
				<img src="img/hospital-2.jpg" class="d-block w-100" alt="..."
					height="500px">
			</div>
			<div class="carousel-item">
				<img src="img/surgery.jpg" class="d-block w-100" alt="..."
					height="500px">
			</div>
		</div>
		<button class="carousel-control-prev" type="button"
			data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
			<span class="carousel-control-prev-icon" aria-hidden="true"></span> <span
				class="visually-hidden">Previous</span>
		</button>
		<button class="carousel-control-next" type="button"
			data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
			<span class="carousel-control-next-icon" aria-hidden="true"></span> <span
				class="visually-hidden">Next</span>
		</button>
	</div>


	<div class="container p-3">


		<marquee direction="right" behavior="alternate"
			style="border: BLUE 2px SOLID">
			<b> WELCOME TO MEDI-TRACKER FOR SEAMLESS APPOINTMENT BOOKING
				EXPERIENCE </b>
		</marquee>
		<br>
		<br>

		<p class="text-center fs-3">Key Features Of Our Hospital !</p>


		<div class="row">
			<div class="col-md-8 p-5">
				<div class="row">
					<div class="col-md-6">
						<div class="card paint-card">
							<div class="card-body">
								<p class="fs-5">100% Safety</p>
								<p>Our Hospital Provides Safty Features According TO indian Goverment Norms
								</p>
							</div>
						</div>
					</div>


					<div class="col-md-6 mt-2">
						<div class="card paint-card">
							<div class="card-body">
								<p class="fs-5">Clean Environment</p>
								<p>Our Hospital Is Certified With Green Tribunal India
								</p>
							</div>
						</div>
					</div>


					<div class="col-md-6 mt-2">
						<div class="card paint-card">
							<div class="card-body">
								<p class="fs-5">Friendly Doctors</p>
								<p>Doctors Are Very Helpfull
								</p>
							</div>
						</div>
					</div>


					<div class="col-md-6 mt-2">
						<div class="card paint-card">
							<div class="card-body">
								<p class="fs-5">Medical Reserch</p>
								<p>Our Hospital Always Promote For R&D In Medical Scince
								</p>
							</div>
						</div>
					</div>


				</div>
			</div>

			<div class="col-md-4">
				<img alt="" src="img/doctor-3.png" height="85%" width="120%">
			</div>

		</div>

	</div>

	<hr>

	<div class="container p-2">
		<p class="text-center fs-2">Our Team</p>
		<div class="row">
			<div class="col-md-4">
				<div class="card paint-card">
					<div class="card-body text-center">
						<img alt="" src="img/manoranjan.jpg" width="250px" height="300px">
						<p class="fw-bold fs-5" style="color:blue;">Manoranjan Nayak</p>
						<p class="fs-7">(CEO & Chairman)</p>
					</div>

				</div>

			</div>


			<div class="col-md-4">
				<div class="card paint-card">
					<div class="card-body text-center">
						<img alt="" src="img/smruti2.jpg" width="250px" height="300px">
						<p class="fw-bold fs-5" style="color:blue;">Smruti Snigdha Swain</p>
						<p class="fs-7" >Co-Founder</p>
					</div>

				</div>

			</div>




			<div class="col-md-4">
				<div class="card paint-card">
					<div class="card-body text-center">
						<img alt="" src="img/suhani.jpg" width="250px" height="300px">
						<p class="fw-bold fs-5" style="color:blue;">Suhani Mania</p>
						<p class="fs-7" >Co-Founder</p>
					</div>

				</div>

			</div>




		</div>


	</div>

	<%@include file="component/footer.jsp"%>
</body>
</html>