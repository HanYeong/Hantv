<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<% request.setCharacterEncoding("UTF-8"); %>
<%
	String idc = request.getParameter("idc");
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

		String sql = "select user_id from account_db where user_id = '" + idc + "'";
		pstmt = conn.prepareStatement(sql);
		rs = pstmt.executeQuery();
	
		if(rs.next()){
			out.print("YES");
		}else{
			out.print("NO");
		}
		
}catch(Exception e){
	e.printStackTrace();
}finally{
	if(conn != null)
		try{conn.close();}catch(SQLException sqle){}
	if(pstmt != null)
		try{conn.close();}catch(SQLException sqle){}
	if(rs != null)
		try{conn.close();}catch(SQLException sqle){}
}
%>
