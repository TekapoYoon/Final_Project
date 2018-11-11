package kh.com.a.model;

import java.io.Serializable;

public class PositionDto implements Serializable {

	private String position;

	public PositionDto() {
		super();
	}

	
	public PositionDto(String position) {
		super();
		this.position = position;
	}


	public String getPosition() {
		return position;
	}

	public void setPosition(String position) {
		this.position = position;
	}


	@Override
	public String toString() {
		return "PositionDto [position=" + position + "]";
	}


	
	
}
