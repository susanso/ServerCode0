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
<!-- 외부css링크 -->
<link rel="stylesheet" type="text/css" href="../css/compose/composeSelectPage.css">
<!-- 제이쿼리 -->
<script src="https://code.jquery.com/jquery-1.10.2.js"></script>
<!-- ajax -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

</head>
<body style="margin: 0 auto;">
	<!-- 	top부분 -->
	<div class="col-xs-12 col-md-12 col-lg-12" style="padding: 0;">
		<%@ include file="../top.jsp" %>
	</div>
	
<!-- 	<div class="container-fluid mainPageForm"> -->
	<div class="col-xs-12 col-md-12 col-lg-12" style="padding: 0;">
		<div class="mainPageForm defaultPage">
			<div class="col-xs-12 col-md-12 col-lg-12">
				<img alt="로고 그림" src="../image/AISMbtn29.png" id="main-logoImg">	
			</div>
			<div class="col-xs-12 col-md-12 col-lg-12">
<!-- 				<img alt="로고 이미지" src="../image/AISMbtna26.png" id="main-logoBeta"> -->
				<div class="composePageLogoBox">
					<span class="composePageLogo"></span>
					<span class="composePageLogoVersion">UI alpha ver 1.3</span>
				</div>
			</div>
			<div class="col-xs-12 col-md-12 col-lg-12 mainComent">
				<p>	최신 트렌드에 맞는 음악을</p>
				<p>인공지능으로 쉽고 빠르게 만들어 보세요!</p>
			</div>
			<div class="col-xs-12 col-sm-4 col-md-4 col-lg-4 startMusicBox">
				<a href="/composeStep" class="startMusic"> 분위기 기반 작곡 </a>			
			</div>
			<div class="col-xs-12 col-sm-4 col-md-4 col-lg-4 startMusicBox">
				<a href="/composeReference" class="startMusic"> 레퍼런스 기반 작곡 </a>			
			</div>
			<div class="col-xs-12 col-sm-4 col-md-4 col-lg-4 startMusicBox">
				<a href="#" class="startMusic customCompose" style="cursor: default;"> 자유롭게 작곡 </a>			
			</div>
		</div>
	</div>
	<!-- 	footer부분 -->
	<div class="col-xs-12 col-md-12 col-lg-12" style="padding: 0;">
		<%@ include file="../../component/footer.jsp" %>
	</div>
</body>
	<script type="text/javascript">
	var sessionBoolean = "${sessionScope.myid}";
	console.log("'"+sessionBoolean+"'");
	console.log(typeof sessionBoolean);
	
	if(sessionBoolean == ""){
		alert("로그인을 진행해 주십시오.");
		location.href = '/login.do';
	}
	
	$(".customCompose").click(function(){
		alert("서비스 준비중입니다.");
		return;
	});
	</script>
</html>