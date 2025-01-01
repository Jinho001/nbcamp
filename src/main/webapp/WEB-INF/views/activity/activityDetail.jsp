<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script src="/resources/js/activitydetail.js"></script>
<link rel="stylesheet" href="/resources/css/actDetail.css">
<br>
<div id="container2" class="container2">
	<div class="activity-all">
		<div id="act_wrap">
			<div id="actContent">
				<input type="hidden" id="actno" value="${actNo}"> <input
					type="hidden" id="username" value="${principal.username}">
				<div style="font-size: 30px">${actList[actNo-1].actName }</div>
				<c:import
					url="classpath:static/activity_contents/actno${actNo }.html"
					charEncoding="UTF-8" />
				<c:choose>
					<c:when test="${userActList[actNo-1].state ne 1}">
						<button class="btn" id="start" onclick="actStart()">시작하기</button>
					</c:when>
					<c:otherwise>
						<button class="btn" id="ctfc" onclick="actCtfc()">인증하기</button>
					</c:otherwise>
				</c:choose>
				<c:choose>
					<c:when
						test="${userActList[actNo-1].bookmark eq 0 || userActList[actNo-1].bookmark eq null}">
						<button class="btn" id="bookmark"
							onclick="addBookmark('${principal.username}')">즐겨찾기</button>
					</c:when>
					<c:otherwise>
						<button class="btn"
							onclick="removeBookmark('${principal.username}')">즐겨찾기
							해제</button>
					</c:otherwise>
				</c:choose>
				<button class="btn" id="sts" onclick="actSts()">활동현황</button>
				<button class="btn" id="go_list" onclick="goActList()">뒤로가기</button>
			</div>
		</div><!-- actwrap -->
		<div id="activityOverview">
			<div id="statusCounts"></div>
			<div id="stsListContainer"></div>
		</div><!-- actoverview -->
	</div><!-- activity-all -->
</div>
