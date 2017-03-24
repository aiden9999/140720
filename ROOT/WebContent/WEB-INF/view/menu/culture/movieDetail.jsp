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
				<section class="movie_section">
					<div class="movie_list_wrap">
						<div class="list">
							<div class="list_wrap">
								<div class="movie_wrap">
									<div class="movie_title">제목</div>
									<div class="movie_content">${movie.movieNm }</div>
								</div>
								<div class="movie_wrap">
									<div class="movie_title">개봉일</div>
									<div class="movie_content">${movie.openDt.substring(0, 4) }년 ${movie.openDt.substring(5, 6) }월 ${movie.openDt.substring(7, 8) }일</div>
								</div>
								<div class="movie_wrap">
									<div class="movie_title">상영시간</div>
									<div class="movie_content">${movie.showTm }분</div>
								</div>
								<div class="movie_wrap">
									<div class="movie_title">장르</div>
									<div class="movie_content">
										<c:forEach var="t" items="${movie.genres }">
											${t.genreNm }
										</c:forEach>
									</div>
								</div>
								<div class="movie_wrap">
									<div class="movie_title">등급</div>
									<div class="movie_content">${movie.audits[0].watchGradeNm }</div>
								</div>
								<div class="movie_wrap">
									<div class="movie_title">감독</div>
									<div class="movie_content">${movie.directors[0].peopleNm }</div>
								</div>
								<div class="movie_wrap">
									<div class="movie_title">배우</div>
									<div class="movie_content">
										<c:set var="actor" value="${movie.actors.size() >= 3 ? 3 : movie.actors.size() }"/>
										<c:forEach var="t" begin="0" end="${actor }">
											<c:choose>
												<c:when test="${t == actor }">
													${movie.actors[t].peopleNm }
												</c:when>
												<c:when test="${t == 1 }">
													${movie.actors[t].peopleNm }&nbsp;/<br>
												</c:when>
												<c:otherwise>
													${movie.actors[t].peopleNm }&nbsp;/
												</c:otherwise>
											</c:choose>
										</c:forEach>
									</div>
								</div>
								<div class="movie_wrap">
									<div class="movie_title">배급사</div>
									<div class="movie_content">${movie.companys[0].companyNm }</div>
								</div>
							</div>
						</div>
					</div>
					<div class="movie_view">
						<div class="view_content_wrap">
<%-- 							<div class="view_poster" style="background-image: url('/img/movie/${num}.gif')"></div> --%>
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