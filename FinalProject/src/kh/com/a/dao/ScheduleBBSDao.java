package kh.com.a.dao;

import java.util.List;

import kh.com.a.model.ScheduleBBSDto;

public interface ScheduleBBSDao {

	List<ScheduleBBSDto> getComingSchedule();
	
	List<ScheduleBBSDto> getIngSchedule();
	
	List<ScheduleBBSDto> getScheduleList() throws Exception;
	
	ScheduleBBSDto getSchedule(int seq) throws Exception;
	
	boolean writeBbs(ScheduleBBSDto dto) throws Exception;
}
