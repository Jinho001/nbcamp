<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<link rel="stylesheet" href="/resources/css/commit.css">
<title>관리자 신고 확인 페이지</title>
<style type="text/css">
body {
	height: 100%;
	margin: 0;
	padding: 0;
	text-align: center;
}

.reportContainer {
	margin: 20px auto;
	padding: 20px;
	margin: 5%;
	border-radius: 5px;
	width: 100%;
	height: 80vh;
	text-align: center;
}

.reportContainer h2 {
	font-size: 24px;
	color: #333;
}

.tableWrapper {
	max-height: calc(80vh - 100px);
	overflow-y: auto;
}

.tableWrapper::-webkit-scrollbar {
    display: none;
}

table {
	width: 100%;
	border-collapse: collapse;
	margin-top: 10px;
}

table th, table td {
	padding: 10px;
	border-bottom: 1px solid #ddd;
	text-align: left;
}

table th {
	background-color: #f2f2f2;
	position: sticky;
	top: 0;
	z-index: 2;
}

table tr:hover {
	background-color: #f5f5f5;
	cursor: pointer;
}

.waiting {
	color: #CD853F;
	font-weight: bold;
}

table th:nth-child(1), table td:nth-child(1) {
	width: 10%;
}

table th:nth-child(2), table td:nth-child(2) {
	width: 25%;
}

table th:nth-child(3), table td:nth-child(3) {
	width: 25%;
}

table th:nth-child(4), table td:nth-child(4) {
	width: 20%;
}

table th:nth-child(5), table td:nth-child(5) {
	width: 20%;
}

table th, table td {
	text-align: center;
}

.reportToggle {
	margin-bottom: 10px;
}

.reportToggle button {
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
<script type="text/javascript">

function goToReportDetail(repId) {
	window.location = '/admin/reportdetail?repId=' + repId;
}

function toggleReportRows(status = "") {
    var reports = document.querySelectorAll('.reportContainer tbody tr');
    reports.forEach(function(report) {
        var repResult = report.querySelector('td:nth-child(5)').innerText.trim();
        if (status === "전체" || status === "" || repResult === status) {
            report.style.display = "table-row";
        } else {
            report.style.display = "none";
        }
    });
}

function goToReportDetail(repId) {
	window.location = '/admin/reportdetail?repId=' + repId;
	}
</script>
</head>
<body>
	<div class="reportContainer">
		<div class="reportToggle">
			<button onclick="toggleReportRows('전체')">전체</button>
			<button onclick="toggleReportRows('처리대기')">처리대기</button>
			<button onclick="toggleReportRows('처리완료')">처리완료</button>
		</div>
		<div class="tableWrapper">
			<table>
				<thead>
					<tr>
						<th class="stiky">신고 활동 번호</th>
						<th class="stiky">신고자</th>
						<th class="stiky">해당 유저</th>
						<th class="stiky">신고 사유</th>
						<th class="stiky">처리 상태</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${reports}" var="report">
						<tr onclick="goToReportDetail('${report.repId}')">
							<td>${report.stsId}</td>
							<td><c:choose>
									<c:when test="${fn:length(report.reporter) > 30}">
                                        ${fn:substring(report.reporter, 0, 30)}...
                                    </c:when>
									<c:otherwise>
                                        ${report.reporter}
                                    </c:otherwise>
								</c:choose></td>
							<td><c:choose>
									<c:when test="${fn:length(report.userid) > 30}">
                                        ${fn:substring(report.userid, 0, 30)}...
                                    </c:when>
									<c:otherwise>
                                        ${report.userid}
                                    </c:otherwise>
								</c:choose></td>
							<td>${report.reason}</td>
							<td><c:choose>
									<c:when test="${report.repResult == 0}">
										<span class="waiting">처리대기</span>
									</c:when>
									<c:otherwise>
                                        처리완료
                                    </c:otherwise>
								</c:choose></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>