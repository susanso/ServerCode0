<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>AISM-My Album</title>
<!-- favicon -->
<link rel="apple-touch-icon" href="../image/favicon/favicon_ipad.png" type="image/png" />
<link rel="shortcut icon" href="../image/favicon/favicon_pc.png" type="image/png">
<!-- 제이쿼리 -->
<script src="https://code.jquery.com/jquery-1.10.2.js"></script>
<!-- ajax -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<!-- 부트스트랩 -->
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<!-- 외부css링크 -->
<link rel="stylesheet" type="text/css" href="../../css/myAlbum/myAlbum.css">
</head>
<body
	style="background-color: rgb(0, 0, 0);margin: 0;color: rgb(242, 242, 243);">
	<!-- 	top부분 -->
	<%@ include file="../../component/top.jsp"%>
	<div class="mainContainer">
 		<ul class="albumContainer"> 
			<li class="nav_title workList navListActive"><div>작곡한 목록</div><!--<div class="nav_title_arrowBtn"></div>--></li>
			<li class="nav_title buyList"><div>구매한 목록</div><!--<div class="nav_title_arrowBtn"></div>--></li>
			<li class="nav_title likeList"><div>찜한 목록</div><!--<div class="nav_title_arrowBtn"></div>--></li>
			<li class="nav_title sellList"><div>판매중인 목록</div><!--<div class="nav_title_arrowBtn"></div>--></li>
		</ul>
		<div class="myAlbum_box">	
			<div class="nav_content" id="workList">
				<div class="listTitle">작곡목록</div>
				<div class="selectContainer">
					<div class="selectTypeContainer">
						<div class="selectOptionBox selectDate"><div>날짜순</div><div class="nav_title_arrowBtn"></div></div>
						<div class="selectOptionBox selectName"><div>이름순</div><div class="nav_title_arrowBtn"></div></div>
					 </div>
	<!-- 				 <div class="viewOptionContainer"> -->
	<!-- 				 	<div class="viewBox"> -->
	<!-- 				 		<div  class="viewList"></div> -->
	<!-- 				 	</div> -->
	<!-- 				 	<div class="viewBox"> -->
	<!-- 				 		<div class="viewCard"></div> -->
	<!-- 				 	</div> -->
	<!-- 				 </div> -->
				 </div>
				<div class="workListcontentBox">
						
					<c:forEach var="board" items="${list}" varStatus="status">
					<c:choose>
					    <c:when test="${board.composetype eq '레퍼런스 기반 작곡'}">
				      <div class='contentMusicBox composeReference'>
					    </c:when>
					    <c:when test="${board.composetype eq '분위기 기반 작곡'}">
				       <div class='contentMusicBox composeKeyword'>
					    </c:when>
					    <c:otherwise>
					    </c:otherwise>
					</c:choose>
						<div class='contentMusicInfo'>
							<div class="contentMusicImg" style="background: url('../../image/album_cover/${board.albumcover}.jpg') 0% 0% / cover"></div>
							<div class='contentMusicTextBox'>
								<div class='date'>${board.createdate}</div>
								<div class='contentMusicTitle'>${board.subject}</div>
								<div class='contentMusicUser'>${board.songinfo1} / ${board.songinfo2}</div>
								<div class='content_musicUpdate'>판매하기</div>
							</div>
						</div>
						<div class='gridDivBox'>
							<div class='deleteButtonBox'>
								<div class='deleteButton' value="${board.subject}"></div>
							</div>
							<div class='cardDownBox'>
								<div class='downBox pdf' value="${board.subject}"></div>
								<div class='downBox mp3' value="${board.subject}"></div>
								<div class='downBox midi' value="${board.subject}"></div>
							</div>
						</div>
					</div>
					</c:forEach>
						
				</div>
				
			</div>
			<div class="nav_content" id ="buyList">
				<div class="listTitle">구매한 목록</div>
				<div class="selectContainer">					
					<div class="selectTypeContainer">
						<div class="selectOptionBox selectDate"><div>날짜순</div><div class="nav_title_arrowBtn"></div></div>
						<div class="selectOptionBox selectName"><div>이름순</div><div class="nav_title_arrowBtn"></div></div>
						<div class="selectOptionBox selectPrice"><div>가격순</div><div class="nav_title_arrowBtn"></div></div>
					 </div>
				</div>
				<!--test -->
				<div class="contentMusicBox">
					<div class="contentMusicInfo">
						<div class="contentMusicImg"
							style="background: url(../../image/album_cover/babyShark.jpg) 0% 0%/cover"></div>
						<div class="contentMusicTextBox">
							<div class="contentMusicTitle">Toxic</div>
							<div class="contentMusicUser">poki</div>
							<div class="contentMusicLikeBox">
								<div class="contentMusicLike">♡ 320</div>
								<div class="contentMusicBuyCount">234 Down</div>
								<div class="">233 Listen</div>
							</div>
						</div>
					</div>
					<div class="contentMusicPrice">₩ 10,000</div>
				</div>
			</div>
			<div class="nav_content" id ="likeList">
				<div class="listTitle">찜한 목록</div>
				<div class="selectContainer">					
					<div class="selectTypeContainer">
						<div class="selectOptionBox selectDate"><div>날짜순</div><div class="nav_title_arrowBtn"></div></div>
						<div class="selectOptionBox selectName"><div>이름순</div><div class="nav_title_arrowBtn"></div></div>
						<div class="selectOptionBox selectLike"><div>좋아요순</div><div class="nav_title_arrowBtn"></div></div>
						<div class="selectOptionBox selectPrice"><div>가격순</div><div class="nav_title_arrowBtn"></div></div>
					 </div>
				</div>
				<!--test -->
				<div class="contentMusicBox">
					<div class="contentMusicInfo">
						<div class="contentMusicImg"
							style="background: url(../../image/album_cover/babyShark.jpg) 0% 0%/cover"></div>
						<div class="contentMusicTextBox">
							<div class="contentMusicTitle">Toxic</div>
							<div class="contentMusicUser">poki</div>
							<div class="contentMusicLikeBox">
								<div class="contentMusicLike">♡ 320</div>
								<div class="contentMusicBuyCount">234 Down</div>
								<div class="">233 Listen</div>
							</div>
						</div>
					</div>
					<div class="contentMusicPrice">₩ 10,000</div>
				</div>
			</div>
			<div class="nav_content" id ="sellList">
				<div class="listTitle">판매중인 목록</div>
				<div class="selectContainer">					
					<div class="selectTypeContainer">
						<div class="selectOptionBox selectDate"><div>날짜순</div><div class="nav_title_arrowBtn"></div></div>
						<div class="selectOptionBox selectName"><div>이름순</div><div class="nav_title_arrowBtn"></div></div>
						<div class="selectOptionBox selectPrice"><div>가격순</div><div class="nav_title_arrowBtn"></div></div>
						<div class="selectOptionBox selectSell"><div>판매량순</div><div class="nav_title_arrowBtn"></div></div>
					 </div>
				</div>
				<!--test -->
				<div class="contentMusicBox">
					<div class="contentMusicInfo">
						<div class="contentMusicImg"
							style="background: url(../../image/album_cover/babyShark.jpg) 0% 0%/cover"></div>
						<div class="contentMusicTextBox">
							<div class="contentMusicTitle">Toxic</div>
							<div class="contentMusicUser">poki</div>
							<div class="contentMusicLikeBox">
								<div class="contentMusicLike">♡ 320</div>
								<div class="contentMusicBuyCount">234 Down</div>
								<div class="">233 Listen</div>
							</div>
						</div>
					</div>
					<div class="contentMusicPrice">₩ 10,000</div>
				</div>
			</div>
		</div>
	</div>
	<!--footer -->
<%-- 	<%@ include file="../../component/footer.jsp"%> --%>
	<script src="../../js/myAlbum/myAlbum.js"></script>
</body>
</html>