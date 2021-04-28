<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.sun.org.apache.xerces.internal.impl.dv.dtd.NMTOKENDatatypeValidator"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Hantube</title>
<style>
	html, body {
			margin:0;
			height:100%;
			overflow: hidden;
			font-family:"나눔고딕";
	}
	
	img {
			max-width:100%; max-height:100%;
            vertical-align:middle;
	}
	
	.maintab {
				width:100%; height:60px; background:#ffffff;
				box-shadow: 0px 2px 4px 0px #ced6e1;
				margin-bottom:2px;
	}
	
	.menutab {
				border-right:2px solid #c9cbce;
				width:240px; height:100%;
				background:#ffffff;
				float: left;
	}
	
	.menucontents {
				cursor:pointer;
				width:100%; height:40px;
				line-height:40px;
				vertical-align:middle;
				color:#474747;
				font-weight:normal;
				font-size:21px;
	}
	
	.menucontents:hover {
				background-color:#e5e5e5;
	}
	
	.menucontents-icon {
				width:30px; height:40px;
				margin-left:20px;
				margin-right:20px;
				float:left;
	}
	
	
	.contentstab1 {
				width:100%; height:auto;
				text-align: center;
	}
	.contentstab2 {
				width:100%; height:500px;
				background:#ffffff;
				box-shadow: 0px 2px 0px 0px #ced6e1;
				margin-bottom:2px;
	}
	
	.contentstag {
				display: inline-block;
				width:50%;
				padding-top: 20px; padding-bottom:20px; text-align:left;

				font-size: 18px;
				color: #595959;
	}
	
	.videobox {
				width:50%; height: 100%;
				border:1px solid #c9cbce;
				border-radius:3px;
				background: white;
				margin: auto;
	}
	
	.contentsproduct {
				width:270px; height: 410px;
				background:white;
				margin-left: 15px; margin-right: 15px;
				display: inline-block;
				border: 1px solid #c9cbce;
				border-radius: 3px;
	}
	
	.logobox {
				width:240px; height:100%;
				color:skyblue;
				float: left;
	}
	
	input::-webkit-input-placeholder { text-align:left; }
	input::-moz-placeholder { text-align:left; }
	input:-ms-input-placeholder { text-align:left; }
	input:-moz-placeholder { text-align:left; }
	input::placeholder { text-align:left; }
	
	.searchbox {
				width:400px; height:100%;
				float: left;
	}
	
	.accountbox {
				cursor:pointer;
				width:220px; height:100%;
				line-height:60px;
				vertical-align:middle;
				float: right;
	}
	
	.accountmenubox {
				width:320px; height:100%;
				float: right;
				line-height:60px;
				vertical-align:middle;
				text-align:center;
				font-size: 14pt;
				color: #434343;
	}
	
	.accountmenucontents {
				cursor:pointer;
				width:80px; height: 100%;
				float: right; vertical-align: middle;
	}
	
	.accountmenucontents:hover {
				color: #4c8fff;
	}
	
	
	.logocontents {
				padding-left: 20px; padding-top: 15px;
	}
	
	.searchcontents {
				position:relative;
				top:10px;
				width:340px; height:35px;
				border:1px solid #0068ff;	
				border-radius:45px;
				line-height: 35px;
				vertical-align: middle;
	}
	input:focus { outline: none;  }
	
	.accountcontents {
				cursor:pointer;
				width:100px; height:42px;
				line-height: 42px;
				border:1.3px solid #095bb7;
				color:#0046af;
				border-radius:3px;
				margin-left: 10px;
				margin-right: 40px;
				margin-top: 6px;
				background-color:white;
				vertical-align: middle;
				font-size:18px;
				float:right;
	}
	
	.accountcontents img {
				display: inline;
	}
	.accountcontents img.over {
				display: none;
	}
	.accountcontents:hover img {
				display: none;
	}
	.accountcontents:hover img.over {
				display: inline;
	}
	
	.accountcontents:hover {
				cursor:pointer;
				width:100px; height:42px;
				line-height: 42px;
				border:1px solid #095bb7;
				color:#ffffff;
				border-radius:3px;
				margin-left: 10px;
				margin-right: 40px;
				margin-top: 6px;
				background-color:#095bb7;
				vertical-align: middle;
				font-size:18px;
				float:right;
	}
	
	.videocontents {
				width: 100%; float: left;
				border: 0px;
	}
	
	.videotitle {
				width: 100%; height: 50px;
				font-size:17px;
	}
	
	.videocomment {
				width: 100%; height: 50px;
				font-size:15px;
				color:#525252;
				margin-top:3px;
				margin-bottom: 7px;
	}
	
	.videodate {
				width: 100%; height: 20px;
				line-height:20px;
				font-size:14px;
				color:#767676;
				vertical-align:middle;
	}
	
	.videouser {
				width: 100%; height: 50px;
				font-size:15px;
				color:black;
				line-height:50px;
				vertical-align: middle;
	}
	
	.totalvideo {
				width:100%; height:180px; margin-top:20px;
				margin-bottom: 20px;
	}
	
	.totalvideo:hover {
				width:100%; height:180px; margin-top:20px;
				margin-bottom: 20px;
				background:#e5e5e5;
	}
	
	.uploadbox {
				width: 930px; height: 70px; margin:auto;
				margin-top:30px;
				padding-top:20px;
				padding-left:30px;
				background:white;
	}
	
	.uploadbox label {
				display: inline-block;
				padding: .5em .75em;
				color: #fff;
				font-size: inherit;
				line-height: normal;
				vertical-align: middle;
				background-color: #5cb85c;
				cursor: pointer;
				border: 1px solid #4cae4c;
				border-radius: .25em;
				-webkit-transition: background-color 0.2s;
				transition: background-color 0.2s;
	}

	.uploadbox label:hover {
				background-color: #6ed36e;
	}

	.uploadbox label:active {
				background-color: #367c36;
	}

	.uploadbox input[type="file"] {
				position: absolute;
				width: 1px; height: 1px;
				padding: 0; margin: -1px;
				overflow: hidden;
				clip: rect(0, 0, 0, 0);
				border: 0;
	}
	
	.uploadresult {
				cursor:pointer;
				width:80px; height:40px;
				background-color:#0068ff;
				border:0px;
				border-radius: 2px;
				color:white;
				float: right;
	}
	
	.uploadcancel {
				cursor:pointer;
				width:80px; height:40px;
				background-color:#ffffff;
				border:1px solid #0068ff;
				border-radius: 2px;
				color:#0068ff;
				float: right;
	}
	
	.accountdropmenubox {
				width: 160px; height: 100px; background: white;
				position: absolute; text-align:center;
				border:1px solid #c9cbce;
				display: none;
				font-size:18px;
				color: #595959;
	}
	
	.dropmenureplace {
				cursor:pointer;
				width: 100%; height: 50px; float: left;
				line-height: 50px;
				vertical-align: middle;
	}
	
	.dropmenureplace:hover {
				width: 100%; height: 50px; float: left;
				background: #e5e5e5;
	}
	
	.dropmenulogout {
				cursor:pointer;
				width: 100%; height: 50px; float: left;
				line-height: 50px;
				vertical-align: middle;
	}
	
	.dropmenulogout:hover {
				width: 100%; height: 50px; float: left;
				background: #e5e5e5;
	}
	
	.insertdropmenubox {
				width: 160px; height: 150px; background: white;
				position: absolute; text-align:center;
				border:1px solid #c9cbce;
				display: none;
				font-size:18px;
				color: #595959;
	}
	
	.dropmenuvideo {
				cursor:pointer;
				width: 100%; height: 50px; float: left;
				line-height: 50px;
				vertical-align: middle;
	}
	
	.dropmenuvideo:hover {
				width: 100%; height: 50px; float: left;
				background: #e5e5e5;
	}
	
	.dropmenureview {
				cursor:pointer;
				width: 100%; height: 50px; float: left;
				line-height: 50px;
				vertical-align: middle;
	}
	
	.dropmenureview:hover {
				width: 100%; height: 50px; float: left;
				background: #e5e5e5;
	}
	
	.dropmenupost {
				cursor:pointer;
				width: 100%; height: 50px; float: left;
				line-height: 50px;
				vertical-align: middle;
	}
	
	.dropmenupost:hover {
				width: 100%; height: 50px; float: left;
				background: #e5e5e5;
	}
	
</style>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
	function accountdropmenu() {
		if(document.getElementById('account_checkdropmenustate').value == 1){
			$(".accountdropmenubox").css("display", "block");
			document.getElementById('account_checkdropmenustate').value = 2;
		}else{
			$(".accountdropmenubox").css("display", "none");
			document.getElementById('account_checkdropmenustate').value = 1;
		}
	}
</script>
<script>
	function insertdropmenu() {
		if(document.getElementById('insert_checkdropmenustate').value == 1){
			$(".insertdropmenubox").css("display", "block");
			document.getElementById('insert_checkdropmenustate').value = 2;
		}else{
			$(".insertdropmenubox").css("display", "none");
			document.getElementById('insert_checkdropmenustate').value = 1;
		}
	}
</script>
</head>
<body>
<%
	String idv = request.getParameter("hidden_name");
	if(idv != null){
		session.setAttribute("id_login", idv);
	}
	
	
	String id_login = (String)session.getAttribute("id_login");
	
	if(id_login == null){
		response.sendRedirect("main.jsp");
	}

	String login_nick = "";
	String login_img = "";

	String login_state_yes = "display:none;";
	String login_state_no = "display:none;";
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

	if(id_login != null){
		String sql = "select * from account_db where user_id = '" + id_login + "'";
		pstmt = conn.prepareStatement(sql);
		rs = pstmt.executeQuery();
		if(rs.next()){
			login_nick = rs.getString("user_nick");
			login_img = rs.getString("user_img");
		}
		
	}
	
}catch(Exception e){
	e.printStackTrace();
	out.print("실패");
}finally{
	if(conn != null)
		try{conn.close();}catch(SQLException sqle){}
	if(pstmt != null)
		try{conn.close();}catch(SQLException sqle){}
	if(rs != null)
		try{conn.close();}catch(SQLException sqle){}
}
%>
<%
	if(id_login != null){
		login_state_yes = "display:block;";
		login_state_no = "display:none;";
	}else{
		login_state_yes = "display:none;";
		login_state_no = "display:block;";
	}

%>

<div class="maintab">
	<div class="logobox">
		<div class="logocontents">
			<img src="resources/imgs/hantv.png" OnClick="location.href='main.jsp'" style="cursor:pointer;">
		</div>
	</div>
	
	<div class="searchbox">
		<div class="searchcontents">
				<div style="margin-left:10px;">
					<a href="#"><img src="resources/imgs/search_btn.png"></a>
					<input type="text" placeholder="검색" style="width:290px; border:none;">
				</div>
		</div>
	</div>
	<div class="accountbox" style="<%=login_state_no%>">
		<div class="accountcontents" OnClick="location.href='login.jsp'">
			<div style="margin-left:10px;">
				로그인
				<img src="resources/imgs/login_btn.png">
				<img src="resources/imgs/login_btn_rollover.png" class="over">
			</div>
		</div>
	</div>
	<div class="accountbox" style="<%=login_state_yes%>" onclick="accountdropmenu();">
		<div style="border-left:1px solid #dcdddf; width:100px; height:100%; padding-left:20px; float: left; text-align: right;">
			<%=login_nick %>
			<div class="accountdropmenubox">
				<form>
					<input type="hidden" id="account_checkdropmenustate" value="1">
				</form>
					<div class="dropmenureplace" OnClick="location.href='#'">
						계정수정
					</div>
					<div class="dropmenulogout" OnClick="location.href='logout.jsp'">
						로그아웃
					</div>
			</div>
		</div>
		<div style="width:40px; height:40px; margin-right:40px; float: right;">
			<img src="<%=login_img%>" style="width:40px; height:40px;">
		</div>
	</div>
	<div class="accountmenubox" style="<%=login_state_yes%>">
		<div class="accountmenucontents" style="margin-left: 10px; margin-right: 20px;">
		내채널
		</div>
		<div class="accountmenucontents" style="margin-right: 10px;" onclick="insertdropmenu();">
		올리기
			<div class="insertdropmenubox">
				<form>
					<input type="hidden" id="insert_checkdropmenustate" value="1">
				</form>
					<div class="dropmenuvideo" OnClick="location.href='uploadvideo.jsp'">
						동영상
					</div>
					<div class="dropmenureview" OnClick="location.href='review.jsp'">
						동영상 리뷰
					</div>
					<div class="dropmenupost" OnClick="location.href='uploadpost.jsp'">
						게시글
					</div>
			</div>
		</div>
	</div>
</div>


<div class="menutab">
	<div style="width:100%; height:10px;">
	
	</div>
	
	<div class="menucontents" OnClick="location.href='main.jsp'">
		<div class="menucontents-icon">
			<img src="resources/imgs/home_normal.png">
		</div>
		<div style="float:left;">
			홈
		</div>
	</div>
	
	<div class="menucontents" OnClick="location.href='video.jsp'">
		<div class="menucontents-icon">
			<img src="resources/imgs/hot_normal.png">
		</div>
		<div style="float:left;">
			동영상
		</div>
	</div>
	
	<div class="menucontents" OnClick="location.href='review.jsp'">
		<div class="menucontents-icon">
			<img src="resources/imgs/review_normal.png">
		</div>
		<div style="float:left;">
			동영상 리뷰
		</div>
	</div>
	
	<div class="menucontents" OnClick="location.href='board.jsp'">
		<div class="menucontents-icon">
			<img src="resources/imgs/text_normal.png">
		</div>
		<div style="float:left;">
			게시글
		</div>
	</div>

</div>

<div style="overflow: auto; width:100%-240px; height:100%; background: #f2f4f7;">
	<div style="width: 100%; height: 50px; border-bottom:1px solid #c9cbce;">
		<div style="width: 960px; height: 100%; margin: auto; line-height: 50px; vertical-align: middle; font-size: 22px; color: #595959;">
		업로드
		</div>
	</div>
<form method="post" action="uploadpostaction.jsp">
	<div style="width: 960px; height: 450px; background: white; margin: auto;">
		<div style="width: 900px; height: 50px; margin-left:30px; margin-top:30px; float: left;">
			<input type="text" placeholder="제목을 입력하세요." name="uploadtitle" style="width: 100%; height: 100%; border:1px solid #c9cbce; border-radius: 3px;">
		</div>
		<div style="width: 897px; height: 300px; margin-left:30px; margin-top:30px; float: left;">
			<textarea name="uploadtext" style="width: 100%; height: 100%; resize: none; border:1px solid #c9cbce; border-radius: 3px;"></textarea>
		</div>
	</div>
		<div style="width: 960px; height: 100px; margin: auto; margin-top: 30px; line-height:100px; background:white; vertical-align: middle;">
			<div style="width: 100%; height: 40px; margin-top: 30px; float: left;">
				<input type="submit" value="제 출" class="uploadresult" style="margin-left: 20px; margin-right: 20px;">
				<input type="reset" value="취 소" class="uploadcancel">
			</div>
		</div>
</form>
	
</div>

</body>
</html>