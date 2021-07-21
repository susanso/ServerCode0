<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" type="text/css" href="../css/defaultPage.css">
<!-- 스크롤 이벤트 -->
<!-- <script src=https://cdnjs.cloudflare.com/ajax/libs/gsap/3.5.1/gsap.min.js></script> -->
<!-- <script src=https://cdnjs.cloudflare.com/ajax/libs/gsap/3.5.1/ScrollTrigger.min.js></script> -->
<!-- 음악 wavesufer  -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/wavesurfer.js/1.1.10/wavesurfer.min.js"></script>
</head>
<body>
	<div class="col-xs-12 col-md-12 col-lg-12 defaultPage">
		<div class="">
<!-- 		main-container -->
			<div class="main-content-imgBox">
				<div class="main-content-titleBox">
					<div class="main-content-title">
						<p>AISM에서는 누구나 원하는</p>
						<p>음악을 만들 수 있습니다</p>
					</div>
					<div class="main-content-btnBox">
						<div class="main-content-btn compose">Compose</div>
						<div class="main-content-btn market">Open Market</div>
					</div>
				</div>
			</div>
		</div>
<!-- 		<div class="col-xs-12 col-md-12 col-lg-12 defaultPageCard01"> -->
<!-- 			<div class="defaultPageBox"> -->
<!-- 				<div class="col-xs-12 col-md-12 col-lg-12"> -->
<!-- 					<div class="logoGifBox"> -->
<!-- 						<div class="logoGif"> -->
<!-- 							<div class="defaultLogoImg"> -->
<!-- 								<span class="defaultLogo"></span> -->
<!-- 								<span class="defaultLogoVersion">UI alpha ver 1.3</span> -->
<!-- 							</div> -->
<!-- 						</div> -->
<!-- 					</div> -->
<!-- 				</div> -->
<!-- 				<div class="col-xs-12 col-md-12 col-lg-12"> -->
<!-- 					<div class="defaultPageTitleBox"> -->
<!-- 						<p class="defaultPageTitle">ASIM (Aartificial Intelligence -->
<!-- 							System of Music) 에서는</p> -->
<!-- 						<p class="defaultPageTitle">누구나 이런 음악을 만들수 있습니다.</p> -->
<!-- 					</div> -->
<!-- 					<div class="col-xs-12 col-md-12 col-lg-12 defaultPageTitleBox"> -->
<!-- 					<p class="defaultPageTitle">최신 트렌드에 맞는 음악을</p> -->
<!-- 					<p class="defaultPageTitle">인공지능으로 쉽고 빠르게 만들어 보세요!</p> -->
<!-- 				</div> -->
<!-- 				</div> -->
<!-- 				<div class="col-xs-12 col-md-12 col-lg-12 defaultWaveformBox"> -->
<!-- 					<div class="col-xs-12 col-md-12 col-lg-12 defaultWaveformBtnBox"> -->
<!-- 						<div class="defaultWaveformBtn"> -->
<!-- 							<div class="defaultPlayBtn" value="Play"></div> -->
<!-- 						</div> -->
<!-- 					</div> -->
<!-- 					<div id="defaultWaveform" class="" style="display: none;"></div> -->
<!-- 				</div> -->
<!-- 			</div> -->
<!-- 		</div> -->
<!-- 		<div class="col-xs-12 col-md-12 col-lg-12 half"> -->
<!-- 			<div class="defaultPageTitleBox defaultPageBox"> -->
<!-- 				<div class="col-xs-12 col-md-6 col-lg-6 defaultTitleBox01"> -->
<!-- 					<p>AISM에서는 누구나 원하는</p> -->
<!-- 					 <p>음악을 만들수 있습니다.</p> -->
<!-- 				</div> -->
<!-- 				<div class="col-xs-12 col-md-6 col-lg-6 defaultTitleBox02"> -->
<!-- 					<p>AISM(아이즘)은 인공지능 기술과 음악이론을 융합한 새로운 작곡 플랫폼 입니다</p>  -->
<!-- 					<p>AISM에서는 “좋은 음악”이라는 주관적인 기준을 사용자 빅데이터를 기반으로 빠르게 만족 시킬수 있습니다.</p> -->
<!-- 					<p>AISM은 음악을 좋아하는 모든 사람들의 새로운 “창작의 공간” 입니다. </p> -->
<!-- 					<p>AISM에서는 누구나 본인의 감성을 익숙하면서도 색다른 “멋진 음악으로 탄생” 시킬수 있습니다.</p> -->
<!-- 				</div> -->
<!-- 				<div class="col-xs-12 col-md-12 col-lg-12 defaultTitleBox03"> -->
<!-- 					<div class="col-xs-6 col-md-6 col-lg-6 defaultTitleBox03Li"> -->
<!-- 						<p class="defaultTitleBox03Title">회사명</p> -->
<!-- 						<p class="defaultTitleBox03subTitle">(주)업보트엔터</p> -->
<!-- 					</div> -->
<!-- 					<div class="col-xs-6 col-md-6 col-lg-6 defaultTitleBox03Li"> -->
<!-- 						<p class="defaultTitleBox03Title">Contact</p> -->
<!-- 						<p class="defaultTitleBox03subTitle">070 - 4415 - 4203</p> -->
<!-- 						<p class="defaultTitleBox03subTitle">upvoteai@gmail.com</p> -->
<!-- 					</div> -->
<!-- 					<div class="col-xs-12 col-md-12 col-lg-12 defaultTitleBox03Li" style="min-height: 100px;"> -->
<!-- 						<p class="defaultTitleBox03Title">파트너</p> -->
<!-- 						<div class="defaultTitleBox03subTitle"> -->
<!-- 							<div class="subTitleImg"> -->
<!-- 								<span class="subTitleImgLi"><img src="../image/defaultPage/genie.png" id ="subTitleImg"></span> -->
<!-- 								<span class="subTitleImgLi"><img src="../image/defaultPage/jaedam.png" id ="subTitleImg"></span> -->
<!-- 								<span class="subTitleImgLi"><img src="../image/defaultPage/MT.png" id ="subTitleImg"></span> -->
<!-- 								<span class="subTitleImgLi"><img src="../image/defaultPage/ehwa.png" id ="subTitleImg"></span> -->
<!-- 								<span class="subTitleImgLi"><img src="../image/defaultPage/music1.png" id ="subTitleImg"></span> -->
<!-- 								<span class="subTitleImgLi"><img src="../image/defaultPage/wbaba.png" id ="subTitleImg"></span> -->
<!-- 								<span class="subTitleImgLi"><img src="../image/defaultPage/CJ.png" id ="subTitleImg"></span> -->
<!-- 								<span class="subTitleImgLi"><img src="../image/defaultPage/Bfamily.png" id ="subTitleImg"></span> -->
<!-- 								<span class="subTitleImgLi"><img src="../image/defaultPage/gom.png" id ="subTitleImg"></span> -->
<!-- 								<span class="subTitleImgLi"><img src="../image/defaultPage/gale.png" id ="subTitleImg"></span> -->
<!-- 							</div> -->
<!-- 						</div> -->
<!-- 					</div> -->
<!-- 				</div> -->
<!-- 			</div> -->
<!-- 		</div> -->
<!-- 		<div class="col-xs-12 col-md-12 col-lg-12"> -->
<!-- 			<div class="defaultPageBox"> -->
<!-- 				<div class="col-xs-6 col-md-6 col-lg-6" style="padding: 0"> -->
<!-- 					<div class="visionTitleImg"> -->
<!-- 					</div> -->
<!-- 				</div> -->
<!-- 				<div class="col-xs-6 col-md-6 col-lg-6" style="padding: 0"> -->
<!-- 					<div class="visionTitleBox"> -->
<!-- 						<p class="visionMainTitle">AISM의 비전</p> -->
<!-- 						<p class="visionSubTitle"> -->
<!-- 							효율: 작곡시간 단축 및 비용 절감<br/> -->
<!-- 							기회: 누구나 음악 창작이 가능<br/> -->
<!-- 							창작: 새로운 창작 아이디어 제공<br/> -->
<!-- 						</p> -->
<!-- 					</div> -->
<!-- 					<div class="col-xs-12 col-md-12 col-lg-12 defaultSignUpBtnBox"> -->
<!-- 					  	<div class="defaultSignUpBtn">체험하기</div> -->
<!-- 					</div> -->
<!-- 				</div> -->
<!-- 			</div> -->
<!-- 		</div> -->
	</div>
</body>
<script src="../js/defaultPage.js"></script>
</html>