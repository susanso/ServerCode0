/**
 * 
 */
//detail 노래 총 시간
var detailPlayTotalTime = null;
//송폼 이름
var detailVerseTitle =null;
//송폼 값
var detailVerseValues = null;
//멜로디 이름
var melodyVerseTitle =null;
// 멜로디 값
var melodyVerseValues = null;
//함수 존재여부를 (instPlayBoolean)로 인해 함수존재 여부를 부여한다.
var instPlayBoolean = false;
//함수 존재여부를 (songFormPlay)로 인해 함수존재 여부를 부여한다.
var songFormPlayBoolean = false;
//(beforeSongFormPlayForm)함수존재 여부를 부여한다.
var beforeSongFormBoolean =false;
//함수 존재여부를 (instPlayBoolean)로 인해 함수존재 여부를 부여한다.
var detailWavesurferBoolean = false;
//로딩퍼센트 초기화
var detailCurrent_progress = 0;
//벌스, 악기 상세 세팅 가져오기
function getDetailSetting(){
		$.ajax({
		url:"/getDetailSetting",
		type: "POST",
		//아이디, 멜로디 생성 유뮤
		data:{"sessionBoolean":sessionBoolean,"melodyBoolean":melodyBoolean},
		success: function(data){
			//멜로디 json
			if(data.melodyOption != "none"){
				//멜로디 이름
				var melodySettings = JSON.parse(data.melodyOption);
				melodyVerseTitle = Object.keys(melodySettings);
				console.log(melodyVerseTitle);				
				// 멜로디 값
				melodyVerseValues = Object.values(melodySettings);
				console.log(melodyVerseValues);
			}
			//반주 json
			var detailSettings = JSON.parse(data.settings);
			console.log(detailSettings);
			
			//송폼 타이틀
			detailVerseTitle = Object.keys(detailSettings);
			console.log("detailSettings 키값");
			console.log(detailVerseTitle);
			
			//송폼 목록출현, 송폼별 시간 가져오기
			var verLi = "";
//			var verseValuesCnt = 0;
			for(var i=0 ; i<detailVerseTitle.length;i++){
				verLi += "<div class='verseList'id='"+detailVerseTitle[i]+"' value='"+verseValues[i]+"' >"+detailVerseTitle[i].toUpperCase()+"</div>";
//				verseValuesCnt++;				
			}
			$(".verseListBox").html(verLi);
			//벌스 마다 다른 색상 부여
			for(var i=0 ; i<detailVerseTitle.length;i++){
				if($(".verseList").eq(i).text().indexOf('INTRO')> -1 ){
					$(".verseList").eq(i).addClass("introColor");
				}else if($(".verseList").eq(i).text().indexOf('VERSE')> -1 ){
					$(".verseList").eq(i).addClass("verseColor");
				}else if($(".verseList").eq(i).text().indexOf('PRE')> -1 ){
					$(".verseList").eq(i).addClass("preColor");
				}else if($(".verseList").eq(i).text().indexOf('CHORUS')> -1 ){
					$(".verseList").eq(i).addClass("chorusColor");
				}else if($(".verseList").eq(i).text().indexOf('INTERLUDE')> -1 ){
					$(".verseList").eq(i).addClass("interludeColor");
				}else if($(".verseList").eq(i).text().indexOf('BRIDGE')> -1 ){
					$(".verseList").eq(i).addClass("bridgeColor");
				}else if($(".verseList").eq(i).text().indexOf('OUTRO')> -1 ){
					$(".verseList").eq(i).addClass("outroColor");
				}
			}
			//송폼 값
			detailVerseValues = Object.values(detailSettings);
//			console.log("detailSettings value값");
//			console.log(detailVerseValues);
		}
	})
};
function detailWavesurferForm(){
	//waveform 초기화
	$("#detailWaveform").html("");
	//상세 설정용 waveform
	detailWavesurfer = WaveSurfer.create({
	  container: '#detailWaveform',
	  
	  height:100,
	  backgroundColor: '#424546',
	  //barWidth: 2,
	  progressColor: '#00abeb',
	  cursorColor: 'transparent',
	  waveColor: '#bdbdbd'
	});
	//곡이 재생되는 동안 일어나는 함수
	detailWavesurfer.on('audioprocess', function () {
	    wavePlaytime = detailWavesurfer.getCurrentTime();
		$(".detailMusicStartTime").text(secondsTimeSpanToMS(wavePlaytime));
		for( var i = 0 ; i<verseValues.length;i++){
			if( i == verseValues.length-1){
				addBlink(i);
				return;
			}else if( parseInt(wavePlaytime) >= $(".verseList").eq(i).attr("value").split("/")[0] && parseInt(wavePlaytime) < $(".verseList").eq(i+1).attr("value").split("/")[0]){
				addBlink(i);
				return;
			}else{
				if($(".verseList").eq(i).text().indexOf('INTRO')> -1 ){
					$(".verseList").eq(i).removeClass("introBlink");
				}else if($(".verseList").eq(i).text().indexOf('VERSE')> -1 ){
					$(".verseList").eq(i).removeClass("verseBlink");
				}else if($(".verseList").eq(i).text().indexOf('PRE')> -1 ){
					$(".verseList").eq(i).removeClass("preBlink");
				}else if($(".verseList").eq(i).text().indexOf('CHORUS')> -1 ){
					$(".verseList").eq(i).removeClass("chorusBlink");
				}else if($(".verseList").eq(i).text().indexOf('INTERLUDE')> -1 ){
					$(".verseList").eq(i).removeClass("interludeBlink");
				}else if($(".verseList").eq(i).text().indexOf('BRIDGE')> -1 ){
					$(".verseList").eq(i).removeClass("bridgeBlink");
				}else if($(".verseList").eq(i).text().indexOf('OUTRO')> -1 ){
					$(".verseList").eq(i).removeClass("outroBlink");
				}
			}
		}//for end
		
	});//audioprocess end
	//모바일 드롭다운 스트립스
	//드롭다운 터치시 화면보이기
//	$(document).on("mouseover",".instInfoBoxSelect",function(){ 
//		if($(window).width() <= "575"){
//			$(this).find(".instInfoBoxSelect-content").removeAttr( 'style' );
////			$(this).find(".instInfoBoxSelect-list").removeAttr( 'style' );
////			$( '.instInfoBoxSelect-content' ).removeAttr( 'style' );
//		}
//		
//	});
//	//드롭다운이스트 터치시 화면 사라지게
//	$(document).on("mouseover",".instInfoBoxSelect-list",function(e){
//		 if($(window).width() <= "575"){
//			$(this).parent(".instInfoBoxSelect-content").css("display","none");	
////			$(this).siblings(".instInfoBoxSelect-content").toggleClass("dropdownDisplay");
////			$(".instInfoBoxSelect-content").css("display","none");	
////			$( '.instInfoBoxSelect-content' ).removeAttr( 'style' );
//		}
////		$(".instInfoBoxSelect-content").css("display","none");
//	});
	
	
	
	
	//곡이 준비가 완료된 상태면 이함수를 실행
	detailWavesurfer.on('ready', function() {
		//로딩 멈추기
		detailCurrent_progress = 100;	
	  	//음악 총시간 구현
	  	detailPlayTotalTime = detailWavesurfer.getDuration();
		$(".detailMusicTotalTime").text(secondsTimeSpanToMS(detailPlayTotalTime));
		//재생버튼 초기화
		$(".playBtn").attr("value","play");
		$(".playBtn").css("background","url(../../image/button/MusicPlayType.png)");
		$(".playBtn").css("background-size","cover");
	}); //ready end
	//곡이 로딩 되면서 일어나는 함수
	detailWavesurfer.on('loading', function(e) {
			$("#detailDynamic")
	 				.css("width", "100%");
	 		$(".deTailLoadingPercent").text("100%");
 			if (e >= 100) {
				detailCurrent_progress = 100;
			}
	});
	//곡이 끝나면 일어나는 함수
	detailWavesurfer.on('finish', function () {
		detailWavesurfer.stop();
		detailWavesurferBoolean = false;
		//blink 효과 전부 삭제
		removeBlink();
		//버튼 초기화
		$("#mainMusicPlayBtn").attr("value","play");
		$("#mainMusicPlayBtn").css("background","url(../../image/button/MusicPlayType.png)");
		$("#mainMusicPlayBtn").css("background-size","cover");
		$(".detailmusicStartTime").text("00:00");
	});  //finish end
	
	//음악 파일 연결
	detailWavesurfer.load("../../../usr/"+sessionBoolean+"/MySong.mp3");
//	detailWavesurfer.load("/audio/MySong.mp3");
	
	//음악 볼륨
	var detailvolumeInput = document.querySelector('#detailmusicVolume');
	var detailOnChangeVolume = function (e) {
		detailWavesurfer.setVolume(e.target.value);
		//음량 이미지
		if(e.target.value == 0){
			$("#detailmusicVolumeBox").css("background", "url(../../image/button/volumeMute.png)");
			$("#detailmusicVolumeBox").css("background-size", "cover");
		}else if(e.target.value >= 0.1 && e.target.value < 0.5){
			$("#detailmusicVolumeBox").css("background", "url(../../image/button/volumeDown.png)");
			$("#detailmusicVolumeBox").css("background-size", "cover");
		}else if(e.target.value >= 0.5 && e.target.value <= 1){
			$("#detailmusicVolumeBox").css("background", "url(../../image/button/volumeUp.png)");
			$("#detailmusicVolumeBox").css("background-size", "cover");
		}
	};
	detailvolumeInput.addEventListener('input', detailOnChangeVolume);
	detailvolumeInput.addEventListener('change', detailOnChangeVolume);
}
//detailMain 재생멈추기
function detailWavesurferPlay(){
		
	if(detailWavesurferBoolean){
		if(detailWavesurfer.isPlaying()){
			detailWavesurfer.stop();
			detailWavesurferBoolean = false;
			$("#mainMusicPlayBtn").css("background","url(../../image/button/MusicPlayType.png)");
			$("#mainMusicPlayBtn").css("background-size","cover");
			$("#mainMusicPlayBtn").attr("value","play");
			$(".detailmusicStartTime").text("00:00");
		}
	}
}
//송폼변경후 재생 멈추기
function songFormPlay(){
	if(songFormPlayBoolean){
		if(songFormPlayForm.isPlaying()){
			songFormPlayForm.stop();
			songFormPlayBoolean = false;
			//버튼 초기화
			$(".applyBox_waveFormBtn").css("background","url(../../image/button/ApplyMusicPlayType.png)");
			$(".applyBox_waveFormBtn").css("background-size","cover");
			$(".applyBox_waveFormBtn").attr("value","stop");
			$(".applyBox_waveFormBox").removeClass("songFormPlayNowActive");
	 	}	
	}
}
//송폼변경전  멈추기
function boforeResetInstPlay(){
	if(beforeSongFormBoolean){
		if(beforeSongFormPlayForm.isPlaying()){
			beforeSongFormPlayForm.stop();
			beforeSongFormBoolean = false;
			//버튼 초기화
			$(".boforeApplyBox_waveFormBtn").css("background","url(../../image/button/ApplyMusicPlayType.png)");
			$(".boforeApplyBox_waveFormBtn").css("background-size","cover");
			$(".boforeApplyBox_waveFormBtn").attr("value","stop");
			$(".boforeApplyBox_waveFormBox").removeClass("songFormPlayNowActive");
	 	}
	}
};
//악기재생 멈추기
function resetInstPlay(){
	if(instPlayBoolean){
		if(instPlayForm.isPlaying()){
			instPlayForm.stop();
			instPlayBoolean = false;
			$(".instBtnBox").removeClass("instStyleListPauseBtn");
			$(".instBtnBox").removeClass("playBoolean");
			$(".instBtnBox").addClass("instStyleListPlayBtn");
	 	}
	}
};
function removeBlink(){
	//blink효과 전체 삭제
	$(".verseList").removeClass("introBlink");
	$(".verseList").removeClass("verseBlink");
	$(".verseList").removeClass("preBlink");
	$(".verseList").removeClass("chorusBlink");
	$(".verseList").removeClass("interludeBlink");
	$(".verseList").removeClass("bridgeBlink");
	$(".verseList").removeClass("outroBlink");	
};
function addBlink(i){
	if($(".verseList").eq(i).text().indexOf('INTRO')> -1 ){
		$(".verseList").eq(i).addClass("introBlink");
	}else if($(".verseList").eq(i).text().indexOf('VERSE')> -1 ){
		$(".verseList").eq(i).addClass("verseBlink");
	}else if($(".verseList").eq(i).text().indexOf('PRE')> -1 ){
		$(".verseList").eq(i).addClass("preBlink");
	}else if($(".verseList").eq(i).text().indexOf('CHORUS')> -1 ){
		$(".verseList").eq(i).addClass("chorusBlink");
	}else if($(".verseList").eq(i).text().indexOf('INTERLUDE')> -1 ){
		$(".verseList").eq(i).addClass("interludeBlink");
	}else if($(".verseList").eq(i).text().indexOf('BRIDGE')> -1 ){
		$(".verseList").eq(i).addClass("bridgeBlink");
	}else if($(".verseList").eq(i).text().indexOf('OUTRO')> -1 ){
		$(".verseList").eq(i).addClass("outroBlink");
	}
	//퍼센트 구하기
	var verseListFocus =  i/verseValues.length;
	//실제 감싸는 div의 길이 값을 구한 퍼센트로 백분율로 px을 반환
	var verseListBoxWidth = $(".verseListBox").width();
	if(i+1 == verseValues.length){
		$('.verseListBox').scrollLeft(verseListBoxWidth);	
	}else{
		$('.verseListBox').scrollLeft(verseListBoxWidth*verseListFocus);
	}
	
	//console.log($(".verseList").eq(i).text()+"의 left값은"+teset000.left);
};
//모든 음악 재생 멈추기
$("html").keyup(function(e) {
	if(e.keyCode == 32){
		//debugger;
		wavesurferPlay();
		detailWavesurferPlay();
		removeBlink();
		songFormPlay();
		resetInstPlay();
		boforeResetInstPlay();
	}
});
//스페이스 누를때 아래로 휠되는거 막기
$( "html" ).keypress(function(e) {
	if(e.keyCode == 32){
		return false;   
	}
});
//재생버튼 클릭
$("#mainMusicPlayBtn").click(function(){
	resetInstPlay();
	if($(this).attr("value") =="play"){
		$(this).css("background","url(../../image/button/MusicPauseType.png)");
		$(this).css("background-size","cover");
		$(this).attr("value","stop");
		detailWavesurfer.playPause();
		detailWavesurferBoolean = true; 
		
	}else if($(this).attr("value") =="stop"){
		$(this).css("background","url(../../image/button/MusicPlayType.png)");
		$(this).css("background-size","cover");
		$(this).attr("value","play");
		//blink효과 전체 삭제
		removeBlink();
		detailWavesurfer.playPause();
		detailWavesurferBoolean = false;
	}
})
//송폼 리스트 클릭시
$(document).on("click",".verseList",function(){
	//메인곡 정지 
	wavesurferPlay();
//	$(".songFormAlertBox").fadeIn(500);
	$(".songFormAlert").text("다시 한번 누르면 노래가 정지됩니다.");
	//송폼이름을 가져온다
	let totalCommitText = $(this).text();
	let commitText="";
	//송폼이름에서 끝에 숫자를 지우고 소문자로 바꾸고 Blink를 붙여 클래스로 만든다.
	if(totalCommitText == 'INTRO' || totalCommitText == 'OUTRO'){
		commitText =totalCommitText.toLowerCase()+"Blink";
	}else{
		commitText = totalCommitText.substring(0, (totalCommitText.length-1)).toLowerCase()+"Blink";
		console.log(commitText);
		//prechorus면 pre로 바꾼다
		if(commitText == 'prechorusBlink'){
			commitText = "preBlink";
		}	
	}
	console.log(commitText);
	//해당 blink가 활성회가 되어있으면 커밋 안보이게한다.
//	if($(this).hasClass(commitText)){
//		$(".songFormAlertBox").fadeOut(500);
//		//$(".songFormAlert").text("");	
//	}
	var selectSongForm =$(this).text();
	//악기재생중이면 멈추기
	resetInstPlay();
	//다시 누르면 일시 정지
	if($(this).hasClass("introBlink")||$(this).hasClass("verseBlink")
		||$(this).hasClass("preBlink")||$(this).hasClass("chorusBlink")
		||$(this).hasClass("interludeBlink")||$(this).hasClass("bridgeBlink")
		||$(this).hasClass("outroBlink")){
		//blink효과 전체 삭제
		removeBlink();
		//버튼 모양 변경
		$("#mainMusicPlayBtn").css("background","url(../../image/button/MusicPlayType.png)");
		$("#mainMusicPlayBtn").css("background-size","cover");
		$("#mainMusicPlayBtn").attr("value","play");
		detailWavesurfer.pause();
		detailWavesurferBoolean = false;
		return;
	}else{
		//재생중이 아닐경우 재생버튼 모양 변경
		$("#mainMusicPlayBtn").css("background","url(../../image/button/MusicPauseType.png)");
		$("#mainMusicPlayBtn").css("background-size","cover");
		$("#mainMusicPlayBtn").attr("value","stop");
		detailWavesurferBoolean = true;
		//들어보기 사라지게 하기
		$(".showDetail_applyBox").css("display","none")
	}
	//blink효과 전체 삭제
	removeBlink();
	//송폼 클릭시 해당 시작구간으로 자동 재생
	var startPoint = $(this).attr("value").split("-")[0];
	detailWavesurfer.play(parseInt(startPoint));
	
	//해당 송폼 상태 출력 , fadeIn 효과
	$(".songFormTitle").css("display","none");
	$(".songFormTitle").text(selectSongForm);
	$(".songFormTitle").fadeIn(200);
	
	//리스트 하나를 크게 3분류로 나눈다. instBox, soundBox, applyBox
	/* 1.	verseListBox의 text값과 detailVerseTitle의값을 문자비교
		값이 일치하면 detailVerseTitle의 index 값을 가져와서
		detailVerseValues의 인덱스와 일치 시켜서 값들을 매칭한다 */
	var matchingSongFormIndex = 0; 
	for(var i =0; i<detailVerseTitle.length;i++){
		if(selectSongForm.toLowerCase() == detailVerseTitle[i]){
			matchingSongFormIndex = i;	
			break;
		}
	}
	
	/* 2.	매칭한 값들은 slpit 으로 데이터를 가공한다.*/
	var songFormSettingInfo = detailVerseValues[matchingSongFormIndex];
	console.log(songFormSettingInfo); 
	var songFormSettingCnt =songFormSettingInfo.split("_").length; 
	//console.log(songFormSettingCnt);
	//대체악기 분류 
	var songFormInstList = songFormSettingInfo.split("_");
	console.log('대체악기 분류');
	console.log(songFormInstList);
	//songFormInstList중 0번째의 선택된 악기, 악기리스트, 악기리스트 번호 분류
	var songFormSection =  songFormInstList[0].split("/");
	console.log('선택된 악기, 악기리스트, 악기리스트 번호 분류');
	console.log(songFormSection);
	//console.log(songFormInstList[0].split("/")[0].split("-")[1]); //선택된 악기 이름 예시 i,0,1;
	//console.log(songFormInstList[0].split("/")[0].split("-")[0]); //선택된 악기 분류 예시 main or sub
	//console.log(songFormInstList[1].split("/")[1].split("-")[0].split(",")); //선택된 악기 대체 악기 리스트
	//console.log(songFormInstList[0].split("/")[1].split("-")[0].split(",").length);//선택된 악기 대체 악기 리스트 갯수
	//console.log(songFormInstList[0].split("/")[2].split("-")[0].split("|")[0]);//선택된 악기 대체 악기 번호 리스트 갯수
	//console.log(songFormInstList[0].split("/")[2].split("-")[0].split("|")[0].split(",").length);//선택된 악기 대체 악기 번호 리스트 갯수
	/*3. 리스트 개수를 구했으니 instBox, soundBox, applyBox에 각각 값을 집어넣는다.*/
	$(".showDetailBox").css("display","none");
	$(".showDetailBoxMelody").css("display","none");
	
	//멜로디를 '생성함' 으로 누른상태면 맬로디 보여주기
	var melodyLi = "";
	if(melodyBoolean){
		for(var i = 0; i<melodyVerseTitle.length;i++){
			if(selectSongForm.toLowerCase() ==melodyVerseTitle[i]){
				//멜로디 이름
				console.log("멜로디 이름");
				console.log(melodyVerseTitle[i]);
				// 멜로디 값
				console.log("멜로디 값");
				console.log(melodyVerseValues[i]);
				console.log("내가 고른 송폼 이름");
				console.log(selectSongForm);
				
				//멜로디 라인 만들기
				melodyLi += "<div class='songFormMelodyTitle'>멜로디</div>";
				melodyLi += "<div class='col-xs-12 col-md-12 col-lg-12 showInstListBox' value='"+melodyVerseValues[i].split("/")[0].split("-")[0]+"'>";
				//instBox
					melodyLi +=	"<div class='col-xs-12 col-sm-5 col-md-3 col-lg-3 showInstList instInfoBox' >"+
									"<div class='instInfoBoxImg'><img alt='test' src='../image/inst/"+melodyVerseValues[i].split("/")[0].split("-")[1]+".png' id='instInfoBoxImg'></div>"+
									"<div class='instInfoControlBox'>"+
										"<div class='mainInstNameBox instInfoBoxNoneSelect'>"+
											"<div class='mainInstName instInfoBoxNoneSelect-button'>";
												if(melodyVerseValues[i].split("/")[0].split("-")[1] == "SynthStrings"){
													melodyLi += "<div class='mainInstNameNum'>SynStr</div>";
												}else{
													melodyLi += "<div class='mainInstNameNum'>"+melodyVerseValues[i].split("/")[0].split("-")[1]+"</div>";
												}
										melodyLi +="</div>"+
										"</div>"+
										"<div class='instInfoControlBox instOptionBox'>"+
											"<div class='instOffBox'>"+
											    "<div class='instOffBtn' id='instOffBtn' value='true'>"+
											     	"<input type='checkbox' class='instOffBoolean'>"+
											     	"<div class='knobs'></div>"+
									    		"</div>"+
											"</div>"+
											"<div class='instReplace'>"+
												"<div class='instReplaceTitle'>재생성</div>"+
												"<div class='instRefreshBtn'></div>"+
											"</div>"+
										"</div>"+
									"</div>"+
								"</div>";
				//soundBox
					melodyLi += "<div class='col-xs-12 col-sm-7 col-md-9 col-lg-9 showInstList instStyleBox "+melodyVerseValues[i].split("/")[0].split("-")[0]+"'>";
									//<!--악기소리도 자동으로 넣기  -->
							for(var j = 0; j<melodyVerseValues[i].split("/")[1].split(",").length;j++){
								if(melodyVerseValues[i].split("/")[0].split("-")[2] == melodyVerseValues[i].split("/")[1].split(",")[j]){
						melodyLi += "<div class='instStyleList playTimeToggle'>";			
								}else{
						melodyLi += "<div class='instStyleList'>";			
								}
						melodyLi +=		"<div class='instStyleListPlayBtn' value='"+melodyVerseValues[i].split("/")[1].split(",")[j]+"' id='"+melodyVerseValues[i].split("/")[0].split("-")[0]+"'></div>";
										if(melodyVerseValues[i].split("/")[0].split("-")[1] == "SynthStrings"){
											melodyLi +="<div class='instStyleSoundTitle'>SynStr "+(j+1)+"</div>";	
										}else{
											melodyLi +="<div class='instStyleSoundTitle'>"+melodyVerseValues[i].split("/")[0].split("-")[1]+" "+(j+1)+"</div>";
										}
									melodyLi += "</div>";
							}
					melodyLi += "</div>"+
							"</div>";
				break;
			}
		}	
	}
	//멜로디 옵션 최종 출력
	$('.showDetailBoxMelody').html(melodyLi);
	$(".showDetailBoxMelody").fadeIn(200);
	$(".instStyleListPlayBtn").addClass("instBtnBox");
	
	var instLi = "<div class='songFormMelodyTitle'>반주</div>";
	for(var i = 0; i<songFormSettingCnt;i++){
		instLi+= "<div class='col-xs-12 col-md-12 col-lg-12 showInstListBox' value='"+songFormInstList[i].split("/")[0].split("-")[0]+"'>";
		//instBox
		instLi+="<div class='col-xs-12 col-sm-5 col-md-3 col-lg-3 showInstList instInfoBox'>"+
					"<div class='instInfoBoxImg'><img alt='' src='../image/inst/"+songFormInstList[i].split("/")[0].split("-")[1]+".png' id='instInfoBoxImg'></div>"+
					"<div class='instInfoControlBox'>"+
						"<div class='mainInstNameBox instInfoBoxSelect'>"+
						"<div class='mainInstName instInfoBoxSelect-button'>";
						if(songFormInstList[i].split("/")[0].split("-")[1] == "SynthStrings"){
							instLi+="<div class='mainInstNameNum'>SynStr";
						}else{
							instLi+="<div class='mainInstNameNum'>"+songFormInstList[i].split("/")[0].split("-")[1];	
						}
						instLi+="</div> <div>&#9660;</div> </div>"+
						"<div class='instInfoBoxSelect-content'>";
						//대체악기 리스트 
						for(var j =0; j<songFormInstList[i].split("/")[1].split(",").length;j++){
							instLi+="<div class='instInfoBoxSelect-list' id='"+songFormInstList[i].split("/")[0].split("-")[0]+"'>";
							if(songFormInstList[i].split("/")[1].split("-")[0].split(",")[j] == "SynthStrings"){
								instLi+="SynStr";
							}else{
								instLi+= songFormInstList[i].split("/")[1].split("-")[0].split(",")[j];	
							}
							instLi+="</div>";
						}
				instLi+="</div>"+
						"</div>"+
						"<div class='instInfoControlBox instOptionBox'>"+
							"<div class='instOffBox'>"+
							    "<div class='instOffBtn' id='instOffBtn' value='true'>"+
							     	"<input type='checkbox' class='instOffBoolean'>"+
							     	"<div class='knobs'></div>"+
						    	"</div>"+
							"</div>"+
							"<div class='instReplace'>"+
								"<div class='instReplaceTitle'>재생성</div>"+
								"<div class='instRefreshBtn'></div>"+
							"</div>"+
						"</div>"+
					"</div>"+
				"</div>";
		//soundBox
		instLi+=	"<div class='col-xs-12 col-sm-7 col-md-9 col-lg-9 showInstList instStyleBox "+songFormInstList[i].split("/")[0].split("-")[0]+"'>";
					//악기소리도 자동으로 넣기  시작
					//해당 악기와 악기번호 list index 같게 만들기
					var instNumIndex = 0;
					for( instNumIndex; instNumIndex<songFormInstList[i].split("/")[1].split(",").length; instNumIndex++){
							if(songFormInstList[i].split("/")[0].split("-")[1] == songFormInstList[i].split("/")[1].split(",")[instNumIndex]){
								break;
							}
					}
					console.log("해당 악기의 인덱스"+instNumIndex);
					for(var k = 0;k<songFormInstList[i].split("/")[2].split("|")[instNumIndex].split(",").length ; k++ ){
					//설정된 악기번호 active 효과
					if(songFormInstList[i].split("/")[0].split("-")[2] == songFormInstList[i].split("/")[2].split("-")[0].split("|")[instNumIndex].split(",")[k]){
		instLi+=		"<div class='instStyleList playTimeToggle'>";			
					}else{
		instLi+=		"<div class='instStyleList'>";				
					}
		instLi+=			"<div class='instStyleListPlayBtn' id='"+songFormInstList[i].split("/")[0].split("-")[0]+"'"+
								"value='"+songFormInstList[i].split("/")[2].split("-")[0].split("|")[instNumIndex].split(",")[k]+"'></div>";
								//"<div class='instStyleSoundTitle'>"+songFormInstList[i].split("/")[0].split("-")[1]+" "+(k+1)+"</div>"+
								if(songFormInstList[i].split("/")[0].split("-")[1] == "SynthStrings"){
									instLi+="<div class='instStyleSoundTitle'>SynStr "+(k+1)+"</div>";	
								}else{
									instLi+="<div class='instStyleSoundTitle'>"+songFormInstList[i].split("/")[0].split("-")[1]+" "+(k+1)+"</div>";
								}
							instLi+="</div>";
					} 
						//악기소리도 자동으로 넣기  종료
		instLi+=		"</div>";
		instLi+="</div>"
	}
	 
	//리스트 최종 출력
	$(".showDetailBox").html(instLi);
	$(".showDetailBox").fadeIn(200);
	$(".instStyleListPlayBtn").addClass("instBtnBox");
});
$(document).on("click",".instInfoBoxSelect-list",function(){
	$(".applyBoxAlert").html("악기를 변경하셨어요! <br/> 변경된 악기로 들어볼까요?");
	var changeInstName  = $(this).text();
	var changeSongFormName = $('.songFormTitle').text().toLowerCase();
	var changeInstTypeName = this.id;
	//화면 전환 효과
	$("."+changeInstTypeName).css("display","none");
	//1. changeSongFormName으로 송폼으로 분류 
	var changeSongFormNameIndex = 0; 
	for(var i = 0; i<detailVerseTitle.length;i++){
		if(changeSongFormName == detailVerseTitle[i]){
			changeSongFormNameIndex = i;	
			break;
		}
		
	}
	//2. changeInstTypeName 으로 악기구분 ex) MainInst or SunInst4 
	var songFormSettingInfo = detailVerseValues[changeSongFormNameIndex];
	var changeInstTypeNameIndex = 0;
	for(var i = 0;i<songFormSettingInfo.split("_").length;i++){
		if(changeInstTypeName == songFormSettingInfo.split("_")[i].split("/")[0].split("-")[0] ){
			changeInstTypeNameIndex = i;
			break;
		}
	}
	//3. 악기구분후 그값으로 악기 리스트 분류 
	var isntListInfo =  songFormSettingInfo.split("_")[changeInstTypeNameIndex];
	 
	//4.매칭되는 악기구분 으로 index 뽑기
	var selectInstNum = isntListInfo.split("/")[0].split("-")[2];
	var findInstList = isntListInfo.split("/")[1];
	var findInstNumList = isntListInfo.split("/")[2];
	//console.log(isntListInfo);
	//console.log(findInstList);
	//console.log(findInstNumList);
	//console.log(selectInstNum);
	
	var changeInstNameIndex = 0;
	for(var i = 0;i<findInstList.split(",").length;i++){
		if(changeInstName == findInstList.split(",")[i]){
			changeInstNameIndex = i;
			break;
		}
	}
	
	//신스 스트링 text 수정	
	if( changeInstName == "SynthStrings"){
		changeInstName = "SynStr";
		$(this).parents(".instInfoControlBox").siblings(".instInfoBoxImg").find("#instInfoBoxImg").attr("src","../image/inst/SynthStrings.png");
	}else if(changeInstName == "SynStr"){
		$(this).parents(".instInfoControlBox").siblings(".instInfoBoxImg").find("#instInfoBoxImg").attr("src","../image/inst/SynthStrings.png");
	}else{
		//악기 이름에 맞게 이미지 변경
		$(this).parents(".instInfoControlBox").siblings(".instInfoBoxImg").find("#instInfoBoxImg").attr("src","../image/inst/"+changeInstName+".png");
	}
	//5. instInfoBoxSelect-button의 text 수정
	$(this).parents('.instInfoBoxSelect-content').prevAll(".instInfoBoxSelect-button").html("<div  class='mainInstNameNum'>"+changeInstName+"</div> <div>&#9660;</div>");
	
	//6. 리스트 갱신	/	원래 값으로 돌릴때 active 활성화 까지 생각하기(json 값 기준으로 비교해서 활성화 하기)
	var changeInstListBox = "";
	for(var i = 0; i<findInstNumList.split("|")[changeInstNameIndex].split(",").length;i++){
			if(selectInstNum == findInstNumList.split("|")[changeInstNameIndex].split(",")[i]){
		changeInstListBox+=	"<div class='instStyleList playTimeToggle'>";		
			}else{
		changeInstListBox+=	"<div class='instStyleList'>";		
			}
		changeInstListBox+=		"<div class=' instStyleListPlayBtn' id='"+changeInstTypeName+"'"+
									"value='"+findInstNumList.split("|")[changeInstNameIndex].split(",")[i]+"'></div>"+
									"<div class='instStyleSoundTitle'>"+changeInstName+" "+(i+1)+"</div>"+
								"</div>";
		changeInstListBox+=	"</div>";
	}
	
	//악기에 따른 리스트 최종 출력
	$("."+changeInstTypeName).html(changeInstListBox);
	$("."+changeInstTypeName).fadeIn(200);
	$(".instStyleListPlayBtn").addClass("instBtnBox");
});
//악기 재생 버튼 클리시
$(document).on("click",".instStyleList",function(){
	
	//버튼 효과 activ주기
	$(this).siblings().removeClass("playTimeToggle");
	$(this).addClass("playTimeToggle");
	// 재생중이면 일시정지로 바꾸기
	if($(this).find(".instBtnBox").hasClass("instStyleListPauseBtn")){
		$(this).find(".instBtnBox").removeClass("instStyleListPauseBtn");
		$(this).find(".instBtnBox").addClass("instStyleListPlayBtn");
		instPlayForm.stop();
		instPlayBoolean = false;
		
		$("#instPlayForm").html("");
		return;
	}
	//다른악기가 재생중이면 정지시키기
	wavesurferPlay();
	detailWavesurferPlay();
	songFormPlay();
	resetInstPlay();
	removeBlink();
	boforeResetInstPlay();
	//송폼리스트 , 재생버튼, 적용하기, 대체악기, 다른 악기들 비활성화 설정
	$(".verseListBox").addClass("disabledbutton");
	$(".mainMusicPlayBtnBox").addClass("disabledbutton");
	$(".instRefreshBtn").addClass("disabledbutton");
	$(".mainInstNameBox").addClass("disabledbutton");
	$(".instStyleList").addClass("disabledbutton");
	
	//일시정지 버튼으로 바꾼다
    $("#instPlayForm").html("");
    $(".instBtnBox").removeClass("playBoolean");
    $(".instBtnBox").removeClass("instStyleListPauseBtn");
	$(".instBtnBox").addClass("instStyleListPlayBtn");
	
	//로딩
	$(this).find(".instBtnBox").removeClass("instStyleListPlayBtn");
	$(this).find(".instBtnBox").addClass("instPlayLoadingSample");
	$(this).find(".instBtnBox").addClass("playBoolean");
	
	//송폼 이름
	var songForm = $(".songFormTitle").text().toLowerCase();
    //음악 타입
	var instType = $(this).find(".instBtnBox").attr("id");
	console.log($(this).find(".instBtnBox").attr("id"));
	//악기 번호
	var instValue = $(this).find(".instBtnBox").attr("value");
	//악기만 재생
	$.ajax({
		url:"/instPlay.do",
		type: "POST",
		//아이디, 멜로디 생성 유뮤
		data:{"sessionBoolean":sessionBoolean,"songForm":songForm,"instType":instType,"instValue":instValue,"keyword":keyword},
		success: function(data){
			instPlayForm = WaveSurfer.create({
			  container: '#instPlayForm'
			});
			instPlayForm.on('ready', function() {
				//들어보기 활성화 및 적용하기 사라지기
				$(".applyBoxAlert").html("악기를 들어보셨군요! <br/> 방금 누르신 악기로 변경해서 들어볼까요?");
				$(".showDetail_applyBox").slideDown(200);
				$(".showDetail_setting").slideUp(200);
				//송폼리스트 , 재생버튼 비활성화 해제
				$(".verseListBox").removeClass("disabledbutton");
				$(".mainMusicPlayBtnBox").removeClass("disabledbutton");
				$(".instRefreshBtn").removeClass("disabledbutton");
				$(".mainInstNameBox").removeClass("disabledbutton");
				$(".instStyleList").removeClass("disabledbutton");
				//악기 불러오기를 끝냈을때 다른 악가 재생 버튼 누를수있게 활성화
                $(".instStyleListPlayBtn").addClass("instBtnBox");
                //$(".playBoolean").addClass("instBtnBox");
				$(".playBoolean").removeClass("instPlayLoadingSample");
				$(".playBoolean").addClass("instStyleListPauseBtn");
				
				instPlayForm.play();
				instPlayBoolean = true;
	 		});
			instPlayForm.on('finish', function () {
				$(".playBoolean").removeClass("instStyleListPauseBtn");
				$(".playBoolean").addClass("instStyleListPlayBtn");
				$("#instPlayForm").html("");
				instPlayBoolean=false;
			}); 
			instPlayForm.load("../../../usr/"+sessionBoolean+"/"+data.songForm+"_"+data.instType+".mp3");
//			instPlayForm.load("/audio/MySong.mp3");
		}
	})
});
//악기 끄기
$(document).on("click",".instOffBtn",function(){
	resetInstPlay();
	boforeResetInstPlay();
	let resetInstCase = $(this).parents('.instInfoControlBox').siblings(".mainInstNameBox").find(".mainInstNameNum").text();
	
	//악기 설정이 변경되면 
	if($(this).hasClass("instOffBtn")){
		if($(this).attr("value") == "true"){
			$(".applyBoxAlert").html(resetInstCase+"의 악기를 끄셨군요! <br/>"+resetInstCase+"의 악기를 끈 설정으로 들어볼까요?");	
		}else{
			$(".applyBoxAlert").html(resetInstCase+"의 악기를 키셨군요! <br/>"+resetInstCase+"의 악기를 킨 설정으로 들어볼까요?");
		}
	}
	if($(this).attr("value") == "false"){
		$(this).attr("value","true");
		$(this).parents(".showInstListBox").removeClass("notUsed");
		$(this).parents(".showInstList").siblings(".instStyleBox").removeClass("disabledbutton");
		$(this).parents(".instInfoControlBox").siblings(".mainInstNameBox").removeClass("disabledbutton");
        $(this).parents(".instInfoBox").css("backgroundColor","#383838");		
		$(this).parent(".instOffBox").siblings().removeClass("disabledbutton");
	}else{
		$(this).attr("value","false");
		$(this).parents(".showInstListBox").addClass("notUsed");
		$(this).parents(".showInstList").siblings(".instStyleBox").addClass("disabledbutton");
		$(this).parents(".instInfoControlBox").siblings(".mainInstNameBox").addClass("disabledbutton");
		$(this).parents(".instInfoBox").css("backgroundColor","#2d2e30");
		$(this).parent(".instOffBox").siblings().addClass("disabledbutton");
	}
	
}); 
//연주법 변경
$(document).on("click",".instRefreshBtn",function(){
	resetInstPlay();
	boforeResetInstPlay();
	//1. 변경시 해당 라인의 값들 가져오기
	// prm_ID,			bpm_num,	key_value,	 sf,	ms_count,	ms_offset,	instType,	instCase,	instNum
	// 유저 아이디,		bpm값,		키 값,		 송폼,	마디수,		총 마디수,		악기구분,		악기이름,		악기번호
	let resetInstCase = $(this).parents('.instOptionBox').siblings(".mainInstNameBox").find(".mainInstNameNum").text();
	console.log(resetInstCase);
	let songFormName = $(".songFormTitle").text().toLowerCase();
	console.log(songFormName);
	let resetInstNum = $(this).parents('.showInstList').siblings(".instStyleBox").find(".playTimeToggle").find(".instStyleListPlayBtn").attr("value");
	console.log(resetInstNum);
	if(resetInstNum == undefined){
		var selectMsg =  "<div><p>"+songFormName+"의 악기를 선택해주세요</p><div class='confirmModalBtnBox'><div class='composeModalClose confirmModalBtn'>확인</div></div><div>";
		callModal(selectMsg);
		return;
	}
	let mainShowInstListBox =  $(this).parents(".showInstListBox");
	console.log(mainShowInstListBox);
	let resetBpm_num = defaultSettings.Bpm_Num;
	console.log(resetBpm_num);
	let resetKeyValue = defaultSettings.KeyValue;
	console.log(resetKeyValue);
	let resetDongForm = $(".songFormTitle").text().toLowerCase();
	console.log(resetDongForm);
	let songformCount =null;
	$.each(songFormSettings, function(key,value){
		if(key == songFormName){
			songformCount = value;
		}
	});
	let resetMs_count = songformCount.split("/")[1];
	console.log(resetMs_count);
	let resetMs_offset = songformCount.split("/")[2];
	console.log(resetMs_count);
	let resetInstType = $(this).parents(".showInstListBox").attr("value");
	console.log(resetInstType);
	//console.log("유저 아이디 (prm_ID) : "+sessionBoolean);
	//console.log("bpm값(bpm_num) : "+defaultSettings.Bpm_Num);//bpm값
	//console.log("키값(key_value) : "+defaultSettings.KeyValue);//키값
	//console.log("송폼 (sf) : "+$(".songFormTitle").text().toLowerCase());
	//console.log("마디수 (ms_count) : "+songformCount.split("/")[1]);
	//console.log("총 마디수 (ms_offset) : "+songformCount.split("/")[2]);
	console.log("악기구분 (instType) : "+$(this).parents(".showInstListBox").attr("value"));
	console.log("악기이름 (instCase) : "+$(this).parents('.showInstList').siblings(".instInfoBox").find(".mainInstNameNum").text());
	console.log("악기번호 (instNum) : "+$(this).parents('.showInstList').siblings(".instStyleBox").find(".playTimeToggle").find(".instStyleListPlayBtn").attr("value"));
	$(this).parents(".showInstListBox").addClass("disabledbutton");
	$(".instRefreshBtn").addClass("disabledbutton");
	$(this).addClass("instRefreshBtnLoading");
	//들어보기 커밋 넣기
	$(".applyBoxAlert").html("연주법을 변경하셨어요! <br/> 변경된 악기를 선택해 들어볼까요?");
	$.ajax({
		url:"/resetYeonZu",
		type: "POST",
		//아이디, 멜로디 생성 유뮤
		data:{"sessionBoolean":sessionBoolean,"bpm_num":resetBpm_num,"key_value":resetKeyValue,"sf":songFormName,"ms_count":resetMs_count,
				"ms_offset":resetMs_offset,"instType":resetInstType,"instCase":resetInstCase,"instNum":resetInstNum,"keyword":keyword,},
		success: function(data){
			//데이터 수신에 성공했을 경우
			if(data.success =="success"){
				console.log(sessionBoolean);
				console.log(resetBpm_num);
				console.log(resetKeyValue);
				console.log(songFormName);
				console.log(resetMs_count);
				console.log(resetMs_offset);
				console.log(resetInstType);
				console.log(resetInstCase);
				console.log(resetInstNum);
				console.log(keyword);
				$(".instRefreshBtn").removeClass("instRefreshBtnLoading");
				$(".instRefreshBtn").parents(".showInstListBox").removeClass("disabledbutton");
				$(".instRefreshBtn").removeClass("disabledbutton");
				mainShowInstListBox.fadeOut();
	            mainShowInstListBox.fadeIn(700);
			}
		}
	})
});
//악기 설정한개라도 event 가 일어나면 들어보기 출력
$(document).on("click",".instRefreshBtn,.instOffBtn,.instInfoBoxSelect-list",function(){
	

	$(".showDetail_applyBox").slideDown(200);
	$(".showDetail_setting").slideUp(200);
	songFormPlay();
	boforeResetInstPlay();
});
//들어보기 클릭시  로딩과 파형을 출력 
$(".applyBox_beforeBtn").click(function(){	
	//재생중인 음원들 전부 중지function
	wavesurferPlay();
	detailWavesurferPlay();
	resetInstPlay();
	boforeResetInstPlay();
	songFormPlay();
	//송폼 리스트 깜빡이는거 없애기
	removeBlink();
	//songform
	let songFormName = $(".songFormTitle").text().toLowerCase();
	//로딩을 먼저 출력 시킨다
	console.log(songFormName);
	//적용할 리스트의 갯수 
	let songFormCnt = $('.showInstListBox').length; 
	console.log(songFormCnt);
	 paramString = "";

	for(var i =0; i<songFormCnt;i++){
		//꺼져있는 악기들 분류
		if($('.showInstListBox').eq(i).hasClass("notUsed")){
			//꺼져있으면 저장 하지 않음
		}else{
			//켜져 있으면 저장함
			console.log(i+"번째 저장됨 --> "+$('.showInstListBox').eq(i).attr("value"));
			var findInstType = $('.showInstListBox').eq(i).attr("value");
			var findInstNum = $('.showInstListBox').eq(i).find(".playTimeToggle").children(".instStyleListPlayBtn").attr("value");
			var findInstName = $('.showInstListBox').eq(i).find(".mainInstNameNum").text();
			if(findInstNum == undefined){
				var selectMsg = "<div><p>"+(i+1)+"번째"+findInstName+"의 소리를 골라주세요</p><div class='confirmModalBtnBox'><div class='composeModalClose confirmModalBtn'>확인</div></div><div>"
				callModal(selectMsg);
				return;
			}
				paramString += ","+findInstType+"/"+findInstName+"/"+findInstNum;
		}
	}
	//모든 악기를 끄지 못하게 막기
	if(paramString == ""){
		var selectMsg = "<div><p>모든악기를 끌수 없습니다</p><div class='confirmModalBtnBox'><div class='composeModalClose confirmModalBtn'>확인</div></div><div>"
		callModal(selectMsg);
		return;
	}
	//여기
	//하단 fixbar 를 사라지게한다
	$(".mainRemocon").css("bottom","-150px");
	
	//송폼 리스트 비활성화
	$(".showInstListBox").addClass("disabledbutton");
	$(".applyBox_afterBtn").fadeIn(200);
	$(".applyAfterAlertBox").fadeIn(200);
	
	paramString = paramString.substring(1);
	console.log(paramString);
	console.log(songFormName);
	console.log(keyword);
	console.log(sessionBoolean);
	
	//송폼리스트와 재생버튼을 비활성화
	$(".verseListBox").addClass("disabledbutton");
	$(".mainMusicPlayBtnBox").addClass("disabledbutton");
	$(".showDetail_setting").css("display","none");
	
	$("#boforeApplyBox_waveForm").html("");
	$("#applyBox_waveForm").html("");
	$(".showDetail_applyBox").css("display", "none");
	$(".showDetail_loadingBox").fadeIn(200);
	$(".showDetail_loadingBox").css("display","flex");
	
	//변경전, 변경후 재생상태 초기화
	$(".boforeApplyBox_waveFormBox").removeClass("songFormPlayNow");
	$(".boforeApplyBox_waveFormBox").removeClass("songFormPlayNowActive");
	$(".applyBox_waveFormBox").removeClass("songFormPlayNow");
	$(".applyBox_waveFormBox").removeClass("songFormPlayNowActive");
	$.ajax({
		url:"/changeSongForm",
		type: "POST",
		//아이디, 멜로디 생성 유뮤
		data:{"songFormName":songFormName,"paramString":paramString,"keyword":keyword,"sessionBoolean":sessionBoolean},
		success: function(data){
			if(data.success =="success"){
				$(".showInstListBox").removeClass("disabledbutton");
				//로딩이 사라지고 파형이 나온다.
				$(".showDetail_setting").fadeIn(200);
				$(".showDetail_setting").eq(0).css("display","flex");
				$(".showDetail_loadingBox").css("display","none");
				
				//변경전 비교대상이 될 송폼을 만든다
				beforeSongFormPlayForm = WaveSurfer.create({
					container: '#boforeApplyBox_waveForm',
					height:30,
					backgroundColor: '#424546',
					progressColor: '#00abeb',
					cursorColor: 'transparent',
					waveColor: '#bdbdbd'
				});
				beforeSongFormPlayForm.on('ready', function() {
					
					//재생버튼으로 변경
					$(".boforeApplyBox_waveFormBtn").css("background","url(../../image/button/ApplyMusicPlayType.png)");
					$(".boforeApplyBox_waveFormBtn").css("background-size","cover");
					$(".boforeApplyBox_waveFormBtn").attr("value","stop");
		 		});
				beforeSongFormPlayForm.on('finish', function () {
					//곡이 끝났을때 버튼 초기화
					beforeSongFormPlayForm.stop();
					$(".boforeApplyBox_waveFormBtn").css("background","url(../../image/button/ApplyMusicPlayType.png)");
					$(".boforeApplyBox_waveFormBtn").css("background-size","cover");
					$(".boforeApplyBox_waveFormBtn").attr("value","stop");
					beforeSongFormBoolean = false;
				});
				beforeSongFormPlayForm.load("../../../usr/"+sessionBoolean+"/"+data.songFormName+"Raw.mp3");
//				beforeSongFormPlayForm.load("/audio/MySong.mp3");
				//음악 볼륨
				var beforeSongFormPlayVolumeInput = document.querySelector('#boforeApplyBox_waveForm_volume');
				var beforeSongFormPlayChangeVolume = function (e) {
					beforeSongFormPlayForm.setVolume(e.target.value);
					//음량 이미지
					if(e.target.value == 0){
						$(".boforeApplyBox_waveForm_volume_Img").css("background", "url(../../image/button/volumeMute.png)");
						$(".boforeApplyBox_waveForm_volume_Img").css("background-size", "cover");
					}else if(e.target.value >= 0.1 && e.target.value < 0.5){
						$(".boforeApplyBox_waveForm_volume_Img").css("background", "url(../../image/button/volumeDown.png)");
						$(".boforeApplyBox_waveForm_volume_Img").css("background-size", "cover");
					}else if(e.target.value >= 0.5 && e.target.value <= 1){
						$(".boforeApplyBox_waveForm_volume_Img").css("background", "url(../../image/button/volumeUp.png)");
						$(".boforeApplyBox_waveForm_volume_Img").css("background-size", "cover");
					}
				};
				beforeSongFormPlayVolumeInput.addEventListener('input', beforeSongFormPlayChangeVolume);
				beforeSongFormPlayVolumeInput.addEventListener('change', beforeSongFormPlayChangeVolume);
				
				
				//변경후 송폼을 만든다
				//값이 성공적으로 보내졌을경우 파형을 담고 있는 div를 display:block 시키고 파형을 출력한다.
				songFormPlayForm = WaveSurfer.create({
					container: '#applyBox_waveForm',
					height:30,
					backgroundColor: '#424546',
					progressColor: '#00abeb',
					cursorColor: 'transparent',
					waveColor: '#bdbdbd'
				});
				songFormPlayForm.on('ready', function() {
					//하단 fixbar 나오게 한다
					$(".mainRemocon").css("bottom","0px");
					//버튼 재생중으로 변경
					$(".applyBox_waveFormBtn").css("background","url(../../image/button/ApplyMusicPauseType.png)");
					$(".applyBox_waveFormBtn").css("background-size","cover");
					$(".applyBox_waveFormBtn").attr("value","play");
					//자동 시작
					songFormPlayForm.play();
					songFormPlayBoolean = true;
					
					//재생중인 폼 표시
					$('.applyBox_waveFormBox').addClass("songFormPlayNow");
					//재생중 효과넣기
					$('.applyBox_waveFormBox').addClass("songFormPlayNowActive");
		 		});
				songFormPlayForm.on('finish', function () {
					//곡이 끝났을때 버튼 초기화
					songFormPlayForm.stop();
					$(".applyBox_waveFormBtn").css("background","url(../../image/button/ApplyMusicPlayType.png)");
					$(".applyBox_waveFormBtn").css("background-size","cover");
					$(".applyBox_waveFormBtn").attr("value","stop");
					songFormPlayBoolean = false;
				}); 
				songFormPlayForm.load("../../../usr/"+sessionBoolean+"/"+data.songFormName+".mp3");
//				songFormPlayForm.load("/audio/MySong.mp3");
				//음악 볼륨
				var songFormPlayVolumeInput = document.querySelector('#applyBox_waveForm_volume');
				var songFormPlayChangeVolume = function (e) {
					songFormPlayForm.setVolume(e.target.value);
					//음량 이미지
					if(e.target.value == 0){
						$(".applyBox_waveForm_volume_Img").css("background", "url(../../image/button/volumeMute.png)");
						$(".applyBox_waveForm_volume_Img").css("background-size", "cover");
					}else if(e.target.value >= 0.1 && e.target.value < 0.5){
						$(".applyBox_waveForm_volume_Img").css("background", "url(../../image/button/volumeDown.png)");
						$(".applyBox_waveForm_volume_Img").css("background-size", "cover");
					}else if(e.target.value >= 0.5 && e.target.value <= 1){
						$(".applyBox_waveForm_volume_Img").css("background", "url(../../image/button/volumeUp.png)");
						$(".applyBox_waveForm_volume_Img").css("background-size", "cover");
					}
				};
				songFormPlayVolumeInput.addEventListener('input', songFormPlayChangeVolume);
				songFormPlayVolumeInput.addEventListener('change', songFormPlayChangeVolume);
			}
		}
	})
});
//송폼 변경후 재생버튼
$(document).on("click",".applyBox_waveFormBtn",function(){
	//변경전 재생 멈추기
	boforeResetInstPlay();
	//악기재생 멈추기
	resetInstPlay();
	//메인곡 정지
	wavesurferPlay();
	if($(this).attr("value") == "play"){
		$(".applyBox_waveFormBtn").css("background","url(../../image/button/ApplyMusicPlayType.png)");
		$(".applyBox_waveFormBtn").css("background-size","cover");
		$(".applyBox_waveFormBtn").attr("value","stop");
		$(".applyBox_waveFormBox").removeClass("songFormPlayNowActive");
		songFormPlayForm.playPause();
		songFormPlayBoolean = false;
		
	}else{
		$(".applyBox_waveFormBtn").css("background","url(../../image/button/ApplyMusicPauseType.png)");
		$(".applyBox_waveFormBtn").css("background-size","cover");
		$(".applyBox_waveFormBtn").attr("value","play");
		//변경전 파형이 재생 활성화 상태면 제거하고 해당파형에 재생활성화하기 
		if($(".boforeApplyBox_waveFormBox").hasClass("songFormPlayNow")){
			$(".boforeApplyBox_waveFormBox").removeClass("songFormPlayNow");
			$(".boforeApplyBox_waveFormBox").removeClass("songFormPlayNowActive");
			// 현제 파형재생 활성화
			$(".applyBox_waveFormBox").addClass("songFormPlayNow");
		}
		//효과 넣기
		$(".applyBox_waveFormBox").addClass("songFormPlayNowActive");
		songFormPlayForm.playPause();
		songFormPlayBoolean = true;
	}
	
});
//송폼 변경전 재생버튼
$(document).on("click",".boforeApplyBox_waveFormBtn",function(){
	//변경후 재생 멈추기
	songFormPlay();
	//악기재생 멈추기
	resetInstPlay();
	//메인곡 정지
	wavesurferPlay();
	if($(this).attr("value") == "play"){
		$(".boforeApplyBox_waveFormBtn").css("background","url(../../image/button/ApplyMusicPlayType.png)");
		$(".boforeApplyBox_waveFormBtn").css("background-size","cover");
		$(".boforeApplyBox_waveFormBtn").attr("value","stop");
		$(".boforeApplyBox_waveFormBox").removeClass("songFormPlayNowActive");
		beforeSongFormPlayForm.playPause();
		beforeSongFormBoolean = false;
	}else{
		$(".boforeApplyBox_waveFormBtn").css("background","url(../../image/button/ApplyMusicPauseType.png)");
		$(".boforeApplyBox_waveFormBtn").css("background-size","cover");
		$(".boforeApplyBox_waveFormBtn").attr("value","play");
		//변경후 파형이 재생 활성화 상태면 제거하고 해당파형에 재생활성화하기 
		if($(".applyBox_waveFormBox").hasClass("songFormPlayNow")){
			$(".applyBox_waveFormBox").removeClass("songFormPlayNow");
			$(".applyBox_waveFormBox").removeClass("songFormPlayNowActive");
			//현재 파형 재생 활성화
			$(".boforeApplyBox_waveFormBox").addClass("songFormPlayNow");
		}
		// 효과 넣기
		$(".boforeApplyBox_waveFormBox").addClass("songFormPlayNowActive");
		beforeSongFormPlayForm.playPause();
		beforeSongFormBoolean = true;
	}
	
});
$(document).on("click",".applyBox_afterBtn",function(){
	let songFormName = $(".songFormTitle").text().toLowerCase();
	console.log(songFormName);
	if(confirm(songFormName+"의 설정을 적용하시겠습니까? ") == false){    //확인
			return false;
	}
	$(".deTailLoadingPercent").text("0%");
	$("#detailDynamic").css("width", "0%");
	wavesurferPlay();
	detailWavesurferPlay();
	songFormPlay();
	resetInstPlay();
	removeBlink();
	boforeResetInstPlay();
	
	//상세 설정을  가리고 로딩을 출력 시킨다
	$(".songFormBox").css("display","none");
	$(".detailLoadingDolphinBox").fadeIn(200);
	$(".pageBtnBox").css("display","none");
	
	//로딩퍼센트 올라가기
	var dranNum = Math.random();//난수 오브젝트 생성
	var deloadingFirstNum = Math.floor(dranNum*10+5); //난수 만들기
	detailCurrent_progress = 0;
	function detailIntervalSecond(){
		 var detailIntervalSecond = setInterval(function() {
			if (detailCurrent_progress >= 100){
				clearInterval(detailIntervalSecond);
				$(".deTailLoadingPercent").text("0%");
				$("#detailDynamic").css("width", "0%");
				return;
			}
			dranNum = Math.random();
			var loadingSecondNum = Math.floor(dranNum*3+2); //난수 만들기
			detailCurrent_progress = detailCurrent_progress + loadingSecondNum;
			$("#detailDynamic").css("width", detailCurrent_progress + "%");
			$(".deTailLoadingPercent").text(detailCurrent_progress + "%");
		}, 6500);
	}
	
	//첫번째 로딩% 빠르게 올라가기 
	var detailIntervalFirst = setInterval(function() {
		if (detailCurrent_progress >= deloadingFirstNum){//난수와 같아질때 까지
			clearInterval(detailIntervalFirst);
			detailIntervalSecond();
			return;
		}
		detailCurrent_progress += 1;
		$("#detailDynamic").css("width", detailCurrent_progress + "%");
		$(".deTailLoadingPercent").text(detailCurrent_progress + "%");
	}, 200);
	
	//적용할 리스트의 갯수 
	let songFormCnt = $('.showInstListBox').length; 
	console.log(songFormCnt);
	 paramString = "";

	for(var i =0; i<songFormCnt;i++){
		//꺼져있는 악기들 분류
		if($('.showInstListBox').eq(i).hasClass("notUsed")){
			//꺼져있으면 저장 하지 않음
		}else{
			//켜져 있으면 저장함
			console.log(i+"번째 저장됨 --> "+$('.showInstListBox').eq(i).attr("value"));
			var findInstType = $('.showInstListBox').eq(i).attr("value");
			var findInstNum = $('.showInstListBox').eq(i).find(".playTimeToggle").children(".instStyleListPlayBtn").attr("value");
			var findInstName = $('.showInstListBox').eq(i).find(".mainInstNameNum").text();
			if(findInstNum == undefined){
				var selectMsg ="<div><p>"+(i+1)+"번째"+findInstName+"의 소리를 골라주세요</p><div class='confirmModalBtnBox'><div class='composeModalClose confirmModalBtn'>확인</div></div><div>"
				callModal(selectMsg);
				return;
			}
				paramString += ","+findInstType+"/"+findInstName+"/"+findInstNum;
		}
	}
	//모든 악기를 끄지 못하게 막기
	if(paramString == ""){
		var selectMsg = "<div><p>모든악기를 끌수 없습니다</p><div class='confirmModalBtnBox'><div class='composeModalClose confirmModalBtn'>확인</div></div><div>"
		callModal(selectMsg);
		return;
	}
	//하단 fixbar 사라지게하기
	$(".mainRemocon").css("bottom","-150px");
	//송폼리스트 초기화
	$(".verseListBox").html("");
	$(".showDetailBoxMelody").html("");
	$(".showDetailBox").html("");
	$(".songFormTitle").html("");
	$(".showDetail_apply").css("display","none");
	$(".showDetail_setting").css("display","none");
	$(".verseListBox").removeClass("disabledbutton");
	$(".mainMusicPlayBtnBox").removeClass("disabledbutton");
	paramString = paramString.substring(1);
	console.log(paramString);
	console.log(songFormName);
	console.log(keyword);
	console.log(sessionBoolean);
	$.ajax({
		url:"/applySongForm",
		type: "POST",
		//아이디, 멜로디 생성 유뮤
		data:{"songFormName":songFormName,"paramString":paramString,"keyword":keyword,"sessionBoolean":sessionBoolean},
		success: function(data){
			if(data.success =="success"){
				//로딩을  가리고 상세 설정을 출력 시킨다
				$("#detailDynamic").css("width", "100%");
				$(".detailLoadingDolphinBox").css("display","none");
				$(".songFormBox").fadeIn();
				//로딩 초기화
				$("#detailDynamic").css("width", 0);
				$(".deTailLoadingPercent").text(0+"%");
				//이전 다음 버튼 보이기
				$(".pageBtnBox").fadeIn();
				//곡 재생성
				getDetailSetting();
				//wavesurfer 다시 불러오기
				detailWavesurferForm();
				//하단 fixbar 나타내기
//				$(".mainRemocon").css("bottom","0px");
				
				
				//하단 fixbar 파형 초기화
				$("#waveFormBox").html("");
				//파형을 만들어주는 라이브러리 wavesurfer
				wavesurfer = WaveSurfer.create({
				  container: '#waveFormBox',
				  
				  height:40,
				  progressColor: '#00abeb',
				  cursorColor: 'transparent',
				  waveColor: '#bdbdbd'
				});
				//곡이 재생되는 동안 일어나는 함수
				wavesurfer.on('audioprocess', function () {
				    wavePlaytime = wavesurfer.getCurrentTime();
					$(".MusicStartTime").text(secondsTimeSpanToMS(wavePlaytime));
				});//audioprocess end

				//곡이 준비가 완료된 상태면 이함수를 실행
				wavesurfer.on('ready', function() {
					//하단 fixbar 를 나타나게 한다
					$(".mainRemocon").css("bottom","0px");
					// 시간 초기화
					$(".MusicStartTime").text("00:00");
					//하단 fixbar 나타내기
					$(".mainRemocon").css("bottom","0");
				  	//음악 총시간 구현
				  	var playTotalTime = wavesurfer.getDuration();
					$(".MusicTotalTime").text(secondsTimeSpanToMS(playTotalTime));
					//재생버튼 초기화
					$(".playBtn").attr("value","play");
					$(".playBtn").css("background","url(../../image/button/MusicPlayType.png)");
					$(".playBtn").css("background-size","cover");
		 		}); //ready end
				//곡이 끝나면 일어나는 함수
				wavesurfer.on('finish', function () {
					wavesurfer.stop();
					//재생버튼 초기화
					$(".playBtn").attr("value","play");
					$(".playBtn").css("background","url(../../image/button/MusicPlayType.png)");
					$(".playBtn").css("background-size","cover");
					$(".MusicStartTime").text("00:00");
				});  //finish end
				
				//음악 파일 연결
				wavesurfer.load("../../../usr/"+sessionBoolean+"/MySong.mp3");
//				wavesurfer.load("/audio/MySong.mp3");
			}
		}
	});
	
});



