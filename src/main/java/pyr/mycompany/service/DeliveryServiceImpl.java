package pyr.mycompany.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import pyr.mycompany.domain.Criteria;
import pyr.mycompany.domain.DeliveryDTO;
import pyr.mycompany.domain.DeliveryExpectDTO;
import pyr.mycompany.domain.InventoryDTO;
import pyr.mycompany.domain.InventoryHistoryDTO;
import pyr.mycompany.domain.ReceivingDTO;
import pyr.mycompany.domain.ReceivingExpectDTO;
import pyr.mycompany.mapper.DeliveryMapper;

@Service
public class DeliveryServiceImpl implements DeliveryService {

	@Autowired
	private DeliveryMapper dmapper;
	
	//품목코드 목록리스트 -구현
	public ArrayList<InventoryDTO> inventory_item_list(Criteria cri) {
		return dmapper.inventory_item_list(cri);
	}
	
	//재고품목목록 페이징에 쓰일 데이터건수 -구현
	public int deliveryTotalCount(Criteria cri) {
		return dmapper.deliveryTotalCount(cri);
	}
	
	//출고등록 글쓰기
	public void d_regist(DeliveryExpectDTO expect) {
		dmapper.d_regist(expect);
	}
	
	//출고예정 목록리스트 -구현
	public ArrayList<DeliveryExpectDTO> d_expect_list(Criteria cri) {
		 return dmapper.d_expect_list(cri);
	}
	
	//출고예정목록 페이징에 쓰일 데이터건수 -구현
	public int d_expectTotalCount(Criteria cri) {
		return dmapper.d_expectTotalCount(cri);
	}
	
	//출고예정코드를 보내서 수정하기위한 상세정보를 받아옴
	public DeliveryExpectDTO d_expect_modify(DeliveryExpectDTO expect) {
		return dmapper.d_expect_modify(expect);
	}
	
	//출고예정내용 수정하고 업데이트
	public void d_expect_update(DeliveryExpectDTO expect) {
		dmapper.d_expect_update(expect);
	}	
	
	//입고예정에서 입고지시 상태변경 업데이트
	public void d_expect_instruct(DeliveryExpectDTO expect) {
		dmapper.d_expect_instruct(expect);
	}
	
	//입고예정삭제
	public void d_expect_delete(DeliveryExpectDTO expect) {
		dmapper.d_expect_delete(expect);
	}
	
	//출고대기 목록리스트 -구현
	public ArrayList<DeliveryExpectDTO> d_status_list(Criteria cri) {
		return dmapper.d_status_list(cri);
	}
	
	//입고목록 페이징에 쓰일 데이터건수 -구현
	public int statusTotalCount(Criteria cri) {
		return dmapper.statusTotalCount(cri);
	}
	
	//출고예정코드를 보내서 수정하기위한 상세정보를 받아옴
	public DeliveryExpectDTO d_modify(DeliveryExpectDTO expect) {
		return dmapper.d_modify(expect);
	}
	
	//내용수정하고 업데이트
	public void d_update(DeliveryExpectDTO expect) {
		dmapper.d_update(expect);
	}
	
	//출고대기에서 출고지시 철회 업데이트
	public void delivery_back(DeliveryExpectDTO expect) {
		dmapper.delivery_back(expect);
	}
	
	//상태변경 업데이트
	public void d_confirm(DeliveryExpectDTO expect) {
		dmapper.d_confirm(expect);
	}	
	
	//출고목록으로 등록
	public void d_upload(DeliveryDTO delivery) {
		dmapper.d_upload(delivery);
	}
	
	//재고목록의 수량 업데이트
	public void i_update(InventoryDTO inventory) {
		dmapper.i_update(inventory);
	}
	
	//출고 확정과 동시에 real_quantity 수량 빼기
	public void real_update(DeliveryDTO delivery) {
		dmapper.real_update(delivery);
	}
	
	//출고 확정과 동시에 reql_quantity와 inventory_quantity 수량이 0이면 재고 삭제
	public void invRealDelete(InventoryDTO inventory) {
		dmapper.invRealDelete(inventory);
	}
	
	//출고 확정과 동시에 재고 이력 insert
	public void delHistoryInsert(InventoryHistoryDTO ihdto) {
		dmapper.delHistoryInsert(ihdto);
	}
	
	//출고 시, 총 재고 등록하면 재고 delete
	public void delDelete() {
		dmapper.delDelete();
	}
	
	//출고확정페이지에 출고목록리스트
	public ArrayList<DeliveryDTO> d_confirm_list(Criteria cri) {
		 return dmapper.d_confirm_list(cri);
	}
	
	//출고확정목록 페이징에 쓰일 데이터건수 -설계
	public int dConfirmTotalCount(Criteria cri) {
		return dmapper.dConfirmTotalCount(cri);
	}
	
	
}
