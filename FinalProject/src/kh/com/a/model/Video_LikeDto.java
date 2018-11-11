package kh.com.a.model;

import java.io.Serializable;

public class Video_LikeDto implements Serializable {
	private String memid;
	private int video_seq;
	
	public Video_LikeDto()
	{
		super();
	}
	
	public Video_LikeDto(String memid, int video_seq) {
		super();
		this.memid = memid;
		this.video_seq = video_seq;
	}

	public String getMemid() {
		return memid;
	}

	public void setMemid(String memid) {
		this.memid = memid;
	}

	public int getVideo_seq() {
		return video_seq;
	}

	public void setVideo_seq(int video_seq) {
		this.video_seq = video_seq;
	}

	@Override
	public String toString() {
		return "Video_LikeDto [memid=" + memid + ", video_seq=" + video_seq + "]";
	}

	
	
	
	
	
}
