<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="page">
	<c:if test="${page > 0 }">
		<c:forEach var="i" begin="${start }" end="${end>page ? page : end }">
			<div class="txt"><span onclick="page(${i})" id="page${i }">${i }</span></div>
		</c:forEach>
	</c:if>
</div>
<div class="page_arrow">
	<div class="arrow_left" onclick="prev(this)" id="prev${start }">이전</div>
	<div class="arrow_right" onclick="next(this)" id="next${start }">다음</div>
</div>

<script>
	//페이지 이전, 다음 표시
	$(document).ready(function(){
		if(${start > 5}){
			$("#prev"+${start }).css("display", "inline-block");
		} else {
			$("#prev"+${start }).hide();
		}
		if(${page > end}){
			$("#next"+${start }).css("display", "inline-block");
		} else {
			$("#next"+${start }).hide();
		}
	});
</script>