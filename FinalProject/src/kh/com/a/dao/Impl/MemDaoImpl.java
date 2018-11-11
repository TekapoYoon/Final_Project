package kh.com.a.dao.Impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.com.a.dao.MemDao;
import kh.com.a.model.MemDto;


@Repository
public class MemDaoImpl implements MemDao{

	@Autowired
	SqlSessionTemplate sqlSession;

	private String namespace="Mem.";
	
	@Override
	public void addMusition(MemDto dto) {
		// TODO Auto-generated method stub
		sqlSession.insert(namespace + "addMusition",dto);
	}
	@Override
	public void addGeneral(MemDto dto) {
		// TODO Auto-generated method stub
		sqlSession.insert(namespace + "addGeneral",dto);
		
	}
	@Override
	public MemDto login(String id) {
		return sqlSession.selectOne(namespace + "login",id);
	}
	@Override
	public void updateMusition(MemDto dto) {
		sqlSession.update(namespace + "updateMusition",dto);
	}
	@Override
	public void updateGeneral(MemDto dto) {
		sqlSession.update(namespace + "updateGeneral",dto);
		
	}
	

}
