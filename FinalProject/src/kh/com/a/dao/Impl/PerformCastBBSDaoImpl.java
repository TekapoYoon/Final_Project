package kh.com.a.dao.Impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.com.a.dao.PerformCastBBSDao;
import kh.com.a.model.PerformCastBBSDto;

@Repository
public class PerformCastBBSDaoImpl implements PerformCastBBSDao {
	@Autowired
	SqlSessionTemplate sqlSession;

	private String namespace = "PerformCastBBS.";
	
	@Override
	public boolean sendCompInfo(PerformCastBBSDto dto) throws Exception {
		sqlSession.insert(namespace + "sendCompanyInfo", dto);
		return true;
	}

	@Override
	public List<PerformCastBBSDto> getCastBbs() {
		
		return sqlSession.selectList(namespace + "getCastBbs");
	}

	@Override
	public List<PerformCastBBSDto> getMoreList(PerformCastBBSDto dto) {
		return sqlSession.selectList(namespace + "getMoreList", dto);
		
	}

	@Override
	public void approveAf(int seq_approve) {
		 sqlSession.update(namespace + "approveAf", seq_approve);
		 
	}

	@Override
	public PerformCastBBSDto getPerformCastInfo(int perform_seq) {
		return sqlSession.selectOne(namespace + "getPerformCastInfo",perform_seq);
	}


	
	
}
