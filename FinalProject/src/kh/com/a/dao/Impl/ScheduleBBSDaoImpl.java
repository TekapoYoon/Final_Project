package kh.com.a.dao.Impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.com.a.dao.ScheduleBBSDao;
import kh.com.a.model.ScheduleBBSDto;

@Repository
public class ScheduleBBSDaoImpl implements ScheduleBBSDao {
	@Autowired
	SqlSessionTemplate sqlSession;
	
	private String namespace = "ScheduleBBS.";

	@Override
	public List<ScheduleBBSDto> getComingSchedule() {
		return sqlSession.selectList(namespace + "getComingSchedule");
	}
	@Override
	public List<ScheduleBBSDto> getIngSchedule() {
		return sqlSession.selectList(namespace + "getIngSchedule");
	}
	
	@Override
	public List<ScheduleBBSDto> getScheduleList() throws Exception {
		List<ScheduleBBSDto> list = sqlSession.selectList(namespace + "getScheduleList");
		return list;
	}

	@Override
	public boolean writeBbs(ScheduleBBSDto bbs) throws Exception {
		sqlSession.insert(namespace + "writeBBs", bbs);
		return true;
	}
	@Override
	public ScheduleBBSDto getSchedule(int seq) throws Exception {
		ScheduleBBSDto dto = sqlSession.selectOne(namespace + "getSchedule", seq);
		return dto;
	}

	
}
