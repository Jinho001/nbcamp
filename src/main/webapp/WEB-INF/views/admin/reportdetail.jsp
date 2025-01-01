<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<meta charset="UTF-8">
<link rel="stylesheet" href="/resources/css/commit.css">
<style type="text/css">
body {
	margin: 0;
	padding: 0;
	text-align: center;
	overflow-y: auto;
}

body::-webkit-scrollbar {
	display: none;
}

.container {
	width: 90%;
	margin: 8% auto 4%;
	padding: 20px;
	font-size: 18px;
	text-align: center;
}

.allreport {
	width: 80%;
	height: auto;
	margin: 0 auto;
	padding: 20px;
	border-radius: 8px;
	background-color: #fff;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.2);
	display: flex;
	flex-direction: column;
	align-items: center;
	max-height: 80vh;
	overflow-y: auto;
}

.allreport ::-webkit-scrollbar {
	display: none;
}

table {
	width: 60%;
	border-collapse: collapse;
	height: auto;
	padding: 8px;
}

td, th {
	padding: 5px;
	text-align: center;
}

.actions {
	text-align: center;
	margin-top: 20px;
}

select, button {
	margin-left: 10px;
	padding: 8px 12px;
	border: none;
	border-radius: 4px;
	background-color: #007bff;
	color: #fff;
	cursor: pointer;
}

select {
	background-color: #f0f0f0;
	color: #333;
}

img {
	display: block;
	margin-top: 10px;
	max-width: 30vh;
	height: auto;
	border-radius: 4px;
	box-shadow: 0 0 5px rgba(0, 0, 0, 0.2);
}

.actions a {
	display: inline-block;
	margin-top: 20px;
	color: #007bff;
	text-decoration: none;
}

.actions a:hover {
	text-decoration: underline;
}

strong {
	font-size: 18px;
}

.post p {
	white-space: nowrap;
	overflow: hidden;
}

.post strong {
	display: inline;
	margin-bottom: 8px;
	font-weight: bold;
}

.centered-image {
	text-align: center;
}

.centered-image img {
	display: inline-block;
	margin: 0 auto;
}

.actions {
	text-align: center;
	margin-top: 20px;
}

.actions form {
	display: inline-block;
	white-space: nowrap;
}

select, button {
	display: inline-block;
	vertical-align: middle;
	margin: 0 3px;
	padding: 8px 12px;
	border: none;
	border-radius: 4px;
	cursor: pointer;
}

select {
	background-color: #f0f0f0;
	color: #333;
}

button {
	background-color: #007bff;
	color: #fff;
}

.custom-select {
	position: relative;
	display: inline-block;
	width: 5vw;
	height: 40px;
	margin: auto;
	text-align: center;
	border-radius: 8px;
	font-family: "KoPubWorldBatang";
}

.custom-select select {
	display: none;
}

.custom-select::after {
	content: '\25BC';
	position: absolute;
	top: 50%;
	right: 8px;
	transform: translateY(-50%);
	color: gray;
}

.custom-select select {
    background-color: transparent;
    border: 1px solid #ccc;
    border-radius: 5px;
    appearance: none;
    -webkit-appearance: none;
    padding: 8px;
    font-size: 12px;
    width: 100%;
    height: 100%;
    text-align-last: center;
    color: gray;
    -webkit-backface-visibility: hidden;
    backface-visibility: hidden;
}

.custom-select select:focus {
	outline: none;
}

.btn-save {
	background-color: #2E5A3C;
	color: white;
	border-radius: 10px;
	cursor: pointer;
	height: 40px;
	width: 5vw;
	padding: 8px 12px;
	transition: background-color 0.3s ease;
	font-family: "KoPubWorldBatang";
	text-align: center;
	border: none;
}

.btn-save:hover {
	background-color: #487b48;
}

#back {
	color: #2E5A3C;
}
</style>
<script>
	
</script>
<title>신고 상세 정보</title>
<div class="container">
	<div class="allreport">
		<table class="post">
			<tr>
				<th colspan="2" style="font-size: 20px;">신고 내역</th>
			<tr>
				<td><strong>활동 이름</strong></td>
				<td>${report.actName}</td>
			</tr>
			<tr>
				<td><strong>신고 유저</strong></td>
				<td>${report.reporter}</td>
			</tr>
			<tr>
				<td><strong>인증 유저</strong></td>
				<td>${report.userid}</td>
			</tr>
			<tr>
				<td><strong>신고 사유</strong></td>
				<td>${report.reason}</td>
			</tr>
			<tr>
				<td><strong>신고 일자 </strong></td>
				<td>${report.sdate}</td>
			</tr>
			<tr>
				<td><strong>처리 일자 </strong></td>
				<td>${report.edate}</td>
			</tr>
			<tr>
				<td><strong>활동 상태 </strong></td>
				<td><c:choose>
						<c:when test="${report.state == -1}">
							<span style="color: #333333;">수행취소</span>
						</c:when>
						<c:when test="${report.state == 1}">
							<span style="color: #006400;">활동시작</span>
						</c:when>
						<c:when test="${report.state == 2}">
							<span style="color: #00008B;">인증완료</span>
						</c:when>
						<c:when test="${report.state == 3}">
							<span style="color: #FF8C00;">인증대기</span>
						</c:when>
						<c:when test="${report.state == 4}">
							<span style="color: #8B0000;">인증반려</span>
						</c:when>
						<c:otherwise>
							<span style="color: #333333;">불명</span>
						</c:otherwise>
					</c:choose></td>
			</tr>
			<tr>
				<td><strong>인증 사진</strong></td>
				<td class="centered-image"><a
					href="/resources/upload/${report.ctfcFilename}" class="centerimage">
						<img src="/resources/upload/${report.ctfcFilename}" alt="img"
						width="50%">
				</a></td>
			</tr>
		</table>

		<div class="actions">
			<form id="reportForm" method="post"
				action="/admin/reportdetail/saveReportResult">
				<input type="hidden" name="repId" value="${report.repId}"> <input
					type="hidden" name="repResult" value="1"> <input
					type="hidden" name="stateId" value="${report.stateId}">
				<!-- 신고 상태의 식별자 -->
				<select name="state" class="custom-select">
					<option value="">수정</option>
					<option value="2" class="complete">완료</option>
					<option value="4" class="reject">반려</option>
				</select>
				<button type="submit" class="btn-save">저장</button>
			</form>
			<br> <a href="/admin/reportform" id="back" class="actions">뒤로 가기</a>
		</div>
	</div>
</div>
</body>
</html>