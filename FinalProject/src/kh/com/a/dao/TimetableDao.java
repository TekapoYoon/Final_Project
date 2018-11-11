package kh.com.a.dao;

import java.util.List;

import kh.com.a.model.TimetableDto;

public interface TimetableDao {
	List<TimetableDto> getTimeTable();
}
