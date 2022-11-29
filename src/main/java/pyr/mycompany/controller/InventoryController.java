package pyr.mycompany.controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import pyr.mycompany.domain.Criteria;
import pyr.mycompany.domain.InventoryDTO;
import pyr.mycompany.domain.InventoryHistoryDTO;
import pyr.mycompany.domain.InventoryMoveMessageDTO;
import pyr.mycompany.domain.PageDTO;
import pyr.mycompany.domain.StorageDTO;
import pyr.mycompany.service.InventoryService;

@Controller
@RequestMapping("/")
public class InventoryController {
	@Autowired
	InventoryService iservice;
	
	// 재고 조회
	@GetMapping("inventory_list")
	public void inventoryListGet(Model model, Criteria cri) {
		model.addAttribute("ilist", iservice.invSelect(cri));
		model.addAttribute("pageMaker", new PageDTO(cri, iservice.invTotalCount(cri)));
		model.addAttribute("storageName", iservice.storageNameGet());
	}
	
	// 재고 이동
	@GetMapping("inventory_move")
	public void inventoryMoveGet(Model model, Criteria cri) {
		model.addAttribute("ilist", iservice.invSelect(cri));
		model.addAttribute("pageMaker", new PageDTO(cri, iservice.invTotalCount(cri)));
		model.addAttribute("storageName", iservice.storageNameGet());
	}
	
	@PostMapping("inventory_move")
	public void inventoryMovePost(Model model, Criteria cri) {
		model.addAttribute("ilist", iservice.invSelect(cri));
		model.addAttribute("pageMaker", new PageDTO(cri, iservice.invTotalCount(cri)));
	}
	
	// 재고 이동 팝업
	@GetMapping("inventory_move_popup")
	public void inventoryMovePopupGet(Model model, InventoryDTO idto, HttpSession session) {
		model.addAttribute("ilist", iservice.invDetailSelect(idto));
		model.addAttribute("storageName", iservice.storageNameGet());
		model.addAttribute("moveMsg", iservice.invMoveMsg());
		//session.setAttribute("login", value);
	}
	
	@PostMapping("inventory_move_popup")
	@ResponseBody
	public HashMap<String, Object> inventoryMovePopupPost(InventoryDTO idto, InventoryHistoryDTO ihdto) {
		iservice.moveRecInsert(ihdto);
		
		if(iservice.moveCheck(idto)==0) {
			System.out.println("중복되지 않습니다.");
			iservice.moveInsert(idto);
			// 재고 이동 시 새로 insert되는 재고 id 업데이트
			iservice.moveRecNewIdUpdate();
		} else {
			System.out.println("중복");
			iservice.moveUpdate(idto);
			iservice.moveRecDupIdUpdate(ihdto);
		}
		
		// 공통 업데이트
		iservice.moveCommonUpdate(idto);
		iservice.moveDelete();
		
		HashMap<String, Object> map=new HashMap<String, Object>();
		map.put("idto", idto);
		map.put("overlapid", iservice.moveOverlapIdSelect(idto));
		return map;
	}

	// 재고 조정
	@GetMapping("inventory_adjust")
	public void inventoryAdjustGet(Model model, Criteria cri) {
		model.addAttribute("ilist", iservice.invSelect(cri));
		model.addAttribute("pageMaker", new PageDTO(cri, iservice.invTotalCount(cri)));
		model.addAttribute("storageName", iservice.storageNameGet());
	}

	@PostMapping("inventory_adjust")
	@ResponseBody
	public InventoryDTO inventoryAdjustPost(InventoryDTO idto, InventoryHistoryDTO ihdto) {
		iservice.adjustUpdate(idto);
		iservice.adjustRecInsert(ihdto);
		return idto;
	}
	
	// 각 창고별 구역 목록 불러오기
	@GetMapping(value="sub/{stg}")
	@ResponseBody
	public ResponseEntity<ArrayList<StorageDTO>> list(@PathVariable("stg") String stg) {
		// @PathVariable : url에 변수 들어갈 때 추가 {bno}
		// 통신이 정상적이면 get() 결과를 ajax 함수 success로 보내라
		return new ResponseEntity<>(iservice.storageAreaNameGet(stg), HttpStatus.OK);
	}
	
	// 재고 이력 현황
	@GetMapping("inventory_history")
	public void inventoryHistoryGet(Criteria cri, Model model) {
		model.addAttribute("hlist", iservice.invHistorySelect(cri));
		model.addAttribute("pageMaker", new PageDTO(cri, iservice.invHistoryTotalCount(cri)));
	}
}
