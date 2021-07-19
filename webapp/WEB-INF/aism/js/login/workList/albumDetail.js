/**
 * 
 */
detailSong = WaveSurfer.create({
	container: '#albumDetailWaveForm',
	height:45,
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

//해시태그 입력시
$(".hashtagValue").on("propertychange change paste input", function(e) {
	let addHashTag = $(this).val();
	console.log(addHashTag);
	if(e.keyCode == 13){
		console.log("gg");	
		$(".startHashTag").append("<div> # "+addHashTag+"</div>");
		$(this).val("");
	}
})

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

$(".goListBtn").click(function(){
	//post로 페이지 이동
	$("#location").attr("action","show_myList");
	$("#locationValue1").attr("name","username");
	$("#locationValue1").val(userId);
	
	$("#location").submit();
});

$(".applyBtn").click(function(){
	alert("등록이 완료 되었습니다");
	
	location.href="myProductList";
})


