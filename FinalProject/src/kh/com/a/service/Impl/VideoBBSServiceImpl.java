package kh.com.a.service.Impl;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.com.a.dao.VideoBBSDao;

import kh.com.a.model.FollowDto;
import kh.com.a.model.MemDto;

import kh.com.a.model.VideoBBSDto;
import kh.com.a.model.Video_LikeDto;
import kh.com.a.service.VideoBBSService;

@Service
public class VideoBBSServiceImpl implements VideoBBSService {
	
	@Autowired
	VideoBBSDao dao;

	@Override
	public boolean writeVideoBBS(VideoBBSDto dto) {
		
		return dao.writeVideoBBS(dto);
	}

	@Override
	public List<VideoBBSDto> getVideoBbsList() throws Exception {
		
		return dao.getVideoBbsList();
	}

	@Override
	public VideoBBSDto getVideoBbs(int seq) {
		
		return dao.getVideoBbs(seq);
	}
	
	public List<VideoBBSDto> getVideoForUser() {
		return dao.getVideoForUser();
	}

	@Override
	public void videoBbsUpdate(VideoBBSDto bbs) throws Exception {
		dao.videoBbsUpdate(bbs);
	}

	@Override
	public void videoBbsDelete(int seq) throws Exception {
		dao.videoBbsDelete(seq);
		
	}
	
	@Override
	public void BbsCommentDelete(int seq) throws Exception {
		dao.BbsCommentDelete(seq);
		
	}

	@Override
	public void BbsLikeDelete(int seq) throws Exception {
		dao.BbsLikeDelete(seq);
		
	}

	@Override
	public void like(Video_LikeDto vlDto) {
		dao.like(vlDto);
	}

	@Override
	public void unLike(Video_LikeDto vlDto) {
		dao.unlike(vlDto);
		
	}

	@Override
	public boolean getLike(Video_LikeDto vlDto) {
		return dao.getLike(vlDto);
		
	}

	@Override
	public boolean getFollow(FollowDto fDto) {
		return dao.getFollow(fDto);
		
	}

	@Override
	public boolean incReadCount(int seq) {
		
		return dao.incReadCount(seq);
	}
	@Override
	public int CheckAndFollow(HashMap<String, String> map) throws Exception {
		System.out.println("afterCheck1 = ");
		System.out.println(map.get("follower"));
		System.out.println(map.get("following"));
		
		int seq = dao.CheckFollow(map); // Integer
		
		System.out.println("afterCheck2 = " + seq);
		
		if (seq > 0) {
			return dao.CancelFollow(map);		 
			
		}else if(seq == 0){
			return dao.doFollow(map);
			
		}else
			return -1;
	}

	@Override
	public List<VideoBBSDto> getFollowingList(MemDto dto) throws Exception {
		
		return dao.getFollowingList(dto);
	}

	@Override
	public List<VideoBBSDto> latelyVideoList() throws Exception {
		
		return dao.latelyVideoList();
	}

	@Override
	public int HowManyFollowers(String id) throws Exception {
		
		return dao.HowManyFollowers(id);
	}
	
	

	@Override
	public int FollowerCount(String museid) {
		return dao.FollowerCount(museid);
	}

	@Override
	public int likeCount(int seq) {
		return dao.likeCount(seq);
	}
	
	
	
}	
