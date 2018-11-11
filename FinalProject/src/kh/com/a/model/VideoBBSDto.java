package kh.com.a.model;

import java.io.Serializable;
/*
CREATE TABLE VIDEOBBS(
ID VARCHAR2(50) NOT NULL,
TITLE VARCHAR2(50) NOT NULL,
CONTENT VARCHAR2(4000) NOT NULL,
VIDEO VARCHAR2(500) NOT NULL,
THUMBNAIL VARCHAR2(100),
WDATE DATE NOT NULL,
READCOUNT NUMBER(8) NOT NULL,
VIDEO_SEQ NUMBER(8) PRIMARY KEY
)
*/
public class VideoBBSDto implements Serializable{

	private String id;
	private String title;
	private String content;
	private String video;
	private String thumbnail;
	private String genre;
	private String wdate;
	private int readcount;
	private int video_seq;
	
	
	public VideoBBSDto() {
		super();
	}
	
	
	public VideoBBSDto(String id, String title, String content, String video, String thumbnail, String genre,
			String wdate, int readcount, int video_seq) {
		super();
		this.id = id;
		this.title = title;
		this.content = content;
		this.video = video;
		this.thumbnail = thumbnail;
		this.genre = genre;
		this.wdate = wdate;
		this.readcount = readcount;
		this.video_seq = video_seq;
	}

	public String getId() {
		return id;
	}



	public String getGenre() {
		return genre;
	}


	public void setGenre(String genre) {
		this.genre = genre;
	}


	public void setId(String id) {
		this.id = id;
	}



	public String getTitle() {
		return title;
	}



	public void setTitle(String title) {
		this.title = title;
	}



	public String getContent() {
		return content;
	}



	public void setContent(String content) {
		this.content = content;
	}



	public String getVideo() {
		return video;
	}



	public void setVideo(String video) {
		this.video = video;
	}



	public String getThumbnail() {
		return thumbnail;
	}



	public void setThumbnail(String thumbnail) {
		this.thumbnail = thumbnail;
	}



	public String getWdate() {
		return wdate;
	}



	public void setWdate(String wdate) {
		this.wdate = wdate;
	}



	public int getReadcount() {
		return readcount;
	}



	public void setReadcount(int readcount) {
		this.readcount = readcount;
	}



	public int getVideo_seq() {
		return video_seq;
	}



	public void setVideo_seq(int video_seq) {
		this.video_seq = video_seq;
	}



	@Override
	public String toString() {
		return "VideoBBSDto [id=" + id + ", title=" + title + ", content=" + content + ", video=" + video
				+ ", thumbnail=" + thumbnail + ", wdate=" + wdate + ", readcount=" + readcount + ", video_seq="
				+ video_seq + "]";
	}

}
