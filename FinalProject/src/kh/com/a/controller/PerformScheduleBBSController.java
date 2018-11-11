package kh.com.a.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;

import org.apache.commons.io.FileUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.mysql.cj.fabric.xmlrpc.base.Data;

import kh.com.a.arrow.CreateTickets;
import kh.com.a.arrow.FUpUtil;
import kh.com.a.model.MemDto;
import kh.com.a.model.MusiRecuBBSDto;
import kh.com.a.model.Param;
import kh.com.a.model.PerformCastBBSDto;
import kh.com.a.model.PerformScheduleBBSDto;
import kh.com.a.model.RecuMusiInfoDto;
import kh.com.a.model.ScheduleBBSDto;
import kh.com.a.model.TicketDto;
import kh.com.a.service.MusiRecuBBSService;
import kh.com.a.service.PerformCastBBSService;
import kh.com.a.service.PerformScheduleBBSService;
import kh.com.a.service.ScheduleBBSService;
import kh.com.a.service.TicketService;

@Controller
public class PerformScheduleBBSController {

	private static final Logger logger = LoggerFactory.getLogger(PerformScheduleBBSController.class);
	
	@Autowired
	PerformScheduleBBSService performScheduleBBSService;

	@Autowired
	TicketService ticketService;

	@Autowired
	MusiRecuBBSService musiRecuBBSService;

	@Autowired
	PerformCastBBSService performCastBBSService;

	@RequestMapping(value = "addperformschedule.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String addperformschedule(Model model) throws Exception {

		return "redirect:/perform_scheduleslist.do";
	}

	@RequestMapping(value = "perform_scheduleslist.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String perform_scheduleslist(Model model, Param param) throws Exception {
		logger.info("PerformScheduleBBSController perform_scheduleslist " + new Date());

		Date from = new Date();

		SimpleDateFormat transFormat = new SimpleDateFormat("yyyy-MM-dd");

		String now = transFormat.format(from);

		model.addAttribute("now", now);

		// paging 처리
		int sn = param.getPageNumber();
		logger.info("PageNumber " + sn);
		int start = (sn) * param.getRecordCountPerPage() + 1;
		int end = (sn + 1) * param.getRecordCountPerPage();

		param.setStart(start);
		param.setEnd(end);
			
		// 글 개수
		int totalRecordCount = performScheduleBBSService.getPerformScheduleBBSCount(param);

		List<PerformScheduleBBSDto> list = performScheduleBBSService.getPerformSchedulPagingList(param);
		for (int i = 0; i < list.size(); i++) {
			System.out.println(list.get(i).toString());
		}
		model.addAttribute("PerformSchedulPagingList", list);
		model.addAttribute("pageNumber", sn);
		model.addAttribute("pageCountPerScreen", 10);
		model.addAttribute("recordCountPerPage", param.getRecordCountPerPage());
		model.addAttribute("totalRecordCount", totalRecordCount);

		model.addAttribute("s_category", param.getS_category());
		model.addAttribute("s_keyword", param.getS_keyword());

		return "perform_scheduleslist.tiles";
	}

	@RequestMapping(value = "perform_scheduledetail.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String perform_scheduledetail(Model model, int perform_schedule_seq) throws Exception {
		logger.info("PerformScheduleBBSController perform_scheduledetail " + new Date());

		PerformScheduleBBSDto pDto = performScheduleBBSService.getPerformScheduleBBSDto(perform_schedule_seq);
		
		TicketDto ticket = new TicketDto();
		ticket.setPerform_schedule_seq(perform_schedule_seq);
		
		int countTicket = ticketService.countTicket(ticket);
		model.addAttribute("performScheduleBBSDto", pDto);
		model.addAttribute("countTicket",countTicket);
		model.addAttribute("performCastBBSDto", performCastBBSService.getPerformCastInfo(pDto.getPerform_seq()));
		
		MusiRecuBBSDto mDto= musiRecuBBSService.getMusiRecuBBS_perform_Seq(pDto.getPerform_seq());
		List<String> musiList= musiRecuBBSService.performSelectMusiList(mDto.getMusi_recu_seq());
		
		model.addAttribute("musiList",musiList);
		return "perform_scheduledetail.tiles";
	}

	@RequestMapping(value = "perform_schedulewrite.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String perform_schedulewrite(Model model, int perform_seq,int musi_recu_seq) throws Exception {
		logger.info("PerformScheduleBBSController perform_scheduledetail " + new Date());
		
		model.addAttribute("performCastBBSDto", performCastBBSService.getPerformCastInfo(perform_seq));
		
		RecuMusiInfoDto recuMusiInfoDto = new RecuMusiInfoDto();
		
		recuMusiInfoDto.setMusi_recu_seq(musi_recu_seq);
		model.addAttribute("recuMusiInfoList",musiRecuBBSService.getRecuMusiInfoList(recuMusiInfoDto));
		model.addAttribute("musi_recu_seq",musi_recu_seq);
		return "perform_schedulewrite.tiles";
	}

	@RequestMapping(value = "perform_schedulewriteAf.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String perform_schedulewriteAf(Model model,HttpSession session,int musi_recu_seq, PerformScheduleBBSDto dto,HttpServletRequest req,
			@RequestParam(value = "consertImgUpload", required = false) MultipartFile fileload) throws Exception {
		logger.info("PerformScheduleBBSController perform_schedulewriteAf " + new Date());
		
		String musition[] = req.getParameterValues("musiList");
		List<String> musiList = new ArrayList<>();
		for (String str : musition) {
			System.out.println(str);
			musiList.add(str);
		}
		
		//파일 기본경로
        String defaultPath = req.getServletContext().getRealPath("/");
        //파일 기본경로 _ 상세경로
        String path = defaultPath + "upload" + File.separator;
        
       
        // filename 취득
        dto.setOri_consertIMG(fileload.getOriginalFilename());

		// upload 경로
		// tomcat
		// String fupload = req.getServletContext().getRealPath("/upload");
		// logger.info("업로드 경로: " + fupload);

		// 폴더
		//String fupload = "d:\\tmp";

		String f = dto.getOri_consertIMG();
		String newFile = FUpUtil.getNewFile(f);

		dto.setNew_consertIMG(newFile);
		logger.info("변경된 파일명: " + newFile);

		File file = new File(path + "/" + newFile);
		logger.info("경로와 파일명: " + path + "/" + newFile);

		// 실제로 업로드 되는 부분
		FileUtils.writeByteArrayToFile(file, fileload.getBytes());

		// DB 저장
		performScheduleBBSService.addPerformSchedule(dto);
		PerformCastBBSDto pDto = performCastBBSService.getPerformCastInfo(dto.getPerform_seq());
		
		
		// 티켓 생성
		List<TicketDto> tickets = CreateTickets.create(performScheduleBBSService.getPerformScheduleSeqMax(), pDto.getTotalcount());
		ticketService.createTicket(tickets);
		
		musiRecuBBSService.musiRecuApproval(musi_recu_seq);
		
		musiRecuBBSService.selectMusi(musiList);
		
		return "redirect:/perform_scheduleslist.do";
	}
	
	
	@RequestMapping(value = "buyTicket.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String buyTicket(HttpSession session,Model model, int perform_schedule_seq) throws Exception {
		logger.info("PerformScheduleBBSController perform_scheduledetail " + new Date());
		
		MemDto mDto = (MemDto)session.getAttribute("user");
		
		TicketDto ticket = new TicketDto();
		
		ticket.setMemid(mDto.getId());
		ticket.setPerform_schedule_seq(perform_schedule_seq);
		ticketService.buyTicket(ticket);
		
		
		return "redirect:/perform_scheduleslist.do";
	}
}
