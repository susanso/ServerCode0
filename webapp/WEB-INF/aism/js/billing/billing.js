/**
 * 
 */

AOS.init();

$(".price_buy_btn").click(function(){
	let thx = $(".buy_promotion_box");
	thx.css("display","grid");
	let offset =thx.offset();
	console.log(offset);
    $('html').animate({scrollTop : offset.top}, 400);
})