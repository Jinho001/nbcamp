package com.zero.board;


import com.zero.waste.mapper.BoardMapper;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@Service
@Slf4j
@RequiredArgsConstructor
@Transactional
public class BoardServiceImpl implements BoardService{

    private final BoardMapper boardMapper;
//    @Override
//    public void fetchAndSaveRssFeed() throws IOException, FeedException {
//        URL feedSource = new URL("http://www.econew.co.kr/rss/clickTop.xml");
//        SyndFeedInput input = new SyndFeedInput();
//        SyndFeed feed = input.build(new XmlReader(feedSource));
//
//        // 데이터베이스에 저장된 모든 게시물의 링크를 가져옵니다.
//        List<String> existingLinks = boardMapper.getAllBoardLinks();
//
//        for (SyndEntry entry : feed.getEntries()) {
//            // 현재 게시물의 링크를 가져옵니다.
//            String currentLink = entry.getLink();
//
//            // 이미 저장된 게시물인지 확인합니다.
//            if (!existingLinks.contains(currentLink)) {
//                Board board = new Board();
//                board.setBoardTitle(entry.getTitle());
//                board.setBoardLink(currentLink);
//                board.setBoardDescription(entry.getDescription().getValue());
////                log.info("pubDate={}", entry.getPublishedDate());
//                board.setBoardAuthor(entry.getAuthor()); // 작성자 정보를 가져옴
//                board.setBoardDate(entry.getPublishedDate());
//
//                boardMapper.insert(board);
//            }
//        }
//    }


    public void fetchAndSaveRssFeed() {
        try {
            String feedUrl = "https://www.google.com/alerts/feeds/07862053005810308272/12609039694328357589";
            Document doc = Jsoup.connect(feedUrl).get();
            Elements entryList = doc.select("entry");

            for (Element entryElement : entryList) {
                String currentLink = entryElement.select("link").attr("href");

                // 현재 링크가 데이터베이스에 이미 존재하는지 확인
                if (!boardMapper.isLinkExists(currentLink)) {
                    Board board = new Board();
                    String title = Jsoup.parse(entryElement.select("title").text()).text();
                    String description = Jsoup.parse(entryElement.select("content").text()).text();
                    String dateString = entryElement.select("published").text();
                    Date date = new SimpleDateFormat("yyyy-MM-dd").parse(dateString);

                    board.setBoardTitle(title);
                    board.setBoardLink(currentLink);
                    board.setBoardDate(date);
                    board.setBoardDescription(description);
                    board.setBoardAuthor("zerowaste");

                    boardMapper.insert(board);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }


    @Override
    @Transactional(readOnly = true)
    public List<Board> getListLimit() {
        return boardMapper.getListLimit();
    }

    // 게시판 관련
    @Override
    @Transactional(readOnly = true)
    public List<Board> getList(Criteria cri) {
        List<Board> list=boardMapper.getList(cri);

        return list;
    }

    @Override
    @Transactional(readOnly = true)
    public Board get(int boardId) {
        Board vo=boardMapper.read(boardId);
        return vo;
    }

    @Override
    public void modify(Board vo) {
        boardMapper.update(vo);
    }

    @Override
    public void remove(int boardId) {
        boardMapper.delete(boardId);
    }

    @Override
    @Transactional(readOnly = true)
    public int totalCount(Criteria cri) {
        return boardMapper.totalCount(cri);
    }

}