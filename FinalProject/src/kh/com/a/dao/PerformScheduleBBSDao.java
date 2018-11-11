package kh.com.a.dao;

import java.util.List;

import kh.com.a.model.Param;
import kh.com.a.model.PerformScheduleBBSDto;
import kh.com.a.model.ScheduleBBSDto;

public interface PerformScheduleBBSDao {

	public List<PerformScheduleBBSDto> getPerformSchedulPagingList(Param param);
	public int getPerformScheduleBBSCount(Param param);
	
	public PerformScheduleBBSDto getPerformScheduleBBSDto(int perform_schedule_seq);
	public void addPerformSchedule(PerformScheduleBBSDto dto);
	public int getPerformScheduleSeqMax();
	public List<PerformScheduleBBSDto> latelyPerformSchedules();
}
