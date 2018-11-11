package kh.com.a.service.Impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.com.a.dao.MemDao;
import kh.com.a.model.MemDto;
import kh.com.a.service.MemService;

@Service
public class MemServiceImpl implements MemService{

	@Autowired
	MemDao memberDao;

	@Override
	public void addMusition(MemDto dto) {
		memberDao.addMusition(dto);
	}

	@Override
	public void addGeneral(MemDto dto) {
		memberDao.addGeneral(dto);
		
	}

	@Override
	public MemDto login(String id) {
		return memberDao.login(id);
	}

	@Override
	public void updateMusition(MemDto dto) {
		memberDao.updateMusition(dto);
	}

	@Override
	public void updateGeneral(MemDto dto) {
		memberDao.updateGeneral(dto);
	}

}
