<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<!-- ajax -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<!-- 부트스트랩 -->
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<!-- CSS -->
<link rel="stylesheet" type="text/css" href="../../css/login/signUp.css">
<title>AISM-회원가입</title>
</head>
<body
	style="background-color: rgb(0, 0, 0); color: rgb(242, 242, 243);">
	<!--top-->
		<%@ include file="../component/top.jsp"%>
		<div class="signUpContainer">
			<div class="signUpBox">
					<div class="signUpculumnRow">
						<div class="signUpTitle">아이디  </div>
						<div class="signUpInputmBox">
							<input type="text" name="id" autocomplete="off" 
								class=" signUpInputForm signUpId" maxlength="12"
								spellcheck="false" placeholder="영문 숫자 조합 아이디(6~12자)"
								oninput="this.value = this.value.replace(/[^a-z0-9]/gi,'');">
						</div>
					</div>
					<div class="signUpculumnRow">
						<div class="alertBox alertId"></div>
					</div>
					<div class="signUpculumnRow">
						<div class="signUpTitle">이름  </div>
						<div class="signUpInputmBox">
							<input type="text" name="id" autocomplete="off"
								class=" signUpInputForm signUpUserName" maxlength="12"
								spellcheck="false" placeholder="이름">					</div>
					</div>
					<div class="signUpculumnRow">
						<div class="signUpTitle">비밀번호  </div>
						<div class="signUpInputmBox">
							<input type="password" name="pwd_first"
								class="signUpInputForm signUpPwd1" placeholder="비밀번호">
						</div>
					</div>
					<div class="signUpculumnRow">
						<div class="signUpTitle">비밀번호 확인</div>
						<div class="signUpInputmBox">
							<input type="password" name="pwd_second"
								class="signUpInputForm signUpPwd2" placeholder="비밀번호 재확인">
						</div>
					</div>
					<div class="signUpculumnRow">
						<div class="alertBox alertPwd"></div>
					</div>
					<div class="signUpculumnRow">
						<div class="signUpTitle">휴대폰</div>
						<div class="signUpInputmBox phoneInputmBox">
							<select name="phone_select" class="signUpInputForm phoneSelectBox">
								<option class="selectPhoneOption" value="010">010</option>
								<option class="selectPhoneOption" value="070">070</option>
								<option class="selectPhoneOption" value="011">011</option>
							</select>
							<div class="">-</div>
							<input type="text" autocomplete="off"
								class=" signUpInputForm phoneInputBox_before" maxlength="4"
								oninput="this.value = this.value.replace(/[^0-9]/g, '');">
							<div class="">-</div>
							<input type="text" autocomplete="off"
								class=" signUpInputForm phoneInputBox_after" maxlength="4"
								oninput="this.value = this.value.replace(/[^0-9]/g, '');">
						</div>
					</div>
					<div class="signUpculumnRow emailBox">
						<div class="signUpTitle signUpEmailTitle">이메일</div>
						<div class="signUpInputmBox emailInputmBox">
							<input type="text" autocomplete="off" name="email_start"
								class="signUpInputForm email_start" placeholder="이메일">
							<div class="">@</div>
							<input type="text" autocomplete="off" name="email_end"
								class="signUpInputForm email_end">
		<!-- 					<select name="email_select" class="signUpInputForm selectEmail"> -->
		<!-- 						<option class="selectEmailOption" value="">직접입력</option> -->
		<!-- 						<option class="selectEmailOption" value="naver.com">네이버</option> -->
		<!-- 						<option class="selectEmailOption" value="google.com">구글</option> -->
		<!-- 						<option class="selectEmailOption" value="daum.net">다음</option> -->
		<!-- 					</select> -->
							<div class="submitEmail submitEmailBox">이메일 인증</div>
							<div class="createSubmitEmail">인증 완료</div>
							<div class="cancelEmailBox">취소</div>
						</div>
					</div>
					<div class="signUpculumnRow">
						
					</div>
					<div class="signUpculumnRow emailResultBox">
						<div class="signUpTitle"></div>
						<div class="emailInputmBox signUpInputmBox">
							<input type="text"
								oninput="this.value = this.value.replace(/[^0-9]/g, '');"
								autocomplete="off" class="signUpInputForm email_result"
								placeholder="인증번호">
							<div class="email_resultBtn">인증</div>
							<div class="returnInsertEmail">다시 입력</div>
						</div>
					</div>
					<div class="createSignUp">회원가입</div>
			</div>
		</div>
	<!--footer -->
		<%@ include file="../component/footer.jsp"%>
</body>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="../../js/login/signUp.js"></script>
</html>