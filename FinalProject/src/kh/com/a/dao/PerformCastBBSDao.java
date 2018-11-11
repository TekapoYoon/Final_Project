package kh.com.a.dao;

import java.util.List;

import kh.com.a.model.PerformCastBBSDto;

public interface PerformCastBBSDao {

	public boolean sendCompInfo(PerformCastBBSDto dto) throws Exception;
	
	public List<PerformCastBBSDto> getCastBbs();
	
	public List<PerformCastBBSDto> getMoreList(PerformCastBBSDto dto);
	
	public void approveAf(int seq_approve);

	public PerformCastBBSDto getPerformCastInfo(int perform_seq);
	
	

}
