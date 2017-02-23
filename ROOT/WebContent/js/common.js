// 디데이
$(document).ready( function() {
	setViewTime = function (){ //함수로 만들어 준다.
		//아래 부분 입력창에서 가져오지 않고 그냥 셋팅해도 된다.
		var getYear = 2014;
		var getMonth = 07;
		var getDay = 20;
        
		var dat1 = new Date(); //현재날짜
		var dat2 = new Date(getYear, getMonth-1, getDay); //월에서 1 빼줘야 함
    
		var diff = dat2 - dat1; //날짜 빼기
        
		var currSec = 1000; // 밀리세컨
		var currMin = 60 * 1000; // 초 * 밀리세컨
		var currHour = 60 * 60 * 1000; // 분 * 초 * 밀리세컨
		var currDay = 24 * 60 * 60 * 1000; // 시 * 분 * 초 * 밀리세컨
        
		var day = parseInt(diff/currDay); //d-day 일
		var hour = parseInt(diff/currHour); //d-day 시
		var min = parseInt(diff/currMin); //d-day 분
		var sec = parseInt(diff/currSec); //d-day 초
        
		var viewHour = (day*24)-hour;
		var viewMin = (hour*60)-min;
		var viewSec = (min*60)-sec;
        
		//시분초 말고 일까지만 보여주면 day만 노출하면 된다.
		var viewStr = day+"일 "+viewHour+"시 "+viewMin+"분 "+viewSec+"초";
		$("#day").html(-day+1);
		$("#hour").html(viewHour);
		$("#minute").html(viewMin);
		$("#second").html(viewSec);
	}
	setInterval('setViewTime()',1000);
});