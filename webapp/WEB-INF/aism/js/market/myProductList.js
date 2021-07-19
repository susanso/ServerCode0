/**
 * 
 */


var albumImg = ["babyShark.jpg","B-DAY.jpg","children01.jpg",
"emoHiphop.jpg","fire.jpg","idea.jpg","iffy.jpg","indigo.jpg",
"money.jpg","take.jpg"];
var maindisplay = "";
for(var i =0 ;i<albumImg.length;i++){
	maindisplay += "<div class='sellCardContainer'>"+
						"<div class='albumImg' style='background: url(../../image/album_cover/"+albumImg[i]+") 0% 0% / cover'></div>"+	
						"<div class='defaultInfo'>"+
							"<div class='sellerInfo'>"+
								"<div class='songTitle'>asdkmasu main</div>"+
								"<div class='sellerName'>susansok</div>"+
							"</div>"+
							"<div class='downInfo'>"+
								"<div class='downCount'>2,347 Listen</div>"+
								"<div class='sellerPrice'>2,900 ₩</div>	"+
						"</div>"+
						"</div>"+
					"<div class='reSetting'>수정</div>"+
					"</div>";
}
$(".myList").html(maindisplay);