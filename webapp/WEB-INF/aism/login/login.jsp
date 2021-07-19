<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>

<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>AISM-로그인</title>
<!-- favicon -->
<link rel="apple-touch-icon" href="../image/favicon/favicon_ipad.png" type="image/png"/>
<link rel="shortcut icon" href="../image/favicon/favicon_pc.png" type="image/png">

<link rel="stylesheet" type="text/css" href="../../css/login/login.css">
<!-- 제이쿼리 -->
<script src="https://code.jquery.com/jquery-1.10.2.js"></script>
<!-- ajax -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<!-- 부트스트랩 -->
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
</head>

<body style="background-color: rgb(38, 40, 43); color: rgb(242, 242, 243);">
	
	<!--top-->
	<div class="col-xs-12 col-md-12 col-lg-12" style="padding: 0;">
		<%@ include file="../component/top.jsp" %>
	</div>
	<div class="col-xs-12 col-md-12 col-lg-12" style="padding: 0;">
		<!--로그인-->
		<div class="login_box defaultPage">
			<div class="col-xs-12 col-md-12 col-lg-12 loginSection">
				<div class="loginSectionTitle">
					Sign in to
				</div>
				<div class="LoginImg">
				</div>
			</div>
			<form action="login.go" method="POST" class="loginStart">
				<div class="col-xs-12 col-md-12 col-lg-12 idBox">
					<p class="inputList idList">
						<span class="idListSection" ></span> <span> <input type="text" autocomplete="off" name="id" class="loginInputForm insertId" placeholder="ID"> </span>
					</p>
				</div>
				<div class="col-xs-12 col-md-12 col-lg-12 pwdBox">
					<p class="inputList pwdList">
						<span class="pwdListSection" ></span> <span> <input type="password" autocomplete="off" name="pwd" class="loginInputForm insertPwd" placeholder="Password"> </span>
					</p>
				</div>
				<div class="col-xs-12 col-md-12 col-lg-12 loginBtnBox">
					<div class="loginBtn loginDo">
						로그인
					</div>
				</div>	
				<div class="col-xs-12 col-md-12 col-lg-12 signUpBox">
					<div class="signUp">
						회원가입
					</div>
					<div class="findUserinfo">
						아이디/비밀번호찾기
					</div>
				</div>
			</form>
		</div>
		<!--아이디 비밀번호 찾기 -->
		<div class="findInfo_box defaultPage">
			<div class="col-xs-12 col-md-12 col-lg-12 selectFind">
					<div class="selectFindTitle findUserId" value="findUserId" style="background: linear-gradient(0.25turn, #a888a1, #34709d);">
						아이디 찾기
					</div>
					<div class="selectFindTitle findUserPwd" value="findUserPwd">
						비밀번호 찾기
					</div>
			</div>
			<div class="col-xs-12 col-md-12 col-lg-12 findIdBox">
				<p class="inputList idList">
					<span class="idListSection" ></span> <span> <input type="text" autocomplete="off" class="loginInputForm findIdEmail" placeholder="이메일"> </span>
				</p>
				<p class="inputList idList">
					<span class="idListSection" ></span> <span> <input type="text" autocomplete="off" class="loginInputForm findPwsId" placeholder="아이디"> </span>
				</p>
			</div>
			<div class="col-xs-12 col-md-12 col-lg-12 findPwdBox">
				<p class="inputList pwdList">
					<span class="pwdListSection" ></span> <span> <input type="text" autocomplete="off" class="loginInputForm findIdBirth" placeholder="생년월일 8자리"  maxlength="8" oninput="this.value = this.value.replace(/[^0-9]/g, '');"> </span>
				</p>
				<p class="inputList pwdList">
					<span class="pwdListSection" ></span> <span> <input type="text" autocomplete="off" class="loginInputForm findPwdEmail" placeholder="이메일"> </span>
				</p>
			</div>
			<div class="col-xs-12 col-md-12 col-lg-12 resultBox">
				<div>
					<span class="resultBoxMsg">
						
					</span>
				</div>
			</div>
			<div class="col-xs-12 col-md-12 col-lg-12 resetPwdEmailBox">
				<div class="resetPwdTitle" >
					<p>인증번호를 전송하였습니다</p> 
					<p>인증번호를 입력해주세요.</p>
				</div>
				<div>
					<p class="inputList idList">
						<span class="idListSection" ></span> <span> <input type="text" autocomplete="off" class="loginInputForm resetPwdEmail" placeholder="인증번호"> </span>
					</p>
				</div>
				<div class="loginBtn resetPwdEmailBtn">
					인증하기
				</div>
			</div>
			<div class="col-xs-12 col-md-12 col-lg-12 resetPwdBox">
				<div class="resetPwdTitle" >
					비밀번호를 변경해주세요.
				</div>
				<div>
					<p class="inputList idList">
						<span class="idListSection" ></span> <span> <input type="password" autocomplete="off" class="loginInputForm resetPwdBefore" placeholder="숫자,영문조합 6자 이상"> </span>
					</p>
					<p class="inputList idList">
						<span class="idListSection" ></span> <span> <input type="password" autocomplete="off" class="loginInputForm resetPwdAfter" placeholder="숫자,영문조합 6자 이상"> </span>
					</p>
				</div>
				<div class="loginBtn resetPwdBtn">
					변경하기
				</div>
			</div>
			<div class="col-xs-12 col-md-12 col-lg-12 loginBtnBox">
				<div class="loginBtn authenticate">
					인증하기
				</div>
			</div>		
			<div class="col-xs-12 col-md-12 col-lg-12 signUpBox">
				<div class="showLogin">
					로그인
				</div>
				
				<div class="signUp">
					회원가입
				</div>
			</div>
		</div>
	</div>
	<!--footer -->
	<div class="col-xs-12 col-md-12 col-lg-12" style="padding: 0;">
		<%@ include file="../component/footer.jsp" %>
	</div>
	<script src="../../js/login/login.js"></script>
</body>
</html>