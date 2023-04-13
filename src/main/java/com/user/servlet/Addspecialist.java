package com.user.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.Db.DBConnect;
import com.dao.SpecialistDao;
import com.entity.User;

@WebServlet("/addspecialist")

public class Addspecialist extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
		String specialname=req.getParameter("specialname");
		
		SpecialistDao dao=new SpecialistDao(DBConnect.getConn());
		boolean f=dao.addSpecialist(specialname);
		
		HttpSession session=req.getSession();
		
		if(f) {
			session.setAttribute("succMsg", "Specialist Added");
			resp.sendRedirect("admin/index.jsp");
		}else {
			session.setAttribute("failedMsg","Something Went Wrong on Server");
			resp.sendRedirect("admin_index.jsp");
		}
	}

	
}
