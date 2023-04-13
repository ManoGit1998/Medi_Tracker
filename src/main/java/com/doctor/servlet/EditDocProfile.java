package com.doctor.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.Db.DBConnect;
import com.dao.DoctorDao;
import com.entity.Doctor;
@WebServlet("/editdocprofile")
public class EditDocProfile extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	try {
		String fullname = req.getParameter("fullname");
		String dob = req.getParameter("dob");
		String qualification = req.getParameter("quali");
		String special = req.getParameter("special");
		String email = req.getParameter("email");
		String mobno = req.getParameter("mobno");
		
		
		int id=Integer.parseInt(req.getParameter("id"));

		Doctor d = new Doctor(id,fullname, dob, qualification, special, email, mobno,"");

		DoctorDao dao = new DoctorDao(DBConnect.getConn());
		HttpSession session = req.getSession();
		if (dao.editDoctorProfile(d)) {
			Doctor upDoctor=dao.getDoctorById(id);
			
			session.setAttribute("succMsgd", "Doctor Updated Succesfully");
			session.setAttribute("doctObj", upDoctor);
			resp.sendRedirect("doctor/editprofile.jsp");
		} else {
			session.setAttribute("failedMsgd", "Something Went Wrong");
			resp.sendRedirect("doctor/editprofile.jsp");

		}

	} catch (Exception e) {
		e.printStackTrace();
	}
	
	}
	
}
