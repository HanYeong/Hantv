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
<style>
	html, body {
			margin:0;
			height:100%;
			overflow: hidden;
			font-family:"나눔고딕";
	}
	
	ul, ol, li {
			list-style:none; margin:0; padding:0;
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
				width:100%; height:500px;
				background:#f2f4f7;
				box-shadow: 0px 2px 0px 0px #ced6e1;
				margin-bottom:2px;
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
				width:100%; margin-left: 65px;
				padding-top: 20px; text-align:left;
				font-size: 18px;
				color: #272727;
	}
	
	.contentsproduct {
				cursor:pointer;
				width:270px; height: 410px;
				background:white;
				margin-left: 15px; margin-right: 15px;
				display: inline-block;
				border: 1px solid #c9cbce;
				border-radius: 3px;
	}
	
	.contentsproduct:hover {
				background: #e5e5e5;
	}
	
	.logobox {
				width:240px; height:100%;
				color:skyblue;
				float: left;
	}
	
	input::-webkit-input-placeholder { text-align:right; }
	input::-moz-placeholder { text-align:right; }
	input:-ms-input-placeholder { text-align:right; }
	input:-moz-placeholder { text-align:right; }
	input::placeholder { text-align:right; }
	
	.searchbox {
				width:400px; height:100%;
				float: left;
	}
	
	.accountbox {
				cursor:pointer;
				width:220px; height:100%;
				line-height:60px;x
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
				height: 100%;
				border: 0px;
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
	
	.hottitlebox {
				width: 100%; height: 50%; float: left;
				font-size:17px;
	}
	
	.hotdatebox {
				width: 100%; height: 20%; float: left;
				font-size:14px; color:#767676;
	}
	
	.hotnickbox {
				width:65%; height:100%; float: right; line-height: 35px;
				vertical-align: middle;
				font-size:15px;
	}
	
	.hotviewbox {
				width: 50%; height: 30%; float: right;
				line-height: 35px; vertical-align: middle; text-align: right;
				font-size:14px; color:#767676;
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

	String login_nick = "";
	String login_img = "";

	String login_state_yes = "display:none;";
	String login_state_no = "display:none;";
%>
<%
Connection conn=null;
PreparedStatement pstmt = null;
ResultSet rs = null;

int hotcnt = 0;
int postcnt = 0;

String[] hottitle = new String[5];
String[] hotusernick = new String[5];
String[] hotuserimgsrc = new String[5];
String[] hotcomment = new String[5];
String[] hotvideoname = new String[5];
String[] hotdate = new String[5];
int[] idsrc = new int[5];
int[] hotviewcnt = new int[5];

String[] posttitle = new String[5];
String[] postusernick = new String[5];
String[] postuserimgsrc = new String[5];
String[] postcomment = new String[5];
String[] postdate = new String[5];
int[] postidsrc = new int[5];
int[] postviewcnt = new int[5];

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
	
	String sql = "select * from video_db order by viewcnt desc";
	pstmt = conn.prepareStatement(sql);
	rs = pstmt.executeQuery();
	
	for(int i = 0; i<4;i++){
		if(rs.next()){
			hottitle[i] = rs.getString("vtitle");
			hotusernick[i] = rs.getString("usernick");
			hotuserimgsrc[i] = rs.getString("userimgsrc");
			hotcomment[i] = rs.getString("comment");
			hotvideoname[i] = rs.getString("videoname");
			hotviewcnt[i] = rs.getInt("viewcnt");
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy. MM. dd");
			hotdate[i] = sdf.format(rs.getTimestamp("signdate"));
			idsrc[i] = rs.getInt("cid");			
			hotcnt += 1;
		}
	}
	
	sql = "select * from post_db order by viewcnt desc";
	pstmt = conn.prepareStatement(sql);
	rs = pstmt.executeQuery();
	
	for(int i = 0; i<4;i++){
		if(rs.next()){
			posttitle[i] = rs.getString("ptitle");
			postusernick[i] = rs.getString("usernick");
			postuserimgsrc[i] = rs.getString("userimgsrc");
			postcomment[i] = rs.getString("comment");
			postviewcnt[i] = rs.getInt("viewcnt");
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy. MM. dd");
			postdate[i] = sdf.format(rs.getTimestamp("signdate"));
			postidsrc[i] = rs.getInt("cid");			
			postcnt += 1;
		}
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
			<img src="resources/imgs/home_selected.png">
		</div>
		<div style="color: #4c8fff; float:left;">
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

<div style="overflow: auto; width:100%-240px; height:100%;">

	<div class="contentstab1">
			<div class="contentstag">
				인기 동영상
			</div>
			<div style="margin-top:20px; margin-left: 50px; display: inline-block;">
			<% 
				for(int i=0; i<hotcnt; i++){
					%>
						<div class="contentsproduct" OnClick="location.href='watch.jsp?video=<%=idsrc[i]%>'">
					<div style="background:#1f1f1f; width: 100%; height: 260px; float: left;">
						<div style="background:black; width: 100%; height: 151px; float: left; margin-top: 50.5px;">
							<video src="./resources/contents/videos/<%=hotvideoname[i]%>#t=5" onmouseover="this.play()" onmouseout="this.pause(), this.currentTime = 5.0" class="videocontents" type="video/mp4" muted="muted">
							</video>
						</div>
					</div>
					<div style="width:100%; height:150px; text-align:left; float: left;">
						<div style="width:100%-40px; height: 110px; margin:20px;">
							<div class="hottitlebox">
								<%=hottitle[i]%>
							</div>
							<div class="hotdatebox">
								<%=hotdate[i] %>
							</div>
							<div style="width: 50%; height: 30%; float: left;">
								<div class="hotnickbox">
									<%=hotusernick[i] %>
									</div>
								<div style="width: 30px; height: 30px; border-radius: 50%; border:1.9px solid #cfd1d4; line-height:30px; background-image: url('<%=hotuserimgsrc[i] %>'); background-repeat: no-repeat; background-size: 30px 30px;">
								</div>
							</div>
							<div class="hotviewbox">
								조회수 <%=hotviewcnt[i] %> 회
							</div>
						</div>
					</div>
				</div>
					<%
				}
			%>
			</div>
	</div>

		<div class="contentstab2">
			<div class="contentstag" style="margin-bottom: 20px;">
				인기 게시글
			</div>
			<div style="width:1320px; height:410px; margin:auto; margin-left:245px;">
			<% 
				for(int i=0; i<postcnt; i++){
					%>
						<div class="contentsproduct" OnClick="location.href='post.jsp?post=<%=postidsrc[i]%>'">
					<div style="width:100%; height:150px; text-align:left; float: left;">
						<div style="width:100%-40px; height: 110px; margin:20px;">
							<div class="hottitlebox" style="font-size: 16pt;">
								<%=posttitle[i]%>
							</div>
							<div style="width: 100%; height: 260px; float: left; border-top: 1px solid #c9cbce;">
								<div style="width: 100%; height: 240px; float: left; margin-top: 20px; font-size: 13pt; color:#767676;">
									<%=postcomment[i] %>
								</div>
							</div>
							<div class="hotdatebox">
								<%=postdate[i] %>
							</div>
							<div style="width: 50%; height: 30%; float: left;">
								<div class="hotnickbox">
									<%=postusernick[i] %>
									</div>
								<div style="width: 30px; height: 30px; border-radius: 50%; border:1.9px solid #cfd1d4; line-height:30px; background-image: url('<%=postuserimgsrc[i] %>'); background-repeat: no-repeat; background-size: 30px 30px;">
								</div>
							</div>
							<div class="hotviewbox">
								조회수 <%=postviewcnt[i] %> 회
							</div>
						</div>
					</div>
				</div>
					<%
				}
			%>
			</div>
	</div>
	
		<div class="contentstab1">
			
		</div>
</div>





</body>
</html>
