package kh.com.a.service;

import java.util.HashMap;
import java.util.List;

import kh.com.a.model.FollowDto;
import kh.com.a.model.MemDto;

import kh.com.a.model.VideoBBSDto;
import kh.com.a.model.Video_LikeDto;


public interface VideoBBSService {
	public boolean writeVideoBBS(VideoBBSDto dto);
	
	public List<VideoBBSDto> getVideoBbsList() throws Exception;
	
	public VideoBBSDto getVideoBbs(int seq);

	public List<VideoBBSDto> getVideoForUser();
	
	public void videoBbsUpdate(VideoBBSDto bbs)throws Exception;
	
	public void videoBbsDelete(int seq)throws Exception;
	public void BbsCommentDelete(int seq)throws Exception;
	public void BbsLikeDelete(int seq)throws Exception;
	
	public void like(Video_LikeDto vlDto);
	
	public void unLike(Video_LikeDto vlDto);
	
	public boolean getLike(Video_LikeDto vlDto);
	
	public boolean getFollow(FollowDto fDto);
	
	public int likeCount(int seq);
	
	public boolean incReadCount(int seq);
	
	public int CheckAndFollow(HashMap<String, String> map) throws Exception;
	
	public List<VideoBBSDto> getFollowingList(MemDto dto) throws Exception;
	
	public List<VideoBBSDto> latelyVideoList() throws Exception;
	
	public int HowManyFollowers(String id) throws Exception;

	public int FollowerCount(String museid);


}
