package kh.com.a.dao.Impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.com.a.dao.PerformScheduleBBSDao;
import kh.com.a.dao.ScheduleBBSDao;
import kh.com.a.model.Param;
import kh.com.a.model.PerformScheduleBBSDto;
import kh.com.a.model.ScheduleBBSDto;

@Repository
public class PerformScheduleBBSDaoImpl implements PerformScheduleBBSDao {
	
	@Autowired
	SqlSessionTemplate sqlSession;
	
	private String namespace="PerformScheduleBBS.";

	@Override
	public List<PerformScheduleBBSDto> getPerformSchedulPagingList(Param param) {
		// TODO Auto-generated method stub
		return sqlSession.selectList(namespace + "getPerformSchedulPagingList",param);
	}

	@Override
	public int getPerformScheduleBBSCount(Param param) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace + "getPerformScheduleBBSCount",param);
	}

	@Override
	public PerformScheduleBBSDto getPerformScheduleBBSDto(int perform_schedule_seq) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace + "getPerformScheduleBBSDto",perform_schedule_seq);
	}

	@Override
	public void addPerformSchedule(PerformScheduleBBSDto dto) {
		sqlSession.insert(namespace + "addPerformSchedule",dto);
		
	}

	@Override
	public int getPerformScheduleSeqMax() {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace + "getPerformScheduleSeqMax");
	}

	@Override
	public List<PerformScheduleBBSDto> latelyPerformSchedules() {
			
		return sqlSession.selectList(namespace+"latelyPerformSchedules");
	}
	
	


}
