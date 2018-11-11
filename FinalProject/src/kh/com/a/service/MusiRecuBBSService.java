package kh.com.a.service;

import java.util.List;

import kh.com.a.model.MusiRecuBBSDto;
import kh.com.a.model.Param;
import kh.com.a.model.PerformCastBBSDto;
import kh.com.a.model.RecuMusiInfoDto;

public interface MusiRecuBBSService {
	public List<MusiRecuBBSDto> getMusiRecuPagingList(Param param);
	public int getMusiRecuBBSCount(Param param);
	public MusiRecuBBSDto getMusiRecuBBSDetail(int musi_recu_seq);
	public void musiRecuApproval(int musi_recu_seq);
	
	public void addRecuMusiInfo(RecuMusiInfoDto recuMusiInfoDto);
	public int getRecuMusiCount(RecuMusiInfoDto recuMusiInfoDto);
	public int getRecuMusiInfo(RecuMusiInfoDto recuMusiInfoDto);
	public void delRecuMusiInfo(RecuMusiInfoDto recuMusiInfoDto);
	public List<RecuMusiInfoDto> getRecuMusiInfoList(RecuMusiInfoDto recuMusiInfoDto);
	
	public List<MusiRecuBBSDto> getRecuMusiDeadLineList();
	public List<MusiRecuBBSDto> moreMusiRecuDeadLineList();
	
	public void addMusiRecuBBS(MusiRecuBBSDto dto);
	
	public void selectMusi(List<String> idList);
	public List<String>	performSelectMusiList(int musi_recu_seq);
	
	public MusiRecuBBSDto getMusiRecuBBS_perform_Seq(int perform_seq);
}
