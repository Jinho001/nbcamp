<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<script defer src="/resources/js/main.js"></script>

	
    <input type="hidden" id="errorMessage" value="${param.error}">
    <!-- //header -->
    <hr />
    <!-- container -->
    <div id="container" class="container">
      <div  class="snb">
        <ul>
          <li class="on"><span><i class="fa-solid fa-earth-asia"></i> 메인</span></li>
          <li><span>왜 해야 하나요?</span></li>
          <li><span>이달의 소식지</span></li>
          <li><span>어떻게 시작할까요?</span></li>
          <li><span>착한 소비 지도</span></li>
          <li><span>실천해볼까요?</span></li>
        </ul>

      </div>
      <section class="content1">
        <div class="content1Bg"></div>
        <h2>제로웨이스트,<br>실천해 볼까요?</h2>
        <a href="#" class="con1bt">제로웨이스트?</a>
      </section>
      <section class="content2">
        <div class="content2Con">
          <h2>왜 제로웨이스트를<br>해야 하나요?</h2>
          <p>매년 지구 온도는 2도씩 높아지고 있습니다.<br>무분별한 자연 파괴, 늘어나는 쓰레기들...<br>모든 것은 사람이 감당해야 할 시기가 다가오고 있습니다.</p>
        </div>
        <div>
          <ul>
            <li>
              <span>Zero Waste</span>
              <h3>제로웨이스트란?</h3>
              <span>오래쓰기, 버리지 않기, 아껴쓰기...</span>
              <p>제로웨이스트는 환경 보호를 위해 폐기물 발생을 최소화하는 생활 방식을 의미합니다. 불필요한 소비를 줄이고, 재사용, 재활용을 적극적으로 실천하며, 자연으로 돌아가는 제품을 선택합니다. 이 방식은 환경 부담을 줄이고 지속 가능한 미래를 만드는 데 기여합니다. 여러분도 제로웨이스트를 실천하여 지구를 지키는 데 동참해 보는 건 어떨까요?</p>
            </li>
            <li>
              <div class="content2Img"></div>
              <span class="content2Mg">An Increasing Amount Of Garbage</span>
              <h3>늘어가는 쓰레기</h3>
              <span>쓰레기 문제, 해결 방법은 없을까요?</span>
              <ul>
                <li><a href="https://www.yna.co.kr/view/AKR20210719063400501" target="_blank">[쓰레기 대란]⑤ 쓰레기 버리기 전에 '줄이는' 것이 급선무…시민들 나섰다</a></li>
                <li><a href="https://news.sbs.co.kr/news/endPage.do?news_id=N1007616980" target="_blank">프랑스 3배 크기의 쓰레기 섬…"폐기물은 미래의 시한폭탄"</a></li>
                <li><a href="https://www.newspenguin.com/news/articleView.html?idxno=11334" target="_blank">[펭귄의 서재] 내가 버린 재활용 쓰레기의 종착지</a></li>
              </ul>
            </li>
            <li>
              <span>Vegan</span>
              <h3>비건이란?</h3>
              <span>식습관의 작은 변화</span>
              <p>비건은 동물성 식품을 제한하고 과일·채소·곡물 등 식물성 식품을 먹는 식습관을 지향하는 것을 의미합니다. 비건에도 다양한 단계가 있습니다. 폴로 베지테리언, 페스코 베지테리언, 락토 베지터리언 등... 다양한 단계가 존재합니다.<br>
                식습관을 조금만 바꾸는 것에도 참여할 수 있으니, 용기를 내서 조금 도전해 보는 것은 어떨까요?</p>
            </li>
            <li>
              <span>Why Vegan</span>
              <h3>왜 비건을 해야 하나요?</h3>
              <span>지구와 환경을 위해</span>
              <p>세계적인 환경단체인 World Watch 연구소는 축산업에서 나오는 이산화탄소, 메탄가스, 아산화질소 등은 지구온실 가스의 51%를 차지하며 온난화에 다가가는 방향이라고 설명했습니다.<br>
                지금도 지구는 온난화의 길로 걸어가고 있습니다. 자그마한 한 발자국이 지구와 환경을 위한 첫 걸음이 될 수 있습니다.</p>
            </li>
          </ul>
        </div>
      </section>
      <section class="content3">
        <div>
          <h2>제로웨이스트 소식지</h2>
          <p>작은 것부터 실천할 수 있는 제로웨이스트.<br>실천할 수 있는 각종 이벤트를 전달해드려요</p>
        </div>
        <ul>
          <c:forEach var="board" items="${list}">
            <li>
              <a href="${board.boardLink}">
                <ul>
                  <li style="font-weight: bold;">${board.boardTitle}</li><br>
                  <li style="font-size:0.75em">${board.boardDescription}...</li>
                </ul>
              </a>
            </li>
          </c:forEach>
        </ul>
      </section>
      <section class="content4">
        <h2>제로웨이스트, 어떻게 시작할까요?</h2>
        <p>생소함에 선뜻 다가가기 어려운 제로웨이스트.<br>주변에서 쉽게 할 수 있는 것부터 시작해 볼까요?</p>
        <table>
          <caption class="blind">제로웨이스트와 관련된 질문</caption>
          <tbody>
            <tr>
              <th><div class="tablediv"><p>제로웨이스트를 시작하고 싶어요</p><span><i class="fa-solid fa-plus" onclick="toggleZeroWaste(event)"></i></span></div></th>
            </tr>
            <tr>
              <td>
                 <p>제로웨이스트는 환경을 생각하면서 일상생활에서 일회용품을 최소화하는 노력을 말해요. 비닐을 대신할 수 있는 장바구니를 사용하거나, 텀블러를 통해 음료를 마시는 등의 다양한 방법이 있어요. 이미 당신도 이러한 활동을 하고 계실 수 있어요! 더 많은 정보를 원하시나요?</p>
      			  <a href="/actList">더 알아보기 →</a>
              </td>
            </tr>
            <tr>
              <th><div class="tablediv"><p>제로웨이스트 상점 지도를 볼 수 있나요?</p><span><i class="fa-solid fa-plus" onclick="toggleZeroWaste(event)"></i></span></div></th>
            </tr>
            <tr>
              <td>
                <p>WZ에서는 내 집 주변의 제로웨이스트와 관련된 상점들의 정보를 확인할 수 있어요!<br>
                  어떤 상점이 있는지 더 알아볼까요?</p>
                <a href="/mapList">더 알아보기 →</a>
              </td>
            </tr>
            <tr>
              <th><div class="tablediv"><p>비건 음식점은 어디서 찾을 수 있나요?</p><span><i class="fa-solid fa-plus" onclick="toggleZeroWaste(event)"></i></span></div></th>
            </tr>
            <tr>
              <td>
                        <p>채식 식당을 찾는 것은 생각보다 쉽습니다! 도시의 많은 지역에서 이미 비건 음식점들이 활발하게 운영되고 있습니다. 이제 당신도 더 많은 선택지를 가지고 있을 거예요. 더 알아보시겠어요?</p>
                <a href="/mapList/searchShop?type=shop_category&keyword=&cate=5">더 알아보기 →</a>
              </td>
            </tr>
            <tr>
              <th><div class="tablediv"><p>비건이 아니어도 실천할 수 있나요?</p><span><i class="fa-solid fa-plus" onclick="toggleZeroWaste(event)"></i></span></div></th>
            </tr>
            <tr>
              <td>
                        <p>채식이 막막하셨다면 다른 방안도 있으니 걱정 마세요! 채식에는 종류가 다양하다는 사실 알고 계셨나요?</p>
                <a href="/mapList/searchShop?type=shop_category&keyword=&cate=4">더 알아보기 →</a>
              </td>
            </tr>
            
            <tr>
              <th><div class="tablediv"><p>환경과 제로웨이스트의 관계를 모르겠어요</p><span><i class="fa-solid fa-plus" onclick="toggleZeroWaste(event)"></i></span></div></th>
            </tr>
            
            <tr>
              <td>
                        <p>환경과 제로웨이스트는 밀접하게 연관되어 있습니다. 제로웨이스트는 환경 보호를 위해 일회용품 사용을 최소화하는 것을 의미합니다. 이미 당신의 노력은 환경에 긍정적인 영향을 미치고 있을 수 있습니다. 더 많은 정보를 원하시나요?</p>

                <a href="/board/list">더 알아보기 →</a>
              </td>
            </tr>
            <tr>
              <th><div class="tablediv"><p>제로 웨이스트와 관련해서 어떤 활동을 할 수 있나요?</p><span><i class="fa-solid fa-plus" onclick="toggleZeroWaste(event)"></i></span></div></th>
            </tr>
            <tr>
              <td>
                        <p>제로 웨이스트와 관련한 일을 직접 실천한 뒤 포인트를 모아 나무를 키울 수 있습니다. 로그인해서 직접 성장시켜 보세요.</p>
                <a href="/tree">더 알아보기 →</a>
              </td>
            </tr>
          </tbody>
        </table>
      </section>
      <section class="content5">
        <h2>착한 소비 지도 보기</h2>
        <p>착한 소비, 어쩌면 아주 가까이에 있을지도 몰라요. 한 번 살펴볼까요?</p>
        <ul>
          <li><div class="content5Img"></div></li>
          <li><div class="content5Img"></div></li>
          <li><div class="content5Img"></div></li>
        </ul>
        <p class = "linkBtn"><a href="/mapList">지도 더 보기 →</a></p>
      </section>
      <section class="content6">
        <div>
          <h2>제로웨이스트,<br>실천해 볼까요?</h2><br>
          <p>시작할 준비 되셨나요?<br>함께 실천해 봐요</p>
        </div>
        <br>
        <sec:authorize access="isAnonymous()">
          <p class="linkBtn"><a href="/user/login">로그인 / 회원가입</a></p>
        </sec:authorize>
        <sec:authorize access="isAuthenticated()">
          <p class="linkBtn"><a href="/user/logout">로그아웃</a></p>
        </sec:authorize>
      </section>
    </div>
    <!-- //container -->
    <hr> 