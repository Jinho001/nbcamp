package com.zero.waste;

import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.List;

import javax.transaction.Transactional;

import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import com.zero.activity.ActivityStateVO;
import com.zero.admin.AdminService;

import lombok.RequiredArgsConstructor;

@Component
@RequiredArgsConstructor
public class Scheduler {
	
	private final AdminService adService;
	
	@Scheduled(cron = "59 59 23 * * *")
	public void initActivityState(){
		try {
		adService.initActivityState();			
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	@Scheduled(cron = "0 0 0/1 * * * ")
	public void autoCtfcActivity() {
		List<ActivityStateVO> ctfcList = adService.getCtfcList();
		
		for(ActivityStateVO asVo:ctfcList) {
			int i = adService.approvalActivity(asVo);
			System.out.println(asVo+"처리 완료");
		}
	}
}
