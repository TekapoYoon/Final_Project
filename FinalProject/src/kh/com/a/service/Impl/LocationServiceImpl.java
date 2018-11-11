package kh.com.a.service.Impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.com.a.dao.GenreDao;
import kh.com.a.dao.LocationDao;
import kh.com.a.model.LocationDto;
import kh.com.a.service.GenreService;
import kh.com.a.service.LocationService;

@Service
public class LocationServiceImpl implements LocationService {

	@Autowired
	LocationDao locationDao;

	@Override
	public List<LocationDto> getLocationList() {
	
		return locationDao.getLocationList();
	}
	
	
}
