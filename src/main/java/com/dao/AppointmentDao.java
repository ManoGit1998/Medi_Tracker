package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.entity.Appointment;
import com.entity.User;
import com.mysql.cj.protocol.Resultset;

public class AppointmentDao {
	private Connection conn;

	public AppointmentDao(Connection conn) {
		super();
		this.conn = conn;
	}

	public boolean addAppointment(Appointment ap) {
		boolean f = false;
		try {

			String sql = "insert into appointmnet(userid,fullname,gender,age,appdate,email,phno,diseases,doctor_id,adress,status) values(?,?,?,?,?,?,?,?,?,?,?)";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, ap.getUserid());
			ps.setString(2, ap.getFullName());
			ps.setString(3, ap.getGender());
			ps.setString(4, ap.getAge());
			ps.setString(5, ap.getAppoinDate());
			ps.setString(6, ap.getEmail());
			ps.setString(7, ap.getPhno());
			ps.setString(8, ap.getDiseases());
			ps.setInt(9, ap.getDoctorId());
			ps.setString(10, ap.getAddress());
			ps.setString(11, ap.getStatus());

			int i = ps.executeUpdate();
			if (i == 1) {
				f = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return f;
	}

	public List<Appointment> getAllAppointmentByLoginUser(int userid) {
		List<Appointment> list = new ArrayList<Appointment>();
		Appointment ap = null;
		try {

			String sql = "select * from appointmnet where userid=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, userid);

			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				ap = new Appointment();
				ap.setId(rs.getInt(1));
				ap.setUserid(rs.getInt(2));
				ap.setFullName(rs.getString(3));
				ap.setGender(rs.getString(4));
				ap.setAge(rs.getString(5));
				ap.setAppoinDate(rs.getString(6));
				ap.setEmail(rs.getString(7));
				ap.setPhno(rs.getString(8));
				ap.setDiseases(rs.getString(9));
				ap.setDoctorId(rs.getInt(10));
				ap.setAddress(rs.getString(11));
				ap.setStatus(rs.getString(12));

				list.add(ap);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	public List<Appointment> getAllAppointmentByDoctorLogin(int doctorid) {
		List<Appointment> list = new ArrayList<Appointment>();
		Appointment ap = null;
		try {

			String sql = "select * from appointmnet where doctor_id=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, doctorid);

			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				ap = new Appointment();
				ap.setId(rs.getInt(1));
				ap.setUserid(rs.getInt(2));
				ap.setFullName(rs.getString(3));
				ap.setGender(rs.getString(4));
				ap.setAge(rs.getString(5));
				ap.setAppoinDate(rs.getString(6));
				ap.setEmail(rs.getString(7));
				ap.setPhno(rs.getString(8));
				ap.setDiseases(rs.getString(9));
				ap.setDoctorId(rs.getInt(10));
				ap.setAddress(rs.getString(11));
				ap.setStatus(rs.getString(12));

				list.add(ap);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	public Appointment getAppointmentById(int id) {
		Appointment ap = null;
		try {

			String sql = "select * from appointmnet where id=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, id);

			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				ap = new Appointment();
				ap.setId(rs.getInt(1));
				ap.setUserid(rs.getInt(2));
				ap.setFullName(rs.getString(3));
				ap.setGender(rs.getString(4));
				ap.setAge(rs.getString(5));
				ap.setAppoinDate(rs.getString(6));
				ap.setEmail(rs.getString(7));
				ap.setPhno(rs.getString(8));
				ap.setDiseases(rs.getString(9));
				ap.setDoctorId(rs.getInt(10));
				ap.setAddress(rs.getString(11));
				ap.setStatus(rs.getString(12));

			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return ap;
	}

	public boolean updateCommentStatus(int id, int doctid, String comm) {
		boolean f = false;
		try {
			String sql = "update appointmnet set status=? where id=? and doctor_id=?";
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setString(1, comm);
			ps.setInt(2, id);
			ps.setInt(3, doctid);
			int i = ps.executeUpdate();
			if(i==1){
				f=true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return f;
	}
	
	public List<Appointment> getAllAppointment() {
		List<Appointment> list = new ArrayList<Appointment>();
		Appointment ap = null;
		try {

			String sql = "select * from appointmnet order by id desc";
			PreparedStatement ps = conn.prepareStatement(sql);
			

			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				ap = new Appointment();
				ap.setId(rs.getInt(1));
				ap.setUserid(rs.getInt(2));
				ap.setFullName(rs.getString(3));
				ap.setGender(rs.getString(4));
				ap.setAge(rs.getString(5));
				ap.setAppoinDate(rs.getString(6));
				ap.setEmail(rs.getString(7));
				ap.setPhno(rs.getString(8));
				ap.setDiseases(rs.getString(9));
				ap.setDoctorId(rs.getInt(10));
				ap.setAddress(rs.getString(11));
				ap.setStatus(rs.getString(12));

				list.add(ap);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
}
