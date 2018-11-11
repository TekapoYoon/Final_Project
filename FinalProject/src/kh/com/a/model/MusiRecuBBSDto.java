package kh.com.a.model;

import java.io.Serializable;
import java.util.Date;

public class MusiRecuBBSDto implements Serializable {

	private String sdate;
	private String edate;
	private String title;
	private String content;
	private int perform_seq;
	private int musi_recu_seq;

	public MusiRecuBBSDto() {
		super();
	}

	public MusiRecuBBSDto(String sdate, String edate, String title, String content, int perform_seq, int musi_recu_seq) {
		super();
		this.sdate = sdate;
		this.edate = edate;
		this.title = title;
		this.content = content;
		this.perform_seq = perform_seq;
		this.musi_recu_seq = musi_recu_seq;
	}

	public String getSdate() {
		return sdate;
	}

	public void setSdate(String sdate) {
		this.sdate = sdate;
	}

	public String getEdate() {
		return edate;
	}

	public void setEdate(String edate) {
		this.edate = edate;
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

	public int getPerform_seq() {
		return perform_seq;
	}

	public void setPerform_seq(int perform_seq) {
		this.perform_seq = perform_seq;
	}

	public int getMusi_recu_seq() {
		return musi_recu_seq;
	}

	public void setMusi_recu_seq(int musi_recu_seq) {
		this.musi_recu_seq = musi_recu_seq;
	}

	@Override
	public String toString() {
		return "MusiRecuBBSDto [sdate=" + sdate + ", edate=" + edate + ", title=" + title + ", content=" + content
				+ ", perform_seq=" + perform_seq + ", musi_recu_seq=" + musi_recu_seq + "]";
	}
	
	
	
}
