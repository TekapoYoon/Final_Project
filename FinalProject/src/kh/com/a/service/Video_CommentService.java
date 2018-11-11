package kh.com.a.service;

import java.util.List;

import kh.com.a.model.Video_CommentDto;

public interface Video_CommentService {
	public boolean addComment(Video_CommentDto vcDto);
	
	public List<Video_CommentDto> getCommetList(int seq);
}
