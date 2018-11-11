package kh.com.a.service;

import java.util.List;

import kh.com.a.model.TicketDto;

import kh.com.a.model.TicketParam;

public interface TicketService {
	public void createTicket(List<TicketDto> list);
	public void buyTicket(TicketDto ticket);
	public int countTicket(TicketDto ticket);
	
	public List<TicketParam> myTicketList(String id);
	
}
