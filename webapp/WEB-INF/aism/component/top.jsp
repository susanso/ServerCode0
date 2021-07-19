<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>AISM</title>
<meta name="viewport" content="width=device-width, initial-scale=1">


<link rel="stylesheet" type="text/css" href="../css/top.css">
</head>

<body>
	<div class="col-xs-12 col-md-12 col-lg-12 composeModal">
		<div class="composeModalBox">
			<div class="composeModalContent">
			</div>
		</div>
	</div>
	<div class="mainTop">
		<div class="topPrev">
			<img alt="로고 이미지" src="../image/top/top_logo.png" id="sub-logoImg">
			<div class="startCompose">
				<a href="/composePage">Compose</a>
			</div>
			<div class="startOpenMarket">
				<a href="/openMarket">Open Market</a>
			</div>
			<div class="startBilling">
				<a href="/bill">Billing</a>
			</div>
			<div class="startNotice">
				<a href="/notice">Notice</a>
			</div>
			<div class="startCompany">
				<a href="/company">Company</a>
			</div>
		</div>
		<div class="topNext">
			<div class="loginQueryResult"></div>
		</div>
	</div>
	<form id="location" method="post" action="">
		<input type="hidden" name="" id="locationValue1">
		<input type="hidden" name="" id="locationValue2">
	</form>
	<script type="text/javascript">
		var sessionBoolean = "${sessionScope.myid}";
		var sessionProfileImg = "${sessionScope.profileImg}";
		$("#sub-logoImg").click(function() {
			location.href = "/";
		});
// 		$("#myPage").click(function(){
// 			$.ajax({
// 				url: "/mypage",
// 				type: "GET",
// 				dataType: "json",
// 				data:{"id":sessionBoolean},
// 				success: function(data){
// 				}
// 			});
// 		});
	</script>
	<script src="../js/compose/top.js"></script>
</body>

</html>