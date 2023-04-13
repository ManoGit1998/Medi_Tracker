package com.admin.servlet;

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

@WebServlet("/update_doctor")
public class UpdateDoctor extends HttpServlet {
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
		String password = req.getParameter("password");
		
		int id=Integer.parseInt(req.getParameter("id"));

		Doctor d = new Doctor(id,fullname, dob, qualification, special, email, mobno, password);

		DoctorDao dao = new DoctorDao(DBConnect.getConn());
		HttpSession session = req.getSession();
		if (dao.updateDoctor(d)) {
			session.setAttribute("succMsg", "Doctor Updated Succesfully");
			resp.sendRedirect("admin/view_doctor.jsp");
		} else {
			session.setAttribute("failedMsg", "Something Went Wrong");
			resp.sendRedirect("admin/view_doctor.jsp");

		}

	} catch (Exception e) {
		e.printStackTrace();
	}
	
	}
}
