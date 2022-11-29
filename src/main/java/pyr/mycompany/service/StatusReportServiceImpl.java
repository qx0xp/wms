package pyr.mycompany.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import pyr.mycompany.domain.Criteria;
import pyr.mycompany.domain.DeliveryReportDTO;
import pyr.mycompany.domain.ReceivingReportDTO;
import pyr.mycompany.mapper.StatusReportMapper;

@Service
public class StatusReportServiceImpl implements StatusReportService{
	@Autowired
	private StatusReportMapper tmapper; 
	
	//입고 그래프리스트
	public ArrayList<ReceivingReportDTO> receiving_report(Criteria cri){
		return tmapper.receiving_report(cri);
	}
	//출고 그래프리스트
	public ArrayList<DeliveryReportDTO> delivery_report(Criteria cri){
		return tmapper.delivery_report(cri);
	}
		
	// 월별 입고 건 수 조회
	public List<Map<String, Object>> recByMonth(Criteria cri) {
		return tmapper.recByMonth(cri);
	}
	// 월별 출고 건 수 조회
	public List<Map<String, Object>> delByMonth(Criteria cri){
		return tmapper.delByMonth(cri);
	}
}
