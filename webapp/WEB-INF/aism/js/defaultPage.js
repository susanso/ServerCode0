/**
 * 
 */

//var defaultWaveform = WaveSurfer.create({
//  container: '#defaultWaveform',
//  
//  height:100,
//  backgroundColor: '#424546',
//  barWidth: 2,
//  progressColor: '#00abeb',
//  cursorColor: 'transparent',
//  waveColor: '#bdbdbd'
//});
////load audio file
//defaultWaveform.load("/audio/default.mp3");
//
//var defaultPlayBtnState =""
////재생버튼 클릭
//$(".defaultPlayBtn").click(function(){
//	defaultPlayBtnState = $(this).attr("value");
//	
//	if(defaultPlayBtnState == "Play"){
//		$(this).css("background","url(../../image/button/MusicPauseType.png)");
//		$(this).css("backgroundSize","cover");
//		$(this).attr("value","Pause");
//		
//	}else{
//		$(this).css("background","url(../../image/button/MusicPlayType.png)");
//		$(this).css("backgroundSize","cover");
//		$(this).attr("value","Play");
//	}
//	defaultWaveform.playPause();
//});
//$(".defaultSignUpBtn").click(function(){
//	location.href = "/composePage";
//});

$(".compose").click(function(){
	location.href="composePage";
});
$(".market").click(function(){
	location.href="openMarket";
});

