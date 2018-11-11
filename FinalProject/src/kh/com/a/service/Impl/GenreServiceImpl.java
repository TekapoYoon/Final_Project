package kh.com.a.service.Impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.com.a.dao.GenreDao;
import kh.com.a.model.GenreDto;
import kh.com.a.service.GenreService;

@Service
public class GenreServiceImpl implements GenreService {

	@Autowired
	GenreDao genreDao;

	@Override
	public List<GenreDto> getGenreList() {
		// TODO Auto-generated method stub
		return genreDao.getGenreList();
	}
	
	
}
