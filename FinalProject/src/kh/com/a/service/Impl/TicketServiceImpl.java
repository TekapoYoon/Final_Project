package kh.com.a.service.Impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.com.a.dao.TicketDao;
import kh.com.a.dao.VideoBBSDao;
import kh.com.a.dao.Video_CommentDao;
import kh.com.a.model.TicketDto;

import kh.com.a.model.TicketParam;

import kh.com.a.service.TicketService;

@Service
public class TicketServiceImpl implements TicketService {
	
	@Autowired
	TicketDao dao;

	@Override
	public void createTicket(List<TicketDto> list) {
		// TODO Auto-generated method stub
		dao.createTicket(list);
	}

	@Override
	public void buyTicket(TicketDto ticket) {
		// TODO Auto-generated method stub
		dao.buyTicket(ticket);
	}

	@Override
	public int countTicket(TicketDto ticket) {
		// TODO Auto-generated method stub
		return dao.countTicket(ticket);
	}

	
	@Override
	public List<TicketParam> myTicketList(String id) {
		// TODO Auto-generated method stub
		return dao.myTicketList(id);
	}
	
}	
