package kh.com.a.dao.Impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.com.a.dao.GenreDao;
import kh.com.a.dao.PositionDao;
import kh.com.a.model.PositionDto;

@Repository
public class PositionDaoImpl implements PositionDao {

	@Autowired
	SqlSessionTemplate sqlSession;
	
	private String namespace="Position.";

	@Override
	public List<PositionDto> getPositionList() {
		
		List<PositionDto> list = sqlSession.selectList(namespace + "getPositionList");
		
		return list;
	}
	
	
}
