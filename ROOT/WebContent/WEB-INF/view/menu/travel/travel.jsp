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
							<c:choose>
								<c:when test="${diary.size() > 0 }">
									<div class="list_wrap" id="list_wrap">
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
									</div>
								</c:when>
								<c:otherwise>
									<div class="no_content">등록된 글이 없습니다.</div>
								</c:otherwise>
							</c:choose>
							<div class="page_wrap" id="page_wrap">
								<div class="page">
									<c:if test="${page > 0 }">
										<c:forEach var="i" begin="1" end="${page>5 ? 5 : page }">
											<div class="txt"><span onclick="page(${i})" id="page${i }">${i }</span></div>
										</c:forEach>
									</c:if>
								</div>
								<div class="page_arrow">
									<div class="arrow_left" onclick="prev(this)" id="prev1">이전</div>
									<div class="arrow_right" onclick="next(this)" id="next1">다음</div>
								</div>
							</div>
						</div>
					</div>
					<div class="diary_view">
						<div class="view_title_wrap">
							<div class="view_title" id="title_div">${view.title }</div>
							<div class="view_day" id="day_div">${view.day }</div>
							<div class="title_write hidden" id="title_div2">
								<div class="title_txt">제목 : </div>
								<input type="text" id="title" value="${view.title }" maxlength="35"/>
							</div>
						</div>
						<div class="view_content_wrap">
							<div class="view_content" id="content_div">${view.content }</div>
							<div class="view_content hidden" id="textarea_div">
								<textarea class="view_write" id="content">${view.content }</textarea>
							</div>
							<div class="btn_wrap">
								<c:if test="${diary.size() > 0 }">
									<c:if test="${login.id == view.id }">
										<div class="btn" id="modify"><span onclick="modify()">수정</span></div>
										<div class="btn" id="remove"><span onclick="remove()">삭제</span></div>
									</c:if>
								</c:if>
								<c:if test="${login != null }">
									<div class="btn" id="write"><span onclick="wri()" id="wri">쓰기</span></div>
									<div class="btn_hidden" id="cancel"><span onclick="cancel()">취소</span></div>
									<div class="btn_hidden" id="modify_save"><span onclick="modifySave()">저장</span></div>
									<div class="btn_hidden" id="write_save"><span onclick="writeSave()" id="wri_save">등록</span></div>
								</c:if>
							</div>
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
		var title = "${view.title }";
		var content = "${view.content }";
		var auto = "${view.auto }";
		// 페이지 ready시 글, 페이지 선택
		$(document).ready(function(){
			$("#list0").addClass(" sel");
			$("#page1").addClass("page_sel");
		});
		// 단축키
		$(document).ready(function(){
			$(document).keyup(function(e){
				if(e.ctrlKey && e.keyCode==32){
					$("#wri").trigger("click");
				}
				if(e.ctrlKey && e.keyCode==13){
					$("#wri_save").trigger("click");
				}
			});
		});
		// 페이지 이전, 다음 표시
		$(document).ready(function(){
			if(${page > 5}){
				$("#next1").css("display", "inline-block");
			}
		});
		// 글 클릭
		function view(num, num2){
			for(var i=0; i<10; i++){
				$("#list"+i).removeClass(" sel");
			}
			$("#list"+num).addClass(" sel");
			auto = num2;
			var title;
			var content;
			$.ajax({
				type : "post",
				url : "/diary/view/"+auto,
				async : false,
				success : function(txt){
					$("#title_div").html(txt.title);
					$("#day_div").html(txt.day);
					$("#content_div").html(txt.content);
				}
			});
		}
		// 글 수정
		function modify(){
			$("#content_div").hide();
			$("#textarea_div").show();
			$("#title_div").hide();
			$("#day_div").hide();
			$("#title_div2").show();
			$("#modify").hide();
			$("#remove").hide();
			$("#write").hide();
			$("#cancel").css("display", "inline-block");
			$("#modify_save").css("display", "inline-block");
		}
		// 글 수정 저장
		function modifySave(){
			var title = $("#title").val();
			var content = $("#content").val();
			$.ajax({
				type : "post",
				url : "/diary/modify/"+auto+"/"+title+"/"+content,
				async : false,
				success : function(txt){
					if(txt){
						alert("수정되었습니다.");
					} else {
						alert("수정에 실패하였습니다.\n잠시후 다시 시도해주세요.");
					}
					location.reload();
				}
			});
		}
		// 글 삭제
		function remove(){
			$("#popup1").show();
			$("#popup2").show();
			$("#remove_wrap").show();
		}
		// 취소
		function cancel(){
			$("#content_div").show();
			$("#textarea_div").hide();
			$("#title_div").css("display", "inline-block");
			$("#day_div").css("display", "inline-block");
			$("#title_div2").hide();
			$("#modify").css("display", "inline-block");
			$("#remove").css("display", "inline-block");
			$("#write").css("display", "inline-block");
			$("#cancel").hide();
			$("#modify_save").hide();
			$("#write_save").hide();
			$("#title").val(title);
			$("#content").val(content);
		}
		// 글 쓰기
		function wri(){
			$("#content_div").hide();
			$("#textarea_div").show();
			$("#title_div").hide();
			$("#day_div").hide();
			$("#title_div2").show();
			$("#modify").hide();
			$("#remove").hide();
			$("#write").hide();
			$("#cancel").css("display", "inline-block");
			$("#write_save").css("display", "inline-block");
			
			$("#title").val("");
			$("#content").val("");
			$("#title").focus();
		}
		// 글 쓰기 저장
		function writeSave(){
			var title = $("#title").val();
			var content = $("#content").val();
			$.ajax({
				type : "post",
				url : "/diary/write/"+title+"/"+content,
				async : false,
				success : function(txt){
					if(txt){
						alert("등록되었습니다.");
					} else {
						alert("등록에 실패하였습니다.\n잠시후 다시 시도해주세요.");
					}
					location.reload();
				}
			});
		}
		// 삭제-no
		function remove_no(){
			$("#popup1").hide();
			$("#popup2").hide();
			$("#remove_wrap").hide();
		}
		// 삭제-yes
		function remove_yes(){
			$.ajax({
				type : "post",
				url : "/diary/remove/"+auto,
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
		// 페이지 이동
		function page(num){
			for(var i="${start }"; i<="${end }"; i++){
				$("#page"+i).removeClass("page_sel");
			}
			$("#page"+num).addClass("page_sel");
			$.ajax({
				type : "post",
				url : "/diary/page/"+num,
				async : false,
				success : function(txt){
					$("#list_wrap").html(txt);
				}
			});
		}
		// 페이지 이전
		function prev(element){
			var num = element.id.substring(element.id.indexOf('v')+1);
			num = Number(num)-5;
			$.ajax({
				type : "post",
				url : "/diary/page/"+num+"/next",
				async : false,
				success : function(txt){
					$("#page_wrap").html(txt);
					page(num);
				}
			});
			$("#next"+(num+5)).prop("id", "next"+num);
			$("#prev"+(num+5)).prop("id", "next"+num);
		}
		// 페이지 다음
		function next(element){
			var num = element.id.substring(element.id.indexOf('t')+1);
			num = Number(num)+5;
			$.ajax({
				type : "post",
				url : "/diary/page/"+num+"/next",
				async : false,
				success : function(txt){
					$("#page_wrap").html(txt);
					page(num);
				}
			});
			$("#next"+(num-5)).prop("id", "next"+num);
			$("#prev"+(num-5)).prop("id", "next"+num);
		}
	</script>

</html>