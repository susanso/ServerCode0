/**
 * 
 */

function slideUP_Down(e,n){
	if($(e).find(".nav_title_arrowBtn").hasClass("arrowBtn_slideUp")){
		$(e).find(".nav_title_arrowBtn").removeClass("arrowBtn_slideUp");
		$(n).slideUp(200);
	}else{
		$(e).find(".nav_title_arrowBtn").addClass("arrowBtn_slideUp");
		$(n).slideDown(200);
	}
}

var albumImg = ["babyShark.jpg","B-DAY.jpg","children01.jpg",
"emoHiphop.jpg","fire.jpg","idea.jpg","iffy.jpg","indigo.jpg",
"money.jpg","take.jpg","jazz03.jpg",];
var count = 11;



function ContainerList(){
	let mainContainerList = "";
	for(var i =0 ;i<7;i++){
		mainContainerList += "<div class='sellCardContainer'>"+
								"<div class='albumImg' style='background: url(../../image/album_cover/"+albumImg[i]+") 0% 0% / cover'></div>";	
		mainContainerList +=	"<div class='songTitle'>asdkmasu main</div>"+
								"<div class='defaultInfo'>"+
										"<div class='sellerInfo'>"+
											"<div class='sellerName'>susansok</div>"+
										"</div>"+	
										"<div class='downInfo'>"+
											"<div class='sellerPrice'>2,900 ₩</div>	"+
										"</div>"+
										"</div>"+
							"</div>";	
				}
	return mainContainerList;
}

function showList(a){
	let	maindisplay ="";
	for(var i =0 ;i<a;i++){
		maindisplay +=	"<div class='contentMusicBox'>"+
							"<div class='contentMusicInfo'>"+
								"<div class='contentMusicImg' style='background: url(../../image/album_cover/"+albumImg[i]+") 0% 0% / cover'></div>"+
								"<div class='contentMusicTextBox'>"+
									"<div class='contentMusicTitle'>Toxic Necessities</div>"+
									"<div class='contentMusicUser'>lilize</div>"+
									"<div class='contentMusicLikeBox'>"+
										"<div class='contentMusicLike'>♡ 9,320</div>"+
										"<div class='contentMusicBuyCount'>576 Down</div>"+
										"<div class=''>1,233 Listen</div>"+
									"</div>"+
								"</div>"+
							"</div>"+
							"<div class='contentMusicPrice'>₩ 10,000</div>"+
						"</div>";
	}
	return maindisplay;
}
function resetAlbum(){
	//album 화살표 및  옵션 slideUp
	$(".allListPage").find(".nav_title_arrowBtn").removeClass("arrowBtn_slideUp");
	$(".allListPage_option").slideUp(200);
}
function resetPlayList(){
	//playList 화살표 및  옵션 slideUp
	$(".playListPage").find(".nav_title_arrowBtn").removeClass("arrowBtn_slideUp");
	$(".playListPage_option").slideUp(200);
}
//showList(count);
//ContainerList();
//home 클릭시
$(".famousListContent").html(showList(count));
$(".cardListContent").html(ContainerList());
$(".newAlbumList").html(ContainerList());

//왼쪽 목록클릭시
$(".navList").click(function(){
	let thx = $(this);
	
	//active효과
	$(".navList").removeClass("navListActive");
	$(thx).addClass("navListActive");
	//전체 content 사라지게 하기
	$(".optionPage").css("display","none");
	
	//여기서 목록 controll
	if(thx.hasClass("allListPage")){//album 클릭시
		thx = ".allListPage";
		let name = ".allListPage_option";
		//임시로 만든것 추후에 DB 연결해야함
		count = 11;
		//하위 리스트 보여주기
		slideUP_Down(thx,name);
		
		
		//content 부분 나오게하기
		$(".allList").fadeIn();
		//maindisplay라는 변수에  content 만들기 함수 시작후 출력
		
		let e = showList(count); 
		$(".allListContent").html(e);
		//playList 화살표 초기화
		resetPlayList();
		
	} else if(thx.hasClass("playListPage")){//playList 클릭시
		thx = ".playListPage";
		let name = ".playListPage_option";
		//임시로 만든것 추후에 DB 연결해야함
		count = 3;
		//하위 리스트 보여주기
		slideUP_Down(thx,name);
		
		//content 부분 나오게하기
		$(".playList_list").fadeIn();
		//maindisplay라는 변수에  content 만들기 함수 시작후 출력
		//let e = showList(count); 
		//$(".playList_list").html(e);
		
		//앨범화살표 초기화
		resetAlbum();
		
	} else if(thx.hasClass("mainHome")){//Home 클릭시
		//임시로 만든것 추후에 DB 연결해야함
		count = 11;
		
		//content 부분 나오게하기
		$(".homeList").fadeIn();
		let e = showList(count); 
		$(".famousListContent").html(e);
		//화살표 초기화
		resetAlbum();
		resetPlayList();
	} else if(thx.hasClass("feedPage")){//Feed 클릭시
		//임시로 만든것 추후에 DB 연결해야함
		count = 8;	
		//content 부분 나오게하기
		$(".feedList").fadeIn();
		//maindisplay라는 변수에  content 만들기 함수 시작후 출력
		let e = showList(count); 
		$(".feedList").html(e);
		//화살표 초기화
		resetAlbum();
		resetPlayList();
	}
});

//장르 클릭시
//$(".allListPage").add(".genreListTitle").add(".keywordListTitle").click(function(){
//	maindisplay = "";
//	count = 11;
//	$(".navList").removeClass("navListActive");
//	$(".allListPage").addClass("navListActive");
//	$(".optionPage").css("display","none");
//	//지우기
//	$(".allList").fadeIn();
//	showList(count);
//	$(".allListContent").html(maindisplay);
//	resetPlayList();
//});

$(document).on("click",".reSetting,.contentMusicInfo",function(){
	let img = $(this).siblings(".albumImg").attr("style");
	console.log(img);
	location.href="productDetail";
});
//장르들 클릭시
//$(document).on("click",".row_Title",function(){
//	maindisplay="";
//	$(".row_Title").removeClass("row_TitleAcvite");
//	$(this).addClass("row_TitleAcvite");
//	
//	count = 11;
//	showList(count);
//	$(".allListContent").html("");
//	$(".allListContent").css("display","none");
//	$(".allListContent").html(maindisplay);
//	$(".allListContent").fadeIn();
//	
//});
// 장르들 마우스로 Hover시
$(document).on("mouseover",".row_Title",function(){
	$(this).addClass("row_TitleHover");
});
$(document).on("mouseout",".row_Title",function(){
	$(this).removeClass("row_TitleHover");
});


var mySwiper = new Swiper('.swiper-container', {
    spaceBetween: 30,
    centeredSlides: true,
    pagination: {
      el: '.swiper-pagination',
      clickable: true
    },
    navigation: {
      nextEl: '.swiper-button-next',
      prevEl: '.swiper-button-prev'
    },
    autoplay: {
      delay: 7000,
      disableOnInteraction: true // 쓸어 넘기거나 버튼 클릭 시 자동 슬라이드 정지.
    },
    loop: true
});

  // 데스크톱에서는 포커스가 빠진 경우 자동 슬라이드 재생.
$(".swiper-container").on("focusout", function(){
  setTimeout(function(){
    if( $(this).find(":focus").length === 0 ){
      mySwiper.autoplay.start();
      console.log("focusout, startAutoplay");
    }
  }, 7000);
});

  // 모바일에서는 화면을 움직이면 자동 슬라이드 기능 재생.
$(document).on("touchmove", function(){
	mySwiper.autoplay.start();
	console.log("touchmove, startAutoplay");
})



//키워드 리스트 만들기
function selectkeywordList(){
let keywordList = ["귀여운","즐거운","당당한",
"로맨틱한","가벼운","달콤한","사랑스러운",
"행복한","편안한","졸린","몽환적인","레트로한","고조된","부드러운","열정적인","섹시한",
"긴장한","터프한","블루지한","그루비한","슬픈","감성적인","무서운","침착한","무기력한","무거운",
"처참한","울적한","황폐한"];
let keywordValueList = ["cute","enjoy","confident",
"romantic","funky","light","sweet","lovely",
"happy","comfortable","sleepy","dreamy","retro","heighten","soft","enthusiastic","sexy",
"tense","tough","bluesy","groovy","sad","emotional","scary","careful","helpless","heavy",
"gruesome","depressed","desolate"];
let str ="";
	keywordList.forEach(function(item,index){
		 //console.log(item);
		str += "<div class='navdetailList selectKeywordTitle'>"+
					"<div>"+item+"</div>"+
					"<input type='checkbox' id="+keywordValueList[index]+" class='keywordCheckBox'/>"+
					"<label for="+keywordValueList[index]+" class='selectGenreToggle'>"+
						item
					+"</label>"+ 			
			  "</div>";
	
		
	});
$(".navSubKeywordContent").html(str);
}

selectkeywordList();



//album 옵션들 클릭시 해당 옵션만 slideDown
$(".albumOption").click(function(){
	let thx = $(this);
	if(thx.hasClass("navSubGenre")){//album-> Genre 클릭시
		thx = ".navSubGenre";
		let name = ".navSubGenreContent";
		slideUP_Down(thx,name);	
	}else if(thx.hasClass("navSubKeyword")){//album-> keyword 클릭시
		thx = ".navSubKeyword";
		let name = ".navSubKeywordContent";
		slideUP_Down(thx,name);
	}//가격, 악기는 아직 미적용
});
