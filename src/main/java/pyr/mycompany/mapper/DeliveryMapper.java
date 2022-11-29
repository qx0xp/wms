package pyr.mycompany.mapper;

import java.util.ArrayList;

import pyr.mycompany.domain.Criteria;
import pyr.mycompany.domain.DeliveryDTO;
import pyr.mycompany.domain.DeliveryExpectDTO;
import pyr.mycompany.domain.InventoryDTO;
import pyr.mycompany.domain.InventoryHistoryDTO;

public interface DeliveryMapper {

	//재고품목 목록리스트 -설계
	public ArrayList<InventoryDTO> inventory_item_list(Criteria cri);
	
	//재고품목목록 페이징에 쓰일 데이터건수 -설계
	public int deliveryTotalCount(Criteria cri);
	
	//출고등록 쓰기
	public void d_regist(DeliveryExpectDTO expect);
	
	//출고예정 목록리스트 -설계
	public ArrayList<DeliveryExpectDTO> d_expect_list(Criteria cri);
		
	//출고예정목록 페이징에 쓰일 데이터건수 -설계
	public int d_expectTotalCount(Criteria cri);
	
	//출고예정코드를 보내서 수정하기위한 상세정보를 받아옴
	public DeliveryExpectDTO d_expect_modify(DeliveryExpectDTO expect);
	
	//출고예정내용 수정하고 업데이트
	public void d_expect_update(DeliveryExpectDTO expect);
	
	//출고예정에서 출고지시 상태변경 업데이트
	public void d_expect_instruct(DeliveryExpectDTO expect);
	
	//출고예정삭제
	public void d_expect_delete(DeliveryExpectDTO expect);
	
	//출고 대기목록리스트 -설계
	public ArrayList<DeliveryExpectDTO> d_status_list(Criteria cri);
		
	//출고대기목록 페이징에 쓰일 데이터건수 -설계
	public int statusTotalCount(Criteria cri);
	
	//출고예정코드를 보내서 수정하기위한 상세정보를 받아옴
	public DeliveryExpectDTO d_modify(DeliveryExpectDTO expect);
	
	//내용수정하고 업데이트
	public void d_update(DeliveryExpectDTO expect);
	
	//출고대기에서 출고지시 철회 업데이트
	public void delivery_back(DeliveryExpectDTO expect);
	
	//상태변경 업데이트
	public void d_confirm(DeliveryExpectDTO expect);
	
	//출고목록으로 등록
	public void d_upload(DeliveryDTO delivery);
	
	//재고목록의 수량 업데이트
	public void i_update(InventoryDTO inventory);
	
	//출고 확정과 동시에 real_quantity 수량 빼기
	public void real_update(DeliveryDTO delivery);
	
	//출고 확정과 동시에 reql_quantity와 inventory_quantity 수량이 0이면 재고 삭제
	public void invRealDelete(InventoryDTO inventory);
	
	//출고 확정과 동시에 재고 이력 insert
	public void delHistoryInsert(InventoryHistoryDTO ihdto);
	
	//출고 시, 총 재고 등록하면 재고 delete
	public void delDelete();
	
	//출고확정페이지에 출고목록리스트
	public ArrayList<DeliveryDTO> d_confirm_list(Criteria cri);

	//출고확정목록 페이징에 쓰일 데이터건수 -설계
	public int dConfirmTotalCount(Criteria cri);
	
}
