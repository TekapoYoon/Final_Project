package kh.com.a.model;

import java.io.Serializable;
import java.sql.Date;

public class Video_CommentDto implements Serializable {

	private int vcomment_seq;	//pk
	private int video_seq;
	private String id;
	private String vcomment;
	private String wdate;
	
	public Video_CommentDto() {
		super();
	}
	
	public Video_CommentDto(int vcomment_seq, int video_seq, String id, String vcomment, String wdate) {
		super();
		this.vcomment_seq = vcomment_seq;
		this.video_seq = video_seq;
		this.id = id;
		this.vcomment = vcomment;
		this.wdate = wdate;
	}
	
	public int getVcomment_seq() {
		return vcomment_seq;
	}
	public void setVcomment_seq(int vcomment_seq) {
		this.vcomment_seq = vcomment_seq;
	}
	public int getVideo_seq() {
		return video_seq;
	}
	public void setVideo_seq(int video_seq) {
		this.video_seq = video_seq;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getVcomment() {
		return vcomment;
	}
	public void setVcomment(String vcomment) {
		this.vcomment = vcomment;
	}
	public String getWdate() {
		return wdate;
	}
	public void setWdate(String wdate) {
		this.wdate = wdate;
	}
	@Override
	public String toString() {
		return "Video_CommentDto [vcomment_seq=" + vcomment_seq + ", video_seq=" + video_seq + ", id=" + id
				+ ", vcomment=" + vcomment + ", wdate=" + wdate + "]";
	}
	
	
	
}
