package pyr.mycompany.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import pyr.mycompany.domain.ClientDTO;
import pyr.mycompany.domain.Criteria;
import pyr.mycompany.mapper.ClientMapper;

@Service
public class ClientServiceImpl implements ClientService {
	@Autowired
	ClientMapper cmapper;
	// 팝업창 거래처 검색
	public ArrayList<ClientDTO> clientPopSelect(Criteria cri){
		return cmapper.clientPopSelect(cri);
	}
	// 팝업창 거래처 건 수 조회
	public int clientPopTotalCount(Criteria cri) {
		return cmapper.clientPopTotalCount(cri);
	}
	
	// 거래처 등록
	public void clientInsert(ClientDTO cdto) {
		cmapper.clientInsert(cdto);
	}
	// 거래처 조회
	public ArrayList<ClientDTO> clientSelect(Criteria cri){
		return cmapper.clientSelect(cri);
	}
	// 거래처 총 건수
	public int clientTotalCount(Criteria cri) {
		return cmapper.clientTotalCount(cri);
	}
	// 거래처 상세 내용 조회
	public ClientDTO clientDetail(ClientDTO cdto) {
		return cmapper.clientDetail(cdto);
	}
	// 거래처 수정
	public void clientModify(ClientDTO cdto) {
		cmapper.clientModify(cdto);
	}
	// 거래처 삭제
	public void clientDelete(ClientDTO cdto) {
		cmapper.clientDelete(cdto);
	}
}
