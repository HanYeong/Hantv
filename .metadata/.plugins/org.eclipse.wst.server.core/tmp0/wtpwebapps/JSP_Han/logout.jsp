<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HanTube</title>
<%
	session.removeAttribute("id_login");
	String id_login = "";
	response.sendRedirect("main.jsp");

%>