package kh.com.a.service.Impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.com.a.dao.GenreDao;
import kh.com.a.dao.PositionDao;
import kh.com.a.model.PositionDto;
import kh.com.a.service.GenreService;
import kh.com.a.service.PositionService;

@Service
public class PositionServiceImpl implements PositionService {

	@Autowired
	PositionDao positionDao;

	@Override
	public List<PositionDto> getPositionList() {
		
		return positionDao.getPositionList();
	}
	
	
}
