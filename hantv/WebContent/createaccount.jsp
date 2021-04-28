<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>account</title>
</head>
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
			margin: 0px;
			border-spacing: 0px;
	}
	
	.createbox {
				width:510px; height:430px;
				padding:30px;
				border:1px solid #0068ff;
				border-radius:10px;
				vertical-align: middle;
				background:#ffffff;
	}
	
	.create_text {
				padding-left:10px;
				border: 1px solid #dadce0;
				border-radius: 3px;
	}
	
	.create_btn {
				margin-top:20px;
				width:100px; height:40px;
				background-color:#0068ff;
				border:0px;
				border-radius: 2px;
				color:white;
				float:right;
	}
	
	.create_imgchange {
				width:40px; height:25px;
				background-color:#ffffff;
				color:#0068ff;
				border:1px solid #0068ff;;
				border-radius: 2px;
				float:right;
	}
	
	.create_imgbox {

				text-align:center;
				margin-left:20px;
				margin-top:0px;

				width:100%-40px; height:100px;
				border: 1px solid #dadce0;
				border-radius: 2px;
				line-height: 100px;
	}
	
	.create_id_check {
				color:red;
				font-size:11px;
				height:10px;
				border:0px;
				width:200px;
	}

	.create_pwd_check {
				color:red;
				font-size:11px;
				height:10px;
				border:0px;
				width:200px;
	}
	
	.create_id_check:focus {
				outline:none;
	}

	.create_pwd_check:focus {
				outline:none;
	}

</style>

 <script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
	function checkimg(){
		alert("test");
	}
</script>
<script>
	$(function(){
		$('#input_id').blur(function(){
			if(document.getElementById('input_id').value != ""){
			$.ajax({
				type:"POST",
			url:"./idcheck.jsp",
			data:{"idc":$('#input_id').val()},
			success:function(data){
				if($.trim(data) == "YES"){
					document.getElementById('id_check').value = "이미 사용하는 아이디 입니다.";
					$(".create_id_check").css("color", "red");
				}else{
					document.getElementById('id_check').value = "사용 가능한 아이디 입니다.";
					$(".create_id_check").css("color", "green");
					if(document.getElementById('create_nick_id').value == ""){
					document.getElementById('example_id').value = document.getElementById('input_id').value;
					}
				}
			}
			});
			}else if(document.getElementById('input_id').value == "" && document.getElementById('id_check').value == "이미 사용하는 아이디 입니다." || document.getElementById('id_check').value == "사용 가능한 아이디 입니다."){
				document.getElementById('id_check').value = "";
			}
		});
	});
</script>
<script>
	$(function(){
		$('#create_pwd_check').blur(function(){
			if(document.getElementById('create_pwd_id').value != ""){
				if(document.getElementById('create_pwd_id').value == document.getElementById('create_pwd_check').value){
					document.getElementById('pwd_check_text').value = "비밀번호가 일치합니다.";
					$(".create_pwd_check").css("color", "green");
				}else {
					document.getElementById('pwd_check_text').value = "비밀번호가 일치하지 않습니다.";
					$(".create_pwd_check").css("color", "red");
				}
			}else{
				document.getElementById('pwd_check_text').value = "비밀번호를 입력하세요.";
				$(".create_pwd_check").css("color", "red");
				$("#create_pwd_id").focus();
			}
		});
	});
</script>
<script>
	$(function(){
		$('#create_pwd_id').blur(function(){
			if(document.getElementById('create_pwd_id').value != ""){
				if(document.getElementById('create_pwd_id').value == document.getElementById('create_pwd_check').value){
					document.getElementById('pwd_check_text').value = "비밀번호가 일치합니다.";
					$(".create_pwd_check").css("color", "green");
				}else {
					document.getElementById('pwd_check_text').value = "비밀번호가 일치하지 않습니다.";
					$(".create_pwd_check").css("color", "red");
				}
			}else{
				document.getElementById('pwd_check_text').value = "비밀번호를 입력하세요.";
				$(".create_pwd_check").css("color", "red");
				
			}
		});
	});
</script>
<script>
	function create_check(){
		if(document.getElementById('id_check').value == "사용 가능한 아이디 입니다."){
			if(document.getElementById('pwd_check_text').value == "비밀번호가 일치합니다."){
				if(document.getElementById('create_name_id').value != ""){
					if(document.getElementById('create_nick_id').value == ""){
						document.getElementById('create_nick_id').value = document.getElementById('input_id').value;
						document.getElementById('c_action').submit();
					}else{
						document.getElementById('c_action').submit();
					}
				}else{
					$("#create_name_id").focus();
				}
			}else{
				$("#create_pwd_id").focus();
			}
		}else{
			$("#input_id").focus();
		}
	}
</script>
<script>
function nick_example(){
	if(document.getElementById('create_nick_id').value == ""){
		if(document.getElementById('input_id').value == ""){
			document.getElementById('example_id').value = "example";
		}else{
			document.getElementById('example_id').value = document.getElementById('input_id').value;
		}
	}else{
		document.getElementById('example_id').value = document.getElementById('create_nick_id').value;
	}
}
</script>
<body>
<div class="createbox">
	<div>
		<h2>회원가입</h2>
		계정
	</div>
	<div style="margin-top:20px;">

	<%
	String imgsrc = "resources/imgs/account_person.png";
	%>
<form action="createaction.jsp" method="POST" id="c_action">
		<table>
			<tr>
				<td><input type="text" name="create_id" id="input_id" placeholder="아이디 account" class="create_text" style="width:240px; height:30px;"></td>
				<td rowspan="5" style="width:248px; display: table-cell; vertical-align: top;">
					<div class="create_imgbox">
						<div style="display:inline-block; width:80px; height:80px; border: 1px solid #dadce0; vertical-align: middle;">
							<img src="<%=imgsrc%>" style="width:100%; height:100%;">
						</div>
						<div>
							<input id="create_check" onClick="checkimg();" type="button" value="변경" class="create_imgchange">
						</div>
					</div>
				</td>
			</tr>
			<tr>
				<td><input type="text" id="id_check" class="create_id_check" style="margin-bottom: 20px" readonly="readonly" tabindex="-1"></td>
			</tr>
			<tr>
				<td><input type="password" name="create_pwd" id="create_pwd_id" placeholder="비밀번호 password" class="create_text" style="width:240px; height:30px;"></td>
			</tr>
			<tr style="height:10px">
			</tr>
			<tr>
				<td><input type="password" id="create_pwd_check" placeholder="비밀번호 확인" class="create_text" style="width:240px; height:30px;"></td>
			</tr>
			<tr>
				<td><input type="text" id="pwd_check_text" class="create_pwd_check" readonly="readonly" tabindex="-1"></td>
			</tr>
			<tr style="height:10px">
			</tr>
			<tr>
				<td><input type="text" name="create_name" id="create_name_id" placeholder="이름 name" class="create_text" style="width:240px; height:30px;"></td>
				<td rowspan="3" style="margin-left:20px;">
				<div style="margin-left:20px;">
				미리보기
				</div>
				<div style="margin-left:40px; margin-top: 20px">
					<img src="<%=imgsrc%>" style="width:20px; height:20px;">
					<input type="text" id="example_id" value="example" style="border:0px;" readonly="readonly" tabindex="-1">
				</div>
				</td>
			</tr>
			<tr style="height:10px">
			</tr>
			<tr>
				<td><input type="text" name="create_nick" id="create_nick_id" onkeyup="nick_example();" placeholder="닉네임 nickname" class="create_text" style="width:240px; height:30px;"></td>
			</tr>
		</table>
		<input type="hidden" value="<%=imgsrc%>" name="create_img">
</form>
		<input type="button" onclick="create_check();" value="제출" class="create_btn">
	</div>
</div>
</body>
</html>