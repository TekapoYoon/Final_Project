package kh.com.a.dao.Impl;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.com.a.dao.Video_CommentDao;
import kh.com.a.model.Video_CommentDto;

@Repository
public class Video_CommentDaoImpl implements Video_CommentDao{
	
	private String namespace = "VideoComment.";
	
	@Autowired
	SqlSessionTemplate sqlSession;

	@Override
	public boolean addComment(Video_CommentDto vcDto) {
		sqlSession.insert(namespace + "addComment", vcDto);
		return true;
	}

	@Override
	public List<Video_CommentDto> getCommetList(int seq) {
		List<Video_CommentDto> list = sqlSession.selectList(namespace + "getCommentList", seq);	
		return list;
	}
	
}
