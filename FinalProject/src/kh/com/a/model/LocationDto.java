package kh.com.a.model;

import java.io.Serializable;

public class LocationDto implements Serializable {

	private String location;

	public LocationDto() {
		super();
	}

	public LocationDto(String location) {
		super();
		this.location = location;
	}

	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	@Override
	public String toString() {
		return "LocationDto [location=" + location + "]";
	}


		
	
	
}
