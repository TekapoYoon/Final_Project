package kh.com.a.dao.Impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.com.a.dao.TimetableDao;
import kh.com.a.model.TimetableDto;

@Repository
public class TimetableDaoImpl implements TimetableDao {

	@Autowired
	SqlSessionTemplate sqlSession;
	
	private String namespace="Timetable.";
	
	@Override
	public List<TimetableDto> getTimeTable() {
		List<TimetableDto> list = sqlSession.selectList(namespace + "getTimetableList");
		return list;
	}

}
