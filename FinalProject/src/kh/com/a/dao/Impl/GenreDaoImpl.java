package kh.com.a.dao.Impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.com.a.dao.GenreDao;
import kh.com.a.model.GenreDto;

@Repository
public class GenreDaoImpl implements GenreDao {

	@Autowired
	SqlSessionTemplate sqlSession;

	private String namespace="Genre.";
	
	@Override
	public List<GenreDto> getGenreList() {
		
		List<GenreDto> list = sqlSession.selectList(namespace + "getGenreList");
		
		return list;
	}
}
