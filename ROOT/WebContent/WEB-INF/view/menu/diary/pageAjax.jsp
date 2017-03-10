<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:if test="${page > 0 }">
	<c:forEach var="i" begin="${start }" end="${end }">
		<div class="txt"><span onclick="page(${i})" id="page${i }">${i }</span></div>
	</c:forEach>
</c:if>