package kh.com.a.service.Impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.com.a.dao.TimetableDao;
import kh.com.a.model.TimetableDto;
import kh.com.a.service.TimetableService;

@Service
public class TimetableServiceImpl implements TimetableService {
	@Autowired
	TimetableDao timetableDao;

	@Override
	public List<TimetableDto> getTimeTable() {
		return timetableDao.getTimeTable();
		
	}
	
	
}
