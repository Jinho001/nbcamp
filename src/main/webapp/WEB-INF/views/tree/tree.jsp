<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script src="https://kit.fontawesome.com/d547fb2b9c.js"
	crossorigin="anonymous"></script>

<script
	src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>

<!-- --------------------------------------------------------------------------------------------- -->
<link rel="stylesheet" type="text/css" href="/resources/css/tree.css">

<div class="contentTree">
	<div id="align">
		<div class="title">
			<p><span>${userid}</span>  님, 반가워요!</p>
			<p style="font-weight: bold;">
				<span style="color: #538e67">5,500 포인트</span>를 쌓으면 배지 1개를 획득할 수 있어요.
				<br> 활동을 해서 나무를 성장시키고 배지를 모아 보세요!
			</p>
			<br>
		</div>
		<div class="point">
			<p>
				<span>총 포인트</span> &nbsp; ${score} point &nbsp; &nbsp; <span>현재
					포인트</span> &nbsp; ${userpoint} point
			</p>
		</div>
		<br>
		<div class="image-container">
			<div class="screen-bg">
				<img src="/images/home-screen-bg.png" id="screen-bg-img"> <img
					src="/images/tree1.png" class="overlay-image" id="treeImage">
			</div>
		</div>
		<div id="userInfo">
			<p id="level">Lv. ${level}
			<p>
			<div class="process">
				<progress class="treeprocess"
					value="${point / upPoint[level - 1] * 100}" max="100" id="lb"></progress>
			</div>
			<a id="percentage"><fmt:formatNumber
					value="${point / upPoint[level - 1] * 100}" pattern="0.00" />%
				(${point} / ${upPoint[level - 1]})</a> <br>
			<br>
			<table class="table">
				<tbody>
					<tr>
						<td>나의 배지</td>
						<td><a href="javascript:void(0);" id="mybadge-link" style="text-decoration: underline;">
						${reward}</a>개</td>
					</tr>
					<tr>
						<td>나의 랭킹</td>
						<td><a href="javascript:void(0);" onclick="openRankPage()"
						id="myrank-link" style="text-decoration: underline;">${rank}</a>위</td>
					</tr>
				</tbody>
			</table>
		</div>

		<br>
		<div id="mybadge-container" style="display: none;">
			<div id="badgeTable">
				<table border="1">
					<%
					int reward = Integer.parseInt(request.getAttribute("reward").toString());
					int totalBadges = reward;
					int rows = (totalBadges - 1) / 4 + 1; // 행 수 계산
					int cols = Math.min(totalBadges, 4); // 열 수 계산

					if (reward == 0) { // reward가 0이면 아직 배지가 없다는 메시지 출력
					%>
					<table border="0">
						<!-- border="0" 추가 -->
						<tr>
							<td colspan="4" style="text-align: center;">아직 배지가 없어요.
								제로웨이스트 활동을 통해 나무를 성장시켜 배지를 획득해 보세요! <br> <br> <img
								src="/images/zerowaste.png" width="500px">
							</td>
						</tr>
					</table>
					<%
					} else { // reward가 0이 아니면 배지 표시
					%>
					<%
					for (int i = 0; i < rows; i++) {
					%>
					<tr>
						<%
						for (int j = 0; j < cols; j++) {
							int badgeIndex = i * 4 + j + 1; // badge 인덱스 계산
							if (badgeIndex <= totalBadges) {
						%>
						<td>
							<div style="text-align: center;">
								<a href="#" class="image-link" onclick="openModal(event, '<%=badgeIndex%>')"> <img
									src="/images/badge<%=((badgeIndex - 1) % 12) + 1%>.jpg"
									width="100" height="100">
								</a> <br>
								<%=badgeIndex%>번째 배지
							</div>
						</td>
						<%
						} else {
						%>
						<td></td>
						<%
						}
						}
						%>
					</tr>
					<%
					} // end of for loop for rows
					} // end of else block for reward check
					%>
				</table>
			</div>
		</div>
		<br>
		<button id="activitybtn">활동하러 가기</button>
	</div>
</div>

<script>
    // 페이지 로드 시 실행되는 함수
    $(document).ready(function() {
        // 현재 level을 가져옵니다.
        var currentLevel = ${level};

        // 이미지를 변경하는 함수
        function updateTreeImage() {
            // 새로운 이미지 요소를 생성합니다.
            var newImage = $("<img>", {
                src: "/images/tree" + currentLevel + ".png", // 현재 level에 따른 이미지 경로를 설정합니다.
                class: "overlay-image"
            });

            // 이전 이미지 요소를 가져옵니다.
            var oldImage = $("#treeImage");

            // 이전 이미지 요소를 새로운 이미지 요소로 대체합니다.
            oldImage.replaceWith(newImage);
        }

        // level이 변경될 때마다 이미지를 업데이트합니다.
        $(document).on("change", "#level", function() {
            // 현재 level을 가져옵니다.
            currentLevel = $(this).val();
            // 이미지를 업데이트합니다.
            updateTreeImage();
        });

        // 페이지 로드 시 이미지 업데이트
        updateTreeImage();

        // "나의 배지" 링크 클릭 시 배지 표시/숨기기
        $("#mybadge-link").click(function() {
            var container = $("#mybadge-container");
            container.toggle();
        });
    });

    // 모달 열기
    function openModal(event, badgeIndex) {
        event.preventDefault(); // 기본 동작 방지

        var modal = document.getElementById("myModal");
        var modalImage = document.getElementById("modalImage");
        var congratsMessage = document.getElementById("congratsMessage");

        modal.style.display = "block";
        modalImage.src = "/images/badge" + ((badgeIndex - 1) % 12 + 1) + ".jpg";
        congratsMessage.innerHTML = "축하합니다! " + badgeIndex + "번째 배지를 획득하셨어요!";
        congratsMessage.style.color = "black";
        
        modalImage.style.width = "100%";
    }

    // 모달 닫기
    function closeModal() {
        var modal = document.getElementById("myModal");
        modal.style.display = "none";
    }

    // 모달 영역 외 클릭 시 모달 닫기
    window.onclick = function(event) {
        var modal = document.getElementById("myModal");
        if (event.target == modal) {
            modal.style.display = "none";
        }
    }
    
    function openRankPage() {
        // 새 창의 속성 설정
        var width = 800; // 창의 너비
        var height = 500; // 창의 높이
        var left = (screen.width - width) / 2; // 화면 가로 중앙 정렬
        var top = (screen.height - height) / 2; // 화면 세로 중앙 정렬
        var options = 'width=' + width + ',height=' + height + ',top=' + top + ',left=' + left;

        // 새 창 열기
        window.open('/user/myrank', '_blank', options);
    }
    
    document.getElementById("activitybtn").addEventListener("click", function() {
        window.location.href = "/actList";
    });
</script>

<!-- 모달 HTML 추가 -->
<div id="myModal" class="modal">
    <div class="modal-content">
        <span class="close" onclick="closeModal()">&times;</span>
        <img id="modalImage" src="" alt="배지 이미지">
        <p id="congratsMessage"></p>
    </div>
</div>

<style>
   
</style>