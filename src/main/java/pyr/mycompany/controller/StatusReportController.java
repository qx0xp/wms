package pyr.mycompany.controller;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;

import pyr.mycompany.domain.Criteria;
import pyr.mycompany.domain.ReceivingExpectDTO;
import pyr.mycompany.service.StatusReportService;

@Controller
@RequestMapping("/")
public class StatusReportController {
	@Autowired
	private StatusReportService tservice;

	//입고현황페이지로 이동 및 그래프 뿌리기
	@GetMapping("receiving_report")
	public void receiving_report(Criteria cri, Model model) {
		System.out.println("receiving_report" + tservice.receiving_report(cri));
		System.out.println("시작일 " + cri.getStart_date() + "종료일 "+ cri.getEnd_date());
		
		model.addAttribute("receiving_report", tservice.receiving_report(cri));
		model.addAttribute("getStart", cri.getStart_date());
		model.addAttribute("getEnd", cri.getEnd_date());
		model.addAttribute("receiving_category", cri.getReceiving_category());
	}
	
	//출고현황페이지로 이동 및 그래프 뿌리기
	@GetMapping("delivery_report")
	public void delivery_report(Criteria cri, Model model) {
		System.out.println("delivery_report" + tservice.delivery_report(cri));
		System.out.println("시작일 " + cri.getStart_date() + "종료일 "+ cri.getEnd_date());
		
		model.addAttribute("delivery_report", tservice.delivery_report(cri));
		model.addAttribute("getStart", cri.getStart_date());
		model.addAttribute("getEnd", cri.getEnd_date());
		model.addAttribute("delivery_category", cri.getDelivery_category());

	}
	
	@GetMapping("monthly_order")
	public void monthlyOrderGet() {}
	
	@PostMapping("monthly_order.do")
	@ResponseBody
	public String monthlyOrderChartGet(Criteria cri, Model model) {
		// 월별 입고 건 수 조회
		System.out.println("월별 입고:" + tservice.recByMonth(cri));
		// 월별 출고 건 수 조회
		System.out.println("월별 출고:" + tservice.delByMonth(cri));
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		map.put("receive", tservice.recByMonth(cri));
		map.put("delivery", tservice.delByMonth(cri));
		
		Gson gson = new Gson();
		return gson.toJson(map);
	}
}
