<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HanTube</title>
<style>
	html, body {
			display: flex;
 			align-items: center;
 			justify-content: center;
			margin:0;
			height:100%;
			overflow: auto;
			font-family:"나눔고딕";
			line-height:100%;
			vertical-align:middle;
			background:#f2f4f7;
	}
	
	table {
			padding: 0px;
			border: 0px;
	}
	
	a:link { color:#858585; }
	a:visited { color:#858585; }
	a:hover { color:#0068ff; }
	a:active { color:blue; }

	
	.loginbox {
				width:420px; height:500px;
				border:1px solid #0068ff;
				border-radius:10px;
				vertical-align: middle;
				background:#ffffff;
	}
	
	.logincontents {
				width:100%-120px; height:100%-100px;
				margin-left:60px; margin-right:60px;
				margin-top:50px; margin-bottom:50px;
				text-align:center;
	}
	
	.login_id_text {
				width:290px; height:50px;
				padding-left:10px;
				border: 1px solid #dadce0;
				border-radius: 5px;
	}
	
	.login_pwd_text {
				width:290px; height:50px;
				padding-left:10px;
				border: 1px solid #dadce0;
				border-radius: 5px;
	}
	
	
	.login_btn {
				width:100px; height:40px;
				background-color:#0068ff;
				border:0px;
				border-radius: 2px;
				color:white;
	}
	
	.login_id_check {
				 width:290px;
				 color:red;
				 font-size:11px;
				 border:0px;
	}
	
	.login_pwd_check {
				 width:290px;
				 color:red;
				 font-size:11px;
				 border:0px;
	}
	
	.login_id_check:focus {
				outline: none;
	}
	.login_pwd_check:focus {
				outline: none;
	}
</style>

<%
	String id_login = (String)session.getAttribute("id_login");
	if(id_login != null){
		response.sendRedirect("main.jsp");
	}
%>

<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
	function login_check(){
		if(document.getElementById('login_id').value == ""){
			document.getElementById('login_check_id').value = "아이디를 입력하세요.";
			$("#login_id").focus();
		}else{
		
		if(document.getElementById('login_password').value == "" && document.getElementById('login_check_id').value != "완료"){
		$.ajax({
			type:"POST",
		url:"./idcheck.jsp",
		data:{"idc":$('#login_id').val()},
		success:function(data){
			if($.trim(data) == "YES"){
				document.getElementById('login_check_id').value = "완료";
				document.getElementById('login_id').setAttribute("readonly", "readonly");
				$(".login_id_text").css("border", "1px solid #dadce0;");
				$(".login_id_check").css("color", "green");
				$(".login_id_check").css("text-align", "right");
				$(".help_id").css("visibility", "hidden");
				$(".div_pwd_form").css("visibility", "visible");
				$("#login_password").focus();
			}else{
				document.getElementById('login_check_id').value = "등록되지 않은 사용자입니다.";
				$("#login_id").focus();
			}
		}
		});
		}else if(document.getElementById('login_check_id').value == "완료" && document.getElementById('login_password').value != ""){
			$.ajax({
				type:"POST",
			url:"./pwdcheck.jsp",
			data:{"idc":$('#login_id').val()},
			success:function(data){
				if($.trim(data) == "NO"){
					document.getElementById('login_check_pwd').value = "비밀번호가 일치하지 않습니다.";
					$("#login_password").focus();
				}else if($.trim(data) == document.getElementById('login_password').value){
					document.getElementById('hidden_id').value = document.getElementById('login_id').value;
					document.getElementById('l_action_id').submit();
				}else{
					document.getElementById('login_check_pwd').value = "비밀번호가 일치하지 않습니다.";
					$("#login_password").focus();
				}
			}
			});
		}else{
			document.getElementById('login_check_pwd').value = "비밀번호를 입력하세요.";
			$("#login_password").focus();
		}
		}
	}
</script>

</head>
<body>
<%
	String giveid = request.getParameter("id");
	if(giveid == null)
	giveid = "";
%>
<div class="loginbox">
	<div class="logincontents">
		<div>
		<h2>로그인</h2>
		LOGIN
		</div>
		<div style="margin-top:30px;">
			<table align="center">
				<tr>
					<td><input type="text" id="login_id" placeholder="아이디 account" class="login_id_text" value=<%=giveid %>></td>
				</tr>
				<tr id="not_account" style="text-align:left;">
					<td><input type="text" value="" id="login_check_id" class="login_id_check" readonly="readonly"></td>
				</tr>
				<tr>
					<td style="height:20px; text-align:right;"><a href="#" title="아이디 찾기" class="help_id" style="text-decoration: none">계정을 잊으셨나요?</a></td>
				</tr>
			</table>
		</div>
		
		<div class="div_pwd_form" style="margin-top:30px; visibility: hidden;">
			<table align="center">
				<tr>
					<td><input type="password" id="login_password" placeholder="비밀번호 password" class="login_pwd_text"></td>
				</tr>
				<tr id="not_account" style="text-align:left;">
					<td><input type="text" value="" id="login_check_pwd" class="login_pwd_check" readonly="readonly"></td>
				</tr>
				<tr>
					<td style="height:20px; text-align:right;"><a href="#" title="비밀번호 찾기" style="text-decoration: none">비밀번호를 잊으셨나요?</a></td>
				</tr>
			</table>
		</div>
		<div style="width:310px; margin-top:30px;">
			<div style="float:left; margin-top:10px;">
				<a href="createaccount.jsp" title="회원가입" style="text-decoration: none">회원가입</a>
			</div>
			<div style="float:right;">
				<input id="login_check" onclick="login_check();" type="button" value="제 출" class="login_btn">
			</div>
		</div>
	</div>
</div>
<form action="main.jsp" id="l_action_id"  method="POST">
<input type="hidden" value="" id="hidden_id" name="hidden_name">
</form>
</body>
</html>