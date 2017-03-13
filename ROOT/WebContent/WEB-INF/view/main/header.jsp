<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="header_inner">
	<div class="header_logo" onclick="location.href='/index'">
		<img src="/img/logo.png"/>
	</div>
	<nav class="header_gnb">
		<ul>
			<li class="gnb">
				<span>Culture</span>
			</li>
			<li class="gnb" onclick="location.href='/travel'">
				<span>Travel</span>
			</li>
			<li class="gnb">
				<span>Play</span>
			</li>
			<li class="gnb">
				<span>Picture</span>
			</li>
			<li class="gnb" onclick="location.href='/diary'">
				<span>Diary</span>
			</li>
		</ul>
	</nav>
</div>