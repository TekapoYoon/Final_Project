package kh.com.a.model;

import java.io.Serializable;

public class TimetableDto implements Serializable {
	private String buskingTime;

	public TimetableDto() {
		super();
	}

	public TimetableDto(String buskingTime) {
		super();
		this.buskingTime = buskingTime;
	}

	public String getBuskingTime() {
		return buskingTime;
	}

	public void setBuskingTime(String buskingTime) {
		this.buskingTime = buskingTime;
	}

	@Override
	public String toString() {
		return "TimetableDto [buskingTime=" + buskingTime + "]";
	}
	
	
}
