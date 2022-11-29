package pyr.mycompany.mapper;

import java.util.ArrayList;

import pyr.mycompany.domain.Criteria;
import pyr.mycompany.domain.InventoryDTO;
import pyr.mycompany.domain.InventoryHistoryDTO;
import pyr.mycompany.domain.ItemDTO;
import pyr.mycompany.domain.ReceivingDTO;
import pyr.mycompany.domain.ReceivingExpectDTO;
import pyr.mycompany.domain.StorageDTO;

public interface ReceivingMapper {
	//입고등록 글쓰기 db작업 - 설계
	public void regist(ReceivingExpectDTO expect);
	
	// 창고 이름 조회
	public ArrayList<StorageDTO> storageNameGet();
	// 창고 구역 조회
	public ArrayList<StorageDTO> storageAreaNameGet(String opt);
	
	//입고예정 목록리스트 -설계
	public ArrayList<ReceivingExpectDTO> expect_list(Criteria cri);
		
	//입고예정목록 페이징에 쓰일 데이터건수 DB작업 -설계
	public int expectTotalCount(Criteria cri);
	
	//입고예정코드를 보내서 수정하기위한 상세정보를 받아옴
	public ReceivingExpectDTO expect_modify(ReceivingExpectDTO expect);
	
	//입고예정내용 수정하고 업데이트
	public void expect_update(ReceivingExpectDTO expect);
	
	//입고예정에서 입고지시 상태변경 업데이트
	public void expect_instruct(ReceivingExpectDTO expect);
	
	//입고예정삭제
	public void expect_delete(ReceivingExpectDTO expect);
	
	//품목코드 목록리스트와 관련이 되어있는 DB작업 -설계
	public ArrayList<ItemDTO> item_list(Criteria cri);
	
	//품목목록 페이징에 쓰일 데이터건수 DB작업 -설계
	public int getTotalCount(Criteria cri);
		
	//품목코드 목록리스트와 관련이 되어있는 DB작업 -설계
	public ArrayList<ReceivingDTO> status_list(Criteria cri);
		
	//입고목록 페이징에 쓰일 데이터건수 DB작업 -설계
	public int receivingTotalCount(Criteria cri);
	
	//입고예정코드를 보내서 수정하기위한 상세정보를 받아옴
	public ReceivingExpectDTO modify(ReceivingExpectDTO expect);
	
	//내용수정하고 업데이트
	public void update(ReceivingExpectDTO expect);
	
	//입고 지시된 항목 철회 상태 다시 0으로 바꿈
	public void receiving_back(ReceivingExpectDTO expect);
	
	//상태변경 업데이트
	public void confirm(ReceivingExpectDTO expect);
	
	//입고목록으로 등록
	public void r_upload(ReceivingDTO receiving);
	
	//재고 중복 확인
	public int invDupCheck(InventoryDTO inventory);
	
	//재고 중복 시 업데이트
	public void invUpdate(InventoryDTO inventory);
	
	//재고목록으로 등록
	public void invUpload(InventoryDTO inventory);
	
	//입고삭제
	public void delete(ReceivingExpectDTO expect);
	
	//입고확정페이지에 입고목록리스트
	public ArrayList<ReceivingDTO> confirm_list(Criteria cri);
	
	//입고확정목록 페이징에 쓰일 데이터건수 -설계
	public int confirmTotalCount(Criteria cri);
	
	// 입고 확정과 동시에 재고 등록 & 재고 이력 데이터 insert
	public void recHistoryInsert(InventoryHistoryDTO ihdto);
	// 재고 등록 시, 새로 insert되는 재고id 등록
	public void recNewIdUpdate();
	// 재고 등록 시, 중복되는 재고id 등록
	public void recDupIdUpdate(InventoryHistoryDTO ihdto);
}
