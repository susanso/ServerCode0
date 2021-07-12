<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<!-- favicon -->
<link rel="apple-touch-icon" href="../image/favicon/favicon_ipad.png" type="image/png"/>
<link rel="shortcut icon" href="../image/favicon/favicon_pc.png" type="image/png">
<!-- 부트스트랩 -->
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- 제이쿼리 -->
<script src="https://code.jquery.com/jquery-1.10.2.js"></script>
<!-- ajax -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<!-- Swiper -->
<link rel="stylesheet" type="text/css" href="https://unpkg.com/swiper/swiper-bundle.min.css">
<script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
<!-- 음악 wavesufer  -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/wavesurfer.js/1.1.10/wavesurfer.min.js"></script>
<!-- 외부css링크 -->
<link rel="stylesheet" type="text/css" href="../css/compose/composeReference.css">
<script type="text/javascript">
	var userSession = "${sessionScope.myid}";
	if(userSession == ""){
		alert("로그인을 진행해 주십시오.");
		location.href = '/login.do';
	}
</script>
</head>
<body>
<!-- 	<div class="col-xs-12 col-md-12 col-lg-12 composeModal"> -->
<!-- 		<div class="composeModalBox"> -->
<!-- 			<div class="composeModalContent"> -->
<!-- 			</div> -->
<!-- 		</div> -->
<!-- 	</div> -->
	<!-- top부분 -->
	<div class="col-xs-12 col-md-12 col-lg-12" style="padding: 0;">
		<%@ include file="../../component/top.jsp" %>
	</div>
	<!-- content부분 -->
	<div class="col-xs-12 col-md-12 col-lg-12" style="padding: 0;">
		<div class="col-xs-12 col-md-12 col-lg-12 stepList subTop">
			<ul>
				<li class="stepStateBox stepState01 stepState">레퍼런스 선곡</li>
				<li class="stepStateArrow">&#8250;</li>
				<li class="stepStateBox stepState02">기본설정</li>
				<li class="stepStateArrow">&#8250;</li>
				<li class="stepStateBox stepState03">상세설정</li>
				<li class="stepStateArrow">&#8250;</li>
				<li class="stepStateBox stepState04">다운로드</li>
			</ul>
		</div>
		<!--step01 -->
		<div class="step01">
			<div class="col-xs-12 col-md-12 col-lg-12" style="padding: 0;">
				<div class="referenceSwiper-container">
					<div class="swiper-wrapper">
						<div class="swiper-slide referenceCardBox">
							<div class="referenceContentBox">
								<div class="contentTitleBox">
									<p class="contentTitle">
										HipHop
									</p>
								</div>
								<div class="referenceContent">
									<div class="Content_musicLiBox" value="indigo">
										<div class="musicLiBoxImg" style="background: url('../../image/album_cover/indigo.jpg') 0% 0% / cover">
										
										</div>
										<div class="musicLiBoxTitle">
											<p>인디고뮤직 (Indigo Music) - IndiGO</p>
										</div>
										<div class="musicLiBoxBtn musicLiBoxBtnPlay"></div>
									</div>
									<div class="Content_musicLiBox" value="emoHiphop">
										<div class="musicLiBoxImg" style="background: url('../../image/album_cover/emoHiphop.jpg') 0% 0% / cover">
										
										</div>
										<div class="musicLiBoxTitle">
											<p>래원 - 이모힙합 (Feat. EK, 이영지, Basick)</p>
										</div>
										<div class="musicLiBoxBtn musicLiBoxBtnPlay"></div>
									</div>
									<div class="Content_musicLiBox" value="iffy">
										<div class="musicLiBoxImg" style="background: url('../../image/album_cover/iffy.jpg') 0% 0% / cover">
										
										</div>
										<div class="musicLiBoxTitle">
											<p> SiK-K, pH-1, 박재범 - iffy (prod by. GroovyRoom)</p>
										</div>
										<div class="musicLiBoxBtn musicLiBoxBtnPlay"></div>
									</div>
									<div class="Content_musicLiBox" value="money">
										<div class="musicLiBoxImg" style="background: url('../../image/album_cover/money.jpg') 0% 0% / cover">
										
										</div>
										<div class="musicLiBoxTitle">
											<p> 머쉬베놈(MUSHVENOM) - 여백의 미 (Feat. Jessi, JUSTHIS)</p>
										</div>
										<div class="musicLiBoxBtn musicLiBoxBtnPlay"></div>
									</div>
									<div class="Content_musicLiBox" value="money">
										<div class="musicLiBoxImg" style="background: url('../../image/album_cover/money.jpg') 0% 0% / cover">
										
										</div>
										<div class="musicLiBoxTitle">
											<p> 릴보이(lIlBOI) - CREDIT (Feat. 염따, 기리보이, Zion.T)</p>
										</div>
										<div class="musicLiBoxBtn musicLiBoxBtnPlay"></div>
									</div>
				
								</div>
							</div>
						</div>
						
						<div class="swiper-slide referenceCardBox">
							<div class="referenceContentBox">
								<div class="contentTitleBox">
									<p class="contentTitle">
										Children
									</p>
								</div>
								<div class="referenceContent">
									<div class="Content_musicLiBox" value="red">
										<div class="musicLiBoxImg" style="background: url('../../image/album_cover/red.jpg') 0% 0% / cover">
										
										</div>
										<div class="musicLiBoxTitle">
											<p>Lullaby song - Hush Little Baby</p>
										</div>
										<div class="musicLiBoxBtn musicLiBoxBtnPlay"></div>
									</div>
									<div class="Content_musicLiBox" value="red">
										<div class="musicLiBoxImg" style="background: url('../../image/album_cover/red.jpg') 0% 0% / cover">
										
										</div>
										<div class="musicLiBoxTitle">
											<p>Super Simple Songs - 반짝반짝 작은별</p>
										</div>
										<div class="musicLiBoxBtn musicLiBoxBtnPlay"></div>
									</div>
									
									<div class="Content_musicLiBox" value="red">
										<div class="musicLiBoxImg" style="background: url('../../image/album_cover/red.jpg') 0% 0% / cover">
										
										</div>
										<div class="musicLiBoxTitle">
											<p>동요 - 루돌프 사슴코</p>
										</div>
										<div class="musicLiBoxBtn musicLiBoxBtnPlay"></div>
									</div>
									<div class="Content_musicLiBox" value="tayo">
										<div class="musicLiBoxImg" style="background: url('../../image/album_cover/tayo.jpg') 0% 0% / cover">
										
										</div>
										<div class="musicLiBoxTitle">
											<p>타요 - 버스바퀴가 빙글 빙글</p>
										</div>
										<div class="musicLiBoxBtn musicLiBoxBtnPlay"></div>
									</div>
									<div class="Content_musicLiBox" value="babyShark">
										<div class="musicLiBoxImg" style="background: url('../../image/album_cover/babyShark.jpg') 0% 0% / cover">
										
										</div>
										<div class="musicLiBoxTitle">
											<p>핑크퐁 - 상어가족</p>
										</div>
										<div class="musicLiBoxBtn musicLiBoxBtnPlay"></div>
									</div>
									<div class="Content_musicLiBox" value="children01">
										<div class="musicLiBoxImg" style="background: url('../../image/album_cover/children01.jpg') 0% 0% / cover">
										
										</div>
										<div class="musicLiBoxTitle">
											<p>동요놀이터 - 병원 다녀오겠습니다</p>
										</div>
										<div class="musicLiBoxBtn musicLiBoxBtnPlay"></div>
									</div>
									<div class="Content_musicLiBox" value="snow">
										<div class="musicLiBoxImg" style="background: url('../../image/album_cover/snow.jpg') 0% 0% / cover">
										
										</div>
										<div class="musicLiBoxTitle">
											<p>키즈팝 - 겨울이 좋아</p>
										</div>
										<div class="musicLiBoxBtn musicLiBoxBtnPlay"></div>
									</div>
				
								</div>
							</div>
						</div>
						
						<div class="swiper-slide referenceCardBox">
							<div class="referenceContentBox">
								<div class="contentTitleBox">
									<p class="contentTitle">
										POP
									</p>
								</div>
								<div class="referenceContent">
									<div class="Content_musicLiBox" value="yoon">
										<div class="musicLiBoxImg" style="background: url('../../image/album_cover/yoon.jpg') 0% 0% / cover">
										</div>
										<div class="musicLiBoxTitle" >
											<p>윤종신 - 팥빙수</p>
										</div>
										<div class="musicLiBoxBtn musicLiBoxBtnPlay"></div>
									</div>
									<div class="Content_musicLiBox" value="sharp">
										<div class="musicLiBoxImg" style="background: url('../../image/album_cover/sharp.jpg') 0% 0% / cover">
										</div>
										<div class="musicLiBoxTitle">
											<p>샤프 - 연극이 끝난 후1</p>
										</div>
										<div class="musicLiBoxBtn musicLiBoxBtnPlay"></div>
									</div>
									<div class="Content_musicLiBox" value="lights">
										<div class="musicLiBoxImg" style="background: url('../../image/album_cover/lights.jpg') 0% 0% / cover">
										</div>
										<div class="musicLiBoxTitle">
											<p>the weekend - blinding lights</p>
										</div>
										<div class="musicLiBoxBtn musicLiBoxBtnPlay"></div>
									</div>
									<div class="Content_musicLiBox" value="sayso">
										<div class="musicLiBoxImg" style="background: url('../../image/album_cover/sayso.jpg') 0% 0% / cover">
										
										</div>
										<div class="musicLiBoxTitle">
											<p>도자캣 - say so</p>
										</div>
										<div class="musicLiBoxBtn musicLiBoxBtnPlay"></div>
									</div>
									<div class="Content_musicLiBox" value="take">
										<div class="musicLiBoxImg" style="background: url('../../image/album_cover/take.jpg') 0% 0% / cover">
										
										</div>
										<div class="musicLiBoxTitle">
											<p>MINO(송민호) - 도망가</p>
										</div>
										<div class="musicLiBoxBtn musicLiBoxBtnPlay"></div>
									</div>
				
								</div>
							</div>
						</div>
						
						<div class="swiper-slide referenceCardBox">
							<div class="referenceContentBox">
								<div class="contentTitleBox">
									<p class="contentTitle">
										Trot
									</p>
								</div>
								<div class="referenceContent">
									<div class="Content_musicLiBox" value="koong">
										<div class="musicLiBoxImg" style="background: url('../../image/album_cover/koong.jpg') 0% 0% / cover">
										
										</div>
										<div class="musicLiBoxTitle">
											<p>김연자 - 쑥덕쿵</p>
										</div>
										<div class="musicLiBoxBtn musicLiBoxBtnPlay"></div>
									</div>
									<div class="Content_musicLiBox" value="trot02">
										<div class="musicLiBoxImg" style="background: url('../../image/album_cover/trot02.jpg') 0% 0% / cover">
										
										</div>
										<div class="musicLiBoxTitle">
											<p>윤수현 - 천태만상</p>
										</div>
										<div class="musicLiBoxBtn musicLiBoxBtnPlay"></div>
									</div>
									<div class="Content_musicLiBox" value="trot03">
										<div class="musicLiBoxImg" style="background: url('../../image/album_cover/trot03.jpg') 0% 0% / cover">
										
										</div>
										<div class="musicLiBoxTitle">
											<p> 장윤정 - 사랑아</p>
										</div>
										<div class="musicLiBoxBtn musicLiBoxBtnPlay"></div>
									</div>
									<div class="Content_musicLiBox" value="one">
										<div class="musicLiBoxImg" style="background: url('../../image/album_cover/one.jpg') 0% 0% / cover">
										
										</div>
										<div class="musicLiBoxTitle">
											<p> 조문근 - 원샷</p>
										</div>
										<div class="musicLiBoxBtn musicLiBoxBtnPlay"></div>
									</div>
									<div class="Content_musicLiBox" value="lovecool">
										<div class="musicLiBoxImg" style="background: url('../../image/album_cover/lovecool.jpg') 0% 0% / cover">
										
										</div>
										<div class="musicLiBoxTitle">
											<p> 김성준,은향 - 사랑은 쿨거래</p>
										</div>
										<div class="musicLiBoxBtn musicLiBoxBtnPlay"></div>
									</div>
				
								</div>
							</div>
						</div>
						
						<div class="swiper-slide referenceCardBox">
							<div class="referenceContentBox">
								<div class="contentTitleBox">
									<p class="contentTitle">
										GS 음원
									</p>
								</div>
								<div class="referenceContent">
									<div class="Content_musicLiBox GS" value="jazz03">
										<div class="musicLiBoxImg" style="background: url('../../image/album_cover/jazz03.jpg') 0% 0% / cover">
										
										</div>
										<div class="musicLiBoxTitle">
											<p>PharrellWilliams - Happy</p>
										</div>
										<div class="musicLiBoxBtn musicLiBoxBtnPlay"></div>
									</div>
									<div class="Content_musicLiBox GS" value="jazz03">
										<div class="musicLiBoxImg" style="background: url('../../image/album_cover/jazz03.jpg') 0% 0% / cover">
										
										</div>
										<div class="musicLiBoxTitle">
											<p>CF송 - 하늘에서별을따다</p>
										</div>
										<div class="musicLiBoxBtn musicLiBoxBtnPlay"></div>
									</div>
									<div class="Content_musicLiBox GS" value="jazz03">
										<div class="musicLiBoxImg" style="background: url('../../image/album_cover/jazz03.jpg') 0% 0% / cover">
										
										</div>
										<div class="musicLiBoxTitle">
											<p>Twice - Ponytail</p>
										</div>
										<div class="musicLiBoxBtn musicLiBoxBtnPlay"></div>
									</div>
									<div class="Content_musicLiBox GS" value="jazz03">
										<div class="musicLiBoxImg" style="background: url('../../image/album_cover/jazz03.jpg') 0% 0% / cover">
										
										</div>
										<div class="musicLiBoxTitle">
											<p>PaulGilbert - Blowtorch</p>
										</div>
										<div class="musicLiBoxBtn musicLiBoxBtnPlay"></div>
									</div>
									<div class="Content_musicLiBox GS" value="jazz03">
										<div class="musicLiBoxImg" style="background: url('../../image/album_cover/jazz03.jpg') 0% 0% / cover">
										
										</div>
										<div class="musicLiBoxTitle">
											<p>2SCOOPS - Donuts</p>
										</div>
										<div class="musicLiBoxBtn musicLiBoxBtnPlay"></div>
									</div>
									<div class="Content_musicLiBox GS" value="jazz03">
										<div class="musicLiBoxImg" style="background: url('../../image/album_cover/jazz03.jpg') 0% 0% / cover">
										
										</div>
										<div class="musicLiBoxTitle">
											<p>SEREBRO - MiMiMi</p>
										</div>
										<div class="musicLiBoxBtn musicLiBoxBtnPlay"></div>
									</div>
									<div class="Content_musicLiBox GS" value="jazz03">
										<div class="musicLiBoxImg" style="background: url('../../image/album_cover/jazz03.jpg') 0% 0% / cover">
										
										</div>
										<div class="musicLiBoxTitle">
											<p>ShawnMendes,Camil - Senorita</p>
										</div>
										<div class="musicLiBoxBtn musicLiBoxBtnPlay"></div>
									</div>
									<div class="Content_musicLiBox GS" value="jazz03">
										<div class="musicLiBoxImg" style="background: url('../../image/album_cover/jazz03.jpg') 0% 0% / cover">
										
										</div>
										<div class="musicLiBoxTitle">
											<p>TheChainsmokers - Closer</p>
										</div>
										<div class="musicLiBoxBtn musicLiBoxBtnPlay"></div>
									</div>
									<div class="Content_musicLiBox GS" value="jazz03">
										<div class="musicLiBoxImg" style="background: url('../../image/album_cover/jazz03.jpg') 0% 0% / cover">
										
										</div>
										<div class="musicLiBoxTitle">
											<p>Rush - TheSpiritOfRadio</p>
										</div>
										<div class="musicLiBoxBtn musicLiBoxBtnPlay"></div>
									</div>
									<div class="Content_musicLiBox GS" value="jazz03">
										<div class="musicLiBoxImg" style="background: url('../../image/album_cover/jazz03.jpg') 0% 0% / cover">
										</div>
										<div class="musicLiBoxTitle">
											<p>Sting - ShapeOfMyHeart</p>
										</div>
										<div class="musicLiBoxBtn musicLiBoxBtnPlay"></div>
									</div>
<!-- 									<div class="Content_musicLiBox GS" value="jazz03"> -->
<!-- 										<div class="musicLiBoxImg" style="background: url('../../image/album_cover/jazz03.jpg') 0% 0% / cover"> -->
<!-- 										</div> -->
<!-- 										<div class="musicLiBoxTitle"> -->
<!-- 											<p>Beatles - IWanttoHoldYourHand</p> -->
<!-- 										</div> -->
<!-- 										<div class="musicLiBoxBtn musicLiBoxBtnPlay"></div> -->
<!-- 									</div> -->
									<div class="Content_musicLiBox GS" value="jazz03">
										<div class="musicLiBoxImg" style="background: url('../../image/album_cover/jazz03.jpg') 0% 0% / cover">
										</div>
										<div class="musicLiBoxTitle">
											<p>하니 - 야놀자</p>
										</div>
										<div class="musicLiBoxBtn musicLiBoxBtnPlay"></div>
									</div>
									<div class="Content_musicLiBox GS" value="jazz03">
										<div class="musicLiBoxImg" style="background: url('../../image/album_cover/jazz03.jpg') 0% 0% / cover">
										</div>
										<div class="musicLiBoxTitle">
											<p>BrunoMars - Treasure</p>
										</div>
										<div class="musicLiBoxBtn musicLiBoxBtnPlay"></div>
									</div>
									<div class="Content_musicLiBox GS" value="jazz03">
										<div class="musicLiBoxImg" style="background: url('../../image/album_cover/jazz03.jpg') 0% 0% / cover">
										</div>
										<div class="musicLiBoxTitle">
											<p>FytaKyte - Bitter</p>
										</div>
										<div class="musicLiBoxBtn musicLiBoxBtnPlay"></div>
									</div>
									<div class="Content_musicLiBox GS" value="jazz03">
										<div class="musicLiBoxImg" style="background: url('../../image/album_cover/jazz03.jpg') 0% 0% / cover">
										</div>
										<div class="musicLiBoxTitle">
											<p>BoneyM - Gottagohome</p>
										</div>
										<div class="musicLiBoxBtn musicLiBoxBtnPlay"></div>
									</div>
									<div class="Content_musicLiBox GS" value="jazz03">
										<div class="musicLiBoxImg" style="background: url('../../image/album_cover/jazz03.jpg') 0% 0% / cover">
										</div>
										<div class="musicLiBoxTitle">
											<p>마로니에 - 칵테일사랑</p>
										</div>
										<div class="musicLiBoxBtn musicLiBoxBtnPlay"></div>
									</div>
									<div class="Content_musicLiBox GS" value="jazz03">
										<div class="musicLiBoxImg" style="background: url('../../image/album_cover/jazz03.jpg') 0% 0% / cover">
										</div>
										<div class="musicLiBoxTitle">
											<p>JustinTimberlake - CANTSTOPTHEFEELING</p>
										</div>
										<div class="musicLiBoxBtn musicLiBoxBtnPlay"></div>
									</div>
									<div class="Content_musicLiBox GS" value="jazz03">
										<div class="musicLiBoxImg" style="background: url('../../image/album_cover/jazz03.jpg') 0% 0% / cover">
										</div>
										<div class="musicLiBoxTitle">
											<p>Maroon5 - Sugar</p>
										</div>
										<div class="musicLiBoxBtn musicLiBoxBtnPlay"></div>
									</div>
									
									
									
									<div class="Content_musicLiBox GS" value="jazz03">
										<div class="musicLiBoxImg" style="background: url('../../image/album_cover/jazz03.jpg') 0% 0% / cover">
										
										</div>
										<div class="musicLiBoxTitle">
											<p>Stonekeepers - Brighter</p>
										</div>
										<div class="musicLiBoxBtn musicLiBoxBtnPlay"></div>
									</div>
									<div class="Content_musicLiBox GS" value="jazz03">
										<div class="musicLiBoxImg" style="background: url('../../image/album_cover/jazz03.jpg') 0% 0% / cover">
										
										</div>
										<div class="musicLiBoxTitle">
											<p>JordanDennis - Crumbs</p>
										</div>
										<div class="musicLiBoxBtn musicLiBoxBtnPlay"></div>
									</div>
									<div class="Content_musicLiBox GS" value="jazz03">
										<div class="musicLiBoxImg" style="background: url('../../image/album_cover/jazz03.jpg') 0% 0% / cover">
										
										</div>
										<div class="musicLiBoxTitle">
											<p>kingdom - Excalibur</p>
										</div>
										<div class="musicLiBoxBtn musicLiBoxBtnPlay"></div>
									</div>
									<div class="Content_musicLiBox GS" value="jazz03">
										<div class="musicLiBoxImg" style="background: url('../../image/album_cover/jazz03.jpg') 0% 0% / cover">
										
										</div>
										<div class="musicLiBoxTitle">
											<p>Lauv - Feelings</p>
										</div>
										<div class="musicLiBoxBtn musicLiBoxBtnPlay"></div>
									</div>
									<div class="Content_musicLiBox GS" value="jazz03">
										<div class="musicLiBoxImg" style="background: url('../../image/album_cover/jazz03.jpg') 0% 0% / cover">
										
										</div>
										<div class="musicLiBoxTitle">
											<p>JustinBieber - Intentions</p>
										</div>
										<div class="musicLiBoxBtn musicLiBoxBtnPlay"></div>
									</div>
									<div class="Content_musicLiBox GS" value="jazz03">
										<div class="musicLiBoxImg" style="background: url('../../image/album_cover/jazz03.jpg') 0% 0% / cover">
										
										</div>
										<div class="musicLiBoxTitle">
											<p>메리다와마법의숲 - TouchTheSky</p>
										</div>
										<div class="musicLiBoxBtn musicLiBoxBtnPlay"></div>
									</div>
									<div class="Content_musicLiBox GS" value="jazz03">
										<div class="musicLiBoxImg" style="background: url('../../image/album_cover/jazz03.jpg') 0% 0% / cover">
										
										</div>
										<div class="musicLiBoxTitle">
											<p>Zootopia - TryEverything</p>
										</div>
										<div class="musicLiBoxBtn musicLiBoxBtnPlay"></div>
									</div>
									<div class="Content_musicLiBox GS" value="jazz03">
										<div class="musicLiBoxImg" style="background: url('../../image/album_cover/jazz03.jpg') 0% 0% / cover">
										
										</div>
										<div class="musicLiBoxTitle">
											<p>Suran - WINE</p>
										</div>
										<div class="musicLiBoxBtn musicLiBoxBtnPlay"></div>
									</div>
									<div class="Content_musicLiBox GS" value="jazz03">
										<div class="musicLiBoxImg" style="background: url('../../image/album_cover/jazz03.jpg') 0% 0% / cover">
										
										</div>
										<div class="musicLiBoxTitle">
											<p>무명 - 돌리랑도트가제일좋아</p>
										</div>
										<div class="musicLiBoxBtn musicLiBoxBtnPlay"></div>
									</div>
								</div>
							</div>
						</div>
						<div class="swiper-slide referenceCardBox">
							<div class="referenceContentBox">
								<div class="contentTitleBox">
									<p class="contentTitle">
										GS2
									</p>
								</div>
								<div class="referenceContent">
									<div class="Content_musicLiBox GS2" value="jazz01">
										<div class="musicLiBoxImg" style="background: url('../../image/album_cover/jazz01.jpg') 0% 0% / cover"></div>
										<div class="musicLiBoxTitle">
											<p>이준기 - 미녀는석류를좋아해</p>
										</div>
										<div class="musicLiBoxBtn musicLiBoxBtnPlay"></div>
									</div>									
									<div class="Content_musicLiBox GS2" value="jazz01">
										<div class="musicLiBoxImg" style="background: url('../../image/album_cover/jazz01.jpg') 0% 0% / cover"></div>
										<div class="musicLiBoxTitle">
											<p>우루사차두리 - 간덕분이야</p>
										</div>
										<div class="musicLiBoxBtn musicLiBoxBtnPlay"></div>
									</div>
									<div class="Content_musicLiBox GS2" value="jazz01">
										<div class="musicLiBoxImg" style="background: url('../../image/album_cover/jazz01.jpg') 0% 0% / cover"></div>
										<div class="musicLiBoxTitle">
											<p>김C - 델몬트망고</p>
										</div>
										<div class="musicLiBoxBtn musicLiBoxBtnPlay"></div>
									</div>
									<div class="Content_musicLiBox GS2" value="jazz01">
										<div class="musicLiBoxImg" style="background: url('../../image/album_cover/jazz01.jpg') 0% 0% / cover"></div>
										<div class="musicLiBoxTitle">
											<p>하니 - 야놀자</p>
										</div>
										<div class="musicLiBoxBtn musicLiBoxBtnPlay"></div>
									</div>
									<div class="Content_musicLiBox GS2" value="jazz01">
										<div class="musicLiBoxImg" style="background: url('../../image/album_cover/jazz01.jpg') 0% 0% / cover"></div>
										<div class="musicLiBoxTitle">
											<p>오마이걸 - Dolphin</p>
										</div>
										<div class="musicLiBoxBtn musicLiBoxBtnPlay"></div>
									</div>
									<div class="Content_musicLiBox GS2" value="jazz01">
										<div class="musicLiBoxImg" style="background: url('../../image/album_cover/jazz01.jpg') 0% 0% / cover"></div>
										<div class="musicLiBoxTitle">
											<p>IU - Celebrity</p>
										</div>
										<div class="musicLiBoxBtn musicLiBoxBtnPlay"></div>
									</div>
									<div class="Content_musicLiBox GS2" value="jazz01">
										<div class="musicLiBoxImg" style="background: url('../../image/album_cover/jazz01.jpg') 0% 0% / cover"></div>
										<div class="musicLiBoxTitle">
											<p>CF송 - 서울사이버대학교cm송</p>
										</div>
										<div class="musicLiBoxBtn musicLiBoxBtnPlay"></div>
									</div>
									<div class="Content_musicLiBox GS2" value="jazz01">
										<div class="musicLiBoxImg" style="background: url('../../image/album_cover/jazz01.jpg') 0% 0% / cover"></div>
										<div class="musicLiBoxTitle">
											<p>2SCOOPS - Donuts</p>
										</div>
										<div class="musicLiBoxBtn musicLiBoxBtnPlay"></div>
									</div>
									<div class="Content_musicLiBox GS2" value="jazz01">
										<div class="musicLiBoxImg" style="background: url('../../image/album_cover/jazz01.jpg') 0% 0% / cover"></div>
										<div class="musicLiBoxTitle">
											<p>LVTHER - OneLook</p>
										</div>
										<div class="musicLiBoxBtn musicLiBoxBtnPlay"></div>
									</div>
									<div class="Content_musicLiBox GS2" value="jazz01">
										<div class="musicLiBoxImg" style="background: url('../../image/album_cover/jazz01.jpg') 0% 0% / cover"></div>
										<div class="musicLiBoxTitle">
											<p>PaulGilbert - Blowtorch</p>
										</div>
										<div class="musicLiBoxBtn musicLiBoxBtnPlay"></div>
									</div>
									<div class="Content_musicLiBox GS2" value="jazz01">
										<div class="musicLiBoxImg" style="background: url('../../image/album_cover/jazz01.jpg') 0% 0% / cover"></div>
										<div class="musicLiBoxTitle">
											<p>Beatles - IWanttoHoldYourHand</p>
										</div>
										<div class="musicLiBoxBtn musicLiBoxBtnPlay"></div>
									</div>
									<div class="Content_musicLiBox GS2" value="jazz01">
										<div class="musicLiBoxImg" style="background: url('../../image/album_cover/jazz01.jpg') 0% 0% / cover"></div>
										<div class="musicLiBoxTitle">
											<p>에버랜드 - 에버랜드립덥</p>
										</div>
										<div class="musicLiBoxBtn musicLiBoxBtnPlay"></div>
									</div>
									<div class="Content_musicLiBox GS2" value="jazz01">
										<div class="musicLiBoxImg" style="background: url('../../image/album_cover/jazz01.jpg') 0% 0% / cover"></div>
										<div class="musicLiBoxTitle">
											<p>CF송 - 오로나민C</p>
										</div>
										<div class="musicLiBoxBtn musicLiBoxBtnPlay"></div>
									</div>
									<div class="Content_musicLiBox GS2" value="jazz01">
										<div class="musicLiBoxImg" style="background: url('../../image/album_cover/jazz01.jpg') 0% 0% / cover"></div>
										<div class="musicLiBoxTitle">
											<p>Rush - TheSpiritOfRadio</p>
										</div>
										<div class="musicLiBoxBtn musicLiBoxBtnPlay"></div>
									</div>
									<div class="Content_musicLiBox GS2" value="jazz01">
										<div class="musicLiBoxImg" style="background: url('../../image/album_cover/jazz01.jpg') 0% 0% / cover"></div>
										<div class="musicLiBoxTitle">
											<p>마로니에 - 칵테일사랑</p>
										</div>
										<div class="musicLiBoxBtn musicLiBoxBtnPlay"></div>
									</div>
									<div class="Content_musicLiBox GS2" value="jazz01">
										<div class="musicLiBoxImg" style="background: url('../../image/album_cover/jazz01.jpg') 0% 0% / cover"></div>
										<div class="musicLiBoxTitle">
											<p>Twice - Ponytail</p>
										</div>
										<div class="musicLiBoxBtn musicLiBoxBtnPlay"></div>
									</div>
									<div class="Content_musicLiBox GS2" value="jazz01">
										<div class="musicLiBoxImg" style="background: url('../../image/album_cover/jazz01.jpg') 0% 0% / cover"></div>
										<div class="musicLiBoxTitle">
											<p>Maroon5 - SundayMorning</p>
										</div>
										<div class="musicLiBoxBtn musicLiBoxBtnPlay"></div>
									</div>
									<div class="Content_musicLiBox GS2" value="jazz01">
										<div class="musicLiBoxImg" style="background: url('../../image/album_cover/jazz01.jpg') 0% 0% / cover"></div>
										<div class="musicLiBoxTitle">
											<p>JustinBieber - Intentions</p>
										</div>
										<div class="musicLiBoxBtn musicLiBoxBtnPlay"></div>
									</div>
									<div class="Content_musicLiBox GS2" value="jazz01">
										<div class="musicLiBoxImg" style="background: url('../../image/album_cover/jazz01.jpg') 0% 0% / cover"></div>
										<div class="musicLiBoxTitle">
											<p>Coldplay - VivaLaVida</p>
										</div>
										<div class="musicLiBoxBtn musicLiBoxBtnPlay"></div>
									</div>
									<div class="Content_musicLiBox GS2" value="jazz01">
										<div class="musicLiBoxImg" style="background: url('../../image/album_cover/jazz01.jpg') 0% 0% / cover"></div>
										<div class="musicLiBoxTitle">
											<p>Lauv - Feelings</p>
										</div>
										<div class="musicLiBoxBtn musicLiBoxBtnPlay"></div>
									</div>
									<div class="Content_musicLiBox GS2" value="jazz01">
										<div class="musicLiBoxImg" style="background: url('../../image/album_cover/jazz01.jpg') 0% 0% / cover"></div>
										<div class="musicLiBoxTitle">
											<p>Stonekeepers - Brighter</p>
										</div>
										<div class="musicLiBoxBtn musicLiBoxBtnPlay"></div>
									</div>
									<div class="Content_musicLiBox GS2" value="jazz01">
										<div class="musicLiBoxImg" style="background: url('../../image/album_cover/jazz01.jpg') 0% 0% / cover"></div>
										<div class="musicLiBoxTitle">
											<p>Zootopia - TryEverything</p>
										</div>
										<div class="musicLiBoxBtn musicLiBoxBtnPlay"></div>
									</div>
									<div class="Content_musicLiBox GS2" value="jazz01">
										<div class="musicLiBoxImg" style="background: url('../../image/album_cover/jazz01.jpg') 0% 0% / cover"></div>
										<div class="musicLiBoxTitle">
											<p>소녀시대 - 햅틱모션</p>
										</div>
										<div class="musicLiBoxBtn musicLiBoxBtnPlay"></div>
									</div>
									<div class="Content_musicLiBox GS2" value="jazz01">
										<div class="musicLiBoxImg" style="background: url('../../image/album_cover/jazz01.jpg') 0% 0% / cover"></div>
										<div class="musicLiBoxTitle">
											<p>LVTHER - Thislove</p>
										</div>
										<div class="musicLiBoxBtn musicLiBoxBtnPlay"></div>
									</div>
									
									<div class="Content_musicLiBox GS2" value="jazz01">
										<div class="musicLiBoxImg" style="background: url('../../image/album_cover/jazz02.jpg') 0% 0% / cover"></div>
										<div class="musicLiBoxTitle">
											<p>메리다와마법의숲 - TouchTheSky</p>
										</div>
										<div class="musicLiBoxBtn musicLiBoxBtnPlay"></div>
									</div>
									<div class="Content_musicLiBox GS2" value="jazz01">
										<div class="musicLiBoxImg" style="background: url('../../image/album_cover/jazz02.jpg') 0% 0% / cover"></div>
										<div class="musicLiBoxTitle">
											<p>Bigbang,2ne1 - Lolipop</p>
										</div>
										<div class="musicLiBoxBtn musicLiBoxBtnPlay"></div>
									</div>
									<div class="Content_musicLiBox GS2" value="jazz01">
										<div class="musicLiBoxImg" style="background: url('../../image/album_cover/jazz02.jpg') 0% 0% / cover"></div>
										<div class="musicLiBoxTitle">
											<p>소녀시대 - chocolatelove</p>
										</div>
										<div class="musicLiBoxBtn musicLiBoxBtnPlay"></div>
									</div>
									<div class="Content_musicLiBox GS2" value="jazz01">
										<div class="musicLiBoxImg" style="background: url('../../image/album_cover/jazz02.jpg') 0% 0% / cover"></div>
										<div class="musicLiBoxTitle">
											<p>태연 - 제주도의푸른밤</p>
										</div>
										<div class="musicLiBoxBtn musicLiBoxBtnPlay"></div>
									</div>
									<div class="Content_musicLiBox GS2" value="jazz01">
										<div class="musicLiBoxImg" style="background: url('../../image/album_cover/jazz02.jpg') 0% 0% / cover"></div>
										<div class="musicLiBoxTitle">
											<p>LSD - Thunderclouds</p>
										</div>
										<div class="musicLiBoxBtn musicLiBoxBtnPlay"></div>
									</div>
									<div class="Content_musicLiBox GS2" value="jazz01">
										<div class="musicLiBoxImg" style="background: url('../../image/album_cover/jazz02.jpg') 0% 0% / cover"></div>
										<div class="musicLiBoxTitle">
											<p>DNCE - CakeByTheOcean</p>
										</div>
										<div class="musicLiBoxBtn musicLiBoxBtnPlay"></div>
									</div>
									<div class="Content_musicLiBox GS2" value="jazz01">
										<div class="musicLiBoxImg" style="background: url('../../image/album_cover/jazz02.jpg') 0% 0% / cover"></div>
										<div class="musicLiBoxTitle">
											<p>ArianaGrande - testdrive</p>
										</div>
										<div class="musicLiBoxBtn musicLiBoxBtnPlay"></div>
									</div>
									<div class="Content_musicLiBox GS2" value="jazz01">
										<div class="musicLiBoxImg" style="background: url('../../image/album_cover/jazz02.jpg') 0% 0% / cover"></div>
										<div class="musicLiBoxTitle">
											<p>SEREBRO - MiMiMi</p>
										</div>
										<div class="musicLiBoxBtn musicLiBoxBtnPlay"></div>
									</div>
									<div class="Content_musicLiBox GS2" value="jazz01">
										<div class="musicLiBoxImg" style="background: url('../../image/album_cover/jazz02.jpg') 0% 0% / cover"></div>
										<div class="musicLiBoxTitle">
											<p>10cm - Phonecert</p>
										</div>
										<div class="musicLiBoxBtn musicLiBoxBtnPlay"></div>
									</div>
									<div class="Content_musicLiBox GS2" value="jazz01">
										<div class="musicLiBoxImg" style="background: url('../../image/album_cover/jazz02.jpg') 0% 0% / cover"></div>
										<div class="musicLiBoxTitle">
											<p>Suran - WINE</p>
										</div>
										<div class="musicLiBoxBtn musicLiBoxBtnPlay"></div>
									</div>
									<div class="Content_musicLiBox GS2" value="jazz01">
										<div class="musicLiBoxImg" style="background: url('../../image/album_cover/jazz02.jpg') 0% 0% / cover"></div>
										<div class="musicLiBoxTitle">
											<p>OneDirection - WhatMakesYouBeautiful</p>
										</div>
										<div class="musicLiBoxBtn musicLiBoxBtnPlay"></div>
									</div>
									<div class="Content_musicLiBox GS2" value="jazz01">
										<div class="musicLiBoxImg" style="background: url('../../image/album_cover/jazz02.jpg') 0% 0% / cover"></div>
										<div class="musicLiBoxTitle">
											<p>볼빨간사춘기 - DancingCartoon</p>
										</div>
										<div class="musicLiBoxBtn musicLiBoxBtnPlay"></div>
									</div>
									
								</div>
							</div>
						</div>
						<div class="swiper-slide referenceCardBox">
							<div class="referenceContentBox">
								<div class="contentTitleBox">
									<p class="contentTitle">
										GS 1-1
									</p>
								</div>
								<div class="referenceContent">
									<div class="Content_musicLiBox GS" value="jazz01">
										<div class="musicLiBoxImg" style="background: url('../../image/album_cover/jazz01.jpg') 0% 0% / cover"></div>
										<div class="musicLiBoxTitle">
											<p>정용화 - 넌내게반했어</p>
										</div>
										<div class="musicLiBoxBtn musicLiBoxBtnPlay"></div>
									</div>
									<div class="Content_musicLiBox GS" value="jazz01">
										<div class="musicLiBoxImg" style="background: url('../../image/album_cover/jazz01.jpg') 0% 0% / cover"></div>
										<div class="musicLiBoxTitle">
											<p>CF송 - 오로나민C</p>
										</div>
										<div class="musicLiBoxBtn musicLiBoxBtnPlay"></div>
									</div>
									<div class="Content_musicLiBox GS" value="jazz01">
										<div class="musicLiBoxImg" style="background: url('../../image/album_cover/jazz01.jpg') 0% 0% / cover"></div>
										<div class="musicLiBoxTitle">
											<p>Coldplay - VivaLaVida</p>
										</div>
										<div class="musicLiBoxBtn musicLiBoxBtnPlay"></div>
									</div>
									<div class="Content_musicLiBox GS" value="jazz01">
										<div class="musicLiBoxImg" style="background: url('../../image/album_cover/jazz01.jpg') 0% 0% / cover"></div>
										<div class="musicLiBoxTitle">
											<p>OneDirection - WhatMakesYouBeautiful</p>
										</div>
										<div class="musicLiBoxBtn musicLiBoxBtnPlay"></div>
									</div>
									<div class="Content_musicLiBox GS" value="jazz01">
										<div class="musicLiBoxImg" style="background: url('../../image/album_cover/jazz01.jpg') 0% 0% / cover"></div>
										<div class="musicLiBoxTitle">
											<p>EdSheeran - ShapeofYou</p>
										</div>
										<div class="musicLiBoxBtn musicLiBoxBtnPlay"></div>
									</div>
									<div class="Content_musicLiBox GS" value="jazz01">
										<div class="musicLiBoxImg" style="background: url('../../image/album_cover/jazz01.jpg') 0% 0% / cover"></div>
										<div class="musicLiBoxTitle">
											<p>BTS - Dynamite</p>
										</div>
										<div class="musicLiBoxBtn musicLiBoxBtnPlay"></div>
									</div>
									<div class="Content_musicLiBox GS" value="jazz01">
										<div class="musicLiBoxImg" style="background: url('../../image/album_cover/jazz01.jpg') 0% 0% / cover"></div>
										<div class="musicLiBoxTitle">
											<p>Bigbang,2ne1 - Lolipop</p>
										</div>
										<div class="musicLiBoxBtn musicLiBoxBtnPlay"></div>
									</div>
									<div class="Content_musicLiBox GS" value="jazz01">
										<div class="musicLiBoxImg" style="background: url('../../image/album_cover/jazz01.jpg') 0% 0% / cover"></div>
										<div class="musicLiBoxTitle">
											<p>소녀시대 - chocolatelove</p>
										</div>
										<div class="musicLiBoxBtn musicLiBoxBtnPlay"></div>
									</div>
									<div class="Content_musicLiBox GS" value="jazz01">
										<div class="musicLiBoxImg" style="background: url('../../image/album_cover/jazz01.jpg') 0% 0% / cover"></div>
										<div class="musicLiBoxTitle">
											<p>이효리 - Anymotion</p>
										</div>
										<div class="musicLiBoxBtn musicLiBoxBtnPlay"></div>
									</div>
									<div class="Content_musicLiBox GS" value="jazz01">
										<div class="musicLiBoxImg" style="background: url('../../image/album_cover/jazz01.jpg') 0% 0% / cover"></div>
										<div class="musicLiBoxTitle">
											<p>소녀시대 - 비타민</p>
										</div>
										<div class="musicLiBoxBtn musicLiBoxBtnPlay"></div>
									</div>
									<div class="Content_musicLiBox GS" value="jazz01">
										<div class="musicLiBoxImg" style="background: url('../../image/album_cover/jazz01.jpg') 0% 0% / cover"></div>
										<div class="musicLiBoxTitle">
											<p>악뮤 - 콩떡빙수</p>
										</div>
										<div class="musicLiBoxBtn musicLiBoxBtnPlay"></div>
									</div>
									<div class="Content_musicLiBox GS" value="jazz01">
										<div class="musicLiBoxImg" style="background: url('../../image/album_cover/jazz01.jpg') 0% 0% / cover"></div>
										<div class="musicLiBoxTitle">
											<p>태연 - 제주도의푸른밤</p>
										</div>
										<div class="musicLiBoxBtn musicLiBoxBtnPlay"></div>
									</div>
									<div class="Content_musicLiBox GS" value="jazz01">
										<div class="musicLiBoxImg" style="background: url('../../image/album_cover/jazz01.jpg') 0% 0% / cover"></div>
										<div class="musicLiBoxTitle">
											<p>볼빨간사춘기 - 나들이갈까</p>
										</div>
										<div class="musicLiBoxBtn musicLiBoxBtnPlay"></div>
									</div>
									<div class="Content_musicLiBox GS" value="jazz01">
										<div class="musicLiBoxImg" style="background: url('../../image/album_cover/jazz01.jpg') 0% 0% / cover"></div>
										<div class="musicLiBoxTitle">
											<p>WRLD - HangUp</p>
										</div>
										<div class="musicLiBoxBtn musicLiBoxBtnPlay"></div>
									</div>
									<div class="Content_musicLiBox GS" value="jazz01">
										<div class="musicLiBoxImg" style="background: url('../../image/album_cover/jazz01.jpg') 0% 0% / cover"></div>
										<div class="musicLiBoxTitle">
											<p>소녀시대 - 햅틱모션</p>
										</div>
										<div class="musicLiBoxBtn musicLiBoxBtnPlay"></div>
									</div>
									<div class="Content_musicLiBox GS" value="jazz01">
										<div class="musicLiBoxImg" style="background: url('../../image/album_cover/jazz01.jpg') 0% 0% / cover"></div>
										<div class="musicLiBoxTitle">
											<p>LSD - Thunderclouds</p>
										</div>
										<div class="musicLiBoxBtn musicLiBoxBtnPlay"></div>
									</div>
									<div class="Content_musicLiBox GS" value="jazz01">
										<div class="musicLiBoxImg" style="background: url('../../image/album_cover/jazz01.jpg') 0% 0% / cover"></div>
										<div class="musicLiBoxTitle">
											<p>TroyeSivan - FOOLS</p>
										</div>
										<div class="musicLiBoxBtn musicLiBoxBtnPlay"></div>
									</div>
									<div class="Content_musicLiBox GS" value="jazz01">
										<div class="musicLiBoxImg" style="background: url('../../image/album_cover/jazz01.jpg') 0% 0% / cover"></div>
										<div class="musicLiBoxTitle">
											<p>HONNE - WarmonaColdNight</p>
										</div>
										<div class="musicLiBoxBtn musicLiBoxBtnPlay"></div>
									</div>
									<div class="Content_musicLiBox GS" value="jazz01">
										<div class="musicLiBoxImg" style="background: url('../../image/album_cover/jazz01.jpg') 0% 0% / cover"></div>
										<div class="musicLiBoxTitle">
											<p>김C - 델몬트망고</p>
										</div>
										<div class="musicLiBoxBtn musicLiBoxBtnPlay"></div>
									</div>
									<div class="Content_musicLiBox GS" value="jazz01">
										<div class="musicLiBoxImg" style="background: url('../../image/album_cover/jazz01.jpg') 0% 0% / cover"></div>
										<div class="musicLiBoxTitle">
											<p>우루사차두리 - 간덕분이야</p>
										</div>
										<div class="musicLiBoxBtn musicLiBoxBtnPlay"></div>
									</div>
									<div class="Content_musicLiBox GS" value="jazz01">
										<div class="musicLiBoxImg" style="background: url('../../image/album_cover/jazz01.jpg') 0% 0% / cover"></div>
										<div class="musicLiBoxTitle">
											<p>CF송 - 서울사이버대학교CM송</p>
										</div>
										<div class="musicLiBoxBtn musicLiBoxBtnPlay"></div>
									</div>
									<div class="Content_musicLiBox GS" value="jazz01">
										<div class="musicLiBoxImg" style="background: url('../../image/album_cover/jazz01.jpg') 0% 0% / cover"></div>
										<div class="musicLiBoxTitle">
											<p>에버랜드 - 에버랜드립덥</p>
										</div>
										<div class="musicLiBoxBtn musicLiBoxBtnPlay"></div>
									</div>
									<div class="Content_musicLiBox GS" value="jazz01">
										<div class="musicLiBoxImg" style="background: url('../../image/album_cover/jazz01.jpg') 0% 0% / cover"></div>
										<div class="musicLiBoxTitle">
											<p>CF송 - 쿠우광고</p>
										</div>
										<div class="musicLiBoxBtn musicLiBoxBtnPlay"></div>
									</div>
									<div class="Content_musicLiBox GS" value="jazz01">
										<div class="musicLiBoxImg" style="background: url('../../image/album_cover/jazz01.jpg') 0% 0% / cover"></div>
										<div class="musicLiBoxTitle">
											<p>이준기 - 미녀는석류를좋아해</p>
										</div>
										<div class="musicLiBoxBtn musicLiBoxBtnPlay"></div>
									</div>
									<div class="Content_musicLiBox GS" value="jazz01">
										<div class="musicLiBoxImg" style="background: url('../../image/album_cover/jazz01.jpg') 0% 0% / cover"></div>
										<div class="musicLiBoxTitle">
											<p>이마트 - 우리가족쇼핑랜드편</p>
										</div>
										<div class="musicLiBoxBtn musicLiBoxBtnPlay"></div>
									</div>
									<div class="Content_musicLiBox GS" value="jazz01">
										<div class="musicLiBoxImg" style="background: url('../../image/album_cover/jazz01.jpg') 0% 0% / cover"></div>
										<div class="musicLiBoxTitle">
											<p>하리 - 귀요미송</p>
										</div>
										<div class="musicLiBoxBtn musicLiBoxBtnPlay"></div>
									</div>
									<div class="Content_musicLiBox GS" value="jazz01">
										<div class="musicLiBoxImg" style="background: url('../../image/album_cover/jazz01.jpg') 0% 0% / cover"></div>
										<div class="musicLiBoxTitle">
											<p>10cm - 사랑은은하수다방에서</p>
										</div>
										<div class="musicLiBoxBtn musicLiBoxBtnPlay"></div>
									</div>
									<div class="Content_musicLiBox GS" value="jazz01">
										<div class="musicLiBoxImg" style="background: url('../../image/album_cover/jazz01.jpg') 0% 0% / cover"></div>
										<div class="musicLiBoxTitle">
											<p>5SecondsofSummer - High</p>
										</div>
										<div class="musicLiBoxBtn musicLiBoxBtnPlay"></div>
									</div>
									<div class="Content_musicLiBox GS" value="jazz01">
										<div class="musicLiBoxImg" style="background: url('../../image/album_cover/jazz01.jpg') 0% 0% / cover"></div>
										<div class="musicLiBoxTitle">
											<p>MAX - Checklist</p>
										</div>
										<div class="musicLiBoxBtn musicLiBoxBtnPlay"></div>
									</div>
									<div class="Content_musicLiBox GS" value="jazz01">
										<div class="musicLiBoxImg" style="background: url('../../image/album_cover/jazz01.jpg') 0% 0% / cover"></div>
										<div class="musicLiBoxTitle">
											<p>DuaLipa - BreakMyHeart</p>
										</div>
										<div class="musicLiBoxBtn musicLiBoxBtnPlay"></div>
									</div>
									<div class="Content_musicLiBox GS" value="jazz01">
										<div class="musicLiBoxImg" style="background: url('../../image/album_cover/jazz01.jpg') 0% 0% / cover"></div>
										<div class="musicLiBoxTitle">
											<p>HONNE - Day1</p>
										</div>
										<div class="musicLiBoxBtn musicLiBoxBtnPlay"></div>
									</div>
									<div class="Content_musicLiBox GS" value="jazz01">
										<div class="musicLiBoxImg" style="background: url('../../image/album_cover/jazz01.jpg') 0% 0% / cover"></div>
										<div class="musicLiBoxTitle">
											<p>Lizzo - Juice</p>
										</div>
										<div class="musicLiBoxBtn musicLiBoxBtnPlay"></div>
									</div>
									<div class="Content_musicLiBox GS" value="jazz01">
										<div class="musicLiBoxImg" style="background: url('../../image/album_cover/jazz01.jpg') 0% 0% / cover"></div>
										<div class="musicLiBoxTitle">
											<p>DNCE - CakeByTheOcean</p>
										</div>
										<div class="musicLiBoxBtn musicLiBoxBtnPlay"></div>
									</div>
									<div class="Content_musicLiBox GS" value="jazz01">
										<div class="musicLiBoxImg" style="background: url('../../image/album_cover/jazz01.jpg') 0% 0% / cover"></div>
										<div class="musicLiBoxTitle">
											<p>JohnnyStimson - GimmeGimme</p>
										</div>
										<div class="musicLiBoxBtn musicLiBoxBtnPlay"></div>
									</div>
									<div class="Content_musicLiBox GS" value="jazz01">
										<div class="musicLiBoxImg" style="background: url('../../image/album_cover/jazz01.jpg') 0% 0% / cover"></div>
										<div class="musicLiBoxTitle">
											<p>Dojacat - likethat</p>
										</div>
										<div class="musicLiBoxBtn musicLiBoxBtnPlay"></div>
									</div>
									<div class="Content_musicLiBox GS" value="jazz01">
										<div class="musicLiBoxImg" style="background: url('../../image/album_cover/jazz01.jpg') 0% 0% / cover"></div>
										<div class="musicLiBoxTitle">
											<p>Dojacat - sayso</p>
										</div>
										<div class="musicLiBoxBtn musicLiBoxBtnPlay"></div>
									</div>
									<div class="Content_musicLiBox GS" value="jazz01">
										<div class="musicLiBoxImg" style="background: url('../../image/album_cover/jazz01.jpg') 0% 0% / cover"></div>
										<div class="musicLiBoxTitle">
											<p>OliviaRodringo - driverslicense</p>
										</div>
										<div class="musicLiBoxBtn musicLiBoxBtnPlay"></div>
									</div>
									<div class="Content_musicLiBox GS" value="jazz01">
										<div class="musicLiBoxImg" style="background: url('../../image/album_cover/jazz01.jpg') 0% 0% / cover"></div>
										<div class="musicLiBoxTitle">
											<p>WINNER - REALLYREALLY</p>
										</div>
										<div class="musicLiBoxBtn musicLiBoxBtnPlay"></div>
									</div>
									<div class="Content_musicLiBox GS" value="jazz01">
										<div class="musicLiBoxImg" style="background: url('../../image/album_cover/jazz01.jpg') 0% 0% / cover"></div>
										<div class="musicLiBoxTitle">
											<p>Heize - Wedonttalktogether</p>
										</div>
										<div class="musicLiBoxBtn musicLiBoxBtnPlay"></div>
									</div>
									<div class="Content_musicLiBox GS" value="jazz01">
										<div class="musicLiBoxImg" style="background: url('../../image/album_cover/jazz01.jpg') 0% 0% / cover"></div>
										<div class="musicLiBoxTitle">
											<p>CoCo - Rememberme</p>
										</div>
										<div class="musicLiBoxBtn musicLiBoxBtnPlay"></div>
									</div>
									<div class="Content_musicLiBox GS" value="jazz01">
										<div class="musicLiBoxImg" style="background: url('../../image/album_cover/jazz01.jpg') 0% 0% / cover"></div>
										<div class="musicLiBoxTitle">
											<p>Whydontwe - Fallin</p>
										</div>
										<div class="musicLiBoxBtn musicLiBoxBtnPlay"></div>
									</div>
									<div class="Content_musicLiBox GS" value="jazz01">
										<div class="musicLiBoxImg" style="background: url('../../image/album_cover/jazz01.jpg') 0% 0% / cover"></div>
										<div class="musicLiBoxTitle">
											<p>BTS - SavageLove</p>
										</div>
										<div class="musicLiBoxBtn musicLiBoxBtnPlay"></div>
									</div>
									<div class="Content_musicLiBox GS" value="jazz01">
										<div class="musicLiBoxImg" style="background: url('../../image/album_cover/jazz01.jpg') 0% 0% / cover"></div>
										<div class="musicLiBoxTitle">
											<p>24kGoldn - Mood</p>
										</div>
										<div class="musicLiBoxBtn musicLiBoxBtnPlay"></div>
									</div>
									<div class="Content_musicLiBox GS" value="jazz01">
										<div class="musicLiBoxImg" style="background: url('../../image/album_cover/jazz01.jpg') 0% 0% / cover"></div>
										<div class="musicLiBoxTitle">
											<p>Charlieputh - Girlfriend</p>
										</div>
										<div class="musicLiBoxBtn musicLiBoxBtnPlay"></div>
									</div>
									<div class="Content_musicLiBox GS" value="jazz01">
										<div class="musicLiBoxImg" style="background: url('../../image/album_cover/jazz01.jpg') 0% 0% / cover"></div>
										<div class="musicLiBoxTitle">
											<p>Tiesto - JackieChan</p>
										</div>
										<div class="musicLiBoxBtn musicLiBoxBtnPlay"></div>
									</div>
									<div class="Content_musicLiBox GS" value="jazz01">
										<div class="musicLiBoxImg" style="background: url('../../image/album_cover/jazz01.jpg') 0% 0% / cover"></div>
										<div class="musicLiBoxTitle">
											<p>LVTHER - Thislove</p>
										</div>
										<div class="musicLiBoxBtn musicLiBoxBtnPlay"></div>
									</div>
									<div class="Content_musicLiBox GS" value="jazz01">
										<div class="musicLiBoxImg" style="background: url('../../image/album_cover/jazz01.jpg') 0% 0% / cover"></div>
										<div class="musicLiBoxTitle">
											<p>오마이걸 - Dolphin</p>
										</div>
										<div class="musicLiBoxBtn musicLiBoxBtnPlay"></div>
									</div>
									<div class="Content_musicLiBox GS" value="jazz01">
										<div class="musicLiBoxImg" style="background: url('../../image/album_cover/jazz01.jpg') 0% 0% / cover"></div>
										<div class="musicLiBoxTitle">
											<p>Twice - Oxygen</p>
										</div>
										<div class="musicLiBoxBtn musicLiBoxBtnPlay"></div>
									</div>
									<div class="Content_musicLiBox GS" value="jazz01">
										<div class="musicLiBoxImg" style="background: url('../../image/album_cover/jazz01.jpg') 0% 0% / cover"></div>
										<div class="musicLiBoxTitle">
											<p>유아 - 숲의아이</p>
										</div>
										<div class="musicLiBoxBtn musicLiBoxBtnPlay"></div>
									</div>
									<div class="Content_musicLiBox GS" value="jazz01">
										<div class="musicLiBoxImg" style="background: url('../../image/album_cover/jazz01.jpg') 0% 0% / cover"></div>
										<div class="musicLiBoxTitle">
											<p>SHINee - Marryyou</p>
										</div>
										<div class="musicLiBoxBtn musicLiBoxBtnPlay"></div>
									</div>
									<div class="Content_musicLiBox GS" value="jazz01">
										<div class="musicLiBoxImg" style="background: url('../../image/album_cover/jazz01.jpg') 0% 0% / cover"></div>
										<div class="musicLiBoxTitle">
											<p>Justgotpaid - Sigala,EllaEyre,MeghanTrainor</p>
										</div>
										<div class="musicLiBoxBtn musicLiBoxBtnPlay"></div>
									</div>
									<div class="Content_musicLiBox GS" value="jazz01">
										<div class="musicLiBoxImg" style="background: url('../../image/album_cover/jazz01.jpg') 0% 0% / cover"></div>
										<div class="musicLiBoxTitle">
											<p>유키카 - Neon</p>
										</div>
										<div class="musicLiBoxBtn musicLiBoxBtnPlay"></div>
									</div>
									<div class="Content_musicLiBox GS" value="jazz01">
										<div class="musicLiBoxImg" style="background: url('../../image/album_cover/jazz01.jpg') 0% 0% / cover"></div>
										<div class="musicLiBoxTitle">
											<p>Maroon5 - BeautifulMistakes</p>
										</div>
										<div class="musicLiBoxBtn musicLiBoxBtnPlay"></div>
									</div>
									<div class="Content_musicLiBox GS" value="jazz01">
										<div class="musicLiBoxImg" style="background: url('../../image/album_cover/jazz01.jpg') 0% 0% / cover"></div>
										<div class="musicLiBoxTitle">
											<p>태연 - ToTheMoon</p>
										</div>
										<div class="musicLiBoxBtn musicLiBoxBtnPlay"></div>
									</div>
									<div class="Content_musicLiBox GS" value="jazz01">
										<div class="musicLiBoxImg" style="background: url('../../image/album_cover/jazz01.jpg') 0% 0% / cover"></div>
										<div class="musicLiBoxTitle">
											<p>아스트로 - AllNight</p>
										</div>
										<div class="musicLiBoxBtn musicLiBoxBtnPlay"></div>
									</div>
									<div class="Content_musicLiBox GS" value="jazz01">
										<div class="musicLiBoxImg" style="background: url('../../image/album_cover/jazz01.jpg') 0% 0% / cover"></div>
										<div class="musicLiBoxTitle">
											<p>Singala,Palomafaith - Lullaby</p>
										</div>
										<div class="musicLiBoxBtn musicLiBoxBtnPlay"></div>
									</div>
									<div class="Content_musicLiBox GS" value="jazz01">
										<div class="musicLiBoxImg" style="background: url('../../image/album_cover/jazz01.jpg') 0% 0% / cover"></div>
										<div class="musicLiBoxTitle">
											<p>Imaginedragon - Walkingthewire</p>
										</div>
										<div class="musicLiBoxBtn musicLiBoxBtnPlay"></div>
									</div>
									<div class="Content_musicLiBox GS" value="jazz01">
										<div class="musicLiBoxImg" style="background: url('../../image/album_cover/jazz01.jpg') 0% 0% / cover"></div>
										<div class="musicLiBoxTitle">
											<p>ArianaGrande - testdrive</p>
										</div>
										<div class="musicLiBoxBtn musicLiBoxBtnPlay"></div>
									</div>
									<div class="Content_musicLiBox GS" value="jazz01">
										<div class="musicLiBoxImg" style="background: url('../../image/album_cover/jazz01.jpg') 0% 0% / cover"></div>
										<div class="musicLiBoxTitle">
											<p>Marbel - GodIsADancer</p>
										</div>
										<div class="musicLiBoxBtn musicLiBoxBtnPlay"></div>
									</div>
									<div class="Content_musicLiBox GS" value="jazz01">
										<div class="musicLiBoxImg" style="background: url('../../image/album_cover/jazz01.jpg') 0% 0% / cover"></div>
										<div class="musicLiBoxTitle">
											<p>Ritaora - LetYouLoveMe</p>
										</div>
										<div class="musicLiBoxBtn musicLiBoxBtnPlay"></div>
									</div>
									<div class="Content_musicLiBox GS" value="jazz01">
										<div class="musicLiBoxImg" style="background: url('../../image/album_cover/jazz01.jpg') 0% 0% / cover"></div>
										<div class="musicLiBoxTitle">
											<p>AudreyHepburn - MoonRiver</p>
										</div>
										<div class="musicLiBoxBtn musicLiBoxBtnPlay"></div>
									</div>
									<div class="Content_musicLiBox GS" value="jazz01">
										<div class="musicLiBoxImg" style="background: url('../../image/album_cover/jazz01.jpg') 0% 0% / cover"></div>
										<div class="musicLiBoxTitle">
											<p>GreatestShowmanost - NeverEnough</p>
										</div>
										<div class="musicLiBoxBtn musicLiBoxBtnPlay"></div>
									</div>
									<div class="Content_musicLiBox GS" value="jazz01">
										<div class="musicLiBoxImg" style="background: url('../../image/album_cover/jazz01.jpg') 0% 0% / cover"></div>
										<div class="musicLiBoxTitle">
											<p>겨울왕국 - DoYouWanttoBuildaSnowman</p>
										</div>
										<div class="musicLiBoxBtn musicLiBoxBtnPlay"></div>
									</div>
									<div class="Content_musicLiBox GS" value="jazz01">
										<div class="musicLiBoxImg" style="background: url('../../image/album_cover/jazz01.jpg') 0% 0% / cover"></div>
										<div class="musicLiBoxTitle">
											<p>WillSmith - FriendLikeMe</p>
										</div>
										<div class="musicLiBoxBtn musicLiBoxBtnPlay"></div>
									</div>
									<div class="Content_musicLiBox GS" value="jazz01">
										<div class="musicLiBoxImg" style="background: url('../../image/album_cover/jazz01.jpg') 0% 0% / cover"></div>
										<div class="musicLiBoxTitle">
											<p>KristenBell,SantinoFontana - LoveIsAnOpenDoor</p>
										</div>
										<div class="musicLiBoxBtn musicLiBoxBtnPlay"></div>
									</div>
									<div class="Content_musicLiBox GS" value="jazz01">
										<div class="musicLiBoxImg" style="background: url('../../image/album_cover/jazz01.jpg') 0% 0% / cover"></div>
										<div class="musicLiBoxTitle">
											<p>AuliiCravalho - HowFarIllGo</p>
										</div>
										<div class="musicLiBoxBtn musicLiBoxBtnPlay"></div>
									</div>
									<div class="Content_musicLiBox GS" value="jazz01">
										<div class="musicLiBoxImg" style="background: url('../../image/album_cover/jazz01.jpg') 0% 0% / cover"></div>
										<div class="musicLiBoxTitle">
											<p>RachaelYamagata - SomethingInTheRain</p>
										</div>
										<div class="musicLiBoxBtn musicLiBoxBtnPlay"></div>
									</div>
									<div class="Content_musicLiBox GS" value="jazz01">
										<div class="musicLiBoxImg" style="background: url('../../image/album_cover/jazz01.jpg') 0% 0% / cover"></div>
										<div class="musicLiBoxTitle">
											<p>FitzandtheTantrums - HandsClap</p>
										</div>
										<div class="musicLiBoxBtn musicLiBoxBtnPlay"></div>
									</div>
									<div class="Content_musicLiBox GS" value="jazz01">
										<div class="musicLiBoxImg" style="background: url('../../image/album_cover/jazz01.jpg') 0% 0% / cover"></div>
										<div class="musicLiBoxTitle">
											<p>BLACKPINK - LovesickGirls</p>
										</div>
										<div class="musicLiBoxBtn musicLiBoxBtnPlay"></div>
									</div>
									<div class="Content_musicLiBox GS" value="jazz01">
										<div class="musicLiBoxImg" style="background: url('../../image/album_cover/jazz01.jpg') 0% 0% / cover"></div>
										<div class="musicLiBoxTitle">
											<p>IU - Celebrity</p>
										</div>
										<div class="musicLiBoxBtn musicLiBoxBtnPlay"></div>
									</div>
									<div class="Content_musicLiBox GS" value="jazz01">
										<div class="musicLiBoxImg" style="background: url('../../image/album_cover/jazz01.jpg') 0% 0% / cover"></div>
										<div class="musicLiBoxTitle">
											<p>볼빨간사춘기 - DancingCartoon</p>
										</div>
										<div class="musicLiBoxBtn musicLiBoxBtnPlay"></div>
									</div>
									<div class="Content_musicLiBox GS" value="jazz01">
										<div class="musicLiBoxImg" style="background: url('../../image/album_cover/jazz01.jpg') 0% 0% / cover"></div>
										<div class="musicLiBoxTitle">
											<p>Avicii - SOS</p>
										</div>
										<div class="musicLiBoxBtn musicLiBoxBtnPlay"></div>
									</div>
									<div class="Content_musicLiBox GS" value="jazz01">
										<div class="musicLiBoxImg" style="background: url('../../image/album_cover/jazz01.jpg') 0% 0% / cover"></div>
										<div class="musicLiBoxTitle">
											<p>LVTHER - OneLook</p>
										</div>
										<div class="musicLiBoxBtn musicLiBoxBtnPlay"></div>
									</div>
									<div class="Content_musicLiBox GS" value="jazz01">
										<div class="musicLiBoxImg" style="background: url('../../image/album_cover/jazz01.jpg') 0% 0% / cover"></div>
										<div class="musicLiBoxTitle">
											<p>DreamTheater - BeneaththeSurface</p>
										</div>
										<div class="musicLiBoxBtn musicLiBoxBtnPlay"></div>
									</div>
									<div class="Content_musicLiBox GS" value="jazz01">
										<div class="musicLiBoxImg" style="background: url('../../image/album_cover/jazz01.jpg') 0% 0% / cover"></div>
										<div class="musicLiBoxTitle">
											<p>아이유 - Blueming</p>
										</div>
										<div class="musicLiBoxBtn musicLiBoxBtnPlay"></div>
									</div>
									<div class="Content_musicLiBox GS" value="jazz01">
										<div class="musicLiBoxImg" style="background: url('../../image/album_cover/jazz01.jpg') 0% 0% / cover"></div>
										<div class="musicLiBoxTitle">
											<p>10cm - Phonecert</p>
										</div>
										<div class="musicLiBoxBtn musicLiBoxBtnPlay"></div>
									</div>
									<div class="Content_musicLiBox GS" value="jazz01">
										<div class="musicLiBoxImg" style="background: url('../../image/album_cover/jazz01.jpg') 0% 0% / cover"></div>
										<div class="musicLiBoxTitle">
											<p>모차르트 - 황금별</p>
										</div>
										<div class="musicLiBoxBtn musicLiBoxBtnPlay"></div>
									</div>
									<div class="Content_musicLiBox GS" value="jazz01">
										<div class="musicLiBoxImg" style="background: url('../../image/album_cover/jazz01.jpg') 0% 0% / cover"></div>
										<div class="musicLiBoxTitle">
											<p>Maroon5 - SundayMorning</p>
										</div>
										<div class="musicLiBoxBtn musicLiBoxBtnPlay"></div>
									</div>
									<div class="Content_musicLiBox GS" value="jazz01">
										<div class="musicLiBoxImg" style="background: url('../../image/album_cover/jazz01.jpg') 0% 0% / cover"></div>
										<div class="musicLiBoxTitle">
											<p>Adam Levine - NoOneElseLikeYou</p>
										</div>
										<div class="musicLiBoxBtn musicLiBoxBtnPlay"></div>
									</div>
									<div class="Content_musicLiBox GS" value="jazz01">
										<div class="musicLiBoxImg" style="background: url('../../image/album_cover/jazz01.jpg') 0% 0% / cover"></div>
										<div class="musicLiBoxTitle">
											<p>백예린 - 0310</p>
										</div>
										<div class="musicLiBoxBtn musicLiBoxBtnPlay"></div>
									</div>
									<div class="Content_musicLiBox GS" value="jazz01">
										<div class="musicLiBoxImg" style="background: url('../../image/album_cover/jazz01.jpg') 0% 0% / cover"></div>
										<div class="musicLiBoxTitle">
											<p>원더걸스 - Rewind</p>
										</div>
										<div class="musicLiBoxBtn musicLiBoxBtnPlay"></div>
									</div>
									<div class="Content_musicLiBox GS" value="jazz01">
										<div class="musicLiBoxImg" style="background: url('../../image/album_cover/jazz01.jpg') 0% 0% / cover"></div>
										<div class="musicLiBoxTitle">
											<p>트와이스 - 녹아요</p>
										</div>
										<div class="musicLiBoxBtn musicLiBoxBtnPlay"></div>
									</div>
									<div class="Content_musicLiBox GS" value="jazz01">
										<div class="musicLiBoxImg" style="background: url('../../image/album_cover/jazz01.jpg') 0% 0% / cover"></div>
										<div class="musicLiBoxTitle">
											<p>Michael Jackson - Butterflies</p>
										</div>
										<div class="musicLiBoxBtn musicLiBoxBtnPlay"></div>
									</div>
									<div class="Content_musicLiBox GS" value="jazz01">
										<div class="musicLiBoxImg" style="background: url('../../image/album_cover/jazz01.jpg') 0% 0% / cover"></div>
										<div class="musicLiBoxTitle">
											<p>Michael Jackson - Love Never Felt So Good</p>
										</div>
										<div class="musicLiBoxBtn musicLiBoxBtnPlay"></div>
									</div>
									<div class="Content_musicLiBox GS" value="jazz01">
										<div class="musicLiBoxImg" style="background: url('../../image/album_cover/jazz01.jpg') 0% 0% / cover"></div>
										<div class="musicLiBoxTitle">
											<p>SOLE - Slow</p>
										</div>
										<div class="musicLiBoxBtn musicLiBoxBtnPlay"></div>
									</div>
									<div class="Content_musicLiBox GS" value="jazz01">
										<div class="musicLiBoxImg" style="background: url('../../image/album_cover/jazz01.jpg') 0% 0% / cover"></div>
										<div class="musicLiBoxTitle">
											<p>딕펑스 - viva 청춘</p>
										</div>
										<div class="musicLiBoxBtn musicLiBoxBtnPlay"></div>
									</div>
									<div class="Content_musicLiBox GS" value="jazz01">
										<div class="musicLiBoxImg" style="background: url('../../image/album_cover/jazz01.jpg') 0% 0% / cover"></div>
										<div class="musicLiBoxTitle">
											<p>Avicii - WaitingForLove</p>
										</div>
										<div class="musicLiBoxBtn musicLiBoxBtnPlay"></div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="col-xs-12 col-md-12 col-lg-12" style="padding: 0;">
				<div class="resultMusicAlertBox">
					<div class="resultMusicAlert">
					</div>
				</div>
			</div>
			<div class="col-xs-12 col-md-12 col-lg-12" style="padding: 0;">
				<div class="selectMusicBtnBox">
					<div class="selectMusicBtn selectMusicPrevBtn">
						이전
					</div>
					<div class="selectMusicBtn selectMusicNextBtn">
						다음
					</div>
				
				</div>
				
			</div>
		</div>
		<!--로딩 페이지 -->
		<div class="referenceLoading">
			<div class="col-xs-12 col-md-12 col-lg-12 loadingDolphinBox">
				<div class="col-xs-12 col-md-12 col-lg-12 " style="padding: 0;">
					<div class="dolphinImg"></div>
				</div>
				<div class="loadingPercent">0%</div>
			 	<div class="loadingState">
			 	 	<div class="progress">
					  <div id="dynamic" class="" style="width: 0%">
					  </div>
					</div>
			 	</div>
			</div>
		</div>
		<!--step02 -->
		<div class="step02">
			<div class="col-xs-12 col-md-12 col-lg-12" style="padding: 0;">
				<div class="selectedMainMusic">
					<div class="selectedMainMusicImg">
					
					</div>
					<div class="mainMusicBoxTitle">
						<p></p>
					</div>
					<div class="musicLiBoxBtn musicLiBoxBtnPlay"></div>
				</div>
			</div>
			<div class="col-xs-12 col-md-12 col-lg-12" style="padding: 0;">
				<!--Key 설정-->
				<div class="selectKeyBox">
					<div class="selectKey">
						<div class="selectedKey"></div>
						<div class="selectKeyUl">
							<div></div>
						</div>
					</div>
					<div class="selectKeyWave">1643</div>
				</div>
			</div>
			<div class="col-xs-12 col-md-12 col-lg-12" style="padding: 0;">
				<div class="referenceAlertBox">
					<div class="referenceAlert">
						래퍼런스 비율을 선택해주세요
					</div>
				</div>
			</div>
			<div class="col-xs-12 col-md-12 col-lg-12" style="padding: 0;">
				<div class="referencePercent">
					<div class="percentOption lower">
						<p class="OptionTitle">낮음</p>
						<p class="OptionEx">60%~70%</p>
					</div>
					<div class="percentOption middle">
						<p class="OptionTitle">중간</p>
						<p class="OptionEx">70%~80%</p>
					</div>
					<div class="percentOption Higher">
						<p class="OptionTitle">높음</p>
						<p class="OptionEx">80%~90%</p>
					</div>
				</div>
				<div class="referenceApplyBtnBox">
					<div class="referenceApplyBtn" value="1">
						<p>적용하기</p>
					</div>
				</div>
					<div class="showDefault_loading">
					</div>
				<!--Key 설정-->
<!-- 				<div class="selectKeyBox"> -->
<!-- 					<div class="selectKey"> -->
<!-- 						<div class="selectedKey">A</div> -->
<!-- 						<div class="selectKeyUl"> -->
<!-- 							<div></div> -->
<!-- 						</div> -->
<!-- 					</div> -->
<!-- 					<div class="selectKeyWave">1643</div> -->
<!-- 				</div> -->
				<!--sample 목록-->
				<div class="percentOptionUl">
					<div class="percentOptionLi sample1" value="63">
						<div class="selectOptionTitle sample1"> sample 1</div>
						<div class="samplePlay_loading sample1 sampleBtn1" value="play"></div>
					</div>
					<div class="testSpace">
						<div id="sampleWaveSongformInfo">
						
						</div>
						<div id="sampleWaveForm1"></div>
					</div>
<!-- 					<div class="percentOptionLi sample2" value="58"> -->
<!-- 						<div class="selectOptionTitle sample2">sample 2</div> -->
<!-- 						<div class="selectOption selectOptionPlay sample2 sampleBtn2" value="play"></div> -->
<!-- 					</div> -->
<!-- 					<div class="testSpace"> -->
<!-- 						<div id="sampleWaveForm2"></div> -->
<!-- 					</div> -->
<!-- 					<div class="percentOptionLi sample3" value="72"> -->
<!-- 						<div class="selectOptionTitle sample3">sample 3</div> -->
<!-- 						<div class="selectOption selectOptionPlay sample3 sampleBtn3" value="play"></div> -->
<!-- 					</div> -->
<!-- 					<div class="testSpace"> -->
<!-- 						<div id="sampleWaveForm3"></div> -->  
<!-- 					</div> -->
				</div>
				<div id="referenceWaveform"></div>
			</div>
			<!--이전/다음 박스-->
			<div class="col-xs-12 col-md-12 col-lg-12" style="padding: 0;">
				<div class="referenceBtnBox">
					<div class="referenceBtn prev" value="2">이전</div>
					<div class="referenceBtn next" value="2">다음</div>
				</div>
			</div>
		</div>
		<!--step03 -->
		<div class="step03">
			<!--midi container -->
			<div class="container datail_alertBox">
<!-- 				<div class="datail_alert">전체 음원의 구성 중 CHORUS1 부분에 다양한 샘플을 적용할 수 있습니다.</div>				 -->
			</div>
			<div class="warning_Box" id="warning_Box">
			
			</div>
			<div id="compose_container" class="compose_container">
				<!--한줄 시작 -->
				
				<!--한줄 종료 -->
			</div>
			<div class="LoadsongformBox">
				<div id="LoadsongformBox"></div>
			</div>
			<!--설정하기 -->
			<div class="referenceRemoconBox">
				<div class="detailApplyBtn">Apply</div>
				<div class="detailPlayBtn detailPlayBtnPlay" value="1"></div>
			</div>
			<!--이전/다음 박스-->
			<div class="col-xs-12 col-md-12 col-lg-12" style="padding: 0;">
				<div class="referenceBtnBox">
					<div class="referenceBtn prev" value="3">이전</div>
					<div class="referenceBtn next" value="3">다음</div>
				</div>
			</div>
		</div>
		<div class="step04" style="display: none">
			<div class="downMainTitleBox">
				<p class="downMainTitle">원하는 다운로드 형태를 고르세요!</p>
			</div>
			<div class="downLoadForm">
				<div class="col-xs-4 col-md-4 col-lg-4 downLoadBox" value="pdf">
					<div class="downTitle">악보</div>
					<div class="downTitleImg downScoreImg"></div>
					<div class="downURL">
						<span class="URLDownFont">악보 다운로드</span>
						<span class="URLDownImg" ></span>
					</div>
				</div>
				<div class="col-xs-4 col-md-4 col-lg-4 downLoadBox" value="mp3">
					<div class="downTitle">MP3</div>
					<div class="downTitleImg downMp3Img">
						<div class="musicCDBox">
							<div class="musicCDShadow">
								<div class="musicCD">
									<div class="musicCDHole">
										<div class="musicCDHoleInner"></div>
									</div>
									<div class="cdTitle">
										my song
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="downURL">
						<span class="URLDownFont">MP3 다운로드</span>
						<span class="URLDownImg" ></span>
					</div>
				</div>
				<div class="col-xs-4 col-md-4 col-lg-4 downLoadBox" value="midi">
					<div class="downTitle">MIDI</div>
					<div class="downTitleImg downMidiImg"></div>
					<div class="downURL">
						<span class="URLDownFont">MIDI 다운로드</span>
						<span class="URLDownImg" ></span>
					</div>
				</div>
			</div>
			<div class="albumCoverBox">
				<div class="cdCase">
					<div class="cdCaseHoleLine">
						<div class="cdCaseHole">
						</div>
					</div>
				</div>
				<div class="cdPlay"></div>
			</div>
			<div class="cdPlayerBox">
				<div class="cdPlayerLi">
					<div class="changeAlbumImg">이미지 변경</div>
				</div>
				<div class="cdPlayerLi">
					<div class="cdPlayerBtn cdPlayerPlay"></div>
				</div>
				<div class="cdPlayerLi">
					<input type="range" class="soundController" value="0">
				</div>
			</div>
			<!--이전/다음 박스-->
			<div class="col-xs-12 col-md-12 col-lg-12" style="padding: 0;">
				<div class="referenceBtnBox">
					<div class="referenceBtn prev" value="4">이전</div>
					<div class="referenceBtn next" value="4">저장하기</div>
				</div>
			</div>
		</div>
	</div>
	
	<div class="col-xs-12 col-md-12 col-lg-12" style="padding: 0;">
	</div>
	<!-- % 상태창 -->
	<div class='percent_box'>
		<p class="percentTitle"></p>
	</div>
	<!-- footer부분 -->
	<div class="col-xs-12 col-md-12 col-lg-12" style="padding: 0">
		<%@ include file="../../component/footer.jsp" %>
	</div>
<!-- 	<form id="location" method="post" action=""> -->
<!-- 		<input type="hidden" name="" id="locationValue"> -->
<!-- 	</form> -->

<!-- 외부 js 링크 -->
<script src="../../js/compose/selectReferencce/composeReference.js" ></script>
<script src="../../js/compose/selectReferencce/composeReferenceDown.js" ></script>
</body>
</html>