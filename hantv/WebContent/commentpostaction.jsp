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
	String videoid = request.getParameter("videoid");
	String userid = request.getParameter("CMid");
	String nickname = request.getParameter("CMnick");
	String imgsrc = request.getParameter("CMimgsrc");
	String text = request.getParameter("CMtext");
%>
<%
Connection conn=null;
PreparedStatement pstmt = null;
ResultSet rs = null;
Timestamp nowdate = new Timestamp(System.currentTimeMillis());


try{
	String driverName = "com.mysql.cj.jdbc.Driver";
	String jdbcUrl = "jdbc:mysql://localhost:3306/han_db?serverTimezone=Asia/Seoul";
	String dbId="guestid2019";
	String dbPass="guestpwd2019";
	
	Class.forName("com.mysql.cj.jdbc.Driver");
	conn = DriverManager.getConnection(jdbcUrl, dbId, dbPass);
	
	String sql = "insert into comment_post_db (userid, usernick, userimg, postcid, signdate, comment) values(?,?,?,?,?,?)";
	pstmt = conn.prepareStatement(sql);	// 쿼리문 수행할 객체 생성
	pstmt.setString(1, userid);	// db순서대로 함
	pstmt.setString(2, nickname);
	pstmt.setString(3, imgsrc);
	pstmt.setString(4, videoid);
	pstmt.setTimestamp(5, nowdate);
	pstmt.setString(6, text);
	
	pstmt.executeUpdate();
	
}catch(Exception e){
	e.printStackTrace();
}finally{
	if(conn != null)
		try{conn.close();}catch(SQLException sqle){}
	if(pstmt != null)
		try{conn.close();}catch(SQLException sqle){}
	if(rs != null)
		try{conn.close();}catch(SQLException sqle){}
	response.sendRedirect("post.jsp?post="+videoid);
}
%>