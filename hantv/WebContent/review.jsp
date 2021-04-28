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
				font-size: 22px;
				color: #595959;
	}
	
	.contentstypebox {
				display: inline-block;
				width:50%; height:50px;
				text-align:left;
				background:white;
				border:1px solid #c9cbce;
				border-radius:3px;
				font-size: 18px;
				color: #595959;
				margin-bottom: 20px;
				line-height: 50px;
				vertical-align: middle;
				text-align: center;
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
				height:100%;
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
				cursor:pointer;
				width:100%; height:180px; margin-top:20px;
				margin-bottom: 20px;
	}
	.totalvideo:hover {
				width:100%; height:180px; margin-top:20px;
				margin-bottom: 20px;
				background:#e5e5e5;
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
	
	.videocntbox {
				text-align: right;float: right; padding-right: 20px;
				font-size:14px;
				color:#767676;
	}
	
	.videouserimg {
				margin-top:8px;
				float:left; width: 30px; height: 30px; border-radius: 50%; border:1.9px solid #cfd1d4;
				background-repeat: no-repeat; background-size: 30px 30px;
	}
	
	.sorttypebox {
				cursor:pointer;
				width: 100px; height: 100%; float: left;
				font-size:15px;
				color:#767676;
	}
	
	.sorttypebox:hover {
				cursor:pointer;
				width: 100px; height: 100%; float: left;
				font-size:15px;
				color:#767676;
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
	String sorttype = request.getParameter("sort");
	if(sorttype == null){
		sorttype = "1";
	}
	int sortcnt = Integer.parseInt(sorttype);
	
	String sortNew = "";
	String sortView = "";
	String sortThumbs = "";
	
	if(sortcnt == 1){
		sortNew = "style='border-bottom:2px solid #3eff39; color:#08ce03;'";
	}
	
	if(sortcnt == 2){
		sortView = "style='border-bottom:2px solid #3eff39; color:#08ce03;'";
	}
	
	if(sortcnt == 3){
		sortThumbs = "style='border-bottom:2px solid #3eff39; color:#08ce03;'";
	}
%>

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
					<div class="dropmenurepost" OnClick="location.href='uploadpost.jsp'">
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
			<img src="resources/imgs/review_selected.png">
		</div>
		<div style="color: #4c8fff; float:left;">
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
conn = null;
pstmt = null;
rs = null;
int numPage = 4;
double pageBlock = 3;
double totalRecord = 0;
double totalPage = 0;
double totalBlock = 0;
String Pagecnt = request.getParameter("Page");
double Page = 0;
int first = 0;
int block = 0;
double firstPage = 0;
double lastPage = 0;
double articleNum = 0;
double articleResult = 0;


Timestamp nowdate = new Timestamp(System.currentTimeMillis());


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
	
	String sql = "select count(cid) from review_db";
	pstmt = conn.prepareStatement(sql);	// 쿼리문 수행할 객체 생성
	rs = pstmt.executeQuery();
	
	if(rs.next()){
		totalRecord = rs.getInt("count(cid)");
		totalPage = Math.ceil(totalRecord/numPage);
		totalBlock = Math.ceil(totalPage/pageBlock);
	}else{
		totalRecord = 0;
		out.print("페이지가 없습니다.");
	}
	
	if(Pagecnt != null){
		Page = Integer.parseInt(Pagecnt);
	}else{
		Page = 1;
	}
	
	first = numPage*(int)(Page-1);
	block = (int)Math.ceil(Page/pageBlock);
	firstPage = (block-1)*pageBlock;
	lastPage = block*pageBlock;
	
	if(block >= totalBlock){
		lastPage = totalPage;
	}
	
	articleNum = totalRecord - numPage*(Page-1);
	if(sortcnt == 1){
		sql = "select * from review_db ORDER BY signdate desc, cid desc LIMIT "+first+", "+numPage;
	}else if(sortcnt == 2){
		sql = "select * from review_db ORDER BY viewcnt desc, cid desc LIMIT "+first+", "+numPage;
	}else{
		sql = "select * from review_db ORDER BY thumbscnt desc, cid desc LIMIT "+first+", "+numPage;
	}
	pstmt = conn.prepareStatement(sql);
	rs = pstmt.executeQuery();
	%>
<div style="overflow: auto; width:100%-240px; height:100%; background: #f2f4f7;">

	<div class="contentstab1">
			<div class="contentstag">
				리뷰
			</div>
			<div class="contentstypebox">
				<div class="sorttypebox" <%=sortNew %> OnClick="location.href='review.jsp?sort=1'">
					최신순
				</div>
				<div class="sorttypebox" <%=sortView %> OnClick="location.href='review.jsp?sort=2'">
					조회순
				</div>
				<div class="sorttypebox" <%=sortThumbs %> OnClick="location.href='review.jsp?sort=3'">
					인기순
				</div>
			</div>
			<div class="videobox">
				<%
					while(rs.next()){
						%>
						<div class="totalvideo" OnClick="location.href='reviewpost.jsp?review=<%=rs.getString("cid")%>'">
							<div style="width:320px; height: 100%; float: left; background: #1f1f1f;">
							<iframe src="<%=rs.getString("videoname") %>#t=5" onmouseover="this.play()" onmouseout="this.pause(), this.currentTime = 5.0" class="videocontents" type="video/mp4" muted="muted">
							</iframe>
							</div>
							<div style="width:20px;height: 100%; float: left;">
								
							</div>
							<div style="width:100%; height: 100%;text-align: left;">
								<div class="videotitle">
									<%=rs.getString("vtitle") %>
								</div>
								<div class="videocomment">
									<%=rs.getString("comment") %>
								</div>
								<div class="videodate">
									<%
									SimpleDateFormat sdf = new SimpleDateFormat("yyyy. MM. dd");
									String videoDate = sdf.format(rs.getTimestamp("signdate"));
									out.println(videoDate);
									%>
								</div>
								<div class="videouser">
									<div class="videouserimg" style="background-image: url('<%=rs.getString("userimgsrc")%>');">	
									</div>
									<div style="margin-left: 10px; float: left;">
										<%= rs.getString("usernick")%>
									</div>
									<div class="videocntbox">조회수 <%=rs.getInt("viewcnt") %>ㆍ좋아요 <%=rs.getInt("thumbscnt") %></div>
								</div>
							</div>
						</div>
						<%
						articleNum--;
					}
				%>

<%
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
	
	</div>
	<div style="width:50%; height: 200px; margin: auto; text-align: center; line-height:100px; vertical-align: middle;">
		<%
		double myPage = 0;
		int directPage = 0;
			if(block > 1){
				myPage = firstPage;
				%>
				<a href="review.jsp?Page=<%=myPage%>&&sort=<%=sortcnt%>">[이전]</a>
				<%
			}else{
				out.println("[이전]");
			}
			for(directPage = (int)firstPage+1;directPage<=lastPage;directPage++){
				if(Page == directPage){
					out.print("["+directPage+"]");
				}else{
					%>
					<a href="review.jsp?Page=<%=directPage%>&&sort=<%=sortcnt%>">[<%=directPage%>]</a>
					<%
				}
			}
		%>
		
		<%
			if(block < totalBlock){
				myPage = lastPage+1;
				%>
				<a href="review.jsp?Page=<%=myPage%>&&sort=<%=sortcnt%>">[다음]</a>
				<%
			}else{
				out.print("[다음]");
			}
		%>
	</div>
</div>
</body>
</html>