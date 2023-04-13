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

@WebServlet("/add_doctor")

public class AddDoctor extends HttpServlet {

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

			Doctor d = new Doctor(fullname, dob, qualification, special, email, mobno, password);

			DoctorDao dao = new DoctorDao(DBConnect.getConn());
			HttpSession session = req.getSession();
			if (dao.registerDoctor(d)) {
				session.setAttribute("succMsg", "Added Succesfully");
				resp.sendRedirect("admin/doctor.jsp");
			} else {
				session.setAttribute("failedMsg", "Something Went Wrong");
				resp.sendRedirect("admin/doctor.jsp");

			}

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
