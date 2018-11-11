package kh.com.a.arrow;

import java.util.ArrayList;
import java.util.List;

import kh.com.a.model.TicketDto;

public class CreateTickets {
	
	private static String code[]= {"L","x","M","1","o","T","U","p","q","D","i","j","B","3","0","b","Q","R","c","h",
			"k","l","m","Y","O","v","Z","n","t","S","V","u","y","C","f","g","F","5","6","H","a",
			"I","J","K","N","w","P","W","7","8","9","X","d","e","E","r","G","4","s","2","z","A"};
	
	public static List<TicketDto> create(int seq,int count){
		List<TicketDto>list = new ArrayList<>();
		
		while(list.size()!=count) {
			String ticketCode="";
			for(int i = 0 ; i < 4 ; i++) {
				ticketCode+=code[(int)(Math.random() * code.length)];
			}
			ticketCode+="-";
			
			for(int i = 0 ; i < 4 ; i++) {
				ticketCode+=code[(int)(Math.random() * code.length)];
			}
			ticketCode+="-";
			
			for(int i = 0 ; i < 4 ; i++) {
				ticketCode+=code[(int)(Math.random() * code.length)];
			}
			ticketCode+="-";
			
			for(int i = 0 ; i < 4 ; i++) {
				ticketCode+=code[(int)(Math.random() * code.length)];
			}
			
			boolean check=false;
			for(TicketDto ticket: list) {
				if(ticket.getTicket_serial().equals(ticketCode)) {
					check = true;
					break;
				}
			}
			if(check)
				continue;
			
			TicketDto dto = new TicketDto();
			dto.setTicket_serial(ticketCode);
			dto.setPerform_schedule_seq(seq);
			list.add(dto);
		}
		
		return list;
	}
}
