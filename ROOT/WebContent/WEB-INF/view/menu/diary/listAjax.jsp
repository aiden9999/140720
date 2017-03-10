<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:forEach var="t" begin="0" end="${diary.size()-1 }">
	<div class="diary_list" id="list${t }" onclick="view(${t}, ${diary.get(t).auto })">
		<div class="list_no">${diary.get(t).auto }</div>
		<c:choose>
			<c:when test="${diary.get(t).title.length() > 9 }">
				<div class="list_title">${diary.get(t).title.substring(0, 9) }...&nbsp;<span class="day">/ ${diary.get(t).day }</span></div>
			</c:when>
			<c:otherwise>
				<div class="list_title">${diary.get(t).title }&nbsp;<span class="day">/ ${diary.get(t).day }</span></div>
			</c:otherwise>
		</c:choose>
	</div>
</c:forEach>