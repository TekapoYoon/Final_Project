package kh.com.a.model;

import java.io.Serializable;
import java.sql.Date;

public class ScheduleBBSDto implements Serializable {

	
	
	   private String scheduledate;
	   private String buskingTime;
	   private String location;
	   private String place;
	   private int schedule_seq;
	   private String id;
	   private String teamname;
	   private double lati;
	   private double longi;
	
	public ScheduleBBSDto() {
		super();
	}

	public ScheduleBBSDto(String scheduledate, String buskingTime, String location, String place, int schedule_seq,
			String id, String teamname, double lati, double longi) {
		super();
		this.scheduledate = scheduledate;
		this.buskingTime = buskingTime;
		this.location = location;
		this.place = place;
		this.schedule_seq = schedule_seq;
		this.id = id;
		this.teamname = teamname;
		this.lati = lati;
		this.longi = longi;
	}

	public String getScheduledate() {
		return scheduledate;
	}

	public void setScheduledate(String scheduledate) {
		this.scheduledate = scheduledate;
	}

	public String getBuskingTime() {
		return buskingTime;
	}

	public void setBuskingTime(String buskingTime) {
		this.buskingTime = buskingTime;
	}

	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	public String getPlace() {
		return place;
	}

	public void setPlace(String place) {
		this.place = place;
	}

	public int getSchedule_seq() {
		return schedule_seq;
	}

	public void setSchedule_seq(int schedule_seq) {
		this.schedule_seq = schedule_seq;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getTeamname() {
		return teamname;
	}

	public void setTeamname(String teamname) {
		this.teamname = teamname;
	}

	public double getLati() {
		return lati;
	}

	public void setLati(double lati) {
		this.lati = lati;
	}

	public double getLongi() {
		return longi;
	}

	public void setLongi(double longi) {
		this.longi = longi;
	}

	@Override
	public String toString() {
		return "ScheduleBBSDto [scheduledate=" + scheduledate + ", buskingTime=" + buskingTime + ", location="
				+ location + ", place=" + place + ", schedule_seq=" + schedule_seq + ", id=" + id + ", teamname="
				+ teamname + ", lati=" + lati + ", longi=" + longi + "]";
	}

	
	
	
	
	
	
}
