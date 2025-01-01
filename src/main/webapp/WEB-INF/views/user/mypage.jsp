<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<!-- websocket 라이브러리 추가 CDN -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.6.1/sockjs.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/stomp.js/2.3.3/stomp.min.js"></script>
<script defer src="/resources/js/mypage.js"></script>
<script defer src="/resources/js/mypage_ws.js"></script>
<link rel="stylesheet" href="/resources/css/mypage.css">

<!--     	<button type="button" onclick="location.href='/user/edit/password' ">회원 정보 수정</button> 	
 -->
 <div id="container2" class="container2">
 <div class="myact">
    <br>
    <div id="stateList">
        <ul id="category" class="category">
            <li><a href="javascript:selectCtgr('all')" class="ctgrNames">전체</a></li>
            <c:forEach var="state" items="${stateList}">
                <li><a href="javascript:selectCtgr('${state.state_name}')" class="ctgrNames">${state.state_name}</a></li>
            </c:forEach>
        </ul>
    </div>
    <div id="actList" class="scrollable-table">
    	<input type="hidden" id = "myid" value="${username }">
        <table id="list" border="1">
        <thead>
            <tr>
                <th>활동번호</th>
                <th>이름</th>
                <th>활동상태</th>
                <th>시작일</th>
                <th>종료일</th>
                <th>수행기한</th>
                <th>취소</th>
            </tr>
            </thead>
            <tbody>
            <c:choose>
                <c:when test="${userActList eq null or empty userActList}">
                    <tr>
                        <td colspan="7"><b>아직 시작한 활동이 없습니다.</b><br>
                        <span><a href="/actList" id="activityA">제로웨이스트 활동을 시작해 보세요!</a></span>
                        </td>
                    </tr>
                </c:when>
                <c:otherwise>
                    <c:forEach var="act" items="${userActList}">
                        <tr>
                            <td class="actNo"><c:out value="${act.actId}" /></td>
                            <td class="actName"><a href="/actDetail/${act.actId}"><c:out value="${act.actName}" /></a></td>
                            <td class="actState"><c:out value="${act.stateName}" /></td>
                            <td class="sdate">${act.startDate}</td>
                            <td class="edate">${act.endDate}</td>
                            <td id="tl${act.actId}_${act.state}" class="timeLeft" data-act-id="${act.actId}" data-act-state="${act.state}" style="color:green">${act.timeLeft}</td>
                            <td class="cancle"><c:if test="${act.state eq 1}">
                                    <button id="btnCancle" onclick="goCancle(${act.actId})">취소</button>
                                </c:if></td>
                        </tr>
                    </c:forEach>
                </c:otherwise>
            </c:choose>
            </tbody>
        </table>
        <form name="cancleForm" id="cancleForm" method="post" action="/user/actCancle">
            <input id="cancleNo" name="cancleNo" type="hidden">
        </form>
        </div>
    </div>
    <br><br>
    <div class="favList">
    
    <br>
        <div id="favTable" class="scrollable-table">
        <table border="1">
        <thead>
            <tr>
                <th>활동번호</th>
                <th>이름</th>
                <th>즐겨찾기</th>
            </tr>
            </thead>
            <tbody>
            <c:choose>
                <c:when test="${userBookmarkList eq null or empty userBookmarkList}">
                    <tr>
                        <td colspan="3"><b>즐겨찾기 한 활동이 없습니다.</b></td>
                    </tr>
                </c:when>
                <c:otherwise>
                    <c:forEach var="bm" items="${userBookmarkList}">
                        <tr>
                            <td class="actId"><c:out value="${bm.actId}" /></td>
                            <td class="actName">
                                <a href="/actDetail/${bm.actId}"><c:out value="${bm.actName}" /></a>
                            </td>
                            <td class="cancle" style="text-align: center;">
                                <button id="btnCancle" onclick="removeBookmark('${sessionScope.SPRING_SECURITY_CONTEXT.authentication.principal.user.userid}', ${bm.actId})">해제</button>
                            </td>
                        </tr>
                    </c:forEach>
                </c:otherwise>
            </c:choose>
            </tbody>
        </table>
        </div>
    </div>
</div>