/**
 * 
 */

//장르
var genre = "-";
var genretitle = "";
//키워드
var keyword ="-";
var keywordTitle ="";
//분위기
var mood ="-";
//빠르기
var tempo = "-";
//곡의 재생성, 악기만설정 여부
var generateCount ="";
var	createCount ="";
//악기 기본 설정
var playtime="-";
var originPlayTime ="";
var bpm ="-";
var originBpm ="";
var musickey ="-";
var originMusickey ="";
var melody ="-";
var originMelody="";
//악기 번호 및 변수 설정
var mainInst ="-"; var mainInstnum ="-";
var subInst0 ="-"; var subInst0num ="-";
var subInst1 ="-"; var subInst1num ="-";
var subInst2 ="-"; var subInst2num ="-";
var subInst3 ="-"; var subInst3num ="-";
var subInst4 ="-"; var subInst4num ="-";
var subInst5 ="-"; var subInst5num ="-";
var subInst6 ="-"; var subInst6num ="-";
var subInst7 ="-"; var subInst7num ="-";
var subInst8 ="-"; var subInst8num ="-";
var subInst9 ="-"; var subInst9num ="-";
var subInst10 ="-"; var subInst10num ="-";
var subInst11 ="-"; var subInst11num ="-";
var subInst12 ="-"; var subInst12num ="-";
var subInst13 ="-"; var subInst13num ="-";
var subInst14 ="-"; var subInst14num ="-";
var subInst15 ="-"; var subInst15num ="-";
var subInst16 ="-"; var subInst16num ="-";
var subInst17 ="-"; var subInst17num ="-";
var subInst18 ="-"; var subInst18num ="-";
var subInst19 ="-"; var subInst19num ="-";
var subInst20 ="-"; var subInst20num ="-";
//송폼 제목, 값 가져오기	
var verseTitle = null;
var verseValues = null;
//멜로디 생성유무
var melodyBoolean = null;
//기본세팅
var songFormSettings = null;
var defaultSettings = null;
//(wavesurfer) 함수존재 여부를 부여한다.
var mainWavesurferBoolean = false;

//YYYY-mm-dd 날짜 포멧
function formatDate(date) {
    var d = new Date(date),
        month = '' + (d.getMonth() + 1),
        day = '' + d.getDate(),
        year = d.getFullYear().toString();
		year = year.substring(2);
		
    if (month.length < 2) 
        month = '0' + month;
    if (day.length < 2) 
        day = '0' + day;

    return [year, month, day].join('-');
}
//확인 안누르고 엔터눌렀을때 이동 시키기 
$( "html" ).keypress(function(e) {
	if(e.keyCode == 13){
		//확인 안누르고 엔터눌렀을때 이동 시키기
		if($(".composeModalContent").find(".locationMyList").length >= 1){
			$("#location").attr("action","show_myList");
			$("#locationValue").attr("name","username");
			$("#locationValue").val(sessionBoolean);
			
			$("#location").submit();
			console.log("test02");
		}else  if($(".composeModalContent").find(".composeModalClose").length >= 1){ //alert류 modal close
			$(".composeModal").fadeOut(100);
			$(".composeModalContent").html("");
			console.log("test01");
		} 
	}
});

//modal을 불러오는 함수
function callModal(e){
	let maskHeight = $(document).height();  
	let maskWidth = $(window).width();
	$('.composeModal').css({'width':maskWidth,'height':maskHeight}); 
	$(".composeModal").fadeIn(100);
	$(".composeModal").css("display","flex");
	$(".composeModalClose").css("display","block");
	$(".composeModalContent").html(e);
	//화면 중앙으로 이동
	var modalOffset = $(".composeModalBox").offset();
	console.log(modalOffset);
    //$('html, body').animate({scrollTop : modalOffset.top-300});
	$('html, body').scrollTop(modalOffset.top-300);
}
$(".composeModal").on('mousewheel scroll touchmove',function(e){
	return false;
});

//confirmModal 을 불러오는 함수
function callConfirmModal(e){
	let maskHeight = $(document).height();  
	let maskWidth = $(window).width();
	$('.composeModal').css({'width':maskWidth,'height':maskHeight});
	$(".composeModal").fadeIn(100);
	$(".composeModal").css("display","flex");
	$(".composeModalContent").html(e);
	//화면 중앙으로 이동
	var modalOffset = $(".composeModalBox").offset();
	console.log(modalOffset);
	$('html, body').scrollTop(modalOffset.top-300);
	
}
//Modal을 닫을 경우
$(document).on("click",".confirmModalBtn",function(){
	if($(this).hasClass("composeModalClose")){
		$(this).css("display","none");
		$(".composeModal").fadeOut(100);
		$(".composeModalContent").html("");
		
	}else if($(this).hasClass("downFileBtn")){
		return;
	}else {
		var songFormOffset = $(".songFormTitleBox").offset();
		$('html, body').scrollTop(songFormOffset.top);
		$(".composeModal").fadeOut(100);
		$(".composeModalContent").html("");
	}
})
// next 버튼의 confirm 확인버튼을 누를경우
$(document).on("click",".confirmModalNextOk",function(){
	detailWavesurferPlay();
	songFormPlay();
	resetInstPlay();
	removeBlink();
	boforeResetInstPlay();
	wavesurferPlay();
	//작곡하기 페이지 출력
	$(".stepBox03").css("display","none");
	$(".stepBox04").fadeIn(200);
	//메뉴 활성화 여부
	$(".stepState03").removeClass("stepState");
	$(".stepState04").addClass("stepState");

	$(".stepBtn").attr("value","4");
});
// prev 버튼의 confirm 확인버튼을 누를경우
$(document).on("click",".confirmModalPrevOk",function(){
	songFormPlay();
	removeBlink();
	resetInstPlay()
	detailWavesurferPlay();
	boforeResetInstPlay();
	wavesurferPlay();
	
	$("#detailWaveform").html("");
	//송폼 메뉴가 비활성화 돼 있으면 해제 하기 
	if($(".verseListBox").hasClass("disabledbutton")){
		$(".verseListBox").removeClass("disabledbutton");
		$(".mainMusicPlayBtnBox").removeClass("disabledbutton");
		//들어보기, 송폼, 적용하기사라짐
		$(".showDetail_setting").css("display","none");
		$(".showDetail_applyBox").css("display","none");
	}
	//상세설정 페이지 노래가 재생중이면 정지및 버튼초기화
	if(detailWavesurfer.isPlaying()){
		detailWavesurfer.stop();
		detailWavesurferBoolean = false;
	 }
	//멜로디 반주 초기화
	$(".showDetailBoxMelody").html("");
	$(".showDetailBox").html("");
	
	$("#mainMusicPlayBtn").attr("value","play");
	$("#mainMusicPlayBtn").css("background","url(../../image/button/MusicPlayType.png)");
	$("#mainMusicPlayBtn").css("background-size","cover");
	$(".detailmusicStartTime").text("00:00");

	 //기본설정 페이지 출력
	$(".stepBox03").css("display","none");
	$(".stepBox02").fadeIn(200);
	//메뉴 활성화 여부
	$(".stepState03").removeClass("stepState");
	$(".stepState02").addClass("stepState");
	$(".songFormTitle").html("");
	//들어보기 사라지게 하기
	$(".showDetail_applyBox").css("display","none");

	$(".stepBtn").attr("value","2");
});



//메인wavesurfer 파형정지
function wavesurferPlay(){
	if(mainWavesurferBoolean){
		if(wavesurfer.isPlaying()){
			wavesurfer.stop();
			mainWavesurferBoolean = false;
			$(".playBtn").css("background","url(../../image/button/MusicPlayType.png)");
			$(".playBtn").css("background-size","cover");
			$(".playBtn").attr("value","play");
			$(".MusicStartTime").text("00:00");
		}
	}
}
//00:00 을 만들어주는 함수
function secondsTimeSpanToMS(s) {
	var m = Math.floor(s / 60); //Get remaining minutes
	s -= m * 60;
	s = Math.floor(s);
	return (m < 10 ? '0' + m : m) + ":" + (s < 10 ? '0' + s : s); //zero padding on minutes and seconds
}
//기본설정 유혀성 검사
function defaultSetting(){
	if(playtime != originPlayTime){
		$(".defaultAlert").text("재생시간을 바꿨었었네요! 적용해서 들어볼까요?")
		$(".defaultAlertForm").slideDown(200);
		return;
	}else if(bpm != originBpm){
		$(".defaultAlert").text("빠르기를 바꿨었었네요! 적용해서 들어볼까요?")
		$(".defaultAlertForm").slideDown(200);
		return;
	}else if(musickey != originMusickey){
		$(".defaultAlert").text("밝기를 바꿨었었네요! 적용해서 들어볼까요?")
		$(".defaultAlertForm").slideDown(200);
		return;
	}else if(melody != originMelody){
		$(".defaultAlert").text("멜로디를 바꿨었었네요! 적용해서 들어볼까요?")
		$(".defaultAlertForm").slideDown(200);
		return;
	}else{
		$(".defaultAlertForm").slideUp();
	}
}
//키워드 리스트를 불러오는 함수 
function showKeyword(){
	//키워드 클릭시
	$(".selectKeyWordBox").click(function(){
		keyword = this.id;
		keywordTitle = $(this).text();
		console.log(keyword);
		$(".selectKeyWordBox").removeClass("selectModBoxActive");
		$(this).addClass("selectModBoxActive");
		$.ajax({
			url:"/KeywordClickMoodTempo",
			type: "GET",
			data:{"keyword":keyword},
			success: function(data){
				mood = data[0].mood;
				tempo = data[0].tempo;
				console.log($(".selectMoodBox").eq(0).attr("id"));
				//분위기, 빠르기 초기화
				$(".selectMoodBox").removeClass("selectModBoxActive");
				$(".selectBPMBox").removeClass("selectModBoxActive");
				
				for(var i = 0; i<2; i++){
					if($(".selectMoodBox").eq(i).attr("id") == mood){
						$(".selectMoodBox").eq(i).addClass("selectModBoxActive");
					}
					if($(".selectBPMBox").eq(i).attr("id") == tempo){
						$(".selectBPMBox").eq(i).addClass("selectModBoxActive");
					}
				}
			}
		})
	});
}
//노래가 생성 or 재생성 되는 함수
function makeSongFunction(){
	var ranNum = Math.random();//난수 오브젝트 생성
	var loadingFirstNum = Math.floor(ranNum*10+5); //난수 만들기
	function intervalSecond(){
	var defaultIntervalSecond = setInterval(function() {
			if (current_progress >= 100){
				clearInterval(defaultIntervalSecond);
				return;
			}
			ranNum = Math.random();
			var loadingSecondNum = Math.floor(ranNum*3+1); //난수 만들기
			current_progress = current_progress + loadingSecondNum;
			$("#dynamic").css("width", current_progress + "%");
			$(".loadingPercent").text(current_progress + "%");
		}, 7000);
	}
	var current_progress = 0;
	//첫번째 로딩% 빠르게 올라가기 
	var intervalFirst = setInterval(function() {
		if (current_progress >= loadingFirstNum){//난수와 같아질때 까지
			clearInterval(intervalFirst);
			intervalSecond();
			return;
		}
		current_progress += 1;
		$("#dynamic").css("width", current_progress + "%");
		$(".loadingPercent").text(current_progress + "%");
	}, 200);
	//곡만들기(첫 생성)
	$.ajax({
		url: "/makeSong",
		type: "GET",
		dataType: "json",
		data:{	"generateCount":1, "createCount":0, "genre":genre,"keyword":keyword,
				"playtime":playtime, "bpm":bpm,"musickey":musickey, "melody":melody,
				"mainInst":mainInst, "mainInstnum":mainInstnum,
				"subInst0"  :  subInst0, "subInst0num"  :  subInst0num,
				"subInst1"  :  subInst1, "subInst1num"  :  subInst1num,
				"subInst2"  :  subInst2, "subInst2num"  :  subInst2num,
				"subInst3"  :  subInst3, "subInst3num"  :  subInst3num,
				"subInst4"  :  subInst4, "subInst4num"  :  subInst4num,
				"subInst5"  :  subInst5, "subInst5num"  :  subInst5num,
				"subInst6"  :  subInst6, "subInst6num"  :  subInst6num,
				"subInst7"  :  subInst7, "subInst7num"  :  subInst7num,
				"subInst8"  :  subInst8, "subInst8num"  :  subInst8num,
				"subInst9"  :  subInst9, "subInst9num"  :  subInst9num,
				"subInst10"  :  subInst10, "subInst10num"  :  subInst10num,
				"subInst11"  :  subInst11, "subInst11num"  :  subInst11num,
				"subInst12"  :  subInst12, "subInst12num"  :  subInst12num,
				"subInst13"  :  subInst13, "subInst13num"  :  subInst13num,
				"subInst14"  :  subInst14, "subInst14num"  :  subInst14num,
				"subInst15"  :  subInst15, "subInst15num"  :  subInst15num,
				"subInst16"  :  subInst16, "subInst16num"  :  subInst16num,
				"subInst17"  :  subInst17, "subInst17num"  :  subInst17num,
				"subInst18"  :  subInst18, "subInst18num"  :  subInst18num,
				"subInst19"  :  subInst19, "subInst19num"  :  subInst19num,
				"subInst20"  :  subInst20, "subInst20num"  :  subInst20num,
				"sessionBoolean" :sessionBoolean
			},
		success: function(data){
			console.log(data.values);
			//노래 만들어지는게 성공하면 악기번호, 악기리스트, 벌스 등 상세 설정을 가져온다.
			if(data.success == "success"){
				$.ajax({
					url: "/basicSetting",
					type: "get",
					dataType: "json",
					data:{"sessionBoolean" :sessionBoolean},
					success: function(data){
						//곡 정보
						defaultSettings = JSON.parse(data.runtime);
						console.log("basicSetting");
						console.log(defaultSettings);
						//송폼 정보
						 songFormSettings = JSON.parse(data.songForm);
						console.log(songFormSettings);
						
						//송폼 타이틀
						verseTitle = Object.keys(songFormSettings);
						console.log("이 곡에 들어간 송폼 이름");
						console.log(verseTitle);
						
						//송폼 시간
						verseValues = Object.values(songFormSettings);
						console.log("이 곡에 들어간 송폼 시간, 마디, 총 마디수");
						console.log(verseValues);
						
						//파형을 만들어주는 라이브러리 wavesurfer
						wavesurfer = WaveSurfer.create({
						  container: '#waveFormBox',
						  
						  height:40,
//						  backgroundColor: '#424546',
						  //barWidth: 2,
						  progressColor: '#00abeb',
						  cursorColor: 'transparent',
						  waveColor: '#bdbdbd'
						});
						//곡이 로딩 되면서 일어나는 함수
						wavesurfer.on('loading', function(e) {
								$("#dynamic")
						 				.css("width", "100%");
//						 				.attr("aria-valuenow", "100");
						 		$(".loadingPercent").text("100%");
				 		    if ($("#loading_flag")) {
					 			if (e >= 100) {
									$(".mainSettingOptions").fadeIn(600);
									current_progress = 100;
									$(".loadingDolphinBox").css("display","none");
								}
				 			}
				 		});
						//곡이 재생되는 동안 일어나는 함수
						wavesurfer.on('audioprocess', function () {
						    wavePlaytime = wavesurfer.getCurrentTime();
							$(".MusicStartTime").text(secondsTimeSpanToMS(wavePlaytime));
						});//audioprocess end

						//곡이 준비가 완료된 상태면 이함수를 실행
						wavesurfer.on('ready', function() {
							//리모콘 보여주기, 원본waveform 보여주기
							$(".mainRemocon").css("bottom","0");
							
							//로딩 퍼센트 초기화
							$("#dynamic").css("width", "0");
							$(".loadingPercent").text("0%");
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
							//레코드 정지
							if($(".previous").attr("value") == "4"){
								$(".musicCD").removeClass("cdLoading");
							}
							wavesurfer.stop();
							mainWavesurferBoolean = false;
							//재생버튼 초기화
							$(".playBtn").attr("value","play");
							$(".playBtn").css("background","url(../../image/button/MusicPlayType.png)");
							$(".playBtn").css("background-size","cover");
							$(".MusicStartTime").text("00:00");
						});  //finish end
						
						//음악 파일 연결
						wavesurfer.load("../../../usr/"+sessionBoolean+"/MySong.mp3");
//						wavesurfer.load("/audio/MySong.mp3");
						
						//장르, 분위기 보여주기
						$(".categoryStatus").text("장르 : "+genreTitle);
						$(".moodStatus").text("분위기 : "+keywordTitle);
						//음악 볼륨
						var volumeInput = document.querySelector('#volume');
						var onChangeVolume = function (e) {
							wavesurfer.setVolume(e.target.value);
							//음량 이미지
							if(e.target.value == 0){
								$("#volumeBox").css("background", "url(../../image/button/volumeMute.png)");
								$("#volumeBox").css("background-size", "cover");
							}else if(e.target.value >= 0.1 && e.target.value < 0.5){
								$("#volumeBox").css("background", "url(../../image/button/volumeDown.png)");
								$("#volumeBox").css("background-size", "cover");
							}else if(e.target.value >= 0.5 && e.target.value <= 1){
								$("#volumeBox").css("background", "url(../../image/button/volumeUp.png)");
								$("#volumeBox").css("background-size", "cover");
							}
						};
						volumeInput.addEventListener('input', onChangeVolume);
						volumeInput.addEventListener('change', onChangeVolume);
						
						//재생시간 , 빠르기, 밝기, 멜로디 설정값 초기화
						$(".musickey").removeClass("playTimeToggle")
						$(".melody").removeClass("playTimeToggle");
						$(".bpm").removeClass("playTimeToggle");
						$(".playTime").removeClass("playTimeToggle");
						
						//재생시간 , 빠르기, 밝기, 멜로디 설정값 가져오기
						for(var i = 0; i<5 ;i++){
							//밝기
							if($(".musickey").eq(i).attr("value") == defaultSettings.KeyClass){
								//console.log(defaultSettings.KeyClass);
								musickey = defaultSettings.KeyClass;
								originMusickey = defaultSettings.KeyClass;
								$(".musickey").eq(i).addClass("playTimeToggle");
							}
							//멜로디
							if($(".melody").eq(i).attr("value") == defaultSettings.Melody){
								//console.log(defaultSettings.Melody);
								originMelody = defaultSettings.Melody;
								melody =  defaultSettings.Melody;
								$(".melody").eq(i).addClass("playTimeToggle");
							}
							//빠르기
							if($(".bpm").eq(i).attr("value") == defaultSettings.Bpm){
								//console.log(defaultSettings.Bpm);
								originBpm = defaultSettings.Bpm;
								bpm = defaultSettings.Bpm;
								$(".bpm").eq(i).addClass("playTimeToggle");
							}
							//재생시간
							if($(".playTime").eq(i).attr("value") == defaultSettings.RunTime){
								//console.log(defaultSettings.RunTime);
								originPlayTime = defaultSettings.RunTime;
								playtime = defaultSettings.RunTime; 
								$(".playTime").eq(i).addClass("playTimeToggle");
							}
						}
			 		} //success end
				});//getsetting ajax end
			} //if -> data.success == "success"  end
		} //success end
	})//곡만들기(첫 생성) ajax end
	//적용하기 버튼 사라짐 유지
	$(".defaultAlertForm").css("display","none");
} //makeSongFunction end

//장르 클릭시
$(".selectGenreBox").click(function(){
	if($(".next").hasClass("nextBlink")){
		$(".next").removeClass("nextBlink");
	}
	$(".selectGenreBox").removeClass("selectModBoxActive");
	$(this).addClass("selectModBoxActive");
	//키워드 초기화
	keyword ="-";
	$(".selectKeyWordBox").removeClass("selectModBoxActive");
	//분위기 초기화
	mood ="-";
	$(".selectMoodBox").removeClass("selectModBoxActive");
	//빠르기 초기화
	tempo = "-";
	$(".selectBPMBox").removeClass("selectModBoxActive");
	
	genre = this.id;
	genreTitle = $(this).text();
	console.log(genre);
	console.log(genreTitle);
	$.ajax({
		url:"/genreClickKeyword",
		type: "GET",
		data:{"genre":genre},
		success: function(data){
			$(".selectKeyWordBoxUl").html("");
			
			keywordList = data;
			
			let str="";
			$.each(keywordList, function (index, value) {
				if(value.keywordstate == 0){
					str +="<div class='selectModBoxLi disableKeyWordBox' id="+value.keyword+" value="+value.keywordstate+">"+value.keytitle+"</div>"	
				}else if(value.keywordstate == 1){
					str +="<div class='selectModBoxLi selectKeyWordBox' id="+value.keyword+" value="+value.keywordstate+">"+value.keytitle+"</div>"	
				}
			});
			$(".selectKeyWordBoxUl").html(str);
				showKeyword();
		}
	})
	//분위기 보여주기
	$(".selectMoodBoxForm").fadeIn();
	//fixbar 문구 변경
	$(".selectComment").css("display","none");
	$(".selectComment").text("분위기를 선택해주세요");
	$(".selectComment").fadeIn();
	
	//포커스 이동
	var selectOffset = $(".selectMoodBox").eq(0).offset();
	console.log(selectOffset);
	$('html, body').scrollTop(selectOffset.top);
});
//분위기 클릭시
$(".selectMoodBox").click(function(){
	if($(".next").hasClass("nextBlink")){
		$(".next").removeClass("nextBlink");
	}
	if(genre=="-"){
		var selectMsg = "<div><p>장르를 먼저 선택해 주세요</p><div class='confirmModalBtnBox'><div class='composeModalClose confirmModalBtn'>확인</div></div><div>";
		callModal(selectMsg);
		return;
	}
	$(".selectMoodBox").removeClass("selectModBoxActive");
	$(this).addClass("selectModBoxActive");
	mood = this.id; 
	//분위기가 안골라져 있을 경우
	if(tempo == "-"){
		$.ajax({
		url:"/moodClickKeyword",
		type: "GET",
		data:{"genre":genre,"mood":mood},
		success: function(data){
				var str="";
			$.each(data, function (index, value) {
				if(value.keywordstate == 0){
					str +="<div class='selectModBoxLi disableKeyWordBox' id="+value.keyword+" value="+value.keywordstate+">"+value.keytitle+"</div>"	
				}else if(value.keywordstate == 1){
					str +="<div class='selectModBoxLi selectKeyWordBox' id="+value.keyword+" value="+value.keywordstate+">"+value.keytitle+"</div>"	
				}
			});
			$(".selectKeyWordBoxUl").html(str);
			showKeyword();
			}
		})

	}else{
		//분위기가 이미선택 되어 있을 경우
		$.ajax({
			url:"/tempoClickKeyword",
			type: "GET",
			data:{"genre":genre,"mood":mood,"tempo":tempo},
			success: function(data){
					var str="";
				$.each(data, function (index, value) {
					if(value.keywordstate == 0){
						str +="<div class='selectModBoxLi disableKeyWordBox' id="+value.keyword+" value="+value.keywordstate+">"+value.keytitle+"</div>"	
					}else if(value.keywordstate == 1){
						str +="<div class='selectModBoxLi selectKeyWordBox' id="+value.keyword+" value="+value.keywordstate+">"+value.keytitle+"</div>"	
					}
				});
				$(".selectKeyWordBoxUl").html(str);
				showKeyword();
			}
		})
	}
	//빠르기보여주기
	$(".selectBPMBoxForm").fadeIn();
	//fixbar 문구 변경
	$(".selectComment").css("display","none");
	$(".selectComment").text("빠르기를 선택해주세요");
	$(".selectComment").fadeIn();
	var selectOffset = $(".selectBPMBox").eq(0).offset();
	console.log(selectOffset);
	$('html, body').scrollTop(selectOffset.top);
});
//BPM 클릭시
$(".selectBPMBox").click(function(){
	if($(".next").hasClass("nextBlink")){
		$(".next").removeClass("nextBlink");
	}
	if(genre=="-"){
		var selectMsg = "<div><p>장르를 선택해 주세요</p><div class='confirmModalBtnBox'><div class='composeModalClose confirmModalBtn'>확인</div></div><div>";
		callModal(selectMsg);
		return;
	}else if(mood=="-"){
		var selectMsg = "<div><p>분위기를 선택해 주세요</p><div class='confirmModalBtnBox'><div class='composeModalClose confirmModalBtn'>확인</div></div><div>";
		callModal(selectMsg);
		return;
	}
	$(".selectBPMBox").removeClass("selectModBoxActive");
	$(this).addClass("selectModBoxActive");
	tempo = this.id;
	$.ajax({
		url:"/tempoClickKeyword",
		type: "GET",
		data:{"genre":genre,"mood":mood,"tempo":tempo},
		success: function(data){
				var str="";
			$.each(data, function (index, value) {
				if(value.keywordstate == 0){
					str +="<div class='selectModBoxLi disableKeyWordBox' id="+value.keyword+" value="+value.keywordstate+">"+value.keytitle+"</div>"	
				}else if(value.keywordstate == 1){
					str +="<div class='selectModBoxLi selectKeyWordBox' id="+value.keyword+" value="+value.keywordstate+">"+value.keytitle+"</div>"	
				}
			});
			$(".selectKeyWordBoxUl").html(str);
			showKeyword();
		}
	})
	//키워드 보여주기
	$(".selectKeyWordBoxForm").fadeIn();
	//fixbar 문구 변경
	$(".selectComment").css("display","none");
	$(".selectComment").text("키워드를 선택해주세요");
	$(".selectComment").fadeIn();
	
	var selectOffset = $(".selectKeyWordBox").eq(0).offset();
	console.log(selectOffset);
	$('html, body').scrollTop(selectOffset.top);
});
//키워드 클릭시
$(document).on("click",".selectKeyWordBox",function(){
//	if(genre=="-" || mood=="-" || tempo =="-"){
	if(genre =="-"){
		var selectMsg = "<div><p>장르를 먼저 선택해 주세요</p><div class='confirmModalBtnBox'><div class='composeModalClose confirmModalBtn'>확인</div></div><div>";
		callModal(selectMsg);
		return;
	}
//	if(mood=="-"){
//		var selectMsg = "<div><p>분위기를 선택해 주세요</p><div class='confirmModalBtnBox'><div class='composeModalClose confirmModalBtn'>확인</div></div><div>";
//		callModal(selectMsg);
//		return;
//	}
//	else if( tempo =="-"){
//		var selectMsg = "<div><p>빠르기를  선택해 주세요</p><div class='confirmModalBtnBox'><div class='composeModalClose confirmModalBtn'>확인</div></div><div>";
//		callModal(selectMsg);
//		return;
//	}
	if($(".next").hasClass("nextBlink")){
		$(".next").removeClass("nextBlink");
	}
	//fixbar 문구 변경
	$(".selectComment").css("display","none");
	$(".selectComment").html("선택이 완료되었습니다 <br/> 다음을 눌러 진행해 주세요!");
	$(".selectComment").fadeIn();
	$(".next").addClass("nextBlink");
});
$(".previous").click(function(){
	$(".next").removeClass("nextBlink");
	if($(this).attr("value") == "1"){// value 가 1 이면 작곡하기 페이지
		location.replace("/composePage");
	}
	if($(this).attr("value") == "2"){// value 가 2 이면 기본설정 페이지
		//모든 악기 설정 초기화
		playtime="-";
		originPlayTime ="";
		bpm ="-";
		originBpm ="";
		musickey ="-";
		originMusickey ="";
		melody ="-";
		originMelody="";
		
		genre = "-";
		mood = "-";
		tempo = "-";
		keyword = "-";
		console.log(genre);
		console.log(mood);
		console.log(tempo);
		console.log(keyword);
		
		console.log(playtime);
		console.log(originPlayTime);
		console.log(bpm);
		console.log(musickey);
		console.log(originMusickey);
		console.log(melody);
		console.log(originMelody);
		//악기 번호 및 변수 초기화
		 mainInst ="-";  mainInstnum ="-";
		 subInst0 ="-";  subInst0num ="-";
		 subInst1 ="-";  subInst1num ="-";
		 subInst2 ="-";  subInst2num ="-";
		 subInst3 ="-";  subInst3num ="-";
		 subInst4 ="-";  subInst4num ="-";
		 subInst5 ="-";  subInst5num ="-";
		 subInst6 ="-";  subInst6num ="-";
		 subInst7 ="-";  subInst7num ="-";
		 subInst8 ="-";  subInst8num ="-";
		 subInst9 ="-";  subInst9num ="-";
		 subInst10 ="-";  subInst10num ="-";
		 subInst11 ="-";  subInst11num ="-";
		 subInst12 ="-";  subInst12num ="-";
		 subInst13 ="-";  subInst13num ="-";
		 subInst14 ="-";  subInst14num ="-";
		 subInst15 ="-";  subInst15num ="-";
		 subInst16 ="-";  subInst16num ="-";
		 subInst17 ="-";  subInst17num ="-";
		 subInst18 ="-";  subInst18num ="-";
		 subInst19 ="-";  subInst19num ="-";
		 subInst20 ="-";  subInst20num ="-";	
		//waveform  초기화
		if(wavesurfer.isPlaying()){
			wavesurfer.stop();
		 }
		//파형 초기화
		$("#waveFormBox").html("");
		//키워드 초기화
		$(".selectKeyWordBoxUl").html("");
		//로딩창 살리기
		$(".loadingDolphinBox").css("display","block");
		$(".mainSettingOptions").css("display","none");
		//작곡하기 페이지 출력
		$(".stepBox02").css("display","none");
		$(".stepBox01").fadeIn(200);
		$(".stepBox01").css("display","flex");
		//메뉴 활성화 여부
		$(".stepState02").removeClass("stepState");
		$(".stepState01").addClass("stepState");
		//장르, 분위기, 빠르기 , 키워드 엑티브 효과 제거
		$(".selectGenreBox").removeClass("selectModBoxActive");
		$(".selectMoodBox").removeClass("selectModBoxActive");
		$(".selectBPMBox").removeClass("selectModBoxActive");
		$(".selectKeyWordBox").removeClass("selectModBoxActive");
		//fixbar파형 사라지고 도움말 보이기
		$(".selectComment").fadeIn(300);
		$('.mainWaveFormBox').css("display","none");
		//분위기, 밝기, 키워드, 코맨트 초기화
		$(".selectMoodBoxForm").css("display","none");
		$(".selectBPMBoxForm").css("display","none");
		$(".selectKeyWordBoxForm").css("display","none");
		$(".selectComment").text("장르를 선택해주세요");
		$(".stepBtn").attr("value","1");
		$('html, body').scrollTop(0);
		
	}else if($(this).attr("value") == "3"){// value 가 3이면 상세설정 페이지
		//confirm 기능 만들기
		let pagePass = false;
		//설정을 건드린게 있으면 alert창 보여주기
		if($(".showDetail_applyBox").attr("style") == "display: block;" || $(".showDetail_setting").eq(1).attr("style") == "display: block;"){
			//pagePass가 true면 화면이 안 넘어가게 만들기 
			pagePass = true;
			var confirmMsg = "<div class='confirmMsgBox'>"+
								"<p>적용하지 않은 설정은 저장이 되지 않습니다</p>"+
								"<p>이동하시겠습니까?</p>"+
								"<div class='confirmModalBtnBox'>"+
									"<div class='confirmModalPrevOk confirmModalBtn'><span class=''>확인</span></div>"+
									"<div class='confirmModalCancel confirmModalBtn'><span class=''>취소</span></div>"+
								"</div>"+
							 "</div> ";
			callConfirmModal(confirmMsg);

//	        if(confirm("적용하지 않은 설정은 저장이 되지 않습니다. ") == false){    //확인
//			return false;
//		    }	
	    }
		//페이지 실행 안하기
		if(pagePass){
			return;
		}
		
		songFormPlay();
		removeBlink();
		resetInstPlay()
		detailWavesurferPlay();
		boforeResetInstPlay();
		wavesurferPlay();
		
		$("#detailWaveform").html("");
		//송폼 메뉴가 비활성화 돼 있으면 해제 하기 
		if($(".verseListBox").hasClass("disabledbutton")){
			$(".verseListBox").removeClass("disabledbutton");
			$(".mainMusicPlayBtnBox").removeClass("disabledbutton");
			//들어보기, 송폼, 적용하기사라짐
			$(".showDetail_setting").css("display","none");
			$(".showDetail_applyBox").css("display","none");
		}
		//상세설정 페이지 노래가 재생중이면 정지및 버튼초기화
		if(detailWavesurfer.isPlaying()){
			detailWavesurfer.stop();
			detailWavesurferBoolean = false;
		 }
		//멜로디 반주 초기화
		$(".showDetailBoxMelody").html("");
		$(".showDetailBox").html("");
		
		$("#mainMusicPlayBtn").attr("value","play");
		$("#mainMusicPlayBtn").css("background","url(../../image/button/MusicPlayType.png)");
		$("#mainMusicPlayBtn").css("background-size","cover");
		$(".detailmusicStartTime").text("00:00");
	
		 //기본설정 페이지 출력
		$(".stepBox03").css("display","none");
		$(".stepBox02").fadeIn(200);
		//메뉴 활성화 여부
		$(".stepState03").removeClass("stepState");
		$(".stepState02").addClass("stepState");
		$(".songFormTitle").html("");
		//들어보기 사라지게 하기
		$(".showDetail_applyBox").css("display","none");
	
		$(".stepBtn").attr("value","2");
		$('html, body').animate({scrollTop : 0}, 200);
		
	}else if($(this).attr("value") == "4"){// value 가 4면 저장하기 페이지
		wavesurferPlay();
		//cd돌아가는 기능 제거
		$(".musicCD").removeClass("cdLoading");
		//상세설정 페이지 출력
		$(".stepBox04").css("display","none");
		$(".stepBox03").fadeIn(200);
		//메뉴 활성화 여부
		$(".stepState04").removeClass("stepState");
		$(".stepState03").addClass("stepState");
		//재생중이든 재생중이 아니든 현재 가지고 있는 웨이브 파괴
//		$("#waveformDown").html("");
		
		$(".stepBtn").attr("value","3");
		$(".next").html("<p>다음</p>");
		$('html, body').scrollTop(0);
	}
});
//앨범 이름

// 다음 버튼 하나로 컨트롤
$(".next").click(function(){
	$(this).removeClass("nextBlink");
	if($(this).attr("value") == "1"){ // value 가 1 이면 작곡하기 페이지
		//선택이 안 돼 있으면 다음페이지로 이동 불가능
		console.log(genre);
		console.log(mood);
		console.log(tempo);
		console.log(keyword);
		
		console.log(playtime);
		console.log(originPlayTime);
		console.log(bpm);
		console.log(musickey);
		console.log(originMusickey);
		console.log(melody);
		console.log(originMelody);
		if(genre =="-"){
			var selectMsg = "<div><p>장르를 선택해주세요</p><div class='confirmModalBtnBox'><div class='composeModalClose confirmModalBtn'>확인</div></div><div>";
			callModal(selectMsg);
			return;
		}else if(mood == "-"){
			var selectMsg = "<div><p>분위기를 선택해주세요</p><div class='confirmModalBtnBox'><div class='composeModalClose confirmModalBtn'>확인</div></div><div>";
			callModal(selectMsg);
			return;
		}else if(tempo=="-"){
			var selectMsg = "<div><p>빠르기를 선택해주세요</p><div class='confirmModalBtnBox'><div class='composeModalClose confirmModalBtn'>확인</div></div><div>";
			callModal(selectMsg);
			return;
		}else if(keyword =="-"){
			var selectMsg = "<div><p>키워드를 선택해주세요</p><div class='confirmModalBtnBox'><div class='composeModalClose confirmModalBtn'>확인</div></div><div>";
			callModal(selectMsg);
			return;
		}
		//기본설정 페이지 출력
		$(".stepBox01").css("display","none");
		$(".stepBox02").fadeIn(200);
		//메뉴 활성화 여부
		$(".stepState01").removeClass("stepState");
		$(".stepState02").addClass("stepState");
		//로딩에서 리모콘,커밋 없애기
		$(".mainRemocon").css("bottom","-150px");
		$(".selectComment").css("display","none");
		//form 미리 보이기(나중에하면 파형이안나옴)
		$(".mainWaveFormBox").fadeIn(1000);
		$(".mainWaveFormBox").css("display","flex");
		//노래가 생성 되는 함수 실행
		makeSongFunction();
		//step2로 지정
		$(".stepBtn").attr("value","2");
		$('html, body').animate({scrollTop : 0}, 200);
		
	}else if($(this).attr("value") == "2"){ // value 가 2면 기본설정 페이지
		//벌스 리스트 설명 다시 보여주기
		$(".songFormAlertBox").css("display","flex");
		//변경사항 비교하기
		if(originMelody != melody || originMusickey != musickey 
		|| originBpm != bpm || playtime != originPlayTime){
			var selectMsg = "<div><p>변경된 설정이 있습니다</p><p>적용하기 버튼을 눌러 적용을 해주세요</p><div class='confirmModalBtnBox'><div class='composeModalClose confirmModalBtn'>확인</div></div><div>";
			callModal(selectMsg);
			return;
		}
		//기본 설정페이지에 있는 노래가 재생중이면 멈추고 버튼 초기화
		if(wavesurfer.isPlaying()){
			wavesurfer.stop();
		 }
		$(".playBtn").attr("value","play");
		$(".playBtn").css("background","url(../../image/button/MusicPlayType.png)");
		$(".playBtn").css("background-size","cover");
		$(".MusicStartTime").text("00:00");
		
		//상세설정 페이지 출력
		$(".stepBox02").css("display","none");
		$(".stepBox03").fadeIn(200);
		//메뉴 활성화 여부
		$(".stepState02").removeClass("stepState");
		$(".stepState03").addClass("stepState");
		//송폼리스트 설명 추가
		$(".songFormAlert").text("원하는 구간을 눌러 자세한 설정을 적용해보세요!");
		
		//상세 설정용 waveform
		detailWavesurferForm();
		
		//멜로디 설정 유무 확인
		if(melody == "no"){
			melodyBoolean = false;
		}else if(melody == "yes"){
			melodyBoolean = true;
		}
		getDetailSetting();
		
		$(".stepBtn").attr("value","3");
		
		
		$('html, body').animate({scrollTop : 0}, 200);
		
	}else if($(this).attr("value") == "3"){ // value 가 3이면 상세 설정 페이지
		//confirm 기능 만들기
		let pagePass = false;
		//설정을 건드린게 있으면 alert창 보여주기
		if($(".showDetail_applyBox").attr("style") == "display: block;" || $(".showDetail_setting").eq(1).attr("style") == "display: block;"){
			//pagePass가 true면 화면이 안 넘어가게 만들기 
			pagePass = true;
			var confirmMsg = "<div class='confirmMsgBox'>"+
								"<p>적용하지 않은 설정은 적용이 되지 않습니다</p>"+
								"<p>이동하시겠습니까?</p>"+
								"<div class='confirmModalBtnBox'>"+
									"<div class='confirmModalNextOk confirmModalBtn'><span class=''>확인</span></div>"+
									"<div class='confirmModalCancel confirmModalBtn'><span class=''>취소</span></div>"+
								"</div>"+
							 "</div> ";
			callConfirmModal(confirmMsg);
	    }
		//페이지 실행 안하기
		if(pagePass){
			return;
		}
		detailWavesurferPlay();
		songFormPlay();
		resetInstPlay();
		removeBlink();
		boforeResetInstPlay();
		wavesurferPlay();
		//작곡하기 페이지 출력
		$(".stepBox03").css("display","none");
		$(".stepBox04").fadeIn(200);
		//메뉴 활성화 여부
		$(".stepState03").removeClass("stepState");
		$(".stepState04").addClass("stepState");
	
		$(".stepBtn").attr("value","4");
		$('html, body').animate({scrollTop : 0}, 200);
		
		//CD 배경 변경
		$(".cdPlay").attr("style","background: url('../../image/album_cover/"+albumCover+".jpg') 0% 0% / cover");
		$(".cdCase").attr("style","background: url('../../image/album_cover/"+albumCover+".jpg') 0% 0% / cover");
		
		//저장 하기로 변경
		$(".next").html("<p>저장하기</p>");
	}else if($(this).attr("value") == "4"){ // value 가 3이면 상세 설정 페이지
		
		
		var confirmMsg = "<div class='confirmMsgBox'>"+
								"<div class='downloadSubjectInputBox'>"+
									"<div class='downloadSubjectTitle'>앨범 이름을 입력해 주세요</div>"+
									"<div><input type='text' class='finalAlbumName'></div>"+
									"<div><p class='finalAlbumNameAlert'></p></div>"+
								"</div>"+
								"<div class='confirmModalBtnBox'>"+
									"<div class='completeAlbum createAlbumBtn'><span class=''>확인</span></div>"+
									"<div class='completeAlbumCancel createAlbumBtn'><span class=''>취소</span></div>"+
								"</div>"+
						 	"</div> ";
		callConfirmModal(confirmMsg);
	
//		var selectMsg = "<div><p>서비스를 준비중입니다</p><div class='confirmModalBtnBox'><div class='composeModalClose confirmModalBtn'>확인</div></div><div>";
//		callModal(selectMsg);
		
		
		$('html, body').animate({scrollTop : 0}, 200);
	}
});
//재생시간 버튼클릭
$(".playTime").click(function(){
	playtime = $(this).attr("value");
	if(originPlayTime != playtime){
		//$(".defaultAlertForm").addClass("defaultAlertBoolean");
		$(".defaultAlert").text("재생시간을 변경하셨군요! 적용해서 들어볼까요?")
		$(".defaultAlertForm").slideDown(200);
	}else{
		defaultSetting();
	}
	$(".playTime").removeClass("playTimeToggle");
	$(this).addClass("playTimeToggle");
	console.log(playtime);	
});
//빠르기 버튼클릭
$(".bpm").click(function(){
	bpm = $(this).attr("value");
	
	if(originBpm != bpm){
		//$(".defaultAlertForm").addClass("defaultAlertBoolean");
		$(".defaultAlert").text("빠르기를 변경하셨군요! 적용해서 들어볼까요?")
		$(".defaultAlertForm").slideDown(200);
	}else{
		defaultSetting();
	}
	
	$(".bpm").removeClass("playTimeToggle");
	$(this).addClass("playTimeToggle");
	console.log(bpm);
});
//밝기 버튼 클릭
$(".musickey").click(function(){
	musickey = $(this).attr("value");
	if(originMusickey != musickey){
		//$(".defaultAlertForm").addClass("defaultAlertBoolean");
		$(".defaultAlert").text("밝기를 변경하셨군요! 적용해서 들어볼까요?")
		$(".defaultAlertForm").slideDown(200);
	}else{
		defaultSetting();
	}
	$(".musickey").removeClass("playTimeToggle");
	$(this).addClass("playTimeToggle");
	console.log(musickey);	
});
//멜로디 버튼 클릭
$(".melody").click(function(){
	if($(this).attr("value") == "no"){
		if(confirm(" 멜로디 [생성안함] 선택시 악보다운로드가 불가능합니다. 적용하시겠습니까?") == true){    //확인
			melody = $(this).attr("value");
			if(originMelody != melody){
				//$(".defaultAlertForm").addClass("defaultAlertBoolean");
				$(".defaultAlert").text("멜로디를 변경하셨군요! 적용해서 들어볼까요?")
				$(".defaultAlertForm").slideDown(200);
			}else{
				defaultSetting();
			}
			$(".melody").removeClass("playTimeToggle");
			$(this).addClass("playTimeToggle");
			console.log(melody);
			//악보 다운로드 비활성화
			$(".downLoadBox").eq(0).addClass("disabledbutton");
			
		}else{   //취소
			return false;
			$(".downLoadBox").eq(0).removeClass("disabledbutton");
		}
	}else{
		melody = $(this).attr("value");
		if(originMelody != melody){
			//$(".defaultAlertForm").addClass("defaultAlertBoolean");
			$(".defaultAlert").text("멜로디를 변경하셨군요! 적용해서 들어볼까요?")
			$(".defaultAlertForm").slideDown(200);
		}else{
			defaultSetting();
		}
		$(".melody").removeClass("playTimeToggle");
		$(this).addClass("playTimeToggle");
		console.log(melody);		
	}
});

//재생버튼 컨트롤
$(".playBtn").click(function(){
	//모든 노래 재생 정지
	detailWavesurferPlay();
	removeBlink();
	songFormPlay();
	resetInstPlay();
	boforeResetInstPlay();
	
	if($(this).attr("value") =="play"){
		if($(".previous").attr("value") == "4"){
			$(".cdCase").addClass("cdLoading");
		}
		$(this).css("background","url(../../image/button/MusicPauseType.png)");
		$(this).css("background-size","cover");
		$(this).attr("value","stop");
		mainWavesurferBoolean = true;
		wavesurfer.playPause();
	}else if($(this).attr("value") =="stop"){
		if($(".previous").attr("value") == "4"){
			$(".cdCase").removeClass("cdLoading");
		}
		$(this).css("background","url(../../image/button/MusicPlayType.png)");
		$(this).css("background-size","cover");
		$(this).attr("value","play");
		wavesurfer.playPause();
		mainWavesurferBoolean = false;
	}
});
//악기 기본설정 적용하기 버튼
$(".applySetting").click(function(){
	//변경사항 비교하기
	if(originMelody == melody && originMusickey == musickey 
	&& originBpm == bpm && playtime == originPlayTime){
		var selectMsg = "<div><p>변경된 설정이 없습니다</p><div class='confirmModalBtnBox'><div class='composeModalClose confirmModalBtn'>확인</div></div><div>";
		callModal(selectMsg);
		return;
	}
	//멜로디 설정 유무 확인
	if(melody == "no"){
		melodyBoolean = false;
	}else if(melody == "yes"){
		melodyBoolean = true;
	}
	console.log(melody); 
	console.log(melodyBoolean);
	//waveform  초기화
	if(wavesurfer.isPlaying()){
		wavesurfer.stop();
	 }
	$("#waveFormBox").html("");
	//로딩창 살리기
	$(".loadingDolphinBox").css("display","block");
	$(".mainSettingOptions").css("display","none");
	//fixbar 사라지게하기
	$(".mainRemocon").css("bottom","-150px");
	//노래가 재생성 되는 함수 실행
	makeSongFunction();
});
