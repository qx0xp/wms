package pyr.mycompany.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import pyr.mycompany.domain.MemberDTO;
import pyr.mycompany.mapper.MemberMapper;

@Service
public class MemberServiceImpl implements MemberService{
	@Autowired
	MemberMapper mmapper;
	
	// 아이디 중복 검사
	public int idOverlapCheck(String id) {
		return mmapper.idOverlapCheck(id);
	}
	// 계정 등록
	public void adminInsert(MemberDTO mdto) {
		mmapper.adminInsert(mdto);
	}
	// 로그인 회원 조회
	public MemberDTO loginSelect(MemberDTO mdto) {
		return mmapper.loginSelect(mdto);
	}
}
