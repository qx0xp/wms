package pyr.mycompany.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import pyr.mycompany.domain.Criteria;
import pyr.mycompany.domain.PageDTO;
import pyr.mycompany.domain.RawDTO;
import pyr.mycompany.service.RawService;

@Controller
@RequestMapping("/")
public class RawController {
	@Autowired
	RawService rservice;
	
	@GetMapping("raw_upload")
	public void rawUploadGet() {
	}
	
	@PostMapping("raw_upload")
	@ResponseBody
	public RawDTO rawUploadPost(RawDTO rdto) {
		rservice.rawInsert(rdto);
		return rdto;
	}
	
	@GetMapping("raw_admin")
	public void rawAdminGet(Criteria cri, Model model) {
		model.addAttribute("rlist", rservice.rawSelect(cri));
		model.addAttribute("pageMaker", new PageDTO(cri, rservice.rawTotalCount(cri)));
	}
	
	@GetMapping("raw_modify")
	public void clientModifyGet(RawDTO rdto, Model model) {
		System.out.println("원자재 상세 정보 : " + rservice.rawDetail(rdto));
		model.addAttribute("rdetail", rservice.rawDetail(rdto));
	}
	
	@PostMapping("raw_modify")
	@ResponseBody
	public RawDTO clientModifyPost(RawDTO rdto) {
		rservice.rawModify(rdto);
		return rdto;
	}
	
	@PostMapping("raw_delete")
	@ResponseBody
	public RawDTO clientDeletePost(RawDTO rdto) {
		rservice.rawDelete(rdto);
		return rdto;
	}
}
