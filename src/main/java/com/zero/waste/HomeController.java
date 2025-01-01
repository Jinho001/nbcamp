package com.zero.waste;

import com.zero.board.Board;
import com.zero.board.BoardService;
import com.zero.common.util.CommonUtil;
import com.zero.user.dto.User;
import com.zero.user.service.UserService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.RequiredArgsConstructor;

import java.util.List;
@Slf4j
@Controller // Controller 등록
@RequiredArgsConstructor //lombok, final 생성자 자동 생성
public class HomeController {

	private final BoardService boardService;
	private final UserService userService;
	private final CommonUtil util;
	
	@RequestMapping("/")
	public String test(Model model) {
		String username = util.getCurrentUsername();
		User user = userService.findByUsername(username);
		boolean isSocialLogin = false;
		if (user != null) {
			isSocialLogin = user.getProvider() != null; // 소셜 로그인 여부 확인
		}
		List<Board> listLimit = boardService.getListLimit();
		model.addAttribute("isSocialLogin", isSocialLogin);
		model.addAttribute("list", listLimit);
		return "index";
	}
}
