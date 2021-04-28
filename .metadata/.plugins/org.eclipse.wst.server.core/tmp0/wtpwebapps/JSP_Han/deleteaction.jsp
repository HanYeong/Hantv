<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Hantube</title>
<%
	String videocid = request.getParameter("videoid");
%>
<%
Connection conn=null;
PreparedStatement pstmt = null;

try{
	String driverName = "com.mysql.cj.jdbc.Driver";
	String jdbcUrl = "jdbc:mysql://localhost:3306/han_db?serverTimezone=Asia/Seoul";
	String dbId="guestid2019";
	String dbPass="guestpwd2019";
	
	Class.forName("com.mysql.cj.jdbc.Driver");
	conn = DriverManager.getConnection(jdbcUrl, dbId, dbPass);
	
	String sql = "delete from video_db where cid = '" + videocid + "'";
	pstmt = conn.prepareStatement(sql);	// 쿼리문 수행할 객체 생성
	pstmt.executeUpdate();
	
	sql = "delete from comment_db where videocid = '" + videocid + "'";
	pstmt = conn.prepareStatement(sql);	// 쿼리문 수행할 객체 생성
	pstmt.executeUpdate();
	
	sql = "delete from thumbs_db where videocid = '" + videocid + "'";
	pstmt = conn.prepareStatement(sql);	// 쿼리문 수행할 객체 생성
	pstmt.executeUpdate();
	
}catch(Exception e){
	e.printStackTrace();
}finally{
	if(conn != null)
		try{conn.close();}catch(SQLException sqle){}
	if(pstmt != null)
		try{conn.close();}catch(SQLException sqle){}
	response.sendRedirect("main.jsp");
}
%>