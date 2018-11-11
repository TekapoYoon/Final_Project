package kh.com.a.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import kh.com.a.dao.ScheduleBBSDao;
import kh.com.a.model.Param;
import kh.com.a.model.PerformScheduleBBSDto;
import kh.com.a.model.ScheduleBBSDto;

public interface PerformScheduleBBSService {
	
	public List<PerformScheduleBBSDto> getPerformSchedulPagingList(Param param);
	public int getPerformScheduleBBSCount(Param param);
	
	public PerformScheduleBBSDto getPerformScheduleBBSDto(int perform_schedule_seq);
	public void addPerformSchedule(PerformScheduleBBSDto dto);
	public int getPerformScheduleSeqMax();
	public List<PerformScheduleBBSDto> latelyPerformSchedules();
}
