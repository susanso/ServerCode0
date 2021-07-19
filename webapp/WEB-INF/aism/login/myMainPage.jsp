<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>AISM-마이페이지</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- favicon -->
<link rel="apple-touch-icon" href="../image/favicon/favicon_ipad.png" type="image/png"/>
<link rel="shortcut icon" href="../image/favicon/favicon_pc.png" type="image/png">
<!-- 제이쿼리 -->
<script src="https://code.jquery.com/jquery-1.10.2.js"></script>
<!-- ajax -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<!-- 부트스트랩 -->
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
	
<link rel="stylesheet" type="text/css" href="../../css/login/myMainPage.css">
</head>
<body
	style="background-color: rgb(0, 0, 0); color: rgb(242, 242, 243);">
	<%@ include file="../component/top.jsp"%>
	<div class="myInfoContainer">
		<div class="rowContainer">
			<div class="halfContainer">
				<div class="myPageProfileBox">
					<div class="myPageProfileFlexBox">
						<div class="profileImgBox">
							<div class="myPageProfile"></div>
						</div>
						<div>
							<div class="myPageCulumnRow">
								<div class="myPageProfileTitle">아이디</div>
								<div class="myPageInputForm">
									${userInfo.id}
								</div>
							</div>
							<div class=" myPageCulumnRow">
								<div class="myPageProfileTitle">이름</div>
								<div class="myPageInputForm">
									${userInfo.username}
								</div>
							</div>
							<div class="myPageCulumnRow">
								<div class="myPageProfileTitle">휴대폰</div>
								<div class="myPageInputForm">
									${userInfo.phone}
								</div>
							</div>
							<div class="myPageCulumnRow emailBox">
								<div class="myPageProfileTitle myPageEmailTitle"> 이메일</div>
								<div class="myPageInputForm">
									${userInfo.email}
								</div>
							</div>
		<!-- 					<div class="userBtnBox"> -->
		<!-- 						<div class="userBtn changeProfile">변경하기</div> -->
		<!-- 						<div class="userBtn backHome">홈으로</div> -->
		<!-- 					</div> -->
		<!-- 					<div class="updateSeller"> -->
		<!-- 						판매자 등록 -->
		<!-- 					</div> -->
						</div>	
					</div>
					<div class="userBtn changeProfile">수정하기</div>
				</div>
				<div class="changePwdBox">
					<div class="changePwd">비밀번호 변경</div>
				</div>
			</div>
			<div class="halfContainer">
				<div class="myAlbum_count_Box">
					<div class="myAlbum_count_container">	
						<div class="myAlbum_count__title">내 작업곡</div>
						<div class="myAlbum_count__content"> 5 </div>
					</div>
					<div class="myAlbum_count_container">
						<div class="myAlbum_count__title">구매곡</div>
						<div class="myAlbum_count__content"> 3 </div>
					</div>
					<div class="myAlbum_count_container">
						<div class="myAlbum_count__title">찜한 곡</div>
						<div class="myAlbum_count__content"> 1 </div>
					</div>
					<div class="myAlbum_count_container">
						<div class="myAlbum_count__title">판매중인 곡</div>
						<div class="myAlbum_count__content"> 0 </div>
					</div>
				</div>
				<div class="products_in_use_box">
					<div class="products_in_container">
						<div class="products_in_title">현재 이용중인 서비스</div>
						<div class="products_in_content"> - </div>
					</div>
				</div>
			</div>
		</div>
<!-- 		<div class="rowContainer"> -->
<!-- 			<div class="sellerContainer"> -->
<!-- 			</div> -->
<!-- 		</div> -->
	</div>
	<%@ include file="../component/footer.jsp"%>
	
	<script type="text/javascript">
		var userId = "${sessionScope.myid}";
		if(userId == ""){
			alert("로그인을 진행해 주십시오.");
			location.href = '/login.do';
		}
		//과연 얘네들이 필요할까..?
		var userPhone = "${userInfo.phone}";
			userPhone = userPhone.split("-");
		var phoneType = userPhone[0];
		var phoneBefore = userPhone[1];
		var phoneAfter = userPhone[2];
		var userEmailFullName = "${userInfo.email}";
		var userEmail = "${userInfo.email}";
			userEmail = userEmail.split("@");
		var userEmailId = userEmail[0];
		var userEmailAddr = userEmail[1];
		var profile = "${userInfo.profile}";
		var userName = "${userInfo.username}";
	</script>
	<script src="../../js/login/myMainPage.js"></script>
</body>
</html>