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
	String videocid = request.getParameter("cid");
	String userid = request.getParameter("userid");
	out.println(videocid);
	out.println(userid);
%>
<%
Connection conn=null;
PreparedStatement pstmt = null;
ResultSet rs = null;

try{
	String driverName = "com.mysql.cj.jdbc.Driver";
	String jdbcUrl = "jdbc:mysql://localhost:3306/han_db?serverTimezone=Asia/Seoul";
	String dbId="guestid2019";
	String dbPass="guestpwd2019";
	
	Class.forName("com.mysql.cj.jdbc.Driver");
	conn = DriverManager.getConnection(jdbcUrl, dbId, dbPass);
	
	String sql = "select * from thumbs_db where videocid = '"+videocid+"' && userid = '"+userid+"'";
	pstmt = conn.prepareStatement(sql);	// 쿼리문 수행할 객체 생성
	rs = pstmt.executeQuery();
	if(rs.next()){
		sql = "delete from thumbs_db where videocid = '"+videocid+"' && userid = '"+userid+"'";
		pstmt = conn.prepareStatement(sql);	// 쿼리문 수행할 객체 생성
		pstmt.executeUpdate();
		
		sql = "update video_db set thumbscnt = thumbscnt-1 where cid = '"+videocid+"'";
		pstmt = conn.prepareStatement(sql);	// 쿼리문 수행할 객체 생성
		pstmt.executeUpdate();
	}else{
		sql = "insert into thumbs_db (videocid, userid) values(?,?)";
		pstmt = conn.prepareStatement(sql);	// 쿼리문 수행할 객체 생성
		pstmt.setInt(1, Integer.parseInt(videocid));	// db순서대로 함
		pstmt.setString(2, userid);
		
		pstmt.executeUpdate();
		
		sql = "update video_db set thumbscnt = thumbscnt+1 where cid = '"+videocid+"'";
		pstmt = conn.prepareStatement(sql);	// 쿼리문 수행할 객체 생성
		pstmt.executeUpdate();
	}
	
	out.println("완료");
	
}catch(Exception e){
	e.printStackTrace();
}finally{
	if(conn != null)
		try{conn.close();}catch(SQLException sqle){}
	if(pstmt != null)
		try{conn.close();}catch(SQLException sqle){}
	if(rs != null)
		try{conn.close();}catch(SQLException sqle){}
	response.sendRedirect("watch.jsp?video="+videocid);
}
%>