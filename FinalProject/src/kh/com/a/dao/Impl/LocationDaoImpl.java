package kh.com.a.dao.Impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.com.a.dao.GenreDao;
import kh.com.a.dao.LocationDao;
import kh.com.a.model.LocationDto;

@Repository
public class LocationDaoImpl implements LocationDao {

	@Autowired
	SqlSessionTemplate sqlSession;
	
	private String namespace="Location.";

	@Override
	public List<LocationDto> getLocationList() {
		
		List<LocationDto> list = sqlSession.selectList(namespace + "getLocationList");
		
		return list;
	}
	
	
}
