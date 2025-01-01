<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script src="/resources/js/activity.js"></script>
<link rel="stylesheet" href="/resources/css/actList.css">
<br>
<div id="container2" class="container2">
	<c:if test="${principal.username ne null}">
		<div class="import-content">
			<c:import url="/dailymission"></c:import>
		</div>
	</c:if>
	<div class="activity-all">
		<!-- 활동 카테고리 -->
		<div id="ctgrList">
			<ul id="category" class="category">
				<li><a href="javascript:selectCtgr('all')" class="ctgrNames">전체</a></li>
				<c:forEach var="category" items="${ctgrList}">
					<li><a
						href="#" onclick="selectCtgr('${category.act_ctgr_name}')">${category.act_ctgr_name}</a></li>
				</c:forEach>
			</ul>
		</div>
		<div id="act_wrap">
			<table id="actlist">
				<tr>
					<th>번호</th>
					<th>분류</th>
					<th>이름</th>
					<th>포인트</th>
				</tr>
				<c:choose>
					<c:when test="${actList eq null or empty actList}">
						<tr>
							<td colspan="6"><b>데이터가 없습니다</b></td>
						</tr>
					</c:when>
					<c:otherwise>
						<c:forEach var="act" items="${actList}">
							<tr>
								<td class="actNo"><c:out value="${act.actId}" /></td>
								<td class="actCategory"><c:out value="${act.actCategory}" /></td>
								<td class="actName"><a href="/actDetail/${act.actId }">
										<c:out value="${act.actName}" />
								</a></td>
								<td class="point"><c:out value="${act.point}" /></td>
							</tr>
						</c:forEach>
					</c:otherwise>
				</c:choose>
			</table>
		</div>
	</div>
</div>
