<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
	<head>
		<c:import url="/WEB-INF/view/main/head.jsp"/>
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
					<c:choose>
						<c:when test="${login == null }">
							<div class="main_login">
								<div class="txt">ID</div>
								<input type="text" id="id" maxlength="12"/>
								<div class="txt">PW</div>
								<input type="password" id="pw" maxlength="16"/>
								<div class="loginFail" id="loginFail">아이디 / 비밀번호를 확인해주세요.</div>
								<div class="btn">회원가입</div>
								<div class="btn" onclick="login()">로그인</div>
							</div>
						</c:when>
						<c:otherwise>
							<div class="main_logon">
								<div class="txt">${login.nick } 님 안녕하세요.</div>
								<div class="btn">내정보</div>
								<div class="btn" onclick="location.href='/logout'">로그아웃</div>
							</div>
						</c:otherwise>
					</c:choose>
				</section>
				<section class="section2">
					<div class="middle">
						<div class="slider">
							<div class="slider_inner">
								<div class="slide" id="slide1" style="background-image: url('/img/slide_1.png')">
								</div>
								<div class="slide" id="slide2" style="background-image: url('/img/slide_2.png')">
								</div>
								<div class="slide" id="slide3" style="background-image: url('/img/slide_3.png')">
								</div>
							</div>
						</div>
					</div>
					<div class="side">
						<div class="movie">
							<div class="title">Movie</div>
							<div class="txt">
								<c:forEach var="t" items="${movie }">
									<c:choose>
										<c:when test="${t.movieNm.length() > 10 }">
											<span onclick="movie(${t.movieCd}, ${t.rnum })">${t.rnum }.&nbsp;${t.movieNm.substring(0, 10) }...</span>
										</c:when>
										<c:otherwise>
											<span onclick="movie(${t.movieCd}, ${t.rnum })">${t.rnum }.&nbsp;${t.movieNm }</span>
										</c:otherwise>
									</c:choose>
								</c:forEach>
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
					<div class="calendar" align="center">
						<div class="side">
							<div class="txt">Schedule</div>
							<div class="img">
								<img src="/img/calendar.png"/>
							</div>
						</div>
						<div class="data">
							<div class="data_top">
								<div class="arrow_wrap">
									<div class="arrow_left" onclick="prev()">
										<img src="/img/arrow_left.png"/>
									</div>
									<div class="arrow_right" onclick="next()">
										<img src="/img/arrow_right.png"/>
									</div>
									<div class="month" id="yearMonth"></div>
									<div class="today" onclick="today()">오늘로</div>
								</div>
							</div>
							<div class="data_box"><table class="calendar_table" id="calendar"></table></div>
						</div>
					</div>
				</section>
			</div>
		</div>
		<footer>
			<c:import url="/WEB-INF/view/main/footer.jsp"/>
		</footer>
		<div class="popup_back" id="popup1"></div>
		<div class="popup_front" id="popup2">
			<div class="txt_wrap" id="txt_wrap">
				<div class="txt_day" id="popup_day"></div>
				<div class="txt_schedule">
					<div class="txt" id="popup_schedule"></div>
					<input type="text" id="popup_input" maxlength="25"/>
				</div>
			</div>
			<div class="btn_wrap" id="btn_wrap">
				<c:if test="${login != null }">
					<div class="btn" id="add"><span onclick="add_schedule()">추가</span></div>
					<div class="btn btn_hidden" id="cancel"><span onclick="cancel_schedule()">취소</span></div>
					<div class="btn" id="remove"><span onclick="remove_schedule()">삭제</span></div>
					<div class="btn btn_hidden" id="save"><span onclick="save_schedule()">저장</span></div>
				</c:if>
				<div class="btn" id="closeBtn"><span onclick="close_popup()">닫기</span></div>
			</div>
			<div class="remove_wrap" id="remove_wrap">
				<div class="txt_wrap">
					<div class="remove_txt">삭제하시겠습니까?</div>
					<div class="btn"><span onclick="remove_no()">아니오</span></div>
					<div class="btn"><span onclick="remove_yes()">네</span></div>
				</div>
			</div>
		</div>
	</body>

	<script>
		var eMonth;
		var schedule;
		$(document).ready(function(){
			eMonth = new Array("January", "Febuary", "March", "April", "May", "June", "July", "August", "September" ,"October", "November", "December");
			var date = new Date();
			var year = date.getFullYear();
			var month = date.getMonth();
			$("#yearMonth").html(year+"년 "+(month+1)+"월");
			$("#eMonth").html(eMonth[month]);
			calendar(year, month);
			setTimeout(slide, 3000);
			$("#slide2").hide();
			$("#slide3").hide();
		});
		// slide
		var sn = 1;
		function slide(){
			if(sn==3){
				$("#slide"+sn).fadeOut(1500);
				$("#slide1").fadeIn(1500);
				sn = 1;
			} else {
				$("#slide"+sn).fadeOut(1500);
				$("#slide"+(sn+1)).fadeIn(1500);
				sn++;
			}
			setTimeout(slide, 3000);
		}
		// 로그인
		function login(){
			var id = $("#id").val();
			var pw = $("#pw").val();
			$.ajax({
				type : "post",
				url : "/login/"+id+"/"+pw,
				async : false,
				success : function(txt){
					if(txt){
						location.href="/index";
					} else {
						$("#loginFail").show();
					}
				}
			});
		}
		// 비밀번호 창에서 엔터
		$("#pw").keyup(function(evt){
			if(evt.keyCode==13){
				login();
			}
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
			var td_day = "<td class='day'><div>"		// 평일
			var td_saterday = "<td class='day'><div class='txt1'>";		// 토요일
			var td_sunday = "<td class='day'><div class='txt2'>";		// 일요일
			var td_day_end = "</div>";		// 평일, 토요일, 일요일 끝
			var td_end = "</td>";		// 빈칸 끝
			
			// 왼쪽 이미지 셋팅
			html = tr_start;
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
						html += td_sunday+day+td_day_end+"<div class='schedule_txt' id='day"+i+"'></div>"+td_end;
						break;
					case 6:		// 토요일
						html += td_saterday+day+td_day_end+"<div class='schedule_txt' id='day"+i+"'></div>"+td_end;
						html += tr_end;
						break;
					default:	// 평일
						html += td_day+day+td_day_end+"<div class='schedule_txt' id='day"+i+"'></div>"+td_end;
						break;
					}
				}
				
				// 다음 날짜로 넘어감
				calendar.setDate(calendar.getDate()+1);
			}
			
			html += tr_end;
			
			$("#calendar").html(html);
			setSchedule((Number(getMonth)+1));
		}
		// 스케줄 셋팅
		function setSchedule(month){
			$.ajax({
    			type : "post",
    			url : "/schedule/schedule/"+month,
    			async : false,
    			success : function(txt){
    				schedule = txt;
    			}
    		});
    		for(var i=0; i<schedule.length; i++){
    			var day = schedule[i].day;
    			day = day.substring(day.indexOf('월')+2, day.indexOf('일'));
    			var sch = schedule[i].schedule;
    			if(sch.length>6){
    				sch = sch.substring(0, 5)+"...";
    			}
    			$("#day"+(Number(day)-1)).append("<div class='txt' onclick='view("+i+")'>"+sch+"</div>");
    		}
		}
		// 이전 달
		function prev(){
			var yearMonth = $("#yearMonth").html();
			var year = yearMonth.substring(0, yearMonth.indexOf('년'));
			var month = yearMonth.substring(yearMonth.indexOf('년')+2, yearMonth.indexOf('월'));
			if(month==1){
				year --;
	    		calendar(year, 11);
	    		$("#yearMonth").html(year+"년 12월");
	    		$("#eMonth").html(eMonth[11]);
			} else {
				calendar(year, month-2);
				$("#yearMonth").html(year+"년 "+(Number(month)-1)+"월");
				$("#eMonth").html(eMonth[Number(month)-2]);
			}
		}
		// 다음 달
		function next(){
			var yearMonth = $("#yearMonth").html();
			var year = yearMonth.substring(0, yearMonth.indexOf('년'));
			var month = yearMonth.substring(yearMonth.indexOf('년')+2, yearMonth.indexOf('월'));
			if(month==12){
				year ++;
				calendar(year, 0);
				$("#yearMonth").html(year+"년 1월");
				$("#eMonth").html(eMonth[0]);
			} else {
				calendar(year, month);
				$("#yearMonth").html(year+"년 "+(Number(month)+1)+"월");
				$("#eMonth").html(eMonth[Number(month)]);
			}
		}
		// 오늘로
		function today(){
			var date = new Date();
			var year = date.getFullYear();
			var month = date.getMonth();
			calendar(year, month);
			$("#yearMonth").html(year+"년 "+(month+1)+"월");
			$("#eMonth").html(eMonth[Number(month)]);
		}
		// 스케줄 팝업
		function view(num){
			var day = schedule[num].day;
			var sch = schedule[num].schedule;
			$("#popup1").show();
			$("#popup2").show();
			$("body").css("overflow", "hidden");
			$("#popup_day").html(day);
			$("#popup_schedule").html(sch);
		}
		// 팝업 닫기
		function close_popup(){
			$('#popup1').hide();
			$('#popup2').hide();
			$('body').css('overflow', 'auto');
			$('#popup_schedule').show();
			$('#popup_input').hide();
			$('#popup_input').val("");
			$("#add").css("display", "inline-block");
			$("#cancel").hide();
			$("#remove").css("display", "inline-block");
			$("#save").hide();
		}
		// 스케줄 추가
		function add_schedule(){
			$('#popup_schedule').hide();
			$('#popup_input').show();
			$("#add").hide();
			$("#cancel").css("display", "inline-block");
			$("#remove").hide();
			$("#save").css("display", "inline-block");
			$("#closeBtn").hide();
		}
		// 스케줄 추가 저장
		function save_schedule(){
			var day = $("#popup_day").html();
			var schedule = $("#popup_input").val();
			if(schedule.length==0){
				alert("스케줄을 작성해주세요.");
			} else {
				$.ajax({
					type : "post",
					url : "/schedule/add/"+day+"/"+schedule,
					async : false,
					success : function(num){
						if(num==0){
							alert("추가되었습니다.");
							location.reload();
						} else if(num==1){
							alert("이미 스케줄이 있는 날짜입니다.\n변경하시겠습니까?");
						} else {
							alert("저장에 실패하였습니다.\n잠시후 다시 시도해주세요.");
						}
					}
				});
			}
		}
		// 스케줄 추가 취소
		function cancel_schedule(){
			$("#popup_schedule").css("display", "inline-block");
			$("#popup_input").hide();
			$("#add").css("display", "inline-block");
			$("#cancel").hide();
			$("#remove").css("display", "inline-block");
			$("#save").hide();
			$("#closeBtn").css("display", "inline-block");
		}
		// 스케줄 삭제
		function remove_schedule(){
			$("#remove_wrap").show();
			$("#txt_wrap").hide();
			$("#btn_wrap").hide();
		}
		// 삭제-아니오
		function remove_no(){
			$("#remove_wrap").hide();
			$("#txt_wrap").show();
			$("#btn_wrap").show();
		}
		// 삭제-예
		function remove_yes(){
			var day = $("#popup_day").html();
			var sch = $("#popup_schedule").html();
			$.ajax({
				type : "post",
				url : "/schedule/remove/"+day+"/"+sch,
				async : false,
				success : function(txt){
					if(txt){
						alert("삭제되었습니다.");
					} else {
						alert("삭제에 실패하였습니다.\n잠시후 다시 시도해주세요.");
					}
					location.reload();
				}
			});
		}
		// 영화 정보
		function movie(movieCd, num){
			location.href="/movie/"+movieCd+"/"+num;
		}
	</script>

</html>