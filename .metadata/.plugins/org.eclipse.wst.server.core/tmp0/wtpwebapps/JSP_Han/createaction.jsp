<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.sql.*" %>
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	String id = request.getParameter("create_id");
	String pwd = request.getParameter("create_pwd");
	String name = request.getParameter("create_name");
	String nick = request.getParameter("create_nick");
	String imgsrc = request.getParameter("create_img");
	Timestamp register = new Timestamp(System.currentTimeMillis());
	
	Connection conn=null;		// 커넥터 객체 생성
	PreparedStatement pstmt = null;	// sql문 수행 준비 (쿼리수행 준비문) 쿼리 실행 객체 생성
	try{
		String driverName = "com.mysql.cj.jdbc.Driver";
		String jdbcUrl = "jdbc:mysql://localhost:3306/han_db?serverTimezone=Asia/Seoul";
		String dbId="guestid2019";
		String dbPass="guestpwd2019";
		
		Class.forName(driverName);	// 드라이버 로딩
		conn = DriverManager.getConnection(jdbcUrl, dbId, dbPass);	// db연동
		
		//sql문. 쿼리 실행
		String sql = "insert into account_db values(?,?,?,?,?,?)";
		pstmt = conn.prepareStatement(sql);	// 쿼리문 수행할 객체 생성
		pstmt.setString(1, id);	// db순서대로 함
		pstmt.setString(2, pwd);
		pstmt.setString(3, name);
		pstmt.setString(4, nick);
		pstmt.setString(5, imgsrc);
		pstmt.setTimestamp(6, register);
		
		pstmt.executeUpdate();	// 만들어진 문장을 수행 (쿼리문 실행)
		out.println("추가 완료");
	}catch(Exception e){
		e.printStackTrace();
		out.println("추가 실패");
	}finally{
		out.println("종료");
		if(pstmt != null)
			try{conn.close();}catch(SQLException sqle){}
		if(conn != null)
			try{conn.close();}catch(SQLException sqle){}
		response.sendRedirect("login.jsp?id="+id);
	}
	
%>
</body>
</html>