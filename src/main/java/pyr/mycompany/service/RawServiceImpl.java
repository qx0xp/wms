package pyr.mycompany.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import pyr.mycompany.domain.Criteria;
import pyr.mycompany.domain.RawDTO;
import pyr.mycompany.mapper.RawMapper;

@Service
public class RawServiceImpl implements RawService{
	@Autowired
	RawMapper rmapper;

	// 원자재 등록
	public void rawInsert(RawDTO rdto) {
		rmapper.rawInsert(rdto);
	}
	// 원자재 목록 조회
	public ArrayList<RawDTO> rawSelect(Criteria cri){
		return rmapper.rawSelect(cri);
	}
	// 원자재 총 건수
	public int rawTotalCount(Criteria cri) {
		return rmapper.rawTotalCount(cri);
	}
	// 원자재 상세 내용 조회
	public RawDTO rawDetail(RawDTO rdto) {
		return rmapper.rawDetail(rdto);
	}
	// 원자재 수정
	public void rawModify(RawDTO rdto) {
		rmapper.rawModify(rdto);
	}
	// 원자재 삭제
	public void rawDelete(RawDTO rdto) {
		rmapper.rawDelete(rdto);
	}
}
