package pyr.mycompany.mapper;

import pyr.mycompany.domain.MemberDTO;

public interface MemberMapper {
	// 아이디 중복 검사
	public int idOverlapCheck(String id);
	// 계정 등록
	public void adminInsert(MemberDTO mdto);
	// 로그인 회원 조회
	public MemberDTO loginSelect(MemberDTO mdto);
}
