package com.user.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.Db.DBConnect;
import com.dao.AppointmentDao;
import com.entity.Appointment;

@WebServlet("/addAppointment")
public class AppointmentServlet extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int userid = Integer.parseInt(req.getParameter("userid"));
		String fullname = req.getParameter("fullname");
		String gender = req.getParameter("gender");
		String age = req.getParameter("age");
		String appoint_date = req.getParameter("appoint_date");
		String email = req.getParameter("email");
		String phno = req.getParameter("phno");
		String disease = req.getParameter("diaseases");
		int doctor_id=Integer.parseInt(req.getParameter("doct"));
		String address = req.getParameter("address");

		Appointment ap = new Appointment(userid, fullname, gender, age, appoint_date, email, phno, disease, doctor_id,
				address, "Pending");
		
		AppointmentDao dao=new AppointmentDao(DBConnect.getConn());
		HttpSession session=req.getSession();
		if(dao.addAppointment(ap)) {
			session.setAttribute("succMsg","Appointment Booked Sucessful");
			resp.sendRedirect("user_appointment.jsp");
		}else {
			session.setAttribute("failedMsg","Something Went Wrong On Server");
			resp.sendRedirect("user_appointment.jsp");

	}

}
}
