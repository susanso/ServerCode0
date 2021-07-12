<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
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
	
	<link rel="stylesheet" type="text/css" href="../../css/login/myPage.css">
</head>
<body
	style="background-color: rgb(38, 40, 43); color: rgb(242, 242, 243);">
	<!-- 	top부분 -->
	<div class="col-xs-12 col-md-12 col-lg-12" style="padding: 0;">
		<%@ include file="../component/top.jsp"%>
	</div>

	<div class="col-xs-12 col-md-12 col-lg-12 defaultPage"
		style="padding: 0;">
		<div class=" col-xs-12 col-md-12 col-lg-12">
			<div class="myPageTitleBox">
				<div class="myPageTitle changeMyInfo myPageTitleActive">My Info</div>
				<div class="myPageTitle paymentHistory">결제내역</div>
				<div class="myPageTitle workList">작업리스트</div>
				<div class="myPageTitle QnAList">문의내역</div>
			</div>
		</div>
		<div class="col-xs-12 col-md-12 col-lg-12">
			<div class="myPageShowBox changeMyInfoBox myPageProfileBox">
				<div class="col-xs-12 col-md-12 col-lg-12 profileImgBox">
					<div class="myPageProfile"></div>
					<div class="changeProfileImg">
						<label for="changeProfileFinder" class="changeProfileFinderLabel">업로드</label>
						<input type="file" id="changeProfileFinder" style="display: none;" autocomplete="off">
						
					</div>
				</div>
				<div class="col-xs-12 col-md-12 col-lg-12 myPageCulumnRow">
					<div class="col-xs-4 col-md-2 col-lg-2 myPageProfileTitle">아이디</div>
					<div class="col-xs-8 col-md-7 col-lg-7 myPageInputBox">
						<input type="text" name="id" autocomplete="off"
							class=" myPageInputForm myPageUpId" maxlength="12" readonly="readonly"
							spellcheck="false" oninput="this.value = this.value.replace(/[^a-z0-9]/gi,'');">
					</div>
					<div class="col-xs-12 col-md-3 col-lg-3 alertBox alertId"></div>
				</div>
				<div class="col-xs-12 col-md-12 col-lg-12 myPageCulumnRow">
					<div class="col-xs-4 col-md-2 col-lg-2 myPageProfileTitle">닉네임</div>
					<div class="col-xs-8 col-md-7 col-lg-7 myPageInputBox">
						<input type="text" name="id" autocomplete="off"
							class=" myPageInputForm myPageNickName" maxlength="12"
							spellcheck="false">
					</div>
					<div class="col-xs-12 col-md-3 col-lg-3 alertBox alertNickName"></div>
				</div>
				<div class="col-xs-12 col-md-12 col-lg-12 myPageCulumnRow">
					<div class="col-xs-4 col-md-2 col-lg-2 myPageProfileTitle">이름</div>
					<div class="col-xs-8 col-md-7 col-lg-7 myPageInputBox">
						<input type="text" name="id" autocomplete="off"
							class=" myPageInputForm myPageUserName" maxlength="12"spellcheck="false" placeholder="이름">
					</div>
				</div>
				<div class="col-xs-12 col-md-12 col-lg-12 myPageCulumnRow">
					<div class="col-xs-4 col-md-2 col-lg-2 myPageProfileTitle">비밀번호</div>
					<div class="col-xs-8 col-md-7 col-lg-7 myPageInputBox">
						<input type="password" name="pwd"
						autocomplete="off"	class="myPageInputForm myPageMainPwd" placeholder="비밀번호">
					</div>
					<div class="col-xs-hidden col-md-3 col-lg-3"></div>
				</div>
				<div class="col-xs-12 col-md-12 col-lg-12 myPageCulumnRow">
					<div class="col-xs-4 col-md-2 col-lg-2 myPageProfileTitle">새 비밀번호</div>
					<div class="col-xs-8 col-md-7 col-lg-7 myPageInputBox">
						<input type="password" name="pwd_first"
						 autocomplete="off"	class="myPageInputForm myPagePwd1" placeholder="새 비밀번호">
					</div>
					<div class="col-xs-hidden col-md-3 col-lg-3"></div>
				</div>
				<div class="col-xs-12 col-md-12 col-lg-12 myPageCulumnRow">
					<div class="col-xs-4 col-md-2 col-lg-2 myPageProfileTitle">새 비밀번호 확인</div>
					<div class="col-xs-8 col-md-7 col-lg-7 myPageInputBox">
						<input type="password" name="pwd_second"
						autocomplete="off"	class="myPageInputForm myPagePwd2" placeholder="새 비밀번호 재확인">
					</div>
					<div class="col-xs-12 col-md-3 col-lg-3 alertBox alertPwd"></div>
				</div>
				<div class="col-xs-12 col-md-12 col-lg-12 myPageCulumnRow">
					<div class="col-xs-4 col-md-2 col-lg-2 myPageProfileTitle">휴대폰</div>
					<div class="col-xs-2 col-md-1 col-lg-1 myPageInputBox">
						<select name="phone_select" class="myPageInputForm phoneSelectBox">
							<option class="selectPhoneOption" value="010">010</option>
							<option class="selectPhoneOption" value="070">070</option>
							<option class="selectPhoneOption" value="011">011</option>
						</select>
					</div>
					<div class="col-xs-1 col-md-1 col-lg-1 myPageInputBox">-</div>
					<div class="col-xs-2 col-md-2 col-lg-2 myPageInputBox">
						<input type="text" autocomplete="off"
							class=" myPageInputForm phoneInputBox_before" maxlength="4"
							oninput="this.value = this.value.replace(/[^0-9]/g, '');">
					</div>
					<div class="col-xs-1 col-md-1 col-lg-1 myPageInputBox">-</div>
					<div class="col-xs-2 col-md-2 col-lg-2 myPageInputBox">
						<input type="text" autocomplete="off"
							class=" myPageInputForm phoneInputBox_after" maxlength="4"
							oninput="this.value = this.value.replace(/[^0-9]/g, '');">
					</div>
					<div class="col-xs-3 col-md-3 col-lg-3"></div>
				</div>
				<div class="col-xs-12 col-md-12 col-lg-12 myPageCulumnRow">
					<div class="col-xs-4 col-md-2 col-lg-2 myPageProfileTitle">주소</div>
					<div class="col-xs-5 col-md-4 col-lg-4 myPageInputBox">
						<input type="text" autocomplete="off" readonly="readonly"
							class=" myPageInputForm postNumber">
					</div>
					<div class="col-xs-3 col-md-3 col-lg-3 myPageInputBox">
						<div class="findAddr">우편번호</div>
					</div>
					<div class="col-xs-hidden col-md-3 col-lg-3"></div>
				</div>
				<div class="col-xs-12 col-md-12 col-lg-12 myPageCulumnRow">
					<div class="col-xs-4 col-md-2 col-lg-2 myPageProfileTitle"></div>
					<div class="col-xs-8 col-md-7 col-lg-7 myPageInputBox">
						<input type="text" autocomplete="off"
							class=" myPageInputForm addrCode" readonly="readonly"
							placeholder="기본주소">
					</div>
					<div class="col-xs-hidden col-md-3 col-lg-3"></div>
				</div>
				<div class="col-xs-12 col-md-12 col-lg-12 myPageCulumnRow">
					<div class="col-xs-4 col-md-2 col-lg-2 myPageProfileTitle"></div>
					<div class="col-xs-8 col-md-7 col-lg-7 myPageInputBox">
						<input type="text" autocomplete="off"
							class=" myPageInputForm detailAddrCode" placeholder="상세주소">
					</div>
					<div class="col-xs-hidden col-md-3 col-lg-3"></div>
				</div>
				<div class="col-xs-12 col-md-12 col-lg-12 myPageCulumnRow">
					<div class="col-xs-4 col-md-2 col-lg-2 myPageProfileTitle">직업</div>
					<div class="col-xs-4 col-md-5 col-lg-5 myPageInputBox">
						<input type="text" autocomplete="off" name="job"
							class="myPageInputForm myPageJob" placeholder="직업">
					</div>
					<div class="col-xs-4 col-md-2 col-lg-2 myPageInputBox">
						<select name="email_select" class="myPageInputForm selectJob">
							<option class="selectEmailOption" value="">직접입력</option>
							<option class="selectEmailOption" value="학생">학생</option>
							<option class="selectEmailOption" value="회사원">회사원</option>
							<option class="selectEmailOption" value="프리랜서">프리렌서</option>
							<option class="selectEmailOption" value="크리에이터">크리에이터</option>
						</select>
					</div>
					<div class="col-xs-hidden col-md-3 col-lg-3"></div>
				</div>
				<div class="col-xs-12 col-md-12 col-lg-12 myPageCulumnRow emailBox">
					<div class="col-xs-12 col-md-2 col-lg-2 myPageProfileTitle myPageEmailTitle"> 이메일</div>
					<div class="col-xs-4 col-md-2 col-lg-2 myPageInputBox">
						<input type="text" autocomplete="off" name="email_start"
							 class="myPageInputForm email_start" placeholder="이메일">
					</div>
					<div class="col-xs-1 col-md-1 col-lg-1 myPageInputBox">@</div>
					<div class="col-xs-4 col-md-2 col-lg-2 myPageInputBox">
						<input type="text" autocomplete="off" name="email_end"
							 class="myPageInputForm email_end">
					</div>
					<div class="col-xs-3 col-md-2 col-lg-2 myPageInputBox">
						<select name="email_select" class="myPageInputForm selectEmail" >
<!-- 							disabled="disabled" -->
							<option class="selectEmailOption" value="">직접입력</option>
							<option class="selectEmailOption" value="naver.com">네이버</option>
							<option class="selectEmailOption" value="google.com">구글</option>
							<option class="selectEmailOption" value="daum.net">다음</option>
						</select>
					</div>
					<div class="col-xs-12 col-md-3 col-lg-3 myPageInputBox">
						<div class="submitEmailBox">이메일 인증완료</div>
					</div>
				</div>
				<div
					class="col-xs-12 col-md-12 col-lg-12 myPageCulumnRow emailResultBox">
					<div class="col-xs-2 col-md-2 col-lg-2 myPageProfileTitle"></div>
					<div class="col-xs-3 col-md-3 col-lg-3 myPageProfileTitle">
						<input type="text"
							oninput="this.value = this.value.replace(/[^0-9]/g, '');"
							autocomplete="off" class="myPageInputForm email_result"
							placeholder="인증번호">
					</div>
					<div class="col-xs-2 col-md-2 col-lg-2 myPageProfileTitle">
						<div class="email_resultBtn">인증</div>
					</div>
					<div class="col-xs-2 col-md-2 col-lg-2 myPageProfileTitle">
						<div class="returnInsertEmail">다시 입력</div>
					</div>
					<div class="col-xs-3 col-md-3 col-lg-3 myPageProfileTitle"></div>
				</div>
				<div class="col-xs-6 col-md-6 col-lg-6 ">
					<div class="changeProfile">변경</div>
				</div>
				<div class="col-xs-6 col-md-6 col-lg-6 ">
					<div class="backHome">취소</div>
				</div>
			</div>
		</div>
		<div class="col-xs-12 col-md-12 col-lg-12">
			<div class="myPageShowBox paymentHistoryBox">
				<div class="paymentHistoryTitle">
					<div class="paymentHistoryColumn">상태</div>
					<div class="harfLine"></div>
					<div class="paymentHistoryColumn">이용권</div>
					<div class="harfLine"></div>
					<div class="paymentHistoryColumn">결제금액</div>
					<div class="harfLine"></div>
					<div class="paymentHistoryColumn">결제일</div>
					<div class="harfLine"></div>
					<div class="paymentHistoryColumn">사용기간</div>
				</div>
			</div>
			<div class="myPageShowBox paymentHistoryBox">
				<div class="paymentHistoryLi">
					<div class="paymentHistoryColumn">이용중</div>
					<div class="harfLine"></div>
					<div class="paymentHistoryColumn">월 무제한 정기 이용권</div>
					<div class="harfLine"></div>
					<div class="paymentHistoryColumn">89,000</div>
					<div class="harfLine"></div>
					<div class="paymentHistoryColumn">2020.09.27</div>
					<div class="harfLine"></div>
					<div class="paymentHistoryColumn">~ 2020.10.26</div>
				</div>
				<div class="paymentHistoryLi">
					<div class="paymentHistoryColumn">종료</div>
					<div class="harfLine"></div>
					<div class="paymentHistoryColumn">50곡 이용권</div>
					<div class="harfLine"></div>
					<div class="paymentHistoryColumn">49,000</div>
					<div class="harfLine"></div>
					<div class="paymentHistoryColumn">2020.08.27</div>
					<div class="harfLine"></div>
					<div class="paymentHistoryColumn">~ 2020.09.26</div>
				</div>
			</div>
		</div>
		<div class="col-xs-12 col-md-12 col-lg-12">
			<div class="myPageShowBox workListBox">
		<!--for 문 돌리자 -->
		<c:forEach var="board" items="${list}" varStatus="status">
				<div class=" col-xs-12 col-sm-6 col-md-4 col-lg-4" style="padding: 0">
				<c:choose>
				    <c:when test="${board.composetype eq '레퍼런스 기반 작곡'}">
				      <div class="workCardBox composeReference">
				    </c:when>
				    <c:when test="${board.composetype eq '분위기 기반 작곡'}">
				       <div class="workCardBox composeKeyword">
				    </c:when>
				    <c:otherwise>
				    </c:otherwise>
				</c:choose>
						<div class="CardtitleBox">
							<div class="title">${board.subject}</div>
							<div class="optionBox">
							<c:choose>
								<c:when test="${board.sell eq 'no'}">
									<div class='not_sold'>미판매</div>
								</c:when>
								<c:when test="${board.sell eq 'yes'}">
									<div class='sale'>판매중</div>
								</c:when>
							</c:choose>
								<div class="date">${board.createdate}</div>
								<div class="deleteButton" value="${board.subject}"></div>
							</div>
						</div>
						<div class="CardContentBox">
							<div class="albumCover" style="background: url('../../image/album_cover/${board.albumcover}.jpg') 0% 0% / cover">
								<div class="playBtn"></div>
							</div>
							<div class="ContentselectBox">
								<div class="selectCompose">${board.composetype}</div>
								<div class="ComposeName">${board.songinfo1}</div>
								<div class="Contentselect">${board.songinfo2}</div>
							</div>
							<div class="CardDownBox">
								<div class="downBox pdf" value="${board.subject}"></div>
								<div class="downBox mp3" value="${board.subject}"></div>
								<div class="downBox midi" value="${board.subject}"></div>
							</div>
						</div>
						<div class='CardStoreSetBox'>
							<div class='CardStoreSet' value="${board.subject}">판매하기</div>
						</div>
					</div>
				</div>
			</c:forEach>
			</div>
		</div>
		<div class="col-xs-12 col-md-12 col-lg-12">
			<div class="myPageShowBox QnAListBox">
				<div class="QnAListTitle">
					<div class="QnAListColumn">NO</div>
					<div class="harfLine"></div>
					<div class="QnAListColumn">TITLE</div>
					<div class="harfLine"></div>
					<div class="QnAListColumn">상태</div>
					<div class="harfLine"></div>
					<div class="QnAListColumn">작성일</div>
				</div>
				<div class="QnAListLi">
					<div class="QnAListColumn">2</div>
					<div class="harfLine"></div>
					<div class="QnAListColumn">환불은 어떻게 하나요?</div>
					<div class="harfLine"></div>
					<div class="QnAListColumn">미답변</div>
					<div class="harfLine"></div>
					<div class="QnAListColumn">2020.09.23</div>
				</div>
				<div class="QnAListLi">
					<div class="QnAListColumn">1</div>
					<div class="harfLine"></div>
					<div class="QnAListColumn">실제 사용시 저작권 문제가 없나요?</div>
					<div class="harfLine"></div>
					<div class="QnAListColumn">답변완료</div>
					<div class="harfLine"></div>
					<div class="QnAListColumn">2020.10.26</div>
				</div>
			</div>
		</div>
		<div class="col-xs-6 col-md-6 col-lg-6"></div>
		<div class="col-xs-6 col-md-6 col-lg-6"></div>
	</div>
	<!--footer -->
	<div class="col-xs-12 col-md-12 col-lg-12" style="padding: 0;">
		<%@ include file="../component/footer.jsp"%>
	</div>
	<form id="location" method="post" action="">
		<input type="hidden" name="" id="locationValue1">
		<input type="hidden" name="" id="locationValue2">
	</form>
</body>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript">
// 작곡하기에서 넘어왔을 경우
if("${worklist}" == "good" ){
	//default 가리기
	$(".myPageProfileBox").css("display","none");
	$(".changeMyInfo").removeClass("myPageTitleActive");
	//리스트 보여주기
	$(".workListBox").css("display","block");
	$(".workList").addClass("myPageTitleActive");
}
// var userId = "${userInfo.id}";
var userId = "${sessionScope.myid}";
// if(${sessionScope.myid} == "${sessionScope.myid}")
// 	var userId = "";
if(userId == ""){
	alert("로그인을 진행해 주십시오.");
	location.href = '/login.do';
}

var userAddr = "${userInfo.addr}";
	userAddr = userAddr.split("_");
var userPostNumber = userAddr[0];
var userAddrCode = userAddr[1];
var userDetailAddrCode = userAddr[2];
var userPhone = "${userInfo.phone}";
	userPhone = userPhone.split("-");
var phoneType = userPhone[0];
var phoneBefore = userPhone[1];
var phoneAfter = userPhone[2];
var userJob = "${userInfo.job}";
var userEmailFullName = "${userInfo.email}";
var userEmail = "${userInfo.email}";
	userEmail = userEmail.split("@");
var userEmailId = userEmail[0];
var userEmailAddr = userEmail[1];
var profile = "${userInfo.profile}";
var userName = "${userInfo.username}"
var userNick = "${userInfo.nick}"
</script>
<script src="../../js/login/myPage.js"></script>
<script src="../../js/login/workList/workList.js"></script>
</html>