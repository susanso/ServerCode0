<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
  <%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
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
<!-- 외부css링크 -->
<link rel="stylesheet" type="text/css" href="../../css/market/productDetail.css">
<title>Insert title here</title>
</head>
<body style="background: #000;color: #f2f2f3">
	<!--top-->
	<div class="col-xs-12 col-md-12 col-lg-12" style="padding: 0;">
		<%@ include file="../top.jsp" %>
	</div>
	
	<!--content -->
	<div class="col-xs-12 col-md-12 col-lg-12" style="padding: 0;">
		<div class="containerBox">
			<div class="songDetailBox">
				<div class="albumImg"></div>
				<div class="songDetailImfoBox">
					<div class="titleMusicContainer">
						<div class="albumDetailBtnBox albumDetailPlay"></div>
						<div class="songTitle">Got It (BUY 1 GET 5 FREE)</div>
					</div>
					<div class="user">susansok</div>
					<div class="priceBox">
						<div class="listenCount">1,233 Listen</div>
						<div class="like">♡ 12,320</div>
						<div class="buyCount">429 Down</div>
					</div>
					<div class="comment"><!--전체박스-->
							조용한 방 속에서 혼자 듣기좋은음악
					</div>
					<div class="price">₩ 2,300</div><!--전체박스-->
				</div>
			</div>
			<div class="albumDetailWaveBox">
			    
			    <div class="albumDetailWaveForm" id="albumDetailWaveForm"></div>
			</div>
			<div class="selectBox">
				<div class="selectBtn otherTrackBtn selectBtnActive">OTHER TRACKS</div>
				<div class="selectBtn commentBtn">COMMENTS</div>
			</div>
			<div class="contentBox">
				<div class='contentMusicBox'>
					<div class='contentMusicInfo'>
						<div class='contentMusicImg' style='background: url(../../image/album_cover/yoon.jpg) 0% 0% / cover'></div>
						<div class='contentMusicTextBox'>
							<div class='contentMusicTitle'>THIS WORLD( Soulful Hip Hop Type Beat)</div>
							<div class='contentMusicUser'>yasuo14</div>
							<div class='contentMusicLikeBox'>
								<div class='contentMusicLike'>♡ 12,320</div>
								<div class='contentMusicBuyCount'>429 Down</div>
								<div class=''>1,233 Listen</div>
							</div>
						</div>
					</div>
					<div class='contentMusicPrice'>₩ 2,900</div>
				</div>
				<div class='contentMusicBox'>
					<div class='contentMusicInfo'>
						<div class='contentMusicImg' style='background: url(../../image/album_cover/iffy.jpg) 0% 0% / cover'></div>
						<div class='contentMusicTextBox'>
							<div class='contentMusicTitle'>Two Way Road</div>
							<div class='contentMusicUser'>aok1544</div>
							<div class='contentMusicLikeBox'>
								<div class='contentMusicLike'>♡ 12,320</div>
								<div class='contentMusicBuyCount'>429 Down</div>
								<div class=''>1,233 Listen</div>
							</div>
						</div>
					</div>
					<div class='contentMusicPrice'>₩ 4,900</div>
				</div>
				<div class='contentMusicBox'>
					<div class='contentMusicInfo'>
						<div class='contentMusicImg' style='background: url(../../image/album_cover/take.jpg) 0% 0% / cover'></div>
						<div class='contentMusicTextBox'>
							<div class='contentMusicTitle'>Slow Ride</div>
							<div class='contentMusicUser'>kingSE</div>
							<div class='contentMusicLikeBox'>
								<div class='contentMusicLike'>♡ 1,320</div>
								<div class='contentMusicBuyCount'>1429 Down</div>
								<div class=''>1,233 Listen</div>
							</div>
						</div>
					</div>
					<div class='contentMusicPrice'> ₩ 1,900</div>
				</div>
				<div class='contentMusicBox'>
					<div class='contentMusicInfo'>
						<div class='contentMusicImg' style='background: url(../../image/album_cover/money.jpg) 0% 0% / cover'></div>
						<div class='contentMusicTextBox'>
							<div class='contentMusicTitle'>Toxic Necessities</div>
							<div class='contentMusicUser'>lilize</div>
							<div class='contentMusicLikeBox'>
								<div class='contentMusicLike'>♡ 9,320</div>
								<div class='contentMusicBuyCount'>576 Down</div>
								<div class=''>1,233 Listen</div>
							</div>
						</div>
					</div>
					<div class='contentMusicPrice'>₩ 10,000</div>
				</div>
				<div class='contentMusicBox'>
					<div class='contentMusicInfo'>
						<div class='contentMusicImg' style='background: url(../../image/album_cover/emoHiphop.jpg) 0% 0% / cover'></div>
						<div class='contentMusicTextBox'>
							<div class='contentMusicTitle'>Kimono (Buy 1 Get 1 Free!)</div>
							<div class='contentMusicUser'>black nut</div>
							<div class='contentMusicLikeBox'>
								<div class='contentMusicLike'>♡ 65,320</div>
								<div class='contentMusicBuyCount'>1,300 Down</div>
								<div class=''>1,233 Listen</div>
							</div>
						</div>
					</div>
					<div class='contentMusicPrice'>₩ 6,900</div>
				</div>
				<div class='commentBox'>
					댓글이 없습니다.
				</div>
			</div>
			
		</div>
	</div>
	
	
	<!--footer -->
	<div class="col-xs-12 col-md-12 col-lg-12" style="padding: 0;">
		<%@ include file="..//footer.jsp"%>
	</div>




<script src="../../../js/market/productDetail.js"></script>
</body>
</html>