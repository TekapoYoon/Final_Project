package kh.com.a.dao.Impl;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.com.a.dao.VideoBBSDao;

import kh.com.a.model.FollowDto;
import kh.com.a.model.MemDto;

import kh.com.a.model.VideoBBSDto;
import kh.com.a.model.Video_LikeDto;

@Repository
public class VideoBBSDaoImpl implements VideoBBSDao {
	
	private String namespace = "VideoBBS.";
	
	@Autowired
	SqlSessionTemplate sqlSession;

	@Override
	public boolean writeVideoBBS(VideoBBSDto dto) {
		
		sqlSession.insert(namespace + "videoBbsWrite", dto);
		return true;
	}

	@Override
	public List<VideoBBSDto> getVideoBbsList() throws Exception {
		List<VideoBBSDto> list = sqlSession.selectList(namespace + "getVideoBbsList");
		return list;
	}

	@Override
	public VideoBBSDto getVideoBbs(int seq) {
		VideoBBSDto dto = sqlSession.selectOne(namespace + "getVideoBbs", seq);
		return dto;
	}
	

	@Override
	public List<VideoBBSDto> getVideoForUser() {
		return sqlSession.selectList(namespace + "getVideoRank");
	}

	@Override
	public void videoBbsUpdate(VideoBBSDto bbs) throws Exception {
		sqlSession.update(namespace + "videoBbsUpdate", bbs);
	}

	@Override
	public void videoBbsDelete(int seq) throws Exception {
		sqlSession.delete(namespace + "videoBbsDelete", seq);
		
	}
	
	@Override
	public void BbsCommentDelete(int seq) throws Exception {
		sqlSession.delete(namespace + "bbsCommentDelete", seq);
		
	}

	@Override
	public void BbsLikeDelete(int seq) throws Exception {
		sqlSession.delete(namespace + "bbsLikeDelete", seq);
		
	}

	@Override
	public void like(Video_LikeDto vlDto) {
		sqlSession.insert(namespace + "like", vlDto);
		
	}

	@Override
	public void unlike(Video_LikeDto vlDto) {
		sqlSession.delete(namespace + "unLike", vlDto);
	}
	
	public int CheckFollow(HashMap<String, String> map) throws Exception {
		
		return sqlSession.selectOne(namespace + "checkfollow", map);
	}

	@Override
	public int CancelFollow(HashMap<String, String> map) throws Exception {
		int seq = sqlSession.selectOne(namespace + "checkSeq", map);	
		sqlSession.delete(namespace + "cancelFollow", seq);
		return 0;
		
	}

	@Override
	public boolean getLike(Video_LikeDto vlDto) {
		Video_LikeDto vl = sqlSession.selectOne(namespace + "getLike", vlDto);
		boolean like = true;
		
		if(vl == null)
			like = false;
		else if(vl != null)
			like = true;
		
		return like;
		
	}
	
	@Override
	public boolean getFollow(FollowDto fDto) {
		FollowDto dto = sqlSession.selectOne(namespace + "getFollow", fDto);
		boolean follow = true;
		
		if(dto == null)
			follow = false;
		else if(dto != null)
			follow = true;
		
		return follow;
	}

	@Override
	public boolean incReadCount(int seq) {
		sqlSession.update(namespace + "incReadCount", seq);
		return true;
	}
	
	
	public int doFollow(HashMap<String, String> map) throws Exception {
		
		sqlSession.insert(namespace + "dofollow", map);
		
		return 1;
	}

	@Override
	public List<VideoBBSDto> getFollowingList(MemDto dto) throws Exception {
		
		System.out.println("여기는 getFollowing DaoMethod="+ dto.getId());
		return sqlSession.selectList(namespace + "getfollowingList", dto);
 
	}

	@Override
	public List<VideoBBSDto> latelyVideoList() throws Exception {
		return sqlSession.selectList(namespace + "latelyVideoList");
	}

	@Override
	public int HowManyFollowers(String id) throws Exception {
		
		return sqlSession.selectOne(namespace + "HowManyFollowers", id);

	}
	public int FollowerCount(String museid) {
		return sqlSession.selectOne(namespace + "followerConunt", museid);
	}

	@Override
	public int likeCount(int seq) {
		return sqlSession.selectOne(namespace + "likeCount", seq);

	}
	
	
	
}
