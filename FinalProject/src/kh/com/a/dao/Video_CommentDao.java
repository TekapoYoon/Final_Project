package kh.com.a.dao;

import java.util.ArrayList;
import java.util.List;

import kh.com.a.model.Video_CommentDto;

public interface Video_CommentDao {
	public boolean addComment(Video_CommentDto vcDto);
	
	public List<Video_CommentDto> getCommetList(int seq);
}
