/**
 * 
 */
window.onload = function(){
	console.log(userName); 
    console.log(userId);
	console.log(userEmailId);
	console.log(userEmailAddr);
	$(".myPageUserName").val(userName);
	$(".myPageUpId").val(userId);
	$(".email_start").val(userEmailId);
	$(".email_end").val(userEmailAddr);
	$(".submitEmailBox").addClass("createSubmitEmail");
	$(".selectEmail").val(userEmailAddr).prop("selected", true); //값이 userEmailAddr 인 option 선택
	$(".phoneSelectBox").val(phoneType).prop("selected", true); //값이 phoneType 인 option 선택
	$(".phoneInputBox_before").val(phoneBefore);
	$(".phoneInputBox_after").val(phoneAfter);
	
	var email ="";
	var emailBoolean =null;
	var emailNum ="";
	
	//프로필 기본 설정
	if(sessionProfileImg == "default"){
		$(".myPageProfile").css("background-image","url(../../image/profile/default_profile.png)");
	}else{
		$(".myPageProfile").css("background-image","url(../../../usr/"+userId+"/profile/"+sessionProfileImg+")");
	}	
}
function callMyWorkList(list){
	let viewMyWorkList = "";
	list.forEach(function(element){
	    console.log(element);
		console.log(element.albumcover);
		viewMyWorkList +="<div class='col-xs-12 col-sm-6 col-md-4 col-lg-4' style='padding: 0'>";
		if(element.composetype == "레퍼런스 기반 작곡"){
		viewMyWorkList += "<div class='workCardBox composeReference'>";	
		}else if(element.composetype == "분위기 기반 작곡"){
		viewMyWorkList += "<div class='workCardBox composeKeyword'>";
		}
		viewMyWorkList +="<div class='CardtitleBox'>"+
			"<div class='title'>"+element.subject+"</div>"+
				"<div class='optionBox'>";
				if(element.sell == "no"){
				viewMyWorkList +="<div class='not_sold'>미판매</div>";
				}else{
				viewMyWorkList +="<div class='sale'>판매중</div>";	
				}
		viewMyWorkList +="<div class='date'>"+element.createdate+"</div>"+
				"<div class='deleteButton' value='"+element.subject+"'></div>"+
			"</div>"+
		"</div>"+
		"<div class='CardContentBox'>"+
			"<div class='albumCover' style='background: url(../../image/album_cover/"+element.albumcover+".jpg) 0% 0% / cover'>"+
				"<div class='playBtn'></div>"+
			"</div>"+
			"<div class='ContentselectBox'>"+
				"<div class='selectCompose'>"+element.composetype+"</div>"+
				"<div class='ComposeName'>"+element.songinfo1+"</div>"+
				"<div class='Contentselect'>"+element.songinfo2+"</div>"+
			"</div>"+
			"<div class='CardDownBox'>"+
				"<div class='downBox pdf' value="+element.subject+"></div>"+
				"<div class='downBox mp3' value="+element.subject+"></div>"+
				"<div class='downBox midi' value="+element.subject+"></div>"+
			"</div></div>"+
			//추가사항
			"<div class='CardStoreSetBox'><div class='CardStoreSet' value='"+element.subject+"'>판매하기</div> </div>"+
			"</div></div>";
	});
	$(".workListBox").html(viewMyWorkList);
};
//페이지 전환
$(".myPageTitle").click(function(){
	$(".myPageTitle").removeClass("myPageTitleActive");
	$(this).addClass("myPageTitleActive");
	if($(this).hasClass("changeMyInfo")){
		$(".myPageShowBox").css("display","none");
		$(".changeMyInfoBox").fadeIn();
	}else if($(this).hasClass("paymentHistory")){
		$(".myPageShowBox").css("display","none");
		$(".paymentHistoryBox").fadeIn();
	}else if($(this).hasClass("workList")){
		$(".myPageShowBox").css("display","none");
//		userId = 
		$.ajax({
			url: "click_show_myList",
			type: "GET",
			dataType: "json",
			data:{"username":userId},
			success: function(data){
					let myList = data.list;
					console.log(myList);
					console.log(myList.albumcover);
					callMyWorkList(myList);
				}
			});
		$(".workListBox").fadeIn();
		console.log(userId);
	} else if($(this).hasClass("myRanking")){
		$(".myPageShowBox").css("display","none");
		$(".myRankingBox").fadeIn();
	} else if($(this).hasClass("QnAList")){
		$(".myPageShowBox").css("display","none");
		$(".QnAListBox").fadeIn();
	} 
});


var checkPwdBoolean = true;
//수정하기 클릭시
$(".changeProfile").click(function(){
});
//취소 누를경우
$(".backHome").click(function(){
	location.href="/";
});

$(document).on("click",".CardStoreSet",function(){
	let aubumName = $(this).attr("value");
	console.log(aubumName);
	
	$("#location").attr("action","show_detail_album");
	$("#locationValue1").attr("name","userName");
	$("#locationValue1").val(userId);
	$("#locationValue2").attr("name","albumName");
	$("#locationValue2").val(aubumName);
	
	$("#location").submit();
});



//악기들 관리 하기
var aaa = "eee"
var test = {"asd":"qwe","qqq":"ewq","eee":"eee"};
console.log(test);
$.each(test, function(key,value){
	if(key == aaa){
		test[key] = "good~!~!";
	}
	console.log("키"+key+", 값"+value);
});
console.log(test);

//리뉴얼 마이페이지
//회원 정보 보기
$(document).on("click",".selectMyInfo",function(){
	console.log("asdasd");	
		
	$("#location").attr("action","selectUserInfo");
	$("#locationValue1").attr("name","userName");
	$("#locationValue1").val(sessionBoolean);
	
	$("#location").submit();
});



//21-02-15 새로운 버전



