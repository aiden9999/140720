<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
	<head>
		<c:import url="/WEB-INF/view/main/head.jsp"/>
	</head>
	
	<body>
		<div class="intro_wrap">
			<div class="intro_txt">
				<div class="intro_inner">
					<div class="intro_main" onclick="location.href='/index'">
						<img src="/img/logo.png"/>
					</div>
					<div class="intro_people">
						<img src="/img/intro_people.png"/>
					</div>
					<div class="intro_d_day">
						<label>만난지</label><br>
						<font id="day"></font>일<br>
						<font id="hour"></font>시간&nbsp;
						<font id="minute"></font>분&nbsp;
						<font id="second"></font>초<br>
					</div>
				</div>
			</div>
			<div class="intro_picture"></div>
		</div>
	</body>

	<script>
		
	</script>

</html>