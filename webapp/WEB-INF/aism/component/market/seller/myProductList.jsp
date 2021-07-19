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
<link rel="stylesheet" type="text/css" href="../../../css/markect/myProductList.css">
<title>Insert title here</title>
</head>
<body style="background: #000;color: #f2f2f3">
	<!--top-->
	<div class="col-xs-12 col-md-12 col-lg-12" style="padding: 0;">
		<%@ include file="../../top.jsp" %>
	</div>
	
	<!--content -->
	<div class="col-xs-12 col-md-12 col-lg-12" style="padding: 0;">
		<div class="contentContainer">
			<ul class="navUl">
				<li class="navList navListActive">
					판매곡 관리
				</li>
				<li class="navList">
					정산 관리					
				</li>
			</ul>
			<div class="navContent">
				<div class="myList">
					<!--반복문 돌리기 -->
<!-- 					<div class='sellCardContainer'> -->
<!-- 						<div class='albumImg' style='background: url(../../image/album_cover/emoHiphop.jpg) 0% 0% / cover'></div>	 -->
<!-- 						<div class='defaultInfo'> -->
<!-- 							<div class='sellerInfo'> -->
<!-- 								<div class='songTitle'>asdkmasu main</div> -->
<!-- 								<div class='sellerName'>susansok</div> -->
<!-- 							</div> -->
<!-- 							<div class='downInfo'> -->
<!-- 								<div class='downCount'>2,347 Listen</div> -->
<!-- 								<div class='sellerPrice'>2,900 ₩</div>	 -->
<!-- 							</div> -->
<!-- 						</div> -->
<!-- 						<div class='reSetting'>수정</div> -->
<!-- 					</div> -->
					<!--여기까지 돌리기 -->
				</div>
			</div>
		</div>
	</div>
	<!--footer -->
	<div class="col-xs-12 col-md-12 col-lg-12" style="padding: 0;">
		<%@ include file="../../footer.jsp"%>
	</div>
	
	<script src="../../../js/markect/myProductList.js"></script>
</body>
</html>