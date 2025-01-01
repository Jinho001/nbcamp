<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<script>
$(document).ready(function () {
	
	document.getElementById("reportForm").addEventListener("submit", function (event) {

		event.preventDefault();
	
		var formData = new FormData(this);
		
		fetch("/activity/actReport", {
            method: "POST",
            body: formData
        })
        .then(function(response){
            return response.text();
        })
        .then(function(data){
        alert(data);
        window.opener.location.reload();
        window.close();
        })
        .catch(function(error) {
            console.error("Error:", error);
        });
	});	
});
</script>

<style>

#header, #footer {
	display: none;
}

#wrap {
	width: 500px; height : 600px;
	overflow: scroll;
}

#stsId {
    display: none;
}

.report-form-container {
    width: 80%;
    max-width: 500px;
    margin: auto;
    padding: 20px;
    background-color: #fff;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    border-radius: 8px;
    text-align: center;
    font-family: "KoPubWorldBatang";
}

.report-form-container form {
    display: flex;
    flex-direction: column;
    align-items: center;
    font-family: "KoPubWorldBatang";
}

.btn {
	background-color: #2E5A3C;
	color: white;
	border: none;
	padding: 10px 20px;
	width: 20vh;
	height: 10vh;
	font-size: 13px;
	cursor: pointer;
	border-radius: 5px;
	transition: background-color 0.3s ease;
	font-family: KoPubWorldBatang;
}

.btn:hover {
	background-color: #D4AF37;
}

#reason{
	background-color: transparent;
	border: none;
	padding: 8px 20px;
	font-size: 16px;
	cursor: pointer;
	outline: none;
	color: #2E5A3C;
	transition: color 0.3s ease;
	font-family: "KoPubWorldBatang";
}

.reportToggle button:hover {
	color: #666;
}
</style>
<div class="report-form-container">
<form id="reportForm" action="/activity/actReport" method="post">

	<input type = "hidden" id="stsId" name="stsId" value="${param.stsId}"><br>
	<h1>${data.actName}</h1>
	<strong>신고 대상 ${data.userid}</strong><br>
	<%-- <strong>시작 ${data.startDate}</strong><br>
	<strong>인증 ${data.endDate}</strong><br>--%>
		<strong>이미지 <img src="/resources/upload/${data.ctfcFilename}" width="200"></strong><br>
	<strong> 

	<select id = "reason" name = "reason" >
		<option value="">신고 사유 선택</option>
		<option value="관련없는사진">관련 없는 사진</option>
		<option value="사진재사용">사진 반복 사용</option>
		<option value="이미지도용">이미지 도용</option>
		<option value="기타">기타</option>
	</select></strong><br>
	<button type="submit" class="btn">신고하기</button>
</form>
</div>