<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<!-- favicon -->
<link rel="apple-touch-icon" href="../image/favicon/favicon_ipad.png" type="image/png"/>
<link rel="shortcut icon" href="../image/favicon/favicon_pc.png" type="image/png">
<!-- 제이쿼리 -->
<script src="https://code.jquery.com/jquery-1.10.2.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<!-- <link rel="stylesheet" type="text/css" href="../../css/compose/composeMakeSong.css"> -->
<!-- 부트스트랩 -->
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<!-- 음악 wavesufer  -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/wavesurfer.js/1.1.10/wavesurfer.min.js"></script>
<!-- <script src="https://unpkg.com/wavesurfer.js"></script> -->
<!-- 외부css링크 -->
<link rel="stylesheet" type="text/css" href="../../css/login/workList/albumDetail.css">
<title>Insert title here</title>
</head>
<body style="background: #26282b;color: #f2f2f3">
	<!--top-->
	<div class="col-xs-12 col-md-12 col-lg-12" style="padding: 0;">
		<%@ include file="../../component/top.jsp" %>
	</div>
	<!--content -->
	<div class="col-xs-12 col-md-12 col-lg-12" style="padding: 0;">
		<div class="detailContainer">
			
			<div class="albumInfoBox">
				<div class="albumInfoName">${userInfo.subject}</div>
				<div class="albumInfoDateBox">
					<div class="composeType">${userInfo.composetype}</div>
					<div class="albumInfoDate">${userInfo.createdate}</div>
					<div class="albumDeleteBtn"></div>
				</div>
			</div>
			<div class="albumCoverContainer">
				<div class="albumCoverBox">
					<div class="cdCase" style="background: url('../../image/album_cover/${userInfo.albumcover}.jpg') 0% 0% / cover">
						<div class="cdCaseHoleLine">
							<div class="cdCaseHole">
							</div>
						</div>
					</div>
					<div class="cdPlay" style="background: url('../../image/album_cover/${userInfo.albumcover}.jpg') 0% 0% / cover"></div>
				</div>
			</div>
			<div class="albumDetailWaveBox">
				<div class="albumDetailBtnBox albumDetailPlay"></div>
				<div class="albumDetailWaveForm" id="albumDetailWaveForm"></div>
			</div>
			<div class="albumInfoBox">
				<div class="userName">${userInfo.user}</div>
				<div class="albumInfoOption option1">${userInfo.songinfo1}</div>
				<div class="albumInfoOption option2">${userInfo.songinfo2}</div>	
			</div>
			<div class="albumInfoBox">
				<div class="priceTitle">가격</div>
				<div class="priceValueBox">
					<input type="number" class="priceValue"> <span>₩</span>
					<%--//${userInfo.price} --%>
				</div>
			</div>
			<div class="albumInfoBox">
				<div class="commentTitle">상세 설명</div>
				<div class="commentBox">
					<textarea class="commentValue"></textarea>
				</div>
			</div>
			<div class="hashtagAlert">엔터(Enter)키로 해시태그를 추가해주세요</div>
			<div class="albumInfoBox hashtagContainer">
				<div class="hashtagTitle">해시태그(#)</div>
				<div class="hashtagBox">
					<input type="text" class="hashtagValue">
				</div>
			</div>
			<div class="hashtagArea">
				<div class="startHashTag"></div>
			</div>
			<div class="btnArea">
				<div class="btnBox goListBtn">취소</div>
				<div class="btnBox applyBtn">등록</div>
			</div>
		</div>
	</div>
	<!--footer -->
	<div class="col-xs-12 col-md-12 col-lg-12" style="padding: 0;">
		<%@ include file="../../component/footer.jsp"%>
	</div>
	<form id="location" method="post" action="">
		<input type="hidden" name="" id="locationValue1">
		<input type="hidden" name="" id="locationValue2">
	</form>
	<script src="../../js/login/workList/albumDetail.js"></script>
	<script type="text/javascript">
		var userId = "${sessionScope.myid}";
	</script>
</body>
</html>