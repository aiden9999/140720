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
		
	</script>

</html>