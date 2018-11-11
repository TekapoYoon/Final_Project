package kh.com.a.service.Impl;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.com.a.dao.PerformScheduleBBSDao;
import kh.com.a.model.Param;
import kh.com.a.model.PerformScheduleBBSDto;
import kh.com.a.service.PerformScheduleBBSService;

@Service
public class PerformScheduleBBSServiceImpl implements PerformScheduleBBSService {
	
	@Autowired
	PerformScheduleBBSDao dao;

	@Override
	public List<PerformScheduleBBSDto> getPerformSchedulPagingList(Param param) {
		// TODO Auto-generated method stub
		return dao.getPerformSchedulPagingList(param);
	}

	@Override
	public int getPerformScheduleBBSCount(Param param) {
		// TODO Auto-generated method stub
		return dao.getPerformScheduleBBSCount(param);
	}

	@Override
	public PerformScheduleBBSDto getPerformScheduleBBSDto(int perform_schedule_seq) {
		// TODO Auto-generated method stub
		return dao.getPerformScheduleBBSDto(perform_schedule_seq);
	}

	@Override
	public void addPerformSchedule(PerformScheduleBBSDto dto) {
		dao.addPerformSchedule(dto);
		
	}

	@Override
	public int getPerformScheduleSeqMax() {
		// TODO Auto-generated method stub
		return dao.getPerformScheduleSeqMax();
	}

	@Override
	public List<PerformScheduleBBSDto> latelyPerformSchedules() {

		return dao.latelyPerformSchedules();
	}

	
	
}	
