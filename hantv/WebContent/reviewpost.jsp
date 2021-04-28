<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
<link href="http://vjs.zencdn.net/c/video-js.css" rel="stylesheet">
<script src="http://vjs.zencdn.net/c/video.js"></script>
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
	
	
	.videotitle {
				width: 100%; height: 50px;
				font-size:16px;
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
	
	.watchbox {
				background:white; width: 960px;
				height: 100%; margin: auto;
				padding:20px; margin-top: 20px;
	}
	
	.watchtitle {
				width:100%; height:30px;
				margin-bottom: 20px; font-size:18px;
	}
	
	.watchcomment {
				width: 100%; height: auto;
				color:#525252; font-size:16px;
				margin-top: 20px; margin-bottom: 20px;
	}
	
	.watchdate {
				width: 100%; height: 20px; color: #767676;
				font-size:14px; line-height: 20px;
				vertical-align: middle;
	}
	
	.watchview {
				width: 100%; height: 20px; color: #767676; font-size:14px;
				line-height: 20px; vertical-align: middle; margin-bottom: 10px;
	}
	
	.watchthumbs-no {
				cursor:pointer;
				width: 70px; height: 30px; color: #767676; font-size:14px;
				line-height: 30px; vertical-align: middle; margin-bottom: 20px;
				text-align : center;
				border-radius: 3px;
				color: white;
				background: gray;
	}
	
	.watchthumbs-yes {
				cursor:pointer;
				width: 70px; height: 30px; color: #767676; font-size:14px;
				line-height: 30px; vertical-align: middle; margin-bottom: 20px;
				text-align : center;
				border-radius: 3px;
				color: red;
				border:1px solid red;
	}
	
	.thumbsbtn {
				
	}
	
	.watchuserbox {
				width: 100%; height: 60px; line-height: 40px;
				vertical-align: middle;
				border-bottom:1px solid #c9cbce;
	}
	
	.watchuserimg {
				float:left; width: 30px; height: 30px; border-radius: 50%; border:1.9px solid #cfd1d4;
				background-repeat: no-repeat; background-size: 30px 30px;
	}
	
	.comment_btn {
				width:80px; height:40px;
				margin-top: 10px;
				background-color:#0068ff;
				border:0px;
				border-radius: 2px;
				color:white;
				float: right;
	}
	
	.watchcommentlist {
				width: 100%; height:auto;
				margin-top: 50px;
				border-top:1px solid #c9cbce;
	}
	
	.threadcomment {
				width:100%; height:auto; margin-top: 10px;
				color:#525252; font-size:16px;
				float: left;
	}
	
	.threaddate {
				width:100%; height:30px; margin-top: 10px;
				color: #767676; font-size:14px; 
				float: left;
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
	
	.dropvideobox {
				cursor:pointer;
				width: 60px; height: 30px; color: #767676; font-size:14px;
				line-height: 30px; vertical-align: middle; margin-bottom: 0px;
				text-align : center;
				border-radius: 3px;
				color: #0068ff;
				float: right;
				border: 1px solid #0068ff;
	}
	
	.dropvideobox:hover {
				cursor:pointer;
				width: 60px; height: 30px; color: #767676; font-size:14px;
				line-height: 30px; vertical-align: middle; margin-bottom: 0px;
				text-align : center;
				border-radius: 3px;
				color: white;
				background:#0068ff;
				float: right;
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
<script>
	function delete_contents() {
		$idhidden = document.getElementById('videoidhidden').value;
		if(confirm("정말로 삭제하시겠습니까?")){
			location.href='./deleteaction.jsp?videoid='+$idhidden;
		}else{
			return false;
		}
	}
</script>
</head>
<body>
<%
	String idv = request.getParameter("hidden_name");
	String videoid = request.getParameter("review");
	
	
	
	if(videoid == null){
		response.sendRedirect("main.jsp");
	}
	if(idv != null){
		session.setAttribute("id_login", idv);
	}
	String id_login = (String)session.getAttribute("id_login");

	String login_nick = "";
	String login_img = "";

	String login_state_yes = "display:none;";
	String login_state_no = "display:none;";
	
	String comment_login_state = "";
	String comment_login_state_btn = "";
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
		comment_login_state = "placeholder='댓글을 작성하세요.'";
		comment_login_state_btn = "display:yes;";
	}else{
		login_state_yes = "display:none;";
		login_state_no = "display:block;";
		comment_login_state = "placeholder='로그인 후 작성이 가능합니다.' readonly='readonly'";
		comment_login_state_btn = "display:none;";
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
<%
conn=null;
pstmt = null;
rs = null;

String videoTitle = "";
String videoUser = "";
String videoDate = "";
String videoComment = "";
String videoSrc = "";
int videoView = 0;
int videoThumbs = 0;

String VMnick = "";
String VMimgSrc = "";

String thumbsCheck = "";

String dropCheck = "";


try{
	String driverName = "com.mysql.cj.jdbc.Driver";
	String jdbcUrl = "jdbc:mysql://localhost:3306/han_db?serverTimezone=Asia/Seoul";
	String dbId="guestid2019";
	String dbPass="guestpwd2019";
	
	Class.forName("com.mysql.cj.jdbc.Driver");
	conn = DriverManager.getConnection(jdbcUrl, dbId, dbPass);

	String sql = "select * from review_db where cid = '" + videoid + "'";
	pstmt = conn.prepareStatement(sql);
	rs = pstmt.executeQuery();

	if(rs.next()){
		videoTitle = rs.getString("vtitle");
		videoUser = rs.getString("userid");
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy년 MM월 dd일 hh:mm:ss");
		videoDate = sdf.format(rs.getTimestamp("signdate"));
		videoComment = rs.getString("comment");
		videoSrc = rs.getString("videoname");
		videoView = rs.getInt("viewcnt");
		videoThumbs = rs.getInt("thumbscnt");
		
		sql = "update review_db set viewcnt = viewcnt+1 where cid = '"+videoid+"'";
		pstmt = conn.prepareStatement(sql);	// 쿼리문 수행할 객체 생성
		pstmt.executeUpdate();
	}else{
		out.print("비디오 불러오지 못함");
	}
	
	sql = "select * from account_db where user_id = '"+videoUser+"'";
	pstmt = conn.prepareStatement(sql);
	rs = pstmt.executeQuery();
	
	if(rs.next()){
		VMnick = rs.getString("user_nick");
		VMimgSrc = rs.getString("user_img");
		
		
		if(videoUser.equals(id_login)){
			dropCheck = "style='display:block;'";
		}else{
			dropCheck = "style='display:none;'";
		}
		
	}else{
		out.print("계정 불러오지 못함");
	}

		thumbsCheck = "watchthumbs-no";

	
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
<div style="overflow: auto; width:100%-240px; height:100%; background: #f2f4f7;">
	<div class="watchbox">
		<div class="watchtitle">
			<%=videoTitle %>
		</div>
		<div style="width:100%; height: 540px;">
		<iframe src="<%=videoSrc %>" class="video-js vjs-default-skin" style="width:100%; height:100%; float:left; border:0px;" type="video/mp4">
		</iframe>
		</div>
		<div class="watchcomment">
		 	<%=videoComment %>
		</div>
		<div class="watchdate">
			<%=videoDate %>
		</div>
		<div class="dropvideobox" <%=dropCheck %> onclick="delete_contents();">
			삭 제
		</div>
		<div class="watchview">
			조회수 <%=videoView %>회 ㆍ 좋아요 <%=videoThumbs %>
		</div>
		<div class="<%=thumbsCheck%>" OnClick="location.href='thumbsaction.jsp?userid=<%=id_login%>&cid=<%=videoid%>'" style="<%=comment_login_state_btn%>"">
			좋아요
		</div>
		<div class="watchuserbox">
			<div class="watchuserimg" style="background-image: url('<%=VMimgSrc %>');">	
			</div>
			<div style="margin-left: 10px; float: left;">
				<%= VMnick %>
			</div>
		</div>
		<div>
			<form method="post" action="commentreviewaction.jsp">
			<input type="text" name="CMtext" <%=comment_login_state %> style="width: 85%; height: 50px; margin-left: 30px; border: 0px;">
			<input type="submit" value="제출" class="comment_btn" style="<%=comment_login_state_btn%>">
			<input type="hidden" id="videoidhidden" name="videoid" value="<%=videoid%>">
			<input type="hidden" name="CMid" value="<%=id_login%>">
			<input type="hidden" name="CMnick" value="<%=login_nick%>">
			<input type="hidden" name="CMimgsrc" value="<%=login_img%>">
			</form>
		</div>
		<div class="watchcommentlist">
		</div>
	</div>
	
	<%
conn=null;
pstmt = null;
rs = null;

try{
	String driverName = "com.mysql.cj.jdbc.Driver";
	String jdbcUrl = "jdbc:mysql://localhost:3306/han_db?serverTimezone=Asia/Seoul";
	String dbId="guestid2019";
	String dbPass="guestpwd2019";
	
	Class.forName("com.mysql.cj.jdbc.Driver");
	conn = DriverManager.getConnection(jdbcUrl, dbId, dbPass);

	String sql = "select * from comment_review_db where videocid = '" + videoid + "' order by signdate desc";
	pstmt = conn.prepareStatement(sql);
	rs = pstmt.executeQuery();
	while(rs.next()){
		String CMnick = rs.getString("usernick");
		String CMimgsrc = rs.getString("userimg");
		String CMcomment = rs.getString("comment");
		%>
		<div style="width: 960px; height: 200px; margin:auto; background: white; padding-left: 20px; padding-right: 20px;">
			<div style="width: 100%; height: 40px;">
				<div class="watchuserimg" style="background-image: url('<%=CMimgsrc %>');">	
				</div>
				<div style="margin-left: 10px; float: left; line-height: 40px; vertical-align: bottom;">
					<%= CMnick%>
				</div>
				
			</div>
			<div class="threadcomment">
					<%= CMcomment%>
			</div>
			<div class="threaddate">
					<%
					SimpleDateFormat sdf = new SimpleDateFormat("yyyy년 MM월 dd일 hh:mm:ss");
					String CMvideoDate = sdf.format(rs.getTimestamp("signdate"));
					out.println(CMvideoDate);
					%>
			</div>
		</div>
		<%	
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
</div>


</body>
</html>