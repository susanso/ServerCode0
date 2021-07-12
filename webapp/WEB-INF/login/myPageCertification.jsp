<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

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
<style type="text/css">
	.myPageCertificationPage{
		display: flex;
	    align-items: center;
	}
	.myPageCertificationBtnStyle{
		margin: 0.6em auto;
	    display: flex;
	    text-align: center;
	    height: 30px;
	    background-color: #505051;
	    justify-content: center;
	    align-items: center;
	    cursor: pointer;
	    -webkit-transition: background-color 0.2s;
	    transition: background-color 0.2s;
	}
	.myPageCertificationInput{
	    background-color: #505051;
	    color: #fff;
	    border: 0;
	    outline: none;
	    width: 100%;
	    height: 35px;
	    margin-top: 1em;
	    text-align: center;
	}
	.myPageCertificationForm{
		width: 450px;
	    margin: 0 auto;
	}
</style>
</head>
<body style="background-color: rgb(38, 40, 43); color: rgb(242, 242, 243);">
	<!-- 	top부분 -->
	<div class="col-xs-12 col-md-12 col-lg-12" style="padding: 0;">
		<%@ include file="../component/top.jsp"%>
	</div>
	<div class="col-xs-12 col-md-12 col-lg-12 defaultPage myPageCertificationPage" style="padding: 0;">
		<form action="mypage" method="post" class="myPageCertificationForm">
			<div class="col-xs-12 col-md-12 col-lg-12">
				<div style="text-align: center;">
				회원님의 정보 보호를 위해 비밀번호를 입력해주세요.
				</div>
			</div>
			<div class="col-xs-12 col-md-12 col-lg-12">
				<input type="hidden" name="id" value=${sessionScope.myid}>	
				<input type="password" name="pwd" class="myPageCertificationInput" autocomplete="off">
			</div>
			<div class="col-xs-6 col-md-6 col-lg-6">
				<div class="myPageCertificationBtnStyle myPageCertificationBtn">
					확인
				</div>
			</div>
			<div class="col-xs-6 col-md-6 col-lg-6">
				<div class="myPageCertificationBtnStyle myPageCertificationCancelBtn">
					취소
				</div>
			</div>
		</form>
	</div>
	<!--footer -->
	<div class="col-xs-12 col-md-12 col-lg-12" style="padding: 0;">
		<%@ include file="../component/footer.jsp"%>
	</div>
	
</body>
<script type="text/javascript">
		window.onload = function(){
			var pwdBoolean ="${userInfo}"; 
			if( pwdBoolean == "false"){
				alert("비밀번호가 맞지 않습니다.");
				$(".myPageCertificationInput").val("");
				$(".myPageCertificationInput").focus();
			}
		}
		$(".myPageCertificationBtn").click(function(){
			
			if ($(".myPageCertificationInput").val() == "") {
	            alert("내용을 입력해주세요");
	            return;
			}else{
				$(".myPageCertificationForm").submit();
			}
		});
		$(".myPageCertificationCancelBtn").click(function(){
			location.href="/";
		});
</script>
</html>