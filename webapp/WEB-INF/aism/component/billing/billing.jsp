<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>AISM - Billing</title>
<!-- favicon -->
<link rel="apple-touch-icon" href="../image/favicon/favicon_ipad.png" type="image/png"/>
<link rel="shortcut icon" href="../image/favicon/favicon_pc.png" type="image/png">
<!-- 제이쿼리 -->
<script src="https://code.jquery.com/jquery-1.10.2.js"></script>
<!-- ajax -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<!-- 부트스트랩 -->
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<!-- css -->
<link rel="stylesheet" type="text/css" href="../../css/billing/billing.css">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- AOS -->
<script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>
<link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet">
</head>

<body style="background-color: #000; color: #f2f2f3">
	<div class="billing_container">
	<%@ include file="../../component/top.jsp" %>
		<div class="billing_content">
			<div class="billing_box">
				<div class="billing_title">
					Why AISM?
				</div>
				<div class="billing_hrLine">
				</div>
			</div>
			<div class="billing_block">
				<div class="poster_container">
					<div data-aos="fade-right" class="poster_box poster_type01">
						<div  class="poster_box_title">
							“ 높은 퀄리티의 음원  ”
						</div>
					</div>
					<div  data-aos="fade-left" class="poster_box"> 
						<div class="poster_box_content">
						어디에나 사용할 수 있는 고퀄리티 음악을<br>
						합리적인 가격에 이용할 수 있습니다
						</div>
					</div>
				</div>
				<div class="poster_container">
					<div data-aos="fade-right" class="poster_box">
						<div class="poster_box_content">
							원하는 노래를 작곡이 가능하고<br>
							필요한 음원을 찾기위한 오픈마켓을<br>
							자유롭게 사용할수 있습니다
						</div>
					</div>
					<div data-aos="fade-left" class="poster_box poster_type02">
						<div class="poster_box_title">
							“ 합리적인 서비스  ”
						</div>
					</div>
				</div>
				<div class="poster_container">
					<div data-aos="fade-right" class="poster_box poster_type03">
						<div class="poster_box_title">
							“ 자유로운 사용범위  ”
						</div>
					</div>
					<div data-aos="fade-left" class="poster_box">
						<div class="poster_box_content">
							저작권자는 곡 판매자와의 소송 걱정없이<br>
							마음껏 사용하실 수 있습니다.
						</div>
					</div>
				</div>
			</div>
			<div class="billing_box">
				<div class="billing_title">
					Promotion
				</div>
				<div class="billing_hrLine">
				</div>
			</div>
			
			<div data-aos="fade-up" data-aos-anchor-placement="top-bottom" class="price_info_box">
				<div class="price_info_content freeBox_content">
					<!-- 구매 정보 -->
					<div class="promotion_box">
						<div class="promotion_tltle">
							직접 제작한 음원 MP3 다운로드 
						</div>
						<div class="promotion_content">
							하루 5개 제한
						</div>
					</div>
					<div class="promotion_box">
						<div class="promotion_tltle">
							직접 제작한 음원 MIDI,악보,WAV 다운로드 
						</div>
						<div class="promotion_content">
							불가능
						</div>
					</div>
					<div class="promotion_box">
						<div class="promotion_tltle">
							오픈 마켓에 업로드 제한 
						</div>
						<div class="promotion_content">
							불가능
						</div>
					</div>
					<div class="promotion_box">
						<div class="promotion_tltle">
							사운드 샘플 킷 판매
						</div>
						<div class="promotion_content">
							불가능
						</div>
					</div>
					<div class="promotion_box">
						<div class="promotion_tltle">
							편곡 기능 제공 
						</div>
						<div class="promotion_content">
							불가능
						</div>
					</div>
					<div class="promotion_box">
						<div class="promotion_tltle">
							음원 판매시 수수료
						</div>
						<div class="promotion_content">
							불가능
						</div>
					</div>
					<div class="promotion_box">
						<div class="promotion_tltle">
							사용 가능 메세지
						</div>
						<div class="promotion_content">
							무제한 가능
						</div>
					</div>
					<div class="promotion_box">
						<div class="promotion_tltle">
							페이팔 사용 기능
						</div>
						<div class="promotion_content">
							무제한 가능
						</div>
					</div>
				</div>
				<div class="price_info_title_box free_title_box">
					<div class="price_info_title">
						Free
					</div>
				</div>
			</div>
			
			<div data-aos="fade-up" data-aos-anchor-placement="top-bottom" class="price_info_box">
				<div class="price_info_content standardBox_content">
					<!-- 구매 정보 -->
					<!--<div>개인 -- 기업</div> -->
					<div class="promotion_box">
						<div class="promotion_tltle">
							직접 제작한 음원 MP3 다운로드 
						</div>
						<div class="promotion_content">
							무제한 가능
						</div>
					</div>
					<div class="promotion_box">
						<div class="promotion_tltle">
							직접 제작한 음원 MIDI,악보,WAV 다운로드 
						</div>
						<div class="promotion_content">
							불가능
						</div>
					</div>
					<div class="promotion_box">
						<div class="promotion_tltle">
							월 100개 제한 
						</div>
						<div class="promotion_content">
							불가능
						</div>
					</div>
					<div class="promotion_box">
						<div class="promotion_tltle">
							사운드 샘플 킷 판매
						</div>
						<div class="promotion_content">
							불가능
						</div>
					</div>
					<div class="promotion_box">
						<div class="promotion_tltle">
							편곡 기능 제공 
						</div>
						<div class="promotion_content">
							불가능
						</div>
					</div>
					<div class="promotion_box">
						<div class="promotion_tltle">
							음원 판매시 수수료
						</div>
						<div class="promotion_content">
							50%
						</div>
					</div>
					<div class="promotion_box">
						<div class="promotion_tltle">
							사용 가능 메세지
						</div>
						<div class="promotion_content">
							무제한 가능
						</div>
					</div>
					<div class="promotion_box">
						<div class="promotion_tltle">
							페이팔 사용 기능
						</div>
						<div class="promotion_content">
							무제한 가능
						</div>
					</div>
				</div>
				<div class="price_info_title_box standard_title_box">
					<div class="price_info_title">
						Standard
					</div>
					<div class="promotion_price">
						월 9,900 원
					</div>
					<div class="price_buy_btn">
						구매
					</div>
				</div>
			</div>
			
			<div data-aos="fade-up" data-aos-anchor-placement="top-bottom" class="price_info_box">
				<div class="price_info_content proBox_content">
					<!-- 구매 정보 -->
					<div class="promotion_box">
						<div class="promotion_tltle">
							직접 제작한 음원 MP3 다운로드 
						</div>
						<div class="promotion_content">
							무제한 가능
						</div>
					</div>
					<div class="promotion_box">
						<div class="promotion_tltle">
							직접 제작한 음원 MIDI,악보,WAV 다운로드 
						</div>
						<div class="promotion_content">
							무제한 가능
						</div>
					</div>
					<div class="promotion_box">
						<div class="promotion_tltle">
							오픈 마켓에 업로드 제한 
						</div>
						<div class="promotion_content">
							무제한 가능
						</div>
					</div>
					<div class="promotion_box">
						<div class="promotion_tltle">
							사운드 샘플 킷 판매
						</div>
						<div class="promotion_content">
							무제한 가능
						</div>
					</div>
					<div class="promotion_box">
						<div class="promotion_tltle">
							편곡 기능 제공 
						</div>
						<div class="promotion_content">
							무제한 가능
						</div>
					</div>
					<div class="promotion_box">
						<div class="promotion_tltle">
							음원 판매시 수수료
						</div>
						<div class="promotion_content">
							30%
						</div>
					</div>
					<div class="promotion_box">
						<div class="promotion_tltle">
							사용 가능 메세지
						</div>
						<div class="promotion_content">
							무제한 가능
						</div>
					</div>
					<div class="promotion_box">
						<div class="promotion_tltle">
							페이팔 사용 기능
						</div>
						<div class="promotion_content">
							무제한 가능
						</div>
					</div>
				</div>
				<div class="price_info_title_box pro_title_box">
					<div class="price_info_title">
						Pro
					</div>
					<div class="promotion_price">
						월 19,900 원
					</div>
					<div class="price_buy_btn">
						구매
					</div>
				</div>
			</div>
			<div  class="buy_promotion_box">
				<div class="buy_promotion_title_box">
					<div class="buy_promotion_info">
						선택한 상품 : 
					</div>
					<div class="buy_promotion_title">
						Standard
					</div>
					<!--<div class="buy_promotion_title_type"> -->
					<!--(개인) -->
					<!--</div> -->
				</div>
				<div class="buy_promotion_content result_content">
					<div class="promotion_box_title">
						혜택 범위
					</div>
					<!-- 구매 정보 -->
					<div class="promotion_box">
						<div class="promotion_tltle">
							직접 제작한 음원 MP3 다운로드 
						</div>
						<div class="promotion_content">
							무제한 가능
						</div>
					</div>
					<div class="promotion_box">
						<div class="promotion_tltle">
							직접 제작한 음원 MIDI,악보,WAV 다운로드 
						</div>
						<div class="promotion_content">
							무제한 가능
						</div>
					</div>
					<div class="promotion_box">
						<div class="promotion_tltle">
							오픈 마켓에 업로드 제한 
						</div>
						<div class="promotion_content">
							무제한 가능
						</div>
					</div>
					<div class="promotion_box">
						<div class="promotion_tltle">
							사운드 샘플 킷 판매
						</div>
						<div class="promotion_content">
							무제한 가능
						</div>
					</div>
					<div class="promotion_box">
						<div class="promotion_tltle">
							편곡 기능 제공 
						</div>
						<div class="promotion_content">
							무제한 가능
						</div>
					</div>
					<div class="promotion_box">
						<div class="promotion_tltle">
							음원 판매시 수수료
						</div>
						<div class="promotion_content">
							30%
						</div>
					</div>
					<div class="promotion_box">
						<div class="promotion_tltle">
							사용 가능 메세지
						</div>
						<div class="promotion_content">
							무제한 가능
						</div>
					</div>
					<div class="promotion_box">
						<div class="promotion_tltle">
							페이팔 사용 기능
						</div>
						<div class="promotion_content">
							무제한 가능
						</div>
					</div>
				</div>
				<div class="buy_promotion_detail_box">
					<div class="buy_promotion_detail_title">
						총 금액 : 
					</div>
					<div class="buy_promotion_detail">
						9,900원
					</div>
				</div>
				<div class="buy_button_box">
					<div class="buy_button toPhone">
						휴대폰 결제
					</div>
					<div class="buy_button toCard">
						카드 결제
					</div>
				</div>
			</div>
		</div>
		
	</div>
	<%@ include file="../../component/footer.jsp" %>
	<script src="../../js/billing/billing.js"></script>
</body>
</html>