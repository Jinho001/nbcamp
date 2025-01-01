package com.zero.board;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.List;

@Controller
@Slf4j
@RequiredArgsConstructor
@RequestMapping("/board")
public class BoardController {

    private final BoardService boardService;
    @RequestMapping("/list")
    public String getList(Criteria cri, Model model) { // type, keyword
        log.info("cri={}",cri);
        List<Board> list=boardService.getList(cri);
        model.addAttribute("list", list); // Model
        PageMaker pageMaker=new PageMaker();
        pageMaker.setCri(cri);
        pageMaker.setTotalCount(boardService.totalCount(cri));
        model.addAttribute("pageMaker", pageMaker);
        return "board/list"; // View
    }

    @GetMapping("/get")
    public String get(@RequestParam("boardId") int boardId, Model model, @ModelAttribute("cri") Criteria cri) {
        Board vo=boardService.get(boardId);
        model.addAttribute("vo", vo);
        return "board/get";
    }
    @GetMapping("/modify")
    @PreAuthorize("hasRole('ROLE_ADMIN')")
    public String modify(@RequestParam("boardId") int boardId, Model model,@ModelAttribute("cri") Criteria cri) {
        Board vo=boardService.get(boardId);
        model.addAttribute("vo", vo);
        return "board/modify"; // /WEB-INF/views/board/modify.jsp
    }
    @PostMapping("/modify")
    @PreAuthorize("hasRole('ROLE_ADMIN')")
    public String modify(Board vo, Criteria cri , RedirectAttributes rttr) {
        boardService.modify(vo); //수정
        rttr.addAttribute("page", cri.getPage());
        rttr.addAttribute("perPageNum", cri.getPerPageNum());
        rttr.addAttribute("type", cri.getType());
        rttr.addAttribute("keyword", cri.getKeyword());

        return "redirect:/board/list";
    }
    @GetMapping("/remove")
    @PreAuthorize("hasRole('ROLE_ADMIN')")
    public String remove(int boardId, Criteria cri, RedirectAttributes rttr) {
        boardService.remove(boardId);
        rttr.addAttribute("page", cri.getPage());
        rttr.addAttribute("perPageNum", cri.getPerPageNum());
        rttr.addAttribute("type", cri.getType());
        rttr.addAttribute("keyword", cri.getKeyword());

        return "redirect:/board/list";
    }
}
