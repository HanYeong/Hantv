<%@page import="java.io.File"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="java.util.Enumeration"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
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
	String userid = (String)session.getAttribute("id_login");
	String title = "";
	String text = "";
	
	title = request.getParameter("uploadtitle");
	text = request.getParameter("uploadtext");
	
	out.println(title);
	out.println(text);
%>

<%
Connection conn=null;
PreparedStatement pstmt = null;
ResultSet rs = null;
Timestamp nowdate = new Timestamp(System.currentTimeMillis());

String usernick = "";
String userimgsrc = "";


try{
	String driverName = "com.mysql.cj.jdbc.Driver";
	String jdbcUrl = "jdbc:mysql://localhost:3306/han_db?serverTimezone=Asia/Seoul";
	String dbId="guestid2019";
	String dbPass="guestpwd2019";
	
	Class.forName("com.mysql.cj.jdbc.Driver");
	conn = DriverManager.getConnection(jdbcUrl, dbId, dbPass);
	
	String sql = "select * from account_db where user_id = '"+userid+"'";
	pstmt = conn.prepareStatement(sql);	// 쿼리문 수행할 객체 생성
	rs = pstmt.executeQuery();
	
	if(rs.next()){
		usernick = rs.getString("user_nick");
		userimgsrc = rs.getString("user_img");
	}
	
	sql = "insert into post_db (userid, ptitle, signdate, comment, usernick, userimgsrc, viewcnt, thumbscnt) values(?,?,?,?,?,?,?,?)";
	pstmt = conn.prepareStatement(sql);	// 쿼리문 수행할 객체 생성
	pstmt.setString(1, userid);	// db순서대로 함
	pstmt.setString(2, title);
	pstmt.setTimestamp(3, nowdate);
	pstmt.setString(4, text);
	pstmt.setString(5, usernick);
	pstmt.setString(6, userimgsrc);
	pstmt.setInt(7, 0);
	pstmt.setInt(8, 0);
	
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
	response.sendRedirect("board.jsp");
}
%>