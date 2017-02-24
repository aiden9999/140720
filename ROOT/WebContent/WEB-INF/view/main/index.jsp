<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
	<head>
		<title>140720</title>
		<meta charset="utf-8">
        <link rel="stylesheet" href="/css/style.css" type="text/css">
        <link href="http://fonts.googleapis.com/earlyaccess/nanumgothic.css" rel='stylesheet' type='text/css'>
        <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0" />
        <meta name="robots" content="follow">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
        <script src="/js/common.js"></script>
	</head>
	
	<body>
		<header>
			<c:import url="/WEB-INF/view/main/header.jsp"/>
		</header>
		<div class="main">
			<div class="main_inner">
				<section class="section1">
					<div class="banner">
						<div class="banner_people">
							<img src="/img/main_people.png"/>
						</div>
						<div class="banner_d_day">
							<label>만난지</label>&nbsp;
							<font id="day"></font>일&nbsp;
							<font id="hour"></font>시간&nbsp;
							<font id="minute"></font>분&nbsp;
							<font id="second"></font>초
						</div>
					</div>
					<div class="main_login">
						<div class="txt">ID</div>
						<input type="text" id="id" maxlength="12"/>
						<div class="txt">PW</div>
						<input type="password" id="pw" maxlength="16"/>
						<div class="btn">JOIN</div>
						<div class="btn">LOGIN</div>
					</div>
				</section>
				<section class="section2">
					<div class="middle">
						<div class="slider">
							<div class="slider_inner">
								<div class="slide">
									<img src="/img/slide_1.png"/>
								</div>
								<div class="slide">
									<img src="/img/slide_2.png"/>
								</div>
								<div class="slide">
									<img src="/img/slide_3.png"/>
								</div>
							</div>
							<div class="arrow_wrap">
								<div class="arrow_left">
									<img src="/img/arrow_left.png"/>
								</div>
								<div class="arrow_right">
									<img src="/img/arrow_right.png"/>
								</div>
							</div>
						</div>
					</div>
					<div class="side">
						<div class="movie">
							<div class="title">Movie</div>
							<div class="txt">
								1. 더킹<br>
								2. 더킹<br>
								3. 더킹<br>
								4. 더킹<br>
								5. 더킹<br>
								6. 더킹<br>
								7. 더킹<br>
								8. 더킹<br>
								9. 더킹<br>
								10. 더킹
							</div>
						</div>
						<div class="theater">
							<div class="title">Theater</div>
							<div class="txt">
								1. 더킹<br>
								2. 더킹<br>
								3. 더킹<br>
								4. 더킹<br>
								5. 더킹<br>
								6. 더킹<br>
								7. 더킹<br>
								8. 더킹<br>
								9. 더킹<br>
								10. 더킹
							</div>
						</div>
					</div>
					<div class="bottom">
						<div class="tab1">
							<div class="title">
								<div class="title_txt">tab1</div>
							</div>
							<div class="content">
								<c:forEach var="i" begin="1" end="10">
									<div class=txt_wrap>
										<div class="dot"></div>
										<div class="content_txt">content${i }</div>
									</div>
								</c:forEach>
							</div>
						</div>
						<div class="tab2">
							<div class="title">
								<div class="title_txt">tab2</div>
							</div>
							<div class="content">
								<div class="no_content">등록된 글이 없습니다.</div>
							</div>
						</div>
						<div class="tab3">
							<div class="title">
								<div class="title_txt">tab3</div>
							</div>
							<div class="content">
								<c:forEach var="i" begin="1" end="10">
									<div class=txt_wrap>
										<div class="dot"></div>
										<div class="content_txt">content${i }</div>
									</div>
								</c:forEach>
							</div>
						</div>
					</div>
				</section>
				<section class="section3">
					<div class="calendar">
						<div class="side">
							<div class="txt">Schedule</div>
							<div class="img">
								<img src="/img/calendar.png"/>
							</div>
						</div>
						<div class="data">
							<div class="data_top">
								<div class="arrow_wrap">
									<div class="arrow_left">
										<img src="/img/arrow_left.png"/>
									</div>
									<div class="arrow_right">
										<img src="/img/arrow_right.png"/>
									</div>
									<div class="month">12월</div>
								</div>
							</div>
							<div class="data_box"></div>
						</div>
					</div>
				</section>
			</div>
		</div>
		<footer>
			<c:import url="/WEB-INF/view/main/footer.jsp"/>
		</footer>
	</body>

	<script>
		var eMonth;
		$(document).ready(function(){
			eMonth = new Array("January", "Febuary", "March", "April", "May", "June", "July", "August", "September" ,"October", "November", "December");
			var date = new Date();
			var year = date.getFullYear();
			var month = date.getMonth();
			$("#year").html(year);
			$("#month").html(month+1);
			$("#eMonth").html(eMonth[month]);
			calendar(year, month);
		});
		
		// 달력
		function calendar(getYear, getMonth){
			var calendar = new Date(getYear, getMonth);		// Date 객체 생성
			var day_of_week = new Array("일", "월", "화", "수", "목", "금", "토");
			var month_of_year = new Array("1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월");
			var year = calendar.getYear();	// yyyy
			var month = calendar.getMonth();		// 0~11(1월~12월)
			var today = calendar.getDate();		// 1~31(1일~31일)
			var week = calendar.getDay();		// 0~6(일요일~토요일)
			
			calendar.setDate(1);		// 1일부터 셋팅
			
			var days_of_week = 7;		// 일주일 7일 셋팅
			var days_of_month = 31;		// 한달 최대 31일 셋팅
			var html;		// html 소스 변수
			
			var tr_start = "<tr>";
			var tr_end = "</tr>";
			
			var td_blank = "<td>";		// 빈칸
			var td_day = "<td><span>"		// 평일
			var td_saterday = "<td><span class='txt1'>";		// 토요일
			var td_sunday = "<td><span class='txt2'>";		// 일요일
			var td_day_end = "</span></td>";		// 평일, 토요일, 일요일 끝
			var td_end = "</td>";		// 빈칸 끝
			
			// 왼쪽 이미지 셋팅
			html = tr_start+"<th rowspan='6'><div class='tit_wrap'><div class='txt'><span class='txt1'>2017</span><br>입시일정</div>";
			html += "<div class='img'><img src='/img/sub02/sub02_03/calendar.png'></div></div></th>";
			// 빈칸 설정
			for(var i=0; i<calendar.getDay(); i++){
				html += td_blank+td_end;
			}
			
			// 1일부터 시작
			for(var i=0; i<days_of_month; i++){
				// 날짜가 1보다 작을때만 셋팅 -> 1보다 작으면 다음달로 넘어가서 1일로 변환된거
				if(calendar.getDate()>i){
					var day = calendar.getDate();		// 날짜
					var week_day = calendar.getDay();		// 요일
					
					// 일요일일 경우 열 변경
					if(week_day==0){
						html += tr_start;
					}
					
					switch(week_day){
					case 0:		// 일요일
						html += td_sunday+day+td_day_end;
						break;
					case 6:		// 토요일
						html += td_saterday+day+td_day_end;
						html += tr_end;
						break;
						default:	// 평일
							html += td_day+day+td_day_end;
							break;
					}
				}
				
				// 다음 날짜로 넘어감
				calendar.setDate(calendar.getDate()+1);
			}
			
			html += tr_end;
			
			$("#data_box").html(html);
		}
		// 이전 달
		function prev(){
			var year = $("#year").html();
			var month = $("#month").html();
			if(month==1){
				year --;
	    		calendar(year, 12);
	    		$("#year").html(year);
	    		$("#month").html(12);
	    		$("#eMonth").html(eMonth[11]);
			} else {
				calendar(year, month-1);
				$("#year").html(year);
				$("#month").html(Number(month)-1);
				$("#eMonth").html(eMonth[Number(month)-2]);
			}
		}
		// 다음 달
		function next(){
			var year = $("#year").html();
			var month = $("#month").html();
			if(month==12){
				year ++;
				calendar(year, 1);
				$("#year").html(year);
				$("#month").html(1);
				$("#eMonth").html(eMonth[0]);
			} else {
				calendar(year, month+1);
				$("#year").html(year);
				$("#month").html(Number(month)+1);
				$("#eMonth").html(eMonth[Number(month)]);
			}
		}
		// 오늘로
		function today(){
			var date = new Date();
			var year = date.getFullYear();
			var month = date.getMonth();
			calendar(year, month);
			$("#year").html(year);
			$("#month").html(month+1);
			$("#eMonth").html(eMonth[Number(month)]);
		}
	</script>

</html>