package pyr.mycompany.controller;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import pyr.mycompany.domain.Criteria;
import pyr.mycompany.domain.InventoryDTO;
import pyr.mycompany.domain.InventoryHistoryDTO;
import pyr.mycompany.domain.PageDTO;
import pyr.mycompany.domain.ReceivingDTO;
import pyr.mycompany.domain.ReceivingExpectDTO;
import pyr.mycompany.service.ReceivingService;

@Controller
@RequestMapping("/")
public class ReceivingController {
	@Autowired
	private ReceivingService rservice;
	
	// 입고예정페이지로 이동
	@GetMapping("receiving_expect")
	public void receiving_expect(Criteria cri, Model model) {
		System.out.println("expect_list" + rservice.expect_list(cri));
		
		model.addAttribute("expect_list", rservice.expect_list(cri));
		//페이징에 쓰일 데이터건수
		int total=rservice.expectTotalCount(cri);
		//PageDTO의 데이터를 jsp에 뿌린다
		model.addAttribute("pageMaker",new PageDTO(cri,total));
	}
	
	// 입고등록페이지로 이동
	@GetMapping("receiving_upload")
	public void receiving_upload(Model model) {
		System.out.println("receiving_upload");
		model.addAttribute("storageName", rservice.storageNameGet());
	}
	
	// 품목코드페이지로 이동 및 품목목록리스트
	@GetMapping("itemcode")
	public void itemcode(Criteria cri, Model model) {
		cri.setAmount(5);
		System.out.println("item_list" + rservice.item_list(cri));
		
		model.addAttribute("item_list", rservice.item_list(cri));
		//게시판 페이징에 쓰일 데이터건수
		int total=rservice.getTotalCount(cri);
		//PageDTO의 데이터를 jsp에 뿌린다
		model.addAttribute("pageMaker",new PageDTO(cri,total));
	}

	//입고등록을 적고 등록버튼을 누르면 db에 저장됨
	@PostMapping("receiving_regist")
	@ResponseBody
	public ReceivingExpectDTO regist_post(ReceivingExpectDTO expect) {
		System.out.println("regist post...."+ expect);
		rservice.regist(expect);
		
		return expect;
	}
	
	// 입고예정수정 페이지로 이동 및 입고예정코드를 보내서 수정하기위한 상세정보를 받아옴
	@GetMapping("expect_modify")
	public void expect_modify(ReceivingExpectDTO expect, Model model) {
		System.out.println("expect_modify");
		
		model.addAttribute("modify", rservice.expect_modify(expect));
		model.addAttribute("storageName", rservice.storageNameGet());
	}
	
	//입고예정내용을 수정하고 수정버튼을 누르면 db에 업데이트됨
	@PostMapping("expect_modify")
	@ResponseBody
	public ReceivingExpectDTO expect_update(ReceivingExpectDTO expect) {
		System.out.println("expect_update...."+ expect);
		rservice.expect_update(expect);
		
		return expect;
	}
	
	//입고예정에서 입고지시로 상태변경 업데이트
	@PostMapping("receiving_instruct")
	@ResponseBody
	public ReceivingExpectDTO expect_instruct(ReceivingExpectDTO expect) {
		System.out.println("expect_instruct...."+ expect);
		rservice.expect_instruct(expect);
		
		return expect;
	}
	
	//입고예정삭제
	@PostMapping("expect_delete")
	@ResponseBody
	public ReceivingExpectDTO expect_delete(ReceivingExpectDTO expect) {
		System.out.println("expect_delete...."+ expect);
		rservice.expect_delete(expect);
		
		return expect;
	}
	
	// 입고대기페이지로 이동 및 입고목록 화면에 뿌리고 페이징처리
	@GetMapping("receiving_status")
	public void receiving_status(Criteria cri, Model model) {
		System.out.println("status_list" + rservice.status_list(cri));
		
		model.addAttribute("status_list", rservice.status_list(cri));
		//게시판 페이징에 쓰일 데이터건수
		int total=rservice.receivingTotalCount(cri);
		//PageDTO의 데이터를 jsp에 뿌린다
		model.addAttribute("pageMaker",new PageDTO(cri,total));
		
		System.out.println("시작일 " + cri.getStart_date() + "종료일 "+ cri.getEnd_date());
	}
	
	// 입고수정 페이지로 이동 및 데이터뿌리기
	@GetMapping("receiving_modify")
	public void receiving_modify(ReceivingExpectDTO expect, Model model) {
		System.out.println("receiving_modify"+rservice.modify(expect));
		
		model.addAttribute("modify", rservice.modify(expect));
	}
	
	//내용을 수정하고 수정버튼을 누르면 db에 업데이트됨
	@PostMapping("receiving_modify")
	@ResponseBody
	public ReceivingExpectDTO update_post(ReceivingExpectDTO expect) {
		System.out.println("update post...."+ expect);
		rservice.update(expect);
		
		return expect;
	}
	
	//입고지시철회 상태변경 업데이트
    @PostMapping("receiving_back")
    @ResponseBody
    public ReceivingExpectDTO expect_back(ReceivingExpectDTO expect) {
		System.out.println("receiving_back...."+ expect);
		rservice.receiving_back(expect);
		  
		return expect;
    }
	
	//입고확정이되고 재고목록에 확정된 데이터가 넘어감
	@PostMapping("receiving_confirm")
	@ResponseBody
	public HashMap<Object, Object> confirm_post(ReceivingExpectDTO expect, ReceivingDTO receiving, InventoryDTO inventory, InventoryHistoryDTO ihdto) {
		
		System.out.println("update post...."+ receiving);
		// 입고 상태 확정 변경
		rservice.confirm(expect);
		// 입고 확정 등록
		rservice.r_upload(receiving);
		// 재고 이력 등록
		rservice.recHistoryInsert(ihdto);
		
		
		// 재고 중복 여부 확인
		System.out.println(rservice.invDupCheck(inventory));
		if(rservice.invDupCheck(inventory)==0) {
			System.out.println("중복이 되지 않습니다.");
			// 재고 등록
			rservice.invUpload(inventory);
			rservice.recNewIdUpdate();
		} else {
			System.out.println("중복입니다.");
			// 재고 업데이트
			rservice.invUpdate(inventory);
			rservice.recDupIdUpdate(ihdto);
		}
		
		HashMap<Object, Object> map = new HashMap<Object, Object>();
		map.put("expect", expect);
		map.put("receiving", receiving);
		map.put("inventory", inventory);
		
		return map;
	}
	
	//입고삭제
	@PostMapping("receiving_delete")
	@ResponseBody
	public ReceivingExpectDTO delete(ReceivingExpectDTO expect) {
		System.out.println("delete...."+ expect);
		rservice.delete(expect);
		
		return expect;
	}
	
	// 입고확정페이지로 이동 및 페이지에 목록나타내기
	@GetMapping("receiving_confirm")
	public void confirm_list(Criteria cri, Model model) {
		System.out.println("confirm_list" + rservice.confirm_list(cri));
		
		model.addAttribute("confirm_list", rservice.confirm_list(cri));
		//게시판 페이징에 쓰일 데이터건수
		int total=rservice.confirmTotalCount(cri);
		//PageDTO의 데이터를 jsp에 뿌린다
		model.addAttribute("pageMaker",new PageDTO(cri,total));
	}
}
