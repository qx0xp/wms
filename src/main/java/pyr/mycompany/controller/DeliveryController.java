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
import pyr.mycompany.domain.DeliveryDTO;
import pyr.mycompany.domain.DeliveryExpectDTO;
import pyr.mycompany.domain.InventoryDTO;
import pyr.mycompany.domain.InventoryHistoryDTO;
import pyr.mycompany.domain.PageDTO;
import pyr.mycompany.domain.ReceivingDTO;
import pyr.mycompany.domain.ReceivingExpectDTO;
import pyr.mycompany.service.DeliveryService;

@Controller
@RequestMapping("/")
public class DeliveryController {
	
	@Autowired
	private DeliveryService dservice;
	
	//출고예정 페이지로 이동
	@GetMapping("delivery_expect")
	public void delivery_expect(Criteria cri, Model model) {
		System.out.println("d_expect_list" + dservice.d_expect_list(cri));
		model.addAttribute("d_expect_list", dservice.d_expect_list(cri));
		//페이징에 쓰일 데이터건수
		int total=dservice.d_expectTotalCount(cri);
		//PageDTO의 데이터를 jsp에 뿌린다
		model.addAttribute("pageMaker",new PageDTO(cri,total));
	}
	
	//출고등록 페이지로 이동
	@GetMapping("delivery_upload")
	public void delivery_upload() {
		System.out.println("delevery_upload");
	}
	
	//재고선택페이지로 이동및 페이징 처리
	@GetMapping("inventory_itemcode")
	public void inventory_itemcode(Criteria cri, Model model) {
		cri.setAmount(5);
		System.out.println("inventory_item_list" + dservice.inventory_item_list(cri));
		model.addAttribute("inventory_item_list", dservice.inventory_item_list(cri));
		int total=dservice.deliveryTotalCount(cri);
		model.addAttribute("pageMaker",new PageDTO(cri,total));
	}
	
	//출고등록을 적고 등록버튼을 누르면 db에 저장됨과 동시에 재고수량빠짐
	@PostMapping("delivery_regist")
	@ResponseBody
	public HashMap<Object, Object> expect_regist(DeliveryExpectDTO expect, InventoryDTO inventory) {
		System.out.println("expect_regist...."+ expect);
		dservice.d_regist(expect);
		dservice.i_update(inventory);
		
		HashMap<Object, Object> map = new HashMap<Object, Object>();
		map.put("expect", expect);
		map.put("inventory", inventory);
		return map;
	}
	
	// 출고예정수정 페이지로 이동 및 출고예정코드를 보내서 수정하기위한 상세정보를 받아옴
	@GetMapping("d_expect_modify")
	public void d_expect_modify(DeliveryExpectDTO expect, Model model) {
		System.out.println("d_expect_modify");
		model.addAttribute("modify", dservice.d_expect_modify(expect));
	}
	
	//출고예정내용을 수정하고 수정버튼을 누르면 db에 업데이트됨과 동시에 재고수량빠짐
	@PostMapping("d_expect_modify")
	@ResponseBody
	public HashMap<Object, Object> d_expect_update(DeliveryExpectDTO expect, InventoryDTO inventory) {
		System.out.println("d_expect_update...."+ expect);
		dservice.d_expect_update(expect);
		dservice.i_update(inventory);
		
		HashMap<Object, Object> map = new HashMap<Object, Object>();
		map.put("expect", expect);
		map.put("inventory", inventory);
		return map;
	}
	
	//출고예정에서 출고지시로 상태변경 업데이트
	@PostMapping("delivery_instruct")
	@ResponseBody
	public DeliveryExpectDTO d_expect_instruct(DeliveryExpectDTO expect) {
		System.out.println("d_expect_instruct...."+ expect);
		dservice.d_expect_instruct(expect);
		return expect;
	}
	
	//출고예정삭제 및 출고예정수량 재고수량으로 다시 백
	@PostMapping("d_expect_delete")
	@ResponseBody
	public HashMap<Object, Object> d_expect_delete(DeliveryExpectDTO expect, InventoryDTO inventory) {
		System.out.println("d_expect_delete...."+ expect);
		dservice.d_expect_delete(expect);
		dservice.i_update(inventory);
		
		HashMap<Object, Object> map = new HashMap<Object, Object>();
		map.put("expect", expect);
		map.put("inventory", inventory);
		return map;
	}
	
	// 출고대기페이지로 이동 및 출고목록 화면에 뿌리고 페이징처리
	@GetMapping("delivery_status")
	public void delivery_status(Criteria cri, Model model) {
		System.out.println("delivery_status" + dservice.d_status_list(cri));
		model.addAttribute("d_status_list", dservice.d_status_list(cri));
		int total=dservice.statusTotalCount(cri);
		model.addAttribute("pageMaker",new PageDTO(cri,total));
		System.out.println("시작일 " + cri.getStart_date() + "종료일 "+ cri.getEnd_date());
	}
	
	// 출고수정 페이지로 이동 및 데이터뿌리기
	@GetMapping("delivery_modify")
	public void delivery_modify(DeliveryExpectDTO expect, Model model) {
		System.out.println("delivery_modify" + dservice.d_modify(expect));
		model.addAttribute("modify", dservice.d_modify(expect));
	}
	
	//출고내용을 수정하고 수정버튼을 누르면 db에 업데이트됨과 동시에 재고수량빠짐
	@PostMapping("delivery_modify")
	@ResponseBody
	public HashMap<Object, Object> delivery_update(DeliveryExpectDTO expect, InventoryDTO inventory) {
		System.out.println("delivery_update...."+ expect);
		dservice.d_update(expect);
		dservice.i_update(inventory);
		
		HashMap<Object, Object> map = new HashMap<Object, Object>();
		map.put("expect", expect);
		map.put("inventory", inventory);
		return map;
	}
	
	//출고지시철회 상태변경 업데이트
   @PostMapping("delivery_back")
   @ResponseBody
   public DeliveryExpectDTO delivery_back(DeliveryExpectDTO expect) {
      System.out.println("delivery_back...."+ expect);
      dservice.delivery_back(expect);
      
      return expect;
   }
	
	//출고확정이되고 확정된 데이터가 출고목록으로 들어감
	@PostMapping("delivery_confirm")
	@ResponseBody
	public HashMap<Object, Object> d_confirm(DeliveryExpectDTO expect, DeliveryDTO delivery, InventoryHistoryDTO ihdto, InventoryDTO inventory) {
		System.out.println("d_confirm....");
		//출고 확정과 동시에 재고 이력 insert
		dservice.delHistoryInsert(ihdto);
		dservice.d_confirm(expect);
		dservice.d_upload(delivery);
		dservice.real_update(delivery);
		//dservice.i_update(inventory);
		
		//출고 시, 총 재고 등록하면 재고 delete
		dservice.invRealDelete(inventory);
		
		HashMap<Object, Object> map = new HashMap<Object, Object>();
		map.put("expect", expect);
		map.put("receiving", delivery);
		//map.put("inventory", inventory);
		return map;
	}
	
	// 입고확정페이지로 이동 및 페이지에 목록나타내기
	@GetMapping("delivery_confirm")
	public void d_confirm_list(Criteria cri, Model model) {
		System.out.println("d_confirm_list" + dservice.d_confirm_list(cri));
		model.addAttribute("d_confirm_list", dservice.d_confirm_list(cri));
		//게시판 페이징에 쓰일 데이터건수
		int total=dservice.dConfirmTotalCount(cri);
		//PageDTO의 데이터를 jsp에 뿌린다
		model.addAttribute("pageMaker",new PageDTO(cri,total));
	}
}
