/**
 * 
 */
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

let swiper = new Swiper ('.referenceSwiper-container', {
		effect: 'coverflow',
		grabCursor: true,
		updateOnWindowResize:true,
		centeredSlides: true,
		initialSlide:4,
		//2
		shortSwipes:false,
		slidesPerView: 'auto',
		coverflowEffect: {
			rotate: 30,
			stretch: 0,
			depth: 200,
			modifier: 1,
			slideShadows: true,
		},
		mousewheel: {
			sensitivity:1,
		},
	  pagination: {
		 el: 'swiper-pagination'
	  }
});
//RGB 컬러 자동으로 돌아가기
var colors = new Array(
  [62,111,197],
  [74,59,172],
  [255,35,98],
  [45,175,230],
  [173,121,167],
  [207,121,105]);

var step = 0;
//color table indices for: 
// current color left
// next color left
// current color right
// next color right
var colorIndices = [0,1,2,3];

//transition speed
var gradientSpeed = 0.002;

function updateGradient()
{
  
  if ( $===undefined ) return;
  
var c0_0 = colors[colorIndices[0]];
var c0_1 = colors[colorIndices[1]];
var c1_0 = colors[colorIndices[2]];
var c1_1 = colors[colorIndices[3]];

var istep = 1 - step;
var r1 = Math.round(istep * c0_0[0] + step * c0_1[0]);
var g1 = Math.round(istep * c0_0[1] + step * c0_1[1]);
var b1 = Math.round(istep * c0_0[2] + step * c0_1[2]);
var color1 = "rgb("+r1+","+g1+","+b1+")";

var r2 = Math.round(istep * c1_0[0] + step * c1_1[0]);
var g2 = Math.round(istep * c1_0[1] + step * c1_1[1]);
var b2 = Math.round(istep * c1_0[2] + step * c1_1[2]);
var color2 = "rgb("+r2+","+g2+","+b2+")";

 $('.contentTitleBox').css({
   background: "-webkit-gradient(linear, left top, right top, from("+color1+"), to("+color2+"))"}).css({
    background: "-moz-linear-gradient(left, "+color1+" 0%, "+color2+" 100%)"});

 $('.Content_musicLiBoxActive').css({
   background: "-webkit-gradient(linear, left top, right top, from("+color1+"), to("+color2+"))"}).css({
    background: "-moz-linear-gradient(left, "+color1+" 0%, "+color2+" 100%)"});

  step += gradientSpeed;
  if ( step >= 1 )
  {
    step %= 1;
    colorIndices[0] = colorIndices[1];
    colorIndices[2] = colorIndices[3];
    
    //pick two new target color indices
    //do not pick the same as the current one
    colorIndices[1] = ( colorIndices[1] + Math.floor( 1 + Math.random() * (colors.length - 1))) % colors.length;
    colorIndices[3] = ( colorIndices[3] + Math.floor( 1 + Math.random() * (colors.length - 1))) % colors.length;
    
  }
}
//RGB 계속 실행
setInterval(updateGradient,50);
//적용버튼 변경 쿼리
function applyBtnQuery(){
	for(var i = 0; i<3;i++){
		//래퍼런스 비율이 하나라도 설정 돼있으면 적용하기 출력
		if($(".percentOption").eq(i).hasClass("percentOptionAvtive")){
			
			$(".referenceApplyBtn").fadeIn(200);
			$(".referenceApplyBtn").css("display","flex");
			//래퍼런스 퍼센트 사라지기
			$(".percent_box").fadeOut(200);
			break;
		}
	}
}
//Loadsongform 정지
function LoadsongformPlay(){
	if(LoadsongformBoolean){
		if(Loadsongform.isPlaying()){
			Loadsongform.stop();
			LoadsongformBoolean = false;
			$(".detailPlayBtn").removeClass("detailPlayBtnPause");
			$(".detailPlayBtn").addClass("detailPlayBtnPlay");
			
			$(".navOptionContentEmpty").eq(6).removeClass("playBlink");
			$(".index0").add(".index1").add(".index2").add(".index3").add(".index4").add(".index5").removeClass("playBlink")
	 	}
	}
};
//sample1 정지
function sampleWaveForm1Play(){
	if(sampleBtn1Boolean){
		if(sampleWaveForm1.isPlaying()){
			sampleWaveForm1.stop();
			sampleBtn1Boolean = false;
			$(".sampleBtn1").removeClass("selectOptionPause");
			$(".sampleBtn1").addClass("selectOptionPlay");
			
			//대표님ver
			$("#sampleWaveForm1").removeClass("Content_musicLiBoxActive");
			$("#sampleWaveForm1").removeAttr("style");
	 	}
	}
};
//sample2 정지
function sampleWaveForm2Play(){
	if(sampleBtn2Boolean){
		if(sampleWaveForm2.isPlaying()){
			sampleWaveForm2.stop();
			sampleBtn2Boolean = false;
			$(".sampleBtn2").removeClass("selectOptionPause");
			$(".sampleBtn2").addClass("selectOptionPlay");
			
			//대표님ver
			$("#sampleWaveForm2").removeClass("Content_musicLiBoxActive");
			$("#sampleWaveForm2").removeAttr("style");
	 	}
	}
};
//sample3 정지
function sampleWaveForm3Play(){
	if(sampleBtn3Boolean){
		if(sampleWaveForm3.isPlaying()){
			sampleWaveForm3.stop();
			sampleBtn3Boolean = false;
			$(".sampleBtn3").removeClass("selectOptionPause");
			$(".sampleBtn3").addClass("selectOptionPlay");
			
			//대표님ver
			$("#sampleWaveForm3").removeClass("Content_musicLiBoxActive");
			$("#sampleWaveForm3").removeAttr("style");
	 	}
	}
};

//레퍼런스원곡 멈추기
function originReferenceWavePlay(){
	if(originReferenceBoolean){
		if(originReferenceWave.isPlaying()){
			originReferenceWave.stop();
			originReferenceBoolean = false;
			$(".musicLiBoxBtn").removeClass("musicLiBoxBtnPause");
			$(".musicLiBoxBtn").addClass("musicLiBoxBtnPlay");
			$("#referenceWaveform").html("");
			
			
	 	}
	}
};
//레퍼런스원곡 음악 재생
var originReferenceBoolean = null;
$(".musicLiBoxBtn").click(function(){
	// 재생중이면 일시정지로 바꾸기
	if($(this).hasClass("musicLiBoxBtnPause")){
		$(this).removeClass("musicLiBoxBtnPause");
		$(this).addClass("musicLiBoxBtnPlay");
		originReferenceWave.stop();
		originReferenceBoolean = false;
		$("#referenceWaveform").html("");
		return;
	}else if($(this).hasClass("musicLiBoxBtnPlay")){
//		referenceWavePlay();
		//다른 버튼은 selectOptionPause 지우고 selectOptionPlay 추가
		$(".musicLiBoxBtn").removeClass("musicLiBoxBtnPause");
		$(".musicLiBoxBtn").addClass("musicLiBoxBtnPlay");
		//이버튼은 selectOptionPlay 지우고  selectOptionPause 추가
		$(this).removeClass("musicLiBoxBtnPlay");
		$(this).addClass("musicLiBoxBtnPause");
		//재생중인 노래가 있다면 노래 멈춤
		if(originReferenceBoolean){
		originReferenceWave.stop();
		$("#referenceWaveform").html("");
		}
		//방금 누른(this)의 정보를 바탕으로 노래 시작 
		originReferenceWave = WaveSurfer.create({
		  container: '#referenceWaveform'
		});
		
		originReferenceWave.on('ready', function() {
			$(this).addClass("musicLiBoxBtnPause");
			originReferenceWave.playPause();
			originReferenceBoolean = true; 
			originReferenceWave.play();
		})
		originReferenceWave.on('finish', function () {
			$(".musicLiBoxBtn").removeClass("musicLiBoxBtnPause");
			$(".musicLiBoxBtn").addClass("musicLiBoxBtnPlay");
			$("#referenceWaveform").html("");
			originReferenceWave.stop();
		});
		//음악 파일 연결
		originReferenceWave.load("../../../usr/"+userSession+"/"+sampleString+".mp3");
//		originReferenceWave.load("/audio/originYoon.mp3");
	}
	
	
});


var originSong = ""; //원곡
var originAlbumCover = ""; // 원곡 이미지경로
var originSongInfo = null; //첫번 째는 원곡작곡가, 두번째는 원곡 명
var originSongKey = "";  //원곡 key
var gs = "";
$('.Content_musicLiBox').click(function(){
	//이미 활성화 된 상태라면 아무것도 안하고 return 시킨다 
	if($(this).hasClass("Content_musicLiBoxActive")){
		return;
	}
	//GS 레퍼런스 분류
	if($(this).hasClass("GS")){
		gs = "GS";
	}else if($(this).hasClass("GS2")){
		gs = "GS2";
	}
	var selectActiveBoolean = $(this).parents(".swiper-slide").attr("style");
	//맨 앞에 없다면 효과 안주기
	if(selectActiveBoolean.indexOf('z-index: 1')== -1 ){
		return;
	}
	originSong = $(this).find(".musicLiBoxTitle").text().trim();
//	background: url('../../image/album_cover/yoon.jpg') 0% 0% / cover
	originAlbumCover = $(this).attr('value');
	console.log(originSong);
	console.log(originAlbumCover);
	originSongInfo =  originSong.split(" - ");
	
	
	console.log(originSongInfo);
	$(".resultMusicAlert").css("display","none");
	$(".resultMusicAlert").fadeIn(200);
	$(".resultMusicAlert").text(originSong+"의 기반으로  곡을 만들겠습니다");
	$(".Content_musicLiBox").removeClass("Content_musicLiBoxActive");
	$(".Content_musicLiBox").removeAttr( "style" );
	$(this).toggleClass("Content_musicLiBoxActive");
	$(".selectMusicNextBtn").addClass("Content_musicLiBoxActive");
	///key 가져와서 미리설정
	$.ajax({
		url:'/getReferenceKey',
		type:'GET',
		data:{"songName":originSongInfo[1],"artist":originSongInfo[0]},
		success: function(data){
			originSongKey = data.result;
			console.log(originSongKey);
			$(".selectedKey").text(data.result);
			let selectOffset = $(".selectMusicBtnBox").offset();
			$('html, body').scrollTop(selectOffset.top);
		}
	});
});
//step01 이전 버튼 클릭
$(".selectMusicPrevBtn").click(function(){
	location.replace("/composePage");
});
//step02 페이지로 이동
$(".selectMusicNextBtn").click(function(){
	if(originSong == ""){
		alert("곡을 선택해 주세요");
		return;
	}
	//원곡 재생 
	originReferenceWavePlay();
	//메뉴 활성화 여부
	$(".stepState01").removeClass("stepState");
	$(".stepState02").addClass("stepState");
	
	//jquery로 줬던 설정들 전부 파괴
	$(this).removeAttr("style");
	$(this).removeClass("Content_musicLiBoxActive");
	$(".resultMusicAlert").text("");
	
	$(".step01").css("display","none");
	$(".step02").fadeIn(200);
	
	//step2에 대한 설정
	//원곡 정보 출력
	$(".selectedMainMusicImg").attr("style","background: url('../../image/album_cover/"+originAlbumCover+".jpg') 0% 0% / cover");//이미지
	$(".mainMusicBoxTitle>p").text(originSong);//제목
	//스크롤 위로 올리기
	var selectOffset = $(".stepStateBox").offset();
	$('html, body').scrollTop(selectOffset.top);
});
//key 클릭시 
$(".selectedKey").click(function(){ 
	$(this).addClass("selectedKeyExpansion");
	//key리스트 집어넣기
	var selelctKeyStr = ""; 
	var selelctKeyList = ["C","C#","D","D#","E","F","F#","G","G#","A","A#","B",
						 "Am","A#m","Bm","Cm","C#m","Dm","D#m","Em","Fm","F#m","Gm","G#m"];
	var selelctKeyBlock =5;
	selelctKeyStr +="<div class='selelctKeyBlock'>";
	for(var i =0 ; i<selelctKeyList.length;i++){
		if(originSongKey == selelctKeyList[i]){
			selelctKeyStr += "<div class='selectKeyLi selectKeyLiActive' value='"+selelctKeyList[i]+"'>"+selelctKeyList[i]+"</div>";			
		}else{
			selelctKeyStr += "<div class='selectKeyLi' value='"+selelctKeyList[i]+"'>"+selelctKeyList[i]+"</div>";	
		}
		if( i == selelctKeyBlock){
			selelctKeyStr +="</div>";
			selelctKeyStr +="<div class='selelctKeyBlock'>";
			selelctKeyBlock+=6;
		}
	}
	$(this).html(selelctKeyStr);
	$(".selectKeyUl").fadeIn(200);
	$(".selectKeyWave").css("display","none");
})
  
//key list 클릭시 
$(document).on("click",".selectKeyLi",function(){
	//클레스를 안가지고 있을경우 적용하기를 나오게 한다
	var examKey = $(this).attr("value");
	if($(this).hasClass("selectKeyLiActive")){
	}else{
		//적용하기 출현
		applyBtnQuery();
		//sampleList사라지게 하기
		$(".percentOptionUl").removeAttr("style");
	}
	$(".selectedKey").removeClass("selectedKeyExpansion");
	$(".selectedKey").text(examKey);
	
	$(".selectKeyWave").fadeIn(200);
})

//래퍼런스 비율 선택시
var referencePercent = 0;
$(".percentOption").click(function(){
	
	//파형 초기화
	$("#sampleWaveForm1").add("#sampleWaveForm2").add("#sampleWaveForm3").html(""); 
	//재생중인 노래가 있으면 중지
	sampleWaveForm1Play();
	sampleWaveForm2Play();
	sampleWaveForm3Play();
	
	//재생버튼 초기화
	$(".sampleBtn1").addClass("samplePlay_loading");
	$(".sampleBtn1").removeClass("selectOption");
	$(".sampleBtn1").removeClass("selectOptionPlay");
	
	
	
	
	if($(this).hasClass("lower")){
		referencePercent = "Low";
	}else if($(this).hasClass("middle")){
		referencePercent = "Middle";
	}else if($(this).hasClass("Higher")){
		referencePercent = "High";
	}
	$(".percentOption").removeClass("percentOptionAvtive");
	$(this).addClass("percentOptionAvtive");
	//Key 셋팅 출력
	//$(".selectKeyBox").removeAttr("style");
	//$(".selectKeyBox").css("display","none");
	$(".selectKeyBox").fadeIn(200);
	$(".selectKeyBox").css("display","flex");
	//적용하기 버튼 출력
//	$(".referenceApplyBtn").fadeIn(200);
//	$(".referenceApplyBtn").css("display","flex");
	//sample 리스트 사라지기
	$(".percentOptionUl").removeAttr("style");
	//래퍼런스 퍼센트 사라지기
	$(".percent_box").fadeOut(200);
	//sample 리스트 avtive 효과 삭제
	$(".percentOptionLi").removeClass("Content_musicLiBoxActive");
	$(".percentOptionLi").removeAttr("style");
	
	//sample list 출력
//	$(".percentOptionUl").removeAttr("style");
//	$(".percentOptionUl").fadeIn(200);
	
	//$(".referenceBtnBox").removeAttr("style");

});
var finalSongName ="";
var finalSongArtist ="";

//$(".referenceApplyBtn").click(function(){ 이건 1.4ver
$(".percentOption").click(function(){
	
	originSongKey = $(".selectedKey").text();
//	$(this).slideUp(200);
	//곡이 재생준비하면서 로딩 출현
	$(".showDefault_loading").fadeIn(200);
	//비활성화
	$(".selectKeyBox").add(".referencePercent").addClass("disabledbutton");
	//곡안에 띄어쓰기가 있을경우 _ 로 치환
	finalSongName = originSongInfo[1].replaceAll(" ","_");
	//팥빙수면 1 붙이기
	if(finalSongName.indexOf("팥빙수") > -1 ){
		finalSongName = finalSongName+"1";
	}
	//아티스트 안에 띄어쓰기가 있을 경우 _ 로 치환
	finalSongArtist = originSongInfo[0].replaceAll(" ","_");
	
	console.log(finalSongName);
	console.log(userSession);
	console.log(finalSongArtist);
	console.log(referencePercent);
	console.log(gs);
	
	$.ajax({
		url:"/startReference",
			type: "GET",
			dataType: "json",
			data:{"userId":userSession,"songName":finalSongName,"artist":finalSongArtist,"referencePercent":referencePercent,"GS":gs},
			success: function(data){
				console.log(data.success);
				console.log(data.song);
				var test01 =  data.values;
				console.log(data.GS_type)
				console.log(test01);
				//로딩 사라지고 리스트 출현
				$(".showDefault_loading").removeAttr("style");
				$(".percentOptionUl").fadeIn(200);
				
				//비활성화 해제
				$(".selectKeyBox").add(".referencePercent").removeClass("disabledbutton");
				
				// sample1 노래 연결
				sampleWaveForm1 = WaveSurfer.create({
					container: '#sampleWaveForm1',
					height:53,
					progressColor: '#00abeb'
				});
				sampleWaveForm1.on('ready', function() {
					$(".sampleBtn1").removeClass("samplePlay_loading");
					$(".sampleBtn1").addClass("selectOption");
					$(".sampleBtn1").addClass("selectOptionPlay");
					
					console.log("sample1 load complete.");
				})
				sampleWaveForm1.on('finish', function () {
				});
				//음악 파일 연결
				console.log(unescape(data.song));
				sampleWaveForm1.load("../../../usr/"+userSession+"/"+formatDate(new Date())+"-AISM-1-"+finalSongArtist+"-"+finalSongName+".mp3");
//				sampleWaveForm1.load("/audio/Reference_1.mp3");
				
				// sample2 노래 연결
//				sampleWaveForm2 = WaveSurfer.create({
//					container: '#sampleWaveForm2',
//					height:53,
//					progressColor: '#00abeb',
//				});
//				sampleWaveForm2.on('ready', function() {
//					console.log("sample2 load complete.");
//				})
//				sampleWaveForm2.on('finish', function () {
//				});
				//음악 파일 연결
//				sampleWaveForm2.load("../../../usr/"+userSession+"/"+formatDate(new Date())+"-AISM-2-"+originSongInfo[0]+"-"+finalSongName+".mp3");
//				sampleWaveForm2.load("/audio/Reference_2.mp3");
		
				// sample3 노래 연결
//				sampleWaveForm3 = WaveSurfer.create({
//					container: '#sampleWaveForm3',
//					height:53,
//					progressColor: '#00abeb',
//				});
//				sampleWaveForm3.on('ready', function() {
//					console.log("sample3 load complete.");
//				});
//				sampleWaveForm3.on('finish', function () {
//				});
				//음악 파일 연결
//				sampleWaveForm3.load("../../../usr/"+userSession+"/"+formatDate(new Date())+"-AISM-3-"+originSongInfo[0]+"-"+finalSongName+".mp3");
//				sampleWaveForm3.load("/audio/Reference_3.mp3");
			},
			error:function(request,status,error){
				console.log("code : "+request.status);
				console.log("msg : "+request.responseText);
				console.log("error : "+error);
				return;
			}
	})
});
var getSampleSong = "";
//퍼센트 출력하는 함수
$(".percentOptionLi").click(function(){
	//이미 활성화 중인 경우
	if(!$(this).hasClass("Content_musicLiBoxActive")){
		let comparePsercent = $(this).attr("value"); 
		//퍼센트 숫자가 오르듯이 출력
		$('.percentTitle').each(function () {
	    $(this).prop('Counter',0).animate({
		        Counter: comparePsercent
		    }, {
		        duration: 300,
		        easing: 'swing',
		        step: function (now) {
		            $(this).text(Math.ceil(now)+"%");
		        }
		    });
		});
		//버튼 효과 
		$(".percentOptionLi").removeClass("Content_musicLiBoxActive");
		$(".percentOptionLi").removeAttr("style");
		$(this).addClass("Content_musicLiBoxActive");
	}
	// 20-12-29-AISM-1-윤종신-팥빙수
	if($(this).hasClass("sample1")){
		sampleStringOrigin = formatDate(new Date())+"-AISM-1-"+originSongInfo[0]+"-"+finalSongName;
		sampleString = formatDate(new Date())+"-AISM-1-"+originSongInfo[0]+"-"+finalSongName;
		sampleMidi= "Bal_"+sampleString;
	}else if($(this).hasClass("sample2")){
		sampleStringOrigin = formatDate(new Date())+"-AISM-2-"+originSongInfo[0]+"-"+finalSongName;
		sampleString = formatDate(new Date())+"-AISM-2-"+originSongInfo[0]+"-"+finalSongName;
		sampleMidi= "Bal_"+sampleString;
	}else if($(this).hasClass("sample3")){
		sampleStringOrigin = formatDate(new Date())+"-AISM-3-"+originSongInfo[0]+"-"+finalSongName;
		sampleString = formatDate(new Date())+"-AISM-3-"+originSongInfo[0]+"-"+finalSongName;
		sampleMidi= "Bal_"+sampleString;
	}
	
	//래퍼런스 비율을 가져온다.
	$(".percent_box").fadeIn(500);
	$(".percent_box").css("display","flex");
	
	//이전 다음 버튼 출현
	//$(".referenceBtnBox").fadeIn(1000);
	//$(".referenceBtnBox").css("display","flex");
	
	//sample 정보를 가져온다 지금은 일단 text로 받아 오기만 나중에 수정 필요
	getSampleSong = $(this).find(".selectOptionTitle").text();
	
});
//타이틀 선택시 해당 곡 적용
var sampleString = "";
var sampleStringOrigin = "";
var sampleMidi ="";
$(".selectOptionTitle").click(function(){
	if($(this).hasClass("sample1")){
		sampleStringOrigin = formatDate(new Date())+"-AISM-1-"+originSongInfo[0]+"-"+finalSongName;
		sampleString = formatDate(new Date())+"-AISM-1-"+originSongInfo[0]+"-"+finalSongName;
		sampleMidi= "Bal_"+sampleString;
	}else if($(this).hasClass("sample2")){
		sampleStringOrigin = formatDate(new Date())+"-AISM-2-"+originSongInfo[0]+"-"+finalSongName;
		sampleString = formatDate(new Date())+"-AISM-2-"+originSongInfo[0]+"-"+finalSongName;
		sampleMidi= "Bal_"+sampleString;
	}else if($(this).hasClass("sample3")){
		sampleStringOrigin = formatDate(new Date())+"-AISM-3-"+originSongInfo[0]+"-"+finalSongName;
		sampleString = formatDate(new Date())+"-AISM-3-"+originSongInfo[0]+"-"+finalSongName;
		sampleMidi= "Bal_"+sampleString;
	}
	console.log(sampleStringOrigin);
	console.log(sampleString);
	console.log(sampleMidi);
});
//음원 재생
var sampleBtn1Boolean= false;
var sampleBtn2Boolean= false;
var sampleBtn3Boolean= false;
//$(".selectOption").click(function(){
$(document).on("click",".selectOption",function(){
	//debugger;
	let referenceBtnValue = $(this);
	if($(this).hasClass("sample1")){
		sampleStringOrigin = formatDate(new Date())+"-AISM-1-"+originSongInfo[0]+"-"+finalSongName;
		sampleString = formatDate(new Date())+"-AISM-1-"+originSongInfo[0]+"-"+finalSongName;
		sampleMidi= "Bal_"+sampleString;
		//재생버튼이면 실행
		if($(this).hasClass("selectOptionPlay")){
			//다른 버튼들 재생 버튼으로 초기화
			$(".selectOption").removeClass("selectOptionPause");
			$(".selectOption").addClass("selectOptionPlay");
			//여기서 다른 노래들 정지
			sampleWaveForm2Play();
			sampleWaveForm3Play();
			//재생버튼 일시정지 버튼으로 변경
			$(this).removeClass("selectOptionPlay");
			$(this).addClass("selectOptionPause");
			
			//대표님ver
			$("#sampleWaveForm1").addClass("Content_musicLiBoxActive");
			
			//음악 재생
			sampleWaveForm1.play();
			sampleBtn1Boolean = true;
		}else if($(this).hasClass("selectOptionPause")){
			//일시정지 버튼 재생버튼으로 변경
			$(this).removeClass("selectOptionPause");
			$(this).addClass("selectOptionPlay");
			
			//대표님ver
			$("#sampleWaveForm1").removeClass("Content_musicLiBoxActive");
			$("#sampleWaveForm1").removeAttr("style");
			
			//음악 정지
			sampleWaveForm1.stop();
		}
	}else if($(this).hasClass("sample2")){
		sampleStringOrigin = formatDate(new Date())+"-AISM-2-"+originSongInfo[0]+"-"+finalSongName;
		sampleString = formatDate(new Date())+"-AISM-2-"+originSongInfo[0]+"-"+finalSongName;
		sampleMidi= "Bal_"+sampleString;
		//재생버튼이면 실행
		if($(this).hasClass("selectOptionPlay")){
			//다른 버튼들 재생 버튼으로 초기화
			$(".selectOption").removeClass("selectOptionPause");
			$(".selectOption").addClass("selectOptionPlay");
			//여기서 다른 노래들 정지
			sampleWaveForm1Play();
			sampleWaveForm3Play();
			//재생버튼 일시정지 버튼으로 변경
			$(this).removeClass("selectOptionPlay");
			$(this).addClass("selectOptionPause");
			
			//대표님ver
			$("#sampleWaveForm2").addClass("Content_musicLiBoxActive");
			
			//음악 재생
			sampleWaveForm2.play();
			sampleBtn2Boolean = true;
		}else if($(this).hasClass("selectOptionPause")){
			//일시정지 버튼 재생버튼으로 변경
			$(this).removeClass("selectOptionPause");
			$(this).addClass("selectOptionPlay");
			
			//대표님ver
			$("#sampleWaveForm2").removeClass("Content_musicLiBoxActive");
			$("#sampleWaveForm2").removeAttr("style");
			
			//음악 정지
			sampleWaveForm2.stop();
		}
	}else if($(this).hasClass("sample3")){
		sampleStringOrigin = formatDate(new Date())+"-AISM-3-"+originSongInfo[0]+"-"+finalSongName;
		sampleString = formatDate(new Date())+"-AISM-3-"+originSongInfo[0]+"-"+finalSongName;
		sampleMidi= "Bal_"+sampleString;
		
		//재생버튼이면 실행
		if($(this).hasClass("selectOptionPlay")){
			//다른 버튼들 재생 버튼으로 초기화
			$(".selectOption").removeClass("selectOptionPause");
			$(".selectOption").addClass("selectOptionPlay");
			//여기서 다른 노래들 정지
			sampleWaveForm1Play();
			sampleWaveForm2Play();
			//재생버튼 일시정지 버튼으로 변경
			$(this).removeClass("selectOptionPlay");
			$(this).addClass("selectOptionPause");
			
			//대표님ver
			$("#sampleWaveForm3").addClass("Content_musicLiBoxActive");
			
			//음악 재생
			sampleWaveForm3.play();
			sampleBtn3Boolean = true;
		}else if($(this).hasClass("selectOptionPause")){
			//일시정지 버튼 재생버튼으로 변경
			$(this).removeClass("selectOptionPause");
			$(this).addClass("selectOptionPlay");
			
			//대표님ver
			$("#sampleWaveForm3").removeClass("Content_musicLiBoxActive");
			$("#sampleWaveForm3").removeAttr("style");
			
			//음악 정지
			sampleWaveForm3.stop();
		}
	}
});

//이전 버튼
$(".prev").click(function(){
	if($(this).attr("value") == "2"){
//  !!!--- 어차피 뒤로가는게 새로고침이랑 같아서 코드는 넣어봤지만 다시  페이지를 로딩하는 데이터가 아까워서 일단 보류---!!!
		location.replace("composeReference");
		
//		originSong = "";
//		originAlbumCover = "";
//		$(".step02").css("display","none");
//		$(".step01").fadeIn(200);
//		
//		//step01 비활성화
//		$(".Content_musicLiBox").removeAttr('style');
//		$(".Content_musicLiBox").removeClass('Content_musicLiBoxActive');
//		
//		//step02에 건드린 모든 style 초기화
//		$(".percentOptionLi").removeClass("Content_musicLiBoxActive");
//		$(".step02 div").removeAttr("style");
//		//$(".percent_box").removeAttr("style");
//		$(".percent_box").fadeOut(200);
//		//래퍼런스 비율 선택 초기화
//		$(".percentOption").removeClass("percentOptionAvtive");
//		
//		//메뉴 활성화 여부
//		$(".stepState02").removeClass("stepState");
//		$(".stepState01").addClass("stepState");
	}else if($(this).attr("value") == "3"){
		//메뉴 활성화 여부
		$(".stepState03").removeClass("stepState");
		$(".stepState02").addClass("stepState");
		
		//페이지 전환
		$(".step03").css("display","none");
		$(".step02").fadeIn(200);
		
		//재생멈추기
		LoadsongformPlay();
	}
	else if($(this).attr("value") == "4"){
		//메뉴 활성화 여부
		$(".stepState04").removeClass("stepState");
		$(".stepState03").addClass("stepState");
		
		//페이지 전환
		$(".step04").css("display","none");
		$(".step03").fadeIn(200);
	}
});
//최종 앨범명을 담을 변수
var finalAlbumName = "";
//악기 트랙 정보
var trackInfo = null;
//악기 송폼 정보
var songformInfo = null;
//OX 번호
var trackListValue =null;
//다음 버튼
$(".next").click(function(){
	var loadingList = ["loadongType01.gif","loadongType02.gif","loadongType03.gif"];
	var ranLoading = Math.random();//난수 오브젝트 생성
	var ranLoadingNum = Math.floor(ranLoading*loadingList.length); //난수 만들기
	console.log(ranLoadingNum);
	$(".dolphinImg").css("background","url(../../image/reference/loading/"+loadingList[ranLoadingNum]+") 0% 0% / cover");
	if($(this).attr("value") == "2"){
		if(getSampleSong == ""){
			alert("래퍼런스할 곡을 만들어 주세요");
			return;
		}
		//래퍼런스 비율 사라지기
		$(".percent_box").fadeOut(200);
		//페이지 전환
		$(".step02").css("display","none");
		
		//재생중인 노래가 있으면 중지
		sampleWaveForm1Play();
		sampleWaveForm2Play();
		sampleWaveForm3Play();
		
		$(".referenceLoading").fadeIn(200);
		
		//노래가 생성 or 재생성 되는 함수
		var ranNum = Math.random();//난수 오브젝트 생성
		var loadingFirstNum = Math.floor(ranNum*10+5); //난수 만들기
		var current_progress = 0;
		function intervalSecond(){
			var defaultIntervalSecond = setInterval(function() {
				if (current_progress >= 100){
					$("#dynamic").css("width", "0%");
					$(".loadingPercent").text("0%");
					// 지금은 바로 다운로드 페이지로 가게 만들기
					//100%가 되면 step02로 이동 
					$(".referenceLoading").removeAttr("style");
					$(".step03").fadeIn(200);
					//임시로 변경사항(step03 삭제 버전)
//					$(".step04").fadeIn(200);
					//메뉴 활성화 여부
					$(".stepState02").removeClass("stepState");
					$(".stepState03").addClass("stepState");
					var selectOffset = $(".selectedMainMusic").offset();
					$('html, body').scrollTop(selectOffset.top);
					//퍼센트초기화
					current_progress = 0;
					clearInterval(defaultIntervalSecond);
					return;
				}
				ranNum = Math.random();
				var loadingSecondNum = Math.floor(ranNum*3+8); //난수 만들기
				
				//current_progress = current_progress + loadingSecondNum;
				//일단 가상의 퍼센트
				current_progress = current_progress + 1;
				$("#dynamic").css("width", current_progress + "%");
				$(".loadingPercent").text(current_progress + "%");
			}, 10);
		}
//		alert('data 입력');
//		alert("아이디 : "+userSession);
//		alert("json 파일 명 : "+sampleStringOrigin);
		$.ajax({
			url:"getsongInfo",
			type:'POST',
			credentials: "same-origin",
			data:{
				"user":userSession,"jsonName":sampleStringOrigin
				},
			success: function(data){
				let referenceInfo = JSON.parse(data.jsonInfo);
				console.log(referenceInfo.replaceinst);
				let detailInfo ="";
				//트랙정보들을 list로 만든다
				//트랙정보key
				var trackListKey = Object.keys(referenceInfo.replaceinst);
				trackListValue = Object.values(referenceInfo.replaceinst);
				console.log(trackListKey);
				console.log(trackListValue);
				//상세설정 뿌리기
				for(var i = 0 ; i<trackListKey.length;i++){
//					console.log(i+"입니다");
					let detailTrackValue = trackListValue[i];
//					console.log(i+"-"+detailTrackValue+"입니다");
//					console.log(detailTrackValue);
//					console.log("");
					detailInfo += "<div class='detailSettingBox'>";
					
					detailInfo += 	"<div class='trackTitle'>"+trackListKey[i]+"</div>"; //악기이름
					detailInfo += 	"<div class='InstName'>"+
										"<div><img src='../image/inst/"+detailTrackValue[0]+".png' id='InstNameImg'></div>"+//트랙이름
										"<div class='InstNameTitle'>"+detailTrackValue[0]+"</div>"+
									"</div>";
					//detailInfo += 	"<div class='trackTitle'>"+detailTrackValue[1]+"</div>"; //사용중인 악기 번호
					let changeInstList = detailTrackValue[2];
						changeInstList = changeInstList.split(",");
					console.log(changeInstList[1]);
					console.log(changeInstList.length);
					detailInfo +=	"<div class='changeInstBox'>";
					for(var j = 0; j<changeInstList.length;j++){
						detailInfo += 	"<div class='changeInst' value='"+changeInstList[j]+"'>"+
											"<div> TYPE "+(j+1)+"</div>"+
											"<div class='instBtnBox instPlayBtn'> </div>"+
										"</div>"; //대체가능한 악기번호 리스트
					}
					detailInfo += 	"</div>";
					detailInfo += "</div>";
					
					
				}
				
				$(".compose_container").html(detailInfo);
				
			},
		});
		var tags = document.getElementById( "warning_Box" );
	 	tags.innerHTML = "서비스 준비중입니다";
//		var tags = document.getElementById( "compose_container" );
// 			 tags.innerHTML = detailInfo;
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
		}, 60);
		
	}else if($(this).attr("value") == "3"){
		
		
		//재생멈추기
		LoadsongformPlay();
		
		//메뉴 활성화 여부
		$(".stepState03").removeClass("stepState");
		$(".stepState04").addClass("stepState");
		
		//페이지 전환
		$(".step03").css("display","none");
		$(".step04").fadeIn(200);
		
		//CD 배경 변경
		$(".cdPlay").attr("style","background: url('../../image/album_cover/"+originAlbumCover+".jpg') 0% 0% / cover");
		$(".cdCase").attr("style","background: url('../../image/album_cover/"+originAlbumCover+".jpg') 0% 0% / cover");
		
	}else if($(this).attr("value") == "4"){
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
	}
});
//변형된 OX들
var testTrackListValue = "O/O/O/O/O/O";

function XOcomtroller(index,name){
	//X로 바꾸기
		if(name.attr("value") == "O"){
		name.removeClass("on");
		name.addClass("off");
		name.attr("value","X");
		trackListValue[index] = "X";
		}else if(name.attr("value") == "X"){//O로 바꾸기
		name.removeClass("off");
		name.addClass("on");
		name.attr("value","O");
		trackListValue[index] = "O";	
		}
		testTrackListValue  = ""+trackListValue;
		testTrackListValue = testTrackListValue.replaceAll(",","/");
		console.log(trackListValue);
		console.log(testTrackListValue);
		
}
//악기스타일 변경 test_ver
var changeReference = null;
$(document).on("click",".navOptionContent",function(){
//$(".navOptionContent").click(function(){
//	debugger;
	changeReference = false;
	var XOname = $(this);
	if($(this).hasClass("index0")){
		XOcomtroller(0,XOname);
		
	}else if($(this).hasClass("index1")){
		XOcomtroller(1,XOname);
	}else if($(this).hasClass("index2")){
		XOcomtroller(2,XOname);
	}else if($(this).hasClass("index3")){
		XOcomtroller(3,XOname);
	}else if($(this).hasClass("index4")){
		XOcomtroller(4,XOname);
	}else if($(this).hasClass("index5")){
		XOcomtroller(5,XOname);
	}
	//버튼 상태 변경
	$(".detailPlayBtn").attr("value","2");
	//버튼 초기화
	$(".detailPlayBtn").removeClass("detailPlayBtnPause");
	$(".detailPlayBtn").addClass("detailPlayBtnPlay");
});
//상세 설정 재생버튼 바뀌기
var LoadsongformBoolean = false;
$(".detailPlayBtn").click(function(){
	
	if($(this).hasClass("detailPlayBtnPlay")){
		$(this).removeClass("detailPlayBtnPlay");
		//로딩 넣기
		$(this).addClass("defatilPlay_loading");
		
		//원곡 가져오기
		if(sampleString.indexOf('_Re')> -1 ){
		console.log("sampleString // _Re 확인전  : "+sampleString);
		sampleString = sampleString.substring(0, sampleString.length-3);
		console.log("sampleString // _Re 확인후  : "+sampleString);
		}
		
		changeReference = true;
		console.log(userSession);
		console.log("ajax로 보낼때 : "+sampleString);
		console.log(testTrackListValue);
		
		//재생 멈추기
		LoadsongformPlay();
		
		$.ajax({
				url:"change_reference",
				type:'GET',
				data:{
					"user":userSession,"songName":sampleString,"OX":testTrackListValue
					},
				success: function(data){
					console.log("ajax를 거치고 난후 : "+data.songName);
					//일시정지 넣기
					$(".detailPlayBtn").removeClass("defatilPlay_loading")
					$(".detailPlayBtn").addClass("detailPlayBtnPause");
					
					$("#LoadsongformBox").html("");
					// Loadsongform 노래 연결
					Loadsongform = WaveSurfer.create({
						container: '#LoadsongformBox',
					});
					Loadsongform.on('ready', function() {
						console.log("Loadsongform load complete.");
						Loadsongform.play();
						LoadsongformBoolean = true;
						$(".navOptionContentEmpty").eq(6).addClass("playBlink");
						$(".index0").add(".index1").add(".index2").add(".index3").add(".index4").add(".index5").addClass("playBlink");
					})
					Loadsongform.on('finish', function () {
						
					});
					//음악 파일 연결
					if($(".detailPlayBtn").attr("value") == "1"){
						Loadsongform.load("../../../usr/"+userSession+"/"+sampleString+".mp3");
						$(".detailPlayBtn").attr("value","2");
					}else{
						sampleString = data.songName;
					    console.log(data.songName);
					    console.log(sampleString);
						Loadsongform.load("../../../usr/"+userSession+"/"+sampleString+".mp3");
					}
//					Loadsongform.load("/audio/Reference_1.mp3");
				}
		});
		
		
	}else if($(this).hasClass("detailPlayBtnPause")){
		$(this).removeClass("detailPlayBtnPause");
		$(this).addClass("detailPlayBtnPlay");
		Loadsongform.stop();
		LoadsongformBoolean = false;
		$(".navOptionContentEmpty").eq(6).removeClass("playBlink");
		$(".index0").add(".index1").add(".index2").add(".index3").add(".index4").add(".index5").removeClass("playBlink");
	}
});
//다운로드 페이지 소리 컨트롤
$('.soundController').on('input', function(){
    let val = $(this).val();
    $(this).css('background', 'linear-gradient(to right, dodgerblue 0%, dodgerblue '+ val +'%, #d5d4d3 ' + val + '%, #d5d4d3 100%)');
});
//다운로드 페이지 재생 버튼 누를시
$(".cdPlayerBtn").click(function(){
	if($(this).hasClass("cdPlayerPlay")){
		$(this).removeClass("cdPlayerPlay");
		$(".cdCase").addClass("infinite_rotating");
		$(this).addClass("cdPlayerPause");
	}else if($(this).hasClass("cdPlayerPause")){
		$(this).removeClass("cdPlayerPause");
		$(".cdCase").removeClass("infinite_rotating");
		$(this).addClass("cdPlayerPlay");
	}
});

$(document).on("propertychange change paste input keyup",".finalAlbumName",function(e){
	finalAlbumName = $(this).val();
	console.log(finalAlbumName);
	$(".finalAlbumNameAlert").fadeOut(200);
	if(e.keyCode == 13){
		if($.trim(finalAlbumName) == ""){
		$(".finalAlbumNameAlert").css("display","none");
		$(".finalAlbumNameAlert").text("제목을 확인해주세요");
		$(".finalAlbumNameAlert").fadeIn(200);
		$('.finalAlbumName').text("");
		return;
		
		}else if($.trim(finalAlbumName) != ""){
			$(".confirmMsgBox").html("");
			//로딩 추가
			$(".confirmMsgBox").addClass("down_loading");
			//여기서 악보 이름 저장 DB 저장, insert 문 수정하기
			$.ajax({
				url:"insert_myList",
				type:'GET',
				data:{
					"user":userSession,"subject":finalAlbumName,"createdate":formatDate(new Date()),"composetype":"레퍼런스 기반 작곡",
					"songinfo1":originSongInfo[0],"songinfo2":originSongInfo[1],"albumcover":originAlbumCover
					},
					success: function(data){
					console.log(data);	
					
					//insert 성공후
					if(data.result == "success"){
						
						console.log("아이디 : "+sessionBoolean);
						console.log("악보에 적힐 악보이름 : "+finalAlbumName);
						console.log("악보에 적힐 작곡가 이름 : "+createUserName);
						console.log("PDF이름 : "+finalAlbumName);
						console.log("원곡노래이름 : "+finalSongName);
						console.log("작곡가 : "+originSongInfo[0]);
						console.log("midi 파일 이름 : "+sampleString);
						
						if(finalAlbumName.indexOf(" ") > 1 ){
							finalAlbumName = finalAlbumName.replaceAll(" ","_");
						}
						console.log("replace 된 이름 : "+finalAlbumName);
						$.ajax({
							url: "/referenceDownFile",
							type: "GET",
							dataType: "json",
							//아이디, 악보에 적힐 악보이름, 악보에 적힐 작곡가 이름,PDF이름, 원곡노래이름   , 원곡 작곡가,   midi 파일 이름
							data:{"sessionBoolean":sessionBoolean,"createSongName":finalAlbumName,"originSongName":finalSongName,"originComposer":finalSongArtist,"MidiName":sampleString.replaceAll(" ","_"),"GS":gs},
							success: function(data){
								if(data.result == "good"){
									console.log("로그 출력");
									console.log(data.values);
									//파일이름을 default로 만든다.
									fileName = data.fileName;
									if(fileName.indexOf("_") > 1 ){
										fileName = fileName.replaceAll("_"," ");
									}
									//컨텐츠 변경
									$(".confirmMsgBox").removeClass("down_loading");
									let myworkLiStr = "";
									myworkLiStr += "<div class='downloadSubjectTitle'>앨범이름이 "+fileName+"으로 저장이 완료 되었습니다</div>";
									myworkLiStr += "<div class='confirmModalBtnBox'>";
									myworkLiStr += "<div class='locationMyList createAlbumBtn'>";
									myworkLiStr += "<span class=''>확인</span>";
									myworkLiStr += "</div></div>";
									$(".confirmMsgBox").html(myworkLiStr);
								}else{
									console.log("비정상적인 접근입니다");	
								}
							}
						});	//ajax end
					}else if(data.result == "fail"){ //if(data.result == "success") end
						//컨텐츠 변경
						$(".confirmMsgBox").removeClass("down_loading");
						let myworkLiStr = "";
						myworkLiStr += "<div class='downloadSubjectTitle' >"+finalAlbumName+"은 이미 존재 합니다</div>"+
										"<div class='confirmModalBtnBox'>"+
											"<div class='completeAlbumCancel createAlbumBtn'>"+
												"<span class=''>확인</span>"+
											"</div>"+
										"</div>";
						$(".confirmMsgBox").html(myworkLiStr);			
					} 
				}//success end
			}); //main ajax end
		} // else if($.trim(finalAlbumName) != "") end
	}
});

$(document).on("click",".completeAlbumCancel",function(){
	//앨범 이름 초기화
	finalAlbumName ="";
	$(".composeModal").fadeOut(100);
	$(".composeModalContent").html("");
});
//레퍼런스작곡 -> 저장 하고 이름입력후 확인 클릭시 나이 페이지로 이동
//여기서 이름이 변경되고 Save 파일로 저장하게 하는 파이썬 코드 연동하기
$(document).on("click",".locationMyList",function(){
//	location.href="show_myList?username="+userSession;

	//post로 페이지 이동
	$("#location").attr("action","show_myList");
	$("#locationValue1").attr("name","username");
	$("#locationValue1").val(userSession);
	
	$("#location").submit();
});
$( "html" ).keypress(function(e) {
	if(e.keyCode == 32){
		return false;   
	}
});
$( "html" ).keypress(function(e) {
	if(e.keyCode == 13){
		//확인 안누르고 엔터눌렀을때 이동 시키기
		if($(".composeModalBox").find(".locationMyList").length >= 1){
			$("#location").attr("action","show_myList");
			$("#locationValue1").attr("name","username");
			$("#locationValue1").val(userSession);
			
			$("#location").submit();
		}   
	}
});









