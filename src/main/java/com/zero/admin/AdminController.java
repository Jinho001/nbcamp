package com.zero.admin;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.zero.activity.ActivityService;
import com.zero.activity.ActivityStateVO;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
@RequestMapping("/admin")
public class AdminController {

	private final AdminService adService;
	private final ActivityService aService;

	@GetMapping("/reportform")
	public String getReportData(Model m) {
		List<ReportVO> reports = adService.getReportData();
		m.addAttribute("reports", reports);
		return "/admin/reportform";
	}

	@GetMapping("/reportdetail")
	public String getReportById(@RequestParam("repId") int repId, Model m) {
		ReportVO report = adService.getReportById(repId);
		m.addAttribute("report", report);
		return "/admin/reportdetail";
	}

	@PostMapping("/reportdetail/saveReportResult")
	@Transactional
	public String saveReportResultRep(@RequestParam("repId") int repId, @RequestParam("repResult") int repResult,
	        @RequestParam("state") int state, @RequestParam int stateId, Model m) {
		
			ActivityStateVO asVo = aService.getStsByStateId(stateId);	
			int currentState = asVo.getState();
			// 업데이트 수행
        	adService.updateResultAndState(repId, repResult, stateId, state);
        	
        	//인증 승인 처리된 건에 대한 신고 처리의 경우
    		if(currentState==2) {
    			//반려시 포인트 회수
        		if(state==4) {
        			adService.retrievalPoint(asVo);
        		}
        	}
    		//인증 대기 중인 건의 신고 처리의 경우
    		if(currentState==3) {
    			//승인 처리시 포인트 지급
        		if(state==2) {
        			adService.approvalActivity(asVo);
        		}
        	}
        	
	        // 변경된 신고 정보를 다시 가져옴
	        ReportVO report = adService.getReportById(repId);	        
	        if (report != null) {
	            m.addAttribute("report", report);
	        } else {
	            m.addAttribute("error", "Report not found.");
	        }

	        return "redirect:/admin/reportdetail?repId=" + repId;
	}
}