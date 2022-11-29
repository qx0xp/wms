package pyr.mycompany.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import pyr.mycompany.domain.ClientDTO;
import pyr.mycompany.domain.Criteria;
import pyr.mycompany.domain.PageDTO;
import pyr.mycompany.service.ClientService;

@Controller
@RequestMapping("/")
public class ClientController {
	@Autowired
	ClientService cservice;
	
	@GetMapping("clientcode")
	public void clientcodeGet(Criteria cri, Model model) {
		cri.setAmount(5);
		model.addAttribute("clist", cservice.clientPopSelect(cri));
		model.addAttribute("pageMaker", new PageDTO(cri, cservice.clientPopTotalCount(cri)));
	}
	
	@GetMapping("client_upload")
	public void clientUploadGet(ClientDTO cdto) {}
	
	@PostMapping("client_upload")
	@ResponseBody
	public ClientDTO clientUploadPost(ClientDTO cdto) {
		cservice.clientInsert(cdto);
		return cdto;
	}
	
	@GetMapping("client_admin")
	public void clientAdminGet(Criteria cri, Model model) {
		model.addAttribute("clist", cservice.clientSelect(cri));
		model.addAttribute("pageMaker", new PageDTO(cri, cservice.clientTotalCount(cri)));
	}
	
	@GetMapping("client_modify")
	public void clientModifyGet(ClientDTO cdto, Model model) {
		System.out.println(cservice.clientDetail(cdto));
		model.addAttribute("cdetail", cservice.clientDetail(cdto));
	}
	
	@PostMapping("client_modify")
	@ResponseBody
	public ClientDTO clientModifyPost(ClientDTO cdto) {
		cservice.clientModify(cdto);
		return cdto;
	}
	
	@PostMapping("client_delete")
	@ResponseBody
	public ClientDTO clientDeletePost(ClientDTO cdto) {
		cservice.clientDelete(cdto);
		return cdto;
	}
}
