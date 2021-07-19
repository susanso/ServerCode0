/**
 * 
 */
if (sessionBoolean == "") {
	$(".loginQueryResult").html("<div class='userLogin'>Sign in</div>");
} else {
	$(".startOpenMarket").after(
		"<div class='startManagement'>"+
			"<div class='myAlbumList'>My Album</div>"+
		"</div>"
	);
	$(".loginQueryResult").html(
		"<div class='profileBox'>"+
			"<div class='profileImg'></div>"+
			"<div class='profileId'>" + sessionBoolean + "</div>"+
			"<div class='userInfoContainer'>"+
				"<div class='userInfoRow selectMyInfo'>"+
					"<div class='profileImg'></div>"+
					"<div class='userInfoContent'>" + sessionBoolean + "</div> <div class='subContent'>정보 보기</div>"+						
				"</div>"+
				"<div class='userInfoRow'>"+
					"<div class='userInfoContent myService'>이용중인 서비스</div> <div class='subContent'> - </div>"+						
				"</div>"+
				"<div class='userInfoRow'>"+
					"<div class='userInfoContent myService'>내 작곡리스트</div> <div class='subContent'>0 곡</div>"+						
				"</div>"+
				"<div class='userInfoRow'>"+
					"<div class='userInfoContent myService'>판매자 등록</div> <div class='subContent'>미등록</div>"+						
				"</div>"+
				"<div class='userInfoRow'>"+
					"<div class='userInfoContent logOut'><a href='/logout.go'>Log Out</a></div>"+						
				"</div>"+
			"</div>"+
		"</div>"
	);
	
	$(".mainTopMenuLi").eq(2).addClass("loginQuery");
	//$(".profileImg").css("cursor", "pointer");
	if(sessionProfileImg == "default"){
		$(".profileImg").css("background-image","url(../../image/profile/default_profile.png)");
	}else{
		$(".profileImg").css("background-image","url(../../../usr/"+sessionBoolean+"/profile/"+sessionProfileImg+")");	
	}
}




$(".loginQueryResult").click(function() {
	if ($(this).text() == "Sign in") {
		location.href = "/login.do";
	}
});
//로그인 로그아웃
$(document).on("mouseover",".userLogin",function(){
	$(this).addClass("userProfileActive");
});
$(document).on("mouseout",".userLogin",function(){
	$(this).removeClass("userProfileActive");
});

//my Info mouseover
$(document).on("mouseover",".profileBox,.userInfoContainer",function(){
	$(".userInfoContainer").css("display","block");
//	:after 써서  My info 로 변경\
	$(".profileBox").addClass("myInfoHover");
});
//my Info mouseout
$(document).on("mouseout",".profileBox,.userInfoContainer",function(){
	$(".userInfoContainer").removeAttr("style");
	//:after 써서  My info 로 변경
	$(".profileBox").removeClass("myInfoHover");
});

//마이페이지로 이동
$(document).on("click",".profileImg,.profileId",function(){
//	location.href="/myPageCertification";
	
});
//내 앨범 정보로 이동
$(document).on("click",".myAlbumList",function(){
	$("#location").attr("action","show_myList");
	$("#locationValue1").attr("name","username");
	$("#locationValue1").val(sessionBoolean);

	$("#location").submit();
});


$(document).on("click",".selectMyInfo",function(){
	$("#location").attr("action","selectUserInfo");
	$("#locationValue1").attr("name","userName");
	$("#locationValue1").val(sessionBoolean);
	
	$("#location").submit();
});