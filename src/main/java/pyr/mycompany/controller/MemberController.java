package pyr.mycompany.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import pyr.mycompany.domain.MemberDTO;
import pyr.mycompany.service.MemberService;

@Controller
@RequestMapping("/")
public class MemberController {
	@Autowired
	MemberService mservice;
	
	@GetMapping("")
	public String loginGet(){
		return "login";
	}
	
	@PostMapping("")
	public String loginPost(MemberDTO mdto, HttpSession session) {
		if(mservice.loginSelect(mdto)!=null) {
			System.out.println(mservice.loginSelect(mdto));
			session.setAttribute("login", mservice.loginSelect(mdto));
			return "redirect:receiving_expect";
		} else {
			return "redirect:login";
		}
	}
	
	@GetMapping("logout")
	public String logoutGet(HttpSession session) {
		session.invalidate();
		return "redirect:receiving_status";
	}
	
	@GetMapping("join")
	public void joinGet() {
	}
	
	@PostMapping("join")
	public void joinPost(MemberDTO mdto) {
		mservice.adminInsert(mdto);
	}
	
	@GetMapping(value="id_check/{id}")
	@ResponseBody
	public int idCheck(@PathVariable("id") String id) {
		if(mservice.idOverlapCheck(id)>0) {
			System.out.println("중복되었습니다.");
		} else {
			System.out.println("중복 아님");
		}
		return mservice.idOverlapCheck(id);
	}
}
