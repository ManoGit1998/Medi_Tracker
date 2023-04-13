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
import com.dao.UserDao;
@WebServlet("/doctpasschange")
public class DoctorPassChange  extends HttpServlet{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		int uid=Integer.parseInt(req.getParameter("uid"));
		String oldPassword=req.getParameter(("oldpassword"));
		String newPassword=req.getParameter(("newpassword"));
		
		DoctorDao dao=new DoctorDao(DBConnect.getConn());
		HttpSession session=req.getSession();
		
		if(dao.checkOldPassword(uid, oldPassword)) {
			
			if(dao.changePassword(uid, newPassword)) {
				session.setAttribute("succMsg", "Password Changed Successfully");
				resp.sendRedirect("doctor/editprofile.jsp");
			}else {
				session.setAttribute("failedMsg", "Something Went Wrong On Server");
				resp.sendRedirect("doctor/editprofile.jsp");
				
			}
			
		}else {
			session.setAttribute("failedMsg", "Old Password Is Incorrect");
			resp.sendRedirect("doctor/editprofile.jsp");
		}
	}
	
	
}
