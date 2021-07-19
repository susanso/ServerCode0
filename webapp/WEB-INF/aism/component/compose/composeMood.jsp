<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%
	request.setCharacterEncoding("utf-8");
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<meta charset="utf-8">
<html> 	
<head>
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
<!-- <script src="https://unpkg.com/wavesurfer.js"></script> -->
<!-- 외부css링크 -->
<link rel="stylesheet" type="text/css" href="../../css/compose/composeMood.css">
	<title>AISM</title>
</head>
<script type="text/javascript">
	var sessionBoolean = "${sessionScope.myid}";
	console.log("'"+sessionBoolean+"'");
	
	if(sessionBoolean == ""){
		alert("로그인을 진행해 주십시오.");
		location.href = '/login.do';
	}
</script>
<body ontouchstart="">
	<!-- top부분 -->
	<div class="col-xs-12 col-md-12 col-lg-12" style="padding: 0;">
		<%@ include file="../../component/top.jsp" %>
	</div>
<!-- 	<div class="col-xs-12 col-md-12 col-lg-12 composeModal"> -->
<!-- 		<div class="composeModalBox"> -->
<!-- 			<div class="composeModalContent"> -->
<!-- 			</div> -->
<!-- 		</div> -->
<!-- 	</div> -->
	<div class="col-xs-12 col-md-12 col-lg-12" style="padding: 0;">
		<div class="defaultPage">
			<div class="col-xs-12 col-md-12 col-lg-12 stepList subTop">
				<ul>
					<li class="stepStateBox stepState01 stepState">작곡하기</li>
					<li class="stepStateArrow">&#8250;</li>
					<li class="stepStateBox stepState02">기본설정</li>
					<li class="stepStateArrow">&#8250;</li>
					<li class="stepStateBox stepState03">상세설정</li>
					<li class="stepStateArrow">&#8250;</li>
					<li class="stepStateBox stepState04">저장하기</li>
				</ul>
			</div>
			<div class="col-xs-12 col-md-12 col-lg-12" style="padding:0;">
				<div class="stepBox01">
					<div class="selectModBox selectGenreBoxForm" >
						<div class="selectModBoxTitle">장르</div>
						<div class="selectModBoxUl">
						<c:forEach var="grnre" items="${grnreList}" varStatus="status">
							<c:if test="${grnre.genrestate == 0}">
					        	<div class="selectModBoxLi disableKeyWordBox" id="${grnre.genre}" value="${grnre.genrestate}">${grnre.genretitle}</div>
					    	</c:if>
					    	<c:if test="${grnre.genrestate == 1}">
					        	<div class="selectModBoxLi selectGenreBox" id="${grnre.genre}" value="${grnre.genrestate}">${grnre.genretitle}</div>
					    	</c:if>
						</c:forEach>
						</div>
					</div>
					<div class="selectModBox selectMoodBoxForm">
						<div class="selectModBoxTitle_noneScroll">분위기</div>
						<div class="selectModBoxUl">
							<div class="selectModBoxLi selectMoodBox" id="dark">어두운</div>
							<div class="selectModBoxLi selectMoodBox" id="bright">밝은</div>
						</div>
					</div>
					<div class="selectModBox selectBPMBoxForm">
						<div class="selectModBoxTitle_noneScroll">빠르기</div>
						<div class="selectModBoxUl">
							<div class="selectModBoxLi selectBPMBox" id="slow">느리게</div>
							<div class="selectModBoxLi selectBPMBox" id="fast">빠르게</div>
						</div>
					</div>
					<div class="selectModBox selectKeyWordBoxForm">
						<div class="selectModBoxTitle">키워드</div>
						<div class="selectModBoxUl selectKeyWordBoxUl">
						<c:forEach var="keyWord" items="${keyWordList}" varStatus="status">
							<c:if test="${keyWord.keywordstate == 0}">
					        	<div class="selectModBoxLi disableKeyWordBox" id="${keyWord.keyword}" value="${keyWord.keywordstate}">${keyWord.keytitle}</div>
					    	</c:if>
					    	<c:if test="${keyWord.keywordstate == 1}">
					        	<div class="selectModBoxLi selectKeyWordBox" id="${keyWord.keyword}" value="${keyWord.keywordstate}">${keyWord.keytitle}</div>
					    	</c:if>
						</c:forEach>
						
						
						</div>
					</div>
				</div>
			</div>
			<!--작곡하기 페이지 -->
			<div class="col-xs-12 col-md-12 col-lg-12" style="padding: 0;">
				<div class="stepBox02" style="display: none">
					<!--로딩 페이지 -->
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
					
					<!--기본설정 -->
					<div class="col-xs-12 col-md-12 col-lg-12 mainSettingOptions">
						<div class="col-xs-12 col-md-12 col-lg-12 settingBox">
							<!--빠르기 -->
							<div class="col-xs-12 col-md-2 col-lg-2 step03BoxUl">
								<div class="step04ListTitle">
									<p>빠르기</p>
								</div>
							</div>
							<div class="col-xs-12 col-md-2 col-lg-2 step03BoxUl">
								<div class="step04List step04ListDetail step04ListSingle bpm" value='VerySlow'>
									<p>매우 느림 (60 ~ 69)</p>
								</div>
							</div>
							<div class="col-xs-12 col-md-2 col-lg-2 step03BoxUl">
								<div class="step04List step04ListDetail step04ListSingle bpm" value='Slow'>
									<p>느림 (70 ~ 99)</p>
								</div>
							</div>
							<div class="col-xs-12 col-md-2 col-lg-2 step03BoxUl">
								<div class="step04List step04ListDetail step04ListSingle bpm" value='Medium'>
									<p>중간 (100 ~ 119)</p>
								</div>
							</div>
							<div class="col-xs-12 col-md-2 col-lg-2 step03BoxUl">
								<div class="step04List step04ListDetail step04ListSingle bpm" value='Fast'>
									<p>빠름 (120 ~ 139)</p>
								</div>
							</div>
							<div class="col-xs-12 col-md-2 col-lg-2 step03BoxUl">
								<div class="step04List step04ListDetail step04ListSingle bpm" value='VeryFast'>
									<p>매우 빠름 (140 ~ 159)</p>
								</div>
							</div>
							
							<!--재생시간 -->
							<div class="col-xs-12 col-md-2 col-lg-2 step03BoxUl">
								<div class="step04ListTitle"><p>재생시간</p></div>
							</div>
							<div class="col-xs-6 col-md-2 col-lg-2 step03BoxUl">
								<div class="step04List step04ListDetail step04ListSingle playTime" value='Under90s'><p>1분40초 미만</p></div>	
							</div>
							<div class="col-xs-6 col-md-2 col-lg-2 step03BoxUl">
								<div class="step04List step04ListDetail step04ListSingle playTime" value='Over90s'><p>1분40초 이상</p></div>
							</div>
							<div class="hidden-xs hidden-sm col-md-2 col-lg-2 step03BoxUl">
								<!--빈칸 --><div class="step04List">&nbsp;</div>
							</div>
							<div class="hidden-xs hidden-sm col-md-2 col-lg-2 step03BoxUl">
								<!--빈칸 --><div class="step04List">&nbsp;</div>
							</div>
							<div class="hidden-xs hidden-sm col-md-2 col-lg-2 step03BoxUl">
								<!--빈칸 --><div class="step04List">&nbsp;</div>
							</div>
							
							<!--밝기 -->
							<div class="col-xs-12 col-md-2 col-lg-2 step03BoxUl">
								<div class="step04ListTitle">
									<p>밝기</p>
								</div>
							</div>
							<div class="col-xs-6 col-md-2 col-lg-2 step03BoxUl">
								<div class="step04List step04ListDetail step04ListSingle musickey" value='MajorKey'>
									<p>밝게</p>
								</div>
							</div>
							<div class="col-xs-6 col-md-2 col-lg-2 step03BoxUl">
								<div class="step04List step04ListDetail step04ListSingle musickey" value='MinorKey'>
									<p>어둡게</p>
								</div>
							</div>
							<div class="hidden-xs hidden-sm col-md-2 col-lg-2 step03BoxUl">
								<!--빈칸 --><div class="step04List">&nbsp;</div>
							</div>
							<div class="hidden-xs hidden-sm col-md-2 col-lg-2 step03BoxUl">
								<!--빈칸 --><div class="step04List">&nbsp;</div>
							</div>
							
							<div class="hidden-xs hidden-sm col-md-2 col-lg-2 step03BoxUl">
								<!--빈칸 --><div class="step04List">&nbsp;</div>
							</div>
							
							<!-- 멜로디 선택 -->
							<div class="col-xs-12 col-md-2 col-lg-2 step03BoxUl musicPlayOptionBox">
								<div class="step04ListTitle">
									<p>멜로디</p>
								</div>
							</div>
							<div class="col-xs-6 col-md-2 col-lg-2 step03BoxUl musicPlayOptionBox">
								<div class="step04List step04ListDetail step04ListSingle melody" value='yes'><p>생성함</p></div>
							</div>
							<div class="col-xs-6 col-md-2 col-lg-2 step03BoxUl musicPlayOptionBox">
								<div class="step04List step04ListDetail step04ListSingle melody" value='no'><p>생성안함</p></div>
							</div>
							<div class="hidden-xs hidden-sm col-md-2 col-lg-2 step03BoxUl musicPlayOptionBox">
								<!--빈칸 --><div class="step04List ">&nbsp;</div>
							</div>
							<div class="hidden-xs hidden-sm col-md-2 col-lg-2 step03BoxUl musicPlayOptionBox">
								<!--빈칸 --><div class="step04List">&nbsp;</div>
							</div>
							<div class="hidden-xs hidden-sm col-md-2 col-lg-2 step03BoxUl musicPlayOptionBox">
								<!--빈칸 --><div class="step04List">&nbsp;</div>
							</div>
						</div>
						<div class="col-xs-12 col-md-12 col-lg-12 defaultAlertForm">
							<div class="defaultAlertBox">
								<p class="defaultAlert">
									변경하셨군요 ~! 적용해볼까요?
								</p>
							</div>
							<div class="applySetting">
								<p class="applySettingTitle">적용하기</p>
							</div>
						</div>
					</div> <!--기본 설정 끝-->
				</div> <!--stepBox02 끝-->
			</div>
			<div class="col-xs-12 col-md-12 col-lg-12" style="padding: 0;">
				<div class="stepBox03" style="display: none">
					<div class="col-xs-12 col-md-12 col-lg-12" style="display: none">
						<div id="detailWaveform"></div>
					</div>
					<!--상세설정 -->
					<div class="col-xs-12 col-md-12 col-lg-12 songFormBox">
						<div class="songFormAlertBox">
							<div class="songFormAlert">
							</div>	
							<!--여기에다가 볼륨 넣을거임 --> 
							<div class="detailmusicVolume">
								<div id="detailmusicVolumeBox"></div>
								<input id="detailmusicVolume" type="range" min="0" max="1" value="1" step="0.01">
							</div>
						</div>
						
						<div class="showSongFormBox">
							<!--벌스 자동으로 생성 -->
							<div class="defaultMisicInfoBox">
								<div class="detailmusicStartTime">00:00</div>
								<div class="verseListBox"></div>
								<div class="detailmusicTotalTime">00:00</div>
							</div>
							
							<!--재생 박스-->
							<div class="mainMusicPlayBtnBox">
								
								<div class="mainMusicPlayBtn">
									<img id="mainMusicPlayBtn" value="play">
								</div>
								
								
							</div>
							<!--악기리스트 자동으로 생성-->
							<div class="songFormTitleBox">
								<div class="songFormTitle"></div>
							</div>
							<div class="col-xs-12 col-md-12 col-lg-12 showDetail_applyBox">
								<div class="applyBox">
									<div class="applyBoxAlertBox">
										<div class="applyBoxAlert">
										</div>
									</div>
									<div class="applyBox_btn applyBox_beforeBtn">
										<p>들어보기</p>
									</div>
								</div>
							</div>
							<div class="col-xs-12 col-md-12 col-lg-12 showDetail_loadingBox">
								<div class="showDetail_loading">
								</div>
							</div>
							<div class="col-xs-12 col-md-12 col-lg-12 showDetail_setting">
								<!--송폼 변경전 -->
								<div class="col-xs-12 col-sm-5 col-md-5 col-lg-5 boforeApplyBox_waveFormBox">
									<div class="boforeApplyBox_waveFormBtn" value="stop"></div>
									<div id="boforeApplyBox_waveForm"></div>
									<div class="boforeApplyBox_waveForm_volumeBox">
										<div class="boforeApplyBox_waveForm_volume_Img"></div>
										<input id="boforeApplyBox_waveForm_volume" type="range" min="0" max="1" value="1" step="0.01">
									</div>
								</div>
								<div class="col-xs-12 col-sm-2 col-md-2 col-lg-2 showDetail_ArrowBox">
									<div class="showDetail_Arrow">
										<span class="showDetail_ArrowImg">
											&#62;&#62;
										</span>
									</div>
								</div>
								<!--송폼 변경후 -->
								<div class="col-xs-12 col-sm-5 col-md-5 col-lg-5 applyBox_waveFormBox">
									<div class="applyBox_waveFormBtn" value="stop"></div>
									<div id="applyBox_waveForm"></div>
									<div class="applyBox_waveForm_volumeBox">
										<div class="applyBox_waveForm_volume_Img"></div>
										<input id="applyBox_waveForm_volume" type="range" min="0" max="1" value="1" step="0.01">
									</div>
								</div>
							</div>
							<div class="col-xs-12 col-md-12 col-lg-12 showDetail_setting">
								<div class="applyBox">
									<div class="applyAfterAlertBox">
										<div class="applyAfterAlert">
											마음에 드신다면 적용해주세요!
										</div>
									</div>
									<div class="applyBox_btn applyBox_afterBtn">
										<p>적용하기</p>	
									</div>
								</div>
							</div>
							<div class="col-xs-12 col-md-12 col-lg-12 showDetailBoxMelody"></div>
							<div class="col-xs-12 col-md-12 col-lg-12 showDetailBox"></div>
							<div id="instPlayForm" style="display: none;"></div>
						</div>
					</div>
					<div class="col-xs-12 col-md-12 col-lg-12 applyLoading">
						
					</div>
					<!--로딩 페이지 -->
					<div class="col-xs-12 col-md-12 col-lg-12 detailLoadingDolphinBox">
						<div class="col-xs-12 col-md-12 col-lg-12 ">
							<div class="dolphinImg"></div>
						</div>
						<div class="loadingPercent deTailLoadingPercent">0%</div>
					 	<div class="deTailLoadingState">
					 	 	<div class="progress">
							  <div id="detailDynamic" class="" style="width: 0%">
							  </div>
							</div>
					 	</div>
					</div>
				</div>
			</div>
			<div class="col-xs-12 col-md-12 col-lg-12" style="padding: 0">
				<div class="stepBox04" style="display: none">
					<div class="col-xs-12 col-md-6 col-lg-12 ">
						<div class="step04Box">
							<div class="col-xs-12 col-md-12 col-lg-12 ">
								<div class="downMainTitleBox">
									<p class="downMainTitle">원하는 다운로드 형태를 고르세요!</p>
								</div>
							</div>
							<div class="col-xs-12 col-md-12 col-lg-12 downLoadForm">
								<div class="albumCoverBox">
									<div class="cdCase">
										<div class="cdCaseHoleLine">
											<div class="cdCaseHole">
											</div>
										</div>
									</div>
									<div class="cdPlay"></div>
								</div>
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
							
	<!-- 						<div class="col-xs-2 col-md-2 col-lg-2 downPlayBtnBox"> -->
	<!-- 							<div><button onclick="wavesurferDown.playPause()" class="playBtnDown" value="Play"></button></div> -->
	<!-- 						</div> -->
	<!-- 						<div id="waveform_box" class="waveform_box col-xs-10 col-md-10 col-lg-10"> -->
	<!-- 							 <div id="waveformDown" class="col-xs-12 col-md-12 col-lg-12" style="padding: 0"> -->
	<!-- 							 </div> -->
	<!-- 							 <div class="col-xs-1 col-md-1 col-lg-1"> -->
	<!-- 								<div class="MusicStartTimeDown" style="display: none;">00:00</div> -->
	<!-- 							 </div> -->
	<!-- 						  	 <div class="col-xs-10 col-md-10 col-lg-10"> -->
	<!-- 								<div class="playStatusDown"> -->
	<!-- 							 		<p class="playStatusTitleDown"></p> -->
	<!-- 								</div> -->
	<!-- 							 </div> -->
	<!-- 							 <div class="col-xs-1 col-md-1 col-lg-1"> -->
	<!-- 								<div class="MusicTotalTimeDown"></div> -->
	<!-- 							 </div> -->
	<!-- 						</div> -->
						</div>
					</div>	
				</div>
			</div>
			<!--하단 재생, 이전다음버튼 -->
			<div class="mainRemocon">
				<div class="RemoconBox">
					<div class="col-xs-12 col-md-7 col-lg-7 musicRemocon remoconUL">
						<div class="selectComment">
							장르를 선택해 주세요
						</div>
						<div class="mainWaveFormBox">
								<div class="hidden-xs col-md-3 col-lg-3 choiceTitleBox">
									<div class="choiceTitle categoryStatus">장르  : </div>
									<div class="choiceTitle moodStatus">분위기 :</div>
								</div>
								<div class="col-xs-3 col-md-2 col-lg-2" style="padding: 0">
									<div class="playBtn"></div>
									<div class="playStatus">
											<div id="volumeBox"></div>
								 			<input id="volume" type="range" min="0" max="1" value="1" step="0.01">
									</div>
								</div>
								<div id="waveform_box" class=" col-xs-9 col-md-7 col-lg-7 waveform_box">
									<div id="waveFormBox" class="col-xs-12 col-md-12 col-lg-12" style="padding: 0">
										 
									</div>
									<div class="col-xs-3 col-md-2 col-lg-2" style="padding: 0">
										<div class="MusicStartTime">00:00</div>
									</div>
								  	<div class="col-xs-6 col-md-8 col-lg-8" style="padding: 0">
										
									</div>
									<div class="col-xs-3 col-md-2 col-lg-2" style="padding: 0">
										<div class="MusicTotalTime">00:00</div>
									</div>
								</div>
<!-- 							</div> -->
						</div>
					</div>
					<div class="col-xs-12 col-md-5 col-lg-5 songFormRemocon remoconUL">
						<div class="stepBtn previous" value="1">
							<p>이전</p>
						</div>
						<div class="stepBtn next" value="1">
							<p>다음</p>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- footer부분 -->
	<div class="col-xs-12 col-md-12 col-lg-12" style="padding: 0">
		<%@ include file="../../component/footer.jsp" %>
	</div>
	<form id="location" method="post" action="">
		<input type="hidden" name="" id="locationValue">
	</form>
	
	
		
		
<!-- 외부 js 링크 -->
<script src="../../js/compose/selectMood/composeDefaultSettings.js" ></script>
<script src="../../js/compose/selectMood/composeDetailSettings.js" ></script>
<script src="../../js/compose/selectMood/composeDownLoadPage.js" ></script>
</body>
</html>




