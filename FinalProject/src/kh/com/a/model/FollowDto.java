package kh.com.a.model;

import java.io.Serializable;

public class FollowDto implements Serializable {
	private String memid;
	private String museid;
	
	public FollowDto() {
		super();
	}

	public FollowDto(String memid, String museid) {
		super();
		this.memid = memid;
		this.museid = museid;
	}

	public String getMemid() {
		return memid;
	}

	public void setMemid(String memid) {
		this.memid = memid;
	}

	public String getMuseid() {
		return museid;
	}

	public void setMuseid(String museid) {
		this.museid = museid;
	}

	@Override
	public String toString() {
		return "FollowDto [memid=" + memid + ", museid=" + museid + "]";
	}
	
	
	
}
