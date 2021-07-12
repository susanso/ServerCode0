/**
 * 
 */
var test = 3;
function test123(test){
	let good = test+test;
	return good;
}
console.log("test 값 : "+test);

let test1234 = test123(test);

console.log("test1234 값 : "+test1234);


//play list 기본 값
function playListDefault(){
	let playListDefault =["무드","잠에 들 시간입니다","음악으로 집안을 가득 채우세요","집중","최신 인기 음악","어디선가 들어본 음악","어깨가 들썩이는 음악"];
	let c = playListDefault.length;
	let str = "";
	for(let i = 0; i<c;i++){
		str += "<div>";
	}
	return str;
}
