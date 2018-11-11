package kh.com.a.service.Impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.com.a.dao.MusiRecuBBSDao;
import kh.com.a.model.MusiRecuBBSDto;
import kh.com.a.model.Param;
import kh.com.a.model.PerformCastBBSDto;
import kh.com.a.model.RecuMusiInfoDto;
import kh.com.a.service.MusiRecuBBSService;


@Service
public class MusiRecutBBSServiceImpl implements MusiRecuBBSService{
	
	@Autowired
	MusiRecuBBSDao dao;

	@Override
	public List<MusiRecuBBSDto> getMusiRecuPagingList(Param param) {
		return dao.getMusiRecuPagingList(param);
	}

	@Override
	public int getMusiRecuBBSCount(Param param) {
		// TODO Auto-generated method stub
		return dao.getMusiRecuBBSCount(param);
	}

	@Override
	public MusiRecuBBSDto getMusiRecuBBSDetail(int musi_recu_seq) {
		// TODO Auto-generated method stub
		return dao.getMusiRecuBBSDetail(musi_recu_seq);
	}

	@Override
	public void addRecuMusiInfo(RecuMusiInfoDto recuMusiInfoDto) {
		
		dao.addRecuMusiInfo(recuMusiInfoDto);
		
	}

	@Override
	public int getRecuMusiCount(RecuMusiInfoDto recuMusiInfoDto) {
		// TODO Auto-generated method stub
		return dao.getRecuMusiCount(recuMusiInfoDto);
	}

	@Override
	public int getRecuMusiInfo(RecuMusiInfoDto recuMusiInfoDto) {
		// TODO Auto-generated method stub
		return dao.getRecuMusiInfo(recuMusiInfoDto);
	}

	@Override
	public void delRecuMusiInfo(RecuMusiInfoDto recuMusiInfoDto) {
		dao.delRecuMusiInfo(recuMusiInfoDto);
	}

	@Override
	public List<MusiRecuBBSDto> getRecuMusiDeadLineList() {
		// TODO Auto-generated method stub
		return dao.getRecuMusiDeadLineList();
	}

	@Override
	public List<MusiRecuBBSDto> moreMusiRecuDeadLineList() {
		// TODO Auto-generated method stub
		return dao.moreMusiRecuDeadLineList();
	}
	
	@Override
	public void addMusiRecuBBS(MusiRecuBBSDto dto) {
		dao.addMusiRecuBBS(dto);
	}

	@Override
	public List<RecuMusiInfoDto> getRecuMusiInfoList(RecuMusiInfoDto recuMusiInfoDto) {
		// TODO Auto-generated method stub
		return dao.getRecuMusiInfoList(recuMusiInfoDto);
	}

	@Override
	public void musiRecuApproval(int musi_recu_seq) {
		// TODO Auto-generated method stub
		dao.musiRecuApproval(musi_recu_seq);
	}

	@Override
	public void selectMusi(List<String> idList) {
		// TODO Auto-generated method stub
		dao.selectMusi(idList);
	}

	@Override
	public List<String> performSelectMusiList(int musi_recu_seq) {
		// TODO Auto-generated method stub
		return dao.performSelectMusiList(musi_recu_seq);
	}

	@Override
	public MusiRecuBBSDto getMusiRecuBBS_perform_Seq(int perform_seq) {
		// TODO Auto-generated method stub
		return dao.getMusiRecuBBS_perform_Seq(perform_seq);
	}

	
}	
