package pyr.mycompany.mapper;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import pyr.mycompany.domain.Criteria;
import pyr.mycompany.domain.DeliveryReportDTO;
import pyr.mycompany.domain.ReceivingReportDTO;

public interface StatusReportMapper {
	//입고 그래프리스트
	public ArrayList<ReceivingReportDTO> receiving_report(Criteria cri);
	//입고 그래프리스트
	public ArrayList<DeliveryReportDTO> delivery_report(Criteria cri);
	
	// 월별 입고 건 수 조회
	public List<Map<String, Object>> recByMonth(Criteria cri);
	// 월별 출고 건 수 조회
	public List<Map<String, Object>> delByMonth(Criteria cri);
}
