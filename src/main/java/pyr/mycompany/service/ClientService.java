package pyr.mycompany.service;

import java.util.ArrayList;

import pyr.mycompany.domain.ClientDTO;
import pyr.mycompany.domain.Criteria;

public interface ClientService {
	// 팝업창 거래처 검색
	public ArrayList<ClientDTO> clientPopSelect(Criteria cri);
	// 팝업창 거래처 건 수 조회
	public int clientPopTotalCount(Criteria cri);
	
	// 거래처 등록
	public void clientInsert(ClientDTO cdto);
	// 거래처 조회
	public ArrayList<ClientDTO> clientSelect(Criteria cri);
	// 거래처 총 건수
	public int clientTotalCount(Criteria cri);
	// 거래처 상세 내용 조회
	public ClientDTO clientDetail(ClientDTO cdto);
	// 거래처 수정
	public void clientModify(ClientDTO cdto);
	// 거래처 삭제
	public void clientDelete(ClientDTO cdto);
}
