package pyr.mycompany.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import pyr.mycompany.domain.Criteria;
import pyr.mycompany.domain.InventoryDTO;
import pyr.mycompany.domain.InventoryHistoryDTO;
import pyr.mycompany.domain.ItemDTO;
import pyr.mycompany.domain.ReceivingDTO;
import pyr.mycompany.domain.ReceivingExpectDTO;
import pyr.mycompany.domain.StorageDTO;
import pyr.mycompany.mapper.ReceivingMapper;

@Service
public class ReceivingServiceImpl implements ReceivingService{
	@Autowired
	private ReceivingMapper rmapper;
	
	//입고등록 글쓰기
	public void regist(ReceivingExpectDTO expect) {
		rmapper.regist(expect);
	}
	
	// 창고 이름 조회
	public ArrayList<StorageDTO> storageNameGet(){
		return rmapper.storageNameGet();
	}
	// 창고 구역 조회
	public ArrayList<StorageDTO> storageAreaNameGet(String opt){
		return rmapper.storageAreaNameGet(opt);
	}
	
	//입고예정 목록리스트 -구현
	public ArrayList<ReceivingExpectDTO> expect_list(Criteria cri) {
		 return rmapper.expect_list(cri);
	}
	
	//입고예정목록 페이징에 쓰일 데이터건수 -구현
	public int expectTotalCount(Criteria cri) {
		return rmapper.expectTotalCount(cri);
	}
	
	//입고예정코드를 보내서 수정하기위한 상세정보를 받아옴
	public ReceivingExpectDTO expect_modify(ReceivingExpectDTO expect) {
		return rmapper.expect_modify(expect);
	}
	
	//입고예정내용 수정하고 업데이트
	public void expect_update(ReceivingExpectDTO expect) {
		rmapper.expect_update(expect);
	}	
	
	//입고예정에서 입고지시 상태변경 업데이트
	public void expect_instruct(ReceivingExpectDTO expect) {
		rmapper.expect_instruct(expect);
	}	
	
	//입고예정삭제
	public void expect_delete(ReceivingExpectDTO expect) {
		rmapper.expect_delete(expect);
	}	

	//품목코드 목록리스트 -구현
	public ArrayList<ItemDTO> item_list(Criteria cri) {
		//System.out.println("service cri="+cri);
		//System.out.println("service list="+bmapper.list(cri));
		return rmapper.item_list(cri);
	}
	
	//품록목록 페이징에 쓰일 데이터건수 -구현
	//return해서 데이터건수 받아와야함
	public int getTotalCount(Criteria cri) {
		return rmapper.getTotalCount(cri);
	}

	//입고 목록리스트 -구현
	public ArrayList<ReceivingDTO> status_list(Criteria cri) {
		return rmapper.status_list(cri);
	}
	
	//입고목록 페이징에 쓰일 데이터건수 -구현
	public int receivingTotalCount(Criteria cri) {
		return rmapper.receivingTotalCount(cri);
	}
	
	//입고예정코드를 보내서 수정하기위한 상세정보를 받아옴
	public ReceivingExpectDTO modify(ReceivingExpectDTO expect) {
		return rmapper.modify(expect);
	}
	
	//내용수정하고 업데이트
	public void update(ReceivingExpectDTO expect) {
		rmapper.update(expect);
	}	
	
	//입고 지시된 항목 철회 상태 다시 0으로 바꿈
	public void receiving_back(ReceivingExpectDTO expect) {
		rmapper.receiving_back(expect);
	}
	
	//상태변경 업데이트
	public void confirm(ReceivingExpectDTO expect) {
		rmapper.confirm(expect);
	}	
	
	//입고목록으로 등록
	public void r_upload(ReceivingDTO receiving) {
		rmapper.r_upload(receiving);
	}
	
	//재고 중복 확인
	public int invDupCheck(InventoryDTO inventory) {
		return rmapper.invDupCheck(inventory);
	}
	
	//재고 중복 시 업데이트
	public void invUpdate(InventoryDTO inventory) {
		rmapper.invUpdate(inventory);
	}
	
	//재고목록으로 등록
	public void invUpload(InventoryDTO inventory) {
		rmapper.invUpload(inventory);
	}
	
	//입고삭제
	public void delete(ReceivingExpectDTO expect) {
		rmapper.delete(expect);
	}
	
	//입고확정페이지에 입고목록리스트
	public ArrayList<ReceivingDTO> confirm_list(Criteria cri){
		System.out.println("service cri="+cri);
//		System.out.println("service list="+rmapper.confirm_list(cri));
		
		ArrayList<ReceivingDTO> check = rmapper.confirm_list(cri);
		System.out.println("check");
		System.out.println(check);
		return check;
	}
	
	//입고확정목록 페이징에 쓰일 데이터건수 -설계
	public int confirmTotalCount(Criteria cri) {
		return rmapper.confirmTotalCount(cri);
	}
	
	
	// 입고 확정과 동시에 재고 등록 & 재고 이력 데이터 insert
	public void recHistoryInsert(InventoryHistoryDTO ihdto) {
		rmapper.recHistoryInsert(ihdto);
	}
	// 재고 등록 시, 새로 insert되는 재고id 등록
	public void recNewIdUpdate() {
		rmapper.recNewIdUpdate();
	}
	// 재고 등록 시, 중복되는 재고id 등록
	public void recDupIdUpdate(InventoryHistoryDTO ihdto) {
		rmapper.recDupIdUpdate(ihdto);
	}
}
