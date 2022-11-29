package pyr.mycompany.service;

import java.util.ArrayList;

import pyr.mycompany.domain.Criteria;
import pyr.mycompany.domain.InventoryDTO;
import pyr.mycompany.domain.InventoryHistoryDTO;
import pyr.mycompany.domain.InventoryMoveMessageDTO;
import pyr.mycompany.domain.StorageDTO;

public interface InventoryService {
	// 재고 목록 조회
	public ArrayList<InventoryDTO> invSelect(Criteria cri);
	// 재고 총 건 수 조회
	public Integer invTotalCount(Criteria cri);
	// 재고 상세 조회
	public ArrayList<InventoryDTO> invDetailSelect(InventoryDTO idto);
	// 창고 이름 조회
	public ArrayList<StorageDTO> storageNameGet();
	// 창고 구역 조회
	public ArrayList<StorageDTO> storageAreaNameGet(String opt);
	// 이동 사유 조회
	public ArrayList<InventoryMoveMessageDTO> invMoveMsg();
	// 재고 이동 시, 중복 확인 여부
	public int moveCheck(InventoryDTO idto);
	// 재고 이동 시, 재고 id 가져오기
	public String moveOverlapIdSelect(InventoryDTO idto);
	// 재고 이동 시, 공통 업데이트
	public void moveCommonUpdate(InventoryDTO idto);
	// 재고 이동 시, 중복 없다면 insert
	public void moveInsert(InventoryDTO idto);
	// 재고 이동 시, 중복 있다면 update
	public void moveUpdate(InventoryDTO idto);
	// 재고 이동 시, 총 재고 이동하면 delete
	public void moveDelete();
	// 재고 조정 update
	public void adjustUpdate(InventoryDTO idto);
	
	// 재고 이동 기록 insert
	public void moveRecInsert(InventoryHistoryDTO ihdto);
	// 재고 조정 기록 insert
	public void adjustRecInsert(InventoryHistoryDTO ihdto);
	
	// 재고 이력 조회
	public ArrayList<InventoryHistoryDTO> invHistorySelect(Criteria cri);
	// 재고 이력 조회 건 수
	public int invHistoryTotalCount(Criteria cri);
	
	// 재고 이동 시 새로 insert되는 재고 id 업데이트
	public void moveRecNewIdUpdate();
	// 재고 이동 시 중복되는 재고 id 업데이트
	public void moveRecDupIdUpdate(InventoryHistoryDTO ihdto);
}
