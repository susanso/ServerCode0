/**
 * 
 */

//FAQ 클릭시
$(".FAQ_box_title").click(function(){
	if($(this).hasClass("titleActive")){
		$(".FAQ_box_title").removeClass("titleActive");
		$(".FAQ_box_content").slideUp();	
	}else{
		$(".FAQ_box_title").removeClass("titleActive");
		$(this).addClass("titleActive");
		$(".FAQ_box_content").slideUp();
		$(this).siblings(".FAQ_box_content").slideDown();	
	}
});

$(".nav_title").click(function(){
	let thx = $(this);
	//클릭 Active 효과
	$(".nav_title").removeClass("navListActive");
	thx.addClass("navListActive");
	
	$(".nav_content").css("display","none");
	if(thx.hasClass("FAQ_title")){
		$(".FAQ_content").fadeIn(200);	
	}else if(thx.hasClass("QnA_title")){
		$(".QnA_content").fadeIn(200);	
	}else if(thx.hasClass("termsOfUse_title")){
		$(".termsOfUse_content").fadeIn(200);	
	}else if(thx.hasClass("notice_title")){
		$(".notice_content").fadeIn(200);	
	}
})
//1:1문의 클릭시
$(".QnA_box_info").click(function(){
	let thx = $(this);
	
	if(thx.hasClass("titleActive")){
		$(".QnA_box_info").removeClass("titleActive");
		$(".QnA_box_answer").slideUp(200);	
	}else{
		$(".QnA_box_info").removeClass("titleActive");
		thx.addClass("titleActive");
		$(".QnA_box_answer").slideUp(200);
		thx.siblings(".QnA_box_answer").slideDown(200);	
	}
});
//공지사항 클릭시
$(".note_box_info").click(function(){
	let thx = $(this);
	
	if(thx.hasClass("titleActive")){
		$(".note_box_info").removeClass("titleActive");
		$(".note_box_content").slideUp(200);	
	}else{
		$(".note_box_info").removeClass("titleActive");
		thx.addClass("titleActive");
		$(".note_box_content").slideUp(200);
		thx.siblings(".note_box_content").slideDown(200);	
	}
});
