/**
 * 
 */
//커스텀 모달
function callConfirmModal(e){
	let maskHeight = $(document).height();  
	let maskWidth = $(window).width();
	$('.composeModal').css({'width':maskWidth,'height':maskHeight});
	$(".composeModal").fadeIn(100);
	$(".composeModal").css("display","flex");
	$(".composeModalContent").html(e);
	//화면 중앙으로 이동
	var modalOffset = $(".composeModalBox").offset();
	$('html, body').scrollTop(modalOffset.top-300);
}
detailSong = WaveSurfer.create({
	container: '#albumDetailWaveForm',
	height:60,
	progressColor: '#00abeb'
});

detailSong.on('ready', function() {
	console.log("complete");
})
detailSong.on('finish', function () {
	$(".albumDetailBtnBox").removeClass("albumDetailPause");
	$(".albumDetailBtnBox").addClass("albumDetailPlay");
	detailSong.stop();
});
//음악 파일 연결
//detailSong.load("../../../usr/"+userSession+"/"+sampleString+".mp3");
detailSong.load("/audio/originYoon.mp3");

$(".albumDetailBtnBox").click(function(){
	if($(this).hasClass("albumDetailPlay")){
		//재생버튼 일시정지 버튼으로 변경
		$(this).removeClass("albumDetailPlay");
		$(this).addClass("albumDetailPause");
		detailSong.play();
	}else if($(this).hasClass("albumDetailPause")){
		//일시정지 버튼 재생버튼으로 변경
		$(this).removeClass("albumDetailPause");
		$(this).addClass("albumDetailPlay");
		detailSong.pause();
	}
});

//가짜 이미지
var fakeImg = [];

//가짜 제목
var fakeTitle = [];

//가짜 가격
var fakePrice = [];
//str
var loadList = "";
//다른 트랙 보기 클릭
$(".otherTrackBtn").click(function(){
	$(this).addClass("selectBtnActive");
	$(".commentBtn").removeClass("selectBtnActive");
	$(".commentBox").css("display","none");
	$(".contentMusicBox").fadeIn(200);
	
});
//댓글 클릭
$(".commentBtn").click(function(){
	$(this).addClass("selectBtnActive");
	$(".otherTrackBtn").removeClass("selectBtnActive");
	$(".contentMusicBox").css("display","none");
	$(".commentBox").fadeIn(200);
	$(".commentBox").css("display","flex");
	
});
var confirmMsg ="";
$(".price").add(".contentMusicPrice").click(function(){
	confirmMsg = "<div class='confirmMsgBox'>"+
		"<div class='buyOptionBox'>"+
			"<div class='canBuy buyOptionLi'>"+
				"<div class='buyOptionTitle'>Free</div>"+
				"<div class='buyOptionPrice'>무료</div>"+
				"<div class='buyOptionDown'>MIDI,악보,WAV 다운로드 불가</div>"+
				"<div class='buyOptionDown'>오픈 마켓 업로드 하루 10개 제한</div>"+
				"<div class='buyOptionDown'>사운드 샘플 킷 판매 불가</div>"+
				"<div class='buyOptionDown'>편집가능 기능 미제공</div>"+
				"<div class='buyOptionDown'>음원 판매시 수수료 70%</div>"+
				"<div class='buyOptionDown'>사이트 내 음원 프로모션 불가</div>"+
				"<div class='buyOptionDown'>사용 가능 메세지 10개</div>"+
				"<div class='buyOptionCopyright'>상업적 이용 불가</div>"+
			"</div>"+
			"<div class='canBuy buyOptionLi'>"+
				"<div class='buyOptionTitle'>Standard</div>"+
				"<div class='buyOptionPrice'>월 9,900 ₩</div>"+
				"<div class='buyOptionDown'>MIDI,악보,WAV 다운로드 무제한</div>"+
				"<div class='buyOptionDown'>오픈 마켓 업로드 무제한</div>"+
				"<div class='buyOptionDown'>사운드 샘플 킷 판매 가능</div>"+
				"<div class='buyOptionDown'>편집가능 기능 제공</div>"+
				"<div class='buyOptionDown'>음원 판매시 수수료 50%</div>"+
				"<div class='buyOptionDown'>사이트 내 음원 프로모션 불가</div>"+
				"<div class='buyOptionDown'>사용 가능 메세지 100개</div>"+
				"<div class='buyOptionCopyright'>상업적 이용 불가</div>"+
			"</div>"+
			"<div class='canBuy buyOptionLi'>"+
				"<div class='buyOptionTitle'>Pro</div>"+
				"<div class='buyOptionPrice'>월 19,900 ₩</div>"+
				"<div class='buyOptionDown'>MIDI,악보,WAV 다운로드 무제한</div>"+
				"<div class='buyOptionDown'>오픈 마켓 업로드 무제한</div>"+
				"<div class='buyOptionDown'>사운드 샘플 킷 판매 가능</div>"+
				"<div class='buyOptionDown'>편집가능 기능 제공</div>"+
				"<div class='buyOptionDown'>음원 판매시 수수료 20%</div>"+
				"<div class='buyOptionDown'>사이트 내 음원 프로모션 가능</div>"+
				"<div class='buyOptionDown'>사용 가능 메세지 무제한</div>"+
				"<div class='buyOptionCopyright'>상업적 이용 가능</div>"+
			"</div>"+
		"</div>"+
		"<div class='justoneBox canBuy'>"+
			"<div class='justoneTitle'> 1회 다운"+
			"</div>"+
			"<div class='justonePrice'>₩ 1,000"+
			"</div>"+
		"</div>"+
		"<div class='confirmModalBtnBox'>"+
			"<div class='buyBtn buyThis'><span class=''>구매</span></div>"+
			"<div class='buyBtn closeModal'><span class=''>취소</span></div>"+
		"</div>"+
 	"</div> ";
	callConfirmModal(confirmMsg);
});
//모달 닫기
$(document).on("click",".closeModal",function(){
	$(".composeModal").fadeOut(100);
	$(".composeModalContent").html("");
});
$(document).on("click",".canBuy",function(){
	$(".canBuy").removeClass("canBuyActive");
	$(this).addClass("canBuyActive");
})
$(document).on("click",".buyThis",function(){
	confirmMs="";
	 confirmMsg ="<div>"+ 
					"<div class='successBuy'> 구입이 완료 되었습니다</div> "+
					"<div class='buyBtn closeModal'><span class=''>확인</span></div>"+
				"</div>";
	callConfirmModal(confirmMsg);
})



