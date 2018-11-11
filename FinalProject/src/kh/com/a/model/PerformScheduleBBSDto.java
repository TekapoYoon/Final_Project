package kh.com.a.model;

import java.io.Serializable;
import java.sql.Date;

public class PerformScheduleBBSDto implements Serializable {
	
	private String ticket_price;
	private String ori_consertIMG;
	private String new_consertIMG;
	private int perform_schedule_seq;
	private int perform_seq;	//PERFORM_CAST_BBS 의 시퀀스번호
	private String title;
	private String notice;
	private String consert_info;
	public PerformScheduleBBSDto() {
		super();
	}
	public PerformScheduleBBSDto(String ticket_price, String ori_consertIMG, String new_consertIMG,
			int perform_schedule_seq, int perform_seq, String title, String notice, String consert_info) {
		super();
		this.ticket_price = ticket_price;
		this.ori_consertIMG = ori_consertIMG;
		this.new_consertIMG = new_consertIMG;
		this.perform_schedule_seq = perform_schedule_seq;
		this.perform_seq = perform_seq;
		this.title = title;
		this.notice = notice;
		this.consert_info = consert_info;
	}
	public String getTicket_price() {
		return ticket_price;
	}
	public void setTicket_price(String ticket_price) {
		this.ticket_price = ticket_price;
	}
	public String getOri_consertIMG() {
		return ori_consertIMG;
	}
	public void setOri_consertIMG(String ori_consertIMG) {
		this.ori_consertIMG = ori_consertIMG;
	}
	public String getNew_consertIMG() {
		return new_consertIMG;
	}
	public void setNew_consertIMG(String new_consertIMG) {
		this.new_consertIMG = new_consertIMG;
	}
	public int getPerform_schedule_seq() {
		return perform_schedule_seq;
	}
	public void setPerform_schedule_seq(int perform_schedule_seq) {
		this.perform_schedule_seq = perform_schedule_seq;
	}
	public int getPerform_seq() {
		return perform_seq;
	}
	public void setPerform_seq(int perform_seq) {
		this.perform_seq = perform_seq;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getNotice() {
		return notice;
	}
	public void setNotice(String notice) {
		this.notice = notice;
	}
	public String getConsert_info() {
		return consert_info;
	}
	public void setConsert_info(String consert_info) {
		this.consert_info = consert_info;
	}
	@Override
	public String toString() {
		return "PerformScheduleBBSDto [ticket_price=" + ticket_price + ", ori_consertIMG=" + ori_consertIMG
				+ ", new_consertIMG=" + new_consertIMG + ", perform_schedule_seq=" + perform_schedule_seq
				+ ", perform_seq=" + perform_seq + ", title=" + title + ", notice=" + notice + ", consert_info="
				+ consert_info + "]";
	}
		
}
