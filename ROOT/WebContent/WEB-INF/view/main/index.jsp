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
					<div class="slider">
						<div class="slider_inner">
							<div class="slide"></div>
						</div>
					</div>
				</section>
			</div>
		</div>
	</body>

	<script>
		
	</script>

</html>