package kh.com.a.dao;

import java.util.List;

import kh.com.a.model.TicketDto;

import kh.com.a.model.TicketParam;

public interface TicketDao {

	public void createTicket(List<TicketDto> list);
	public void buyTicket(TicketDto ticket);
	public int countTicket(TicketDto ticket);
	
	public List<TicketParam> myTicketList(String id);
	
}
