package pyr.mycompany.service;

import java.util.ArrayList;

import pyr.mycompany.domain.Criteria;
import pyr.mycompany.domain.RawDTO;

public interface RawService {
	// 원자재 등록
	public void rawInsert(RawDTO rdto);
	// 원자재 목록 조회
	public ArrayList<RawDTO> rawSelect(Criteria cri);
	// 원자재 총 건수
	public int rawTotalCount(Criteria cri);
	// 원자재 상세 내용 조회
	public RawDTO rawDetail(RawDTO rdto);
	// 원자재 수정
	public void rawModify(RawDTO rdto);
	// 원자재 삭제
	public void rawDelete(RawDTO rdto);
}
