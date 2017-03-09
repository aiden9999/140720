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
				<section class="diary_section">
					<div class="diary_list_wrap">
						<div class="list_top">
							<div class="list_no">No</div>
							<div class="list_title">Title / Day</div>
						</div>
						<div class="list">
							<c:forEach var="i" begin="1" end="10">
								<div class="diary_list" id="list${i }" onclick="view(${i})">
									<div class="list_no">${i }</div>
									<div class="list_title">${i }_title</div>
								</div>
							</c:forEach>
							<div class="page">
								<c:forEach var="i" begin="1" end="5">
									<div class="txt"><span>${i }</span></div>
								</c:forEach>
							</div>
						</div>
					</div>
					<div class="diary_view">
						<div class="view_title_wrap">
							<div class="view_title">제목입니당</div>
							<div class="view_day">2017.03.02</div>
						</div>
						<div class="view_content_wrap">
							<div class="view_content">내용내용내욘ㅁ이런마ㅣ얼미 ㄴ어라ㅣㅁ너 리ㅏ 너ㅣㅏ러니ㅏㄹ ㅓㅣㅏㅁ너 리ㅏㅁ너ㅣ라ㅓ ㅁ니ㅏㅇ 러ㅣ만어리ㅏ</div>
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
		// 글 클릭
		function view(num){
			for(var i=1; i<11; i++){
				$("#list"+i).removeClass(" sel");
			}
			$("#list"+num).addClass(" sel");
		}
	</script>

</html>