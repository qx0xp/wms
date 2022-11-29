package pyr.mycompany.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import pyr.mycompany.domain.Criteria;
import pyr.mycompany.domain.InventoryDTO;
import pyr.mycompany.domain.InventoryHistoryDTO;
import pyr.mycompany.domain.InventoryMoveMessageDTO;
import pyr.mycompany.domain.StorageDTO;
import pyr.mycompany.mapper.InventoryMapper;

@Service
public class InventoryServiceImpl implements InventoryService{
	@Autowired
	InventoryMapper imapper;
	// 재고 목록 조회
	public ArrayList<InventoryDTO> invSelect(Criteria cri){
		return imapper.invSelect(cri);
	}
	// 재고 총 건 수 조회
	public Integer invTotalCount(Criteria cri) {
		return imapper.invTotalCount(cri);
	}
	// 재고 상세 조회
	public ArrayList<InventoryDTO> invDetailSelect(InventoryDTO idto){
		return imapper.invDetailSelect(idto);
	}
	// 창고 이름 조회
	public ArrayList<StorageDTO> storageNameGet(){
		return imapper.storageNameGet();
	}
	// 창고 구역 조회
	public ArrayList<StorageDTO> storageAreaNameGet(String opt){
		return imapper.storageAreaNameGet(opt);
	}
	// 이동 사유 조회
	public ArrayList<InventoryMoveMessageDTO> invMoveMsg(){
		return imapper.invMoveMsg();
	}
	// 재고 이동 시, 중복 확인 여부
	public int moveCheck(InventoryDTO idto) {
		return imapper.moveCheck(idto);
	}
	// 재고 이동 시, 재고 id 가져오기
	public String moveOverlapIdSelect(InventoryDTO idto) {
		return imapper.moveOverlapIdSelect(idto);
	}
	
	// 재고 이동 시, 공통 업데이트
	public void moveCommonUpdate(InventoryDTO idto) {
		imapper.moveCommonUpdate(idto);
	}
	// 재고 이동 시, 중복 없다면 insert
	public void moveInsert(InventoryDTO idto) {
		imapper.moveInsert(idto);
	}
	// 재고 이동 시, 중복 있다면 update
	public void moveUpdate(InventoryDTO idto) {
		imapper.moveUpdate(idto);
	}
	// 재고 이동 시, 총 재고 이동하면 delete
	public void moveDelete() {
		imapper.moveDelete();
	}
	// 재고 조정 update
	public void adjustUpdate(InventoryDTO idto) {
		imapper.adjustUpdate(idto);
	}
	
	// 재고 이동 기록 insert
	public void moveRecInsert(InventoryHistoryDTO ihdto) {
		imapper.moveRecInsert(ihdto);
	}
	// 재고 조정 기록 insert
	public void adjustRecInsert(InventoryHistoryDTO ihdto) {
		imapper.adjustRecInsert(ihdto);
	}
	
	// 재고 이력 조회
	public ArrayList<InventoryHistoryDTO> invHistorySelect(Criteria cri){
		return imapper.invHistorySelect(cri);
	}
	// 재고 이력 조회 건 수
	public int invHistoryTotalCount(Criteria cri) {
		return imapper.invHistoryTotalCount(cri);
	}
	
	// 재고 이동 시 새로 insert되는 재고 id 업데이트
	public void moveRecNewIdUpdate() {
		imapper.moveRecNewIdUpdate();
	}
	// 재고 이동 시 중복되는 재고 id 업데이트
	public void moveRecDupIdUpdate(InventoryHistoryDTO ihdto) {
		imapper.moveRecDupIdUpdate(ihdto);
	}
}
