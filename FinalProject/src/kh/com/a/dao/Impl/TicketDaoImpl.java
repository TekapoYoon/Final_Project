package kh.com.a.dao.Impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.com.a.dao.TicketDao;
import kh.com.a.model.TicketDto;

import kh.com.a.model.TicketParam;

@Repository
public class TicketDaoImpl implements TicketDao{
	@Autowired
	SqlSessionTemplate sqlSession;
	
	private String namespace="Ticket.";

	@Override
	public void createTicket(List<TicketDto> list) {
		
		for(TicketDto dto: list) {
			sqlSession.insert(namespace + "createTicket",dto);
		}
	}

	@Override
	public void buyTicket(TicketDto ticket) {
		sqlSession.update(namespace + "buyTicket",ticket);
	}

	@Override
	public int countTicket(TicketDto ticket) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace + "countTicket",ticket);
	}

	
	
	@Override
	public List<TicketParam> myTicketList(String id) {
		// TODO Auto-generated method stub
		return sqlSession.selectList(namespace + "myTicketList",id);
	}
	
	
	
}
