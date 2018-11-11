package kh.com.a.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.StringTokenizer;

import javax.servlet.http.HttpServletRequest;

import java.io.IOException;
import java.io.PrintWriter;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mysql.cj.fabric.xmlrpc.base.Data;

import kh.com.a.model.LocationDto;
import kh.com.a.model.MemDto;
import kh.com.a.model.ScheduleBBSDto;
import kh.com.a.model.TimetableDto;
import kh.com.a.model.Video_CommentDto;
import kh.com.a.service.LocationService;
import kh.com.a.service.MemService;
import kh.com.a.service.ScheduleBBSService;
import kh.com.a.service.TimetableService;


@Controller
public class ScheduleBBSController {
	
	private static final Logger logger = LoggerFactory.getLogger(ScheduleBBSController.class);
	
	@Autowired
	ScheduleBBSService scheduleBBSService;
	
	@Autowired
	LocationService locationService;
	
	@Autowired
	TimetableService timetableService;
	
	@Autowired
	MemService memberService;
	
	@RequestMapping(value="schedule.do", method= {RequestMethod.GET, RequestMethod.POST})
	public String schedule(Model model) throws Exception{
	
		logger.info("schedulecontroller schedule" + new Data());
		List<ScheduleBBSDto> bbslist = scheduleBBSService.getScheduleList(); 
		
		for(int i = 0; i < bbslist.size(); i++)
		{
			String splDate = bbslist.get(i).getScheduledate();
			bbslist.get(i).setScheduledate(splDate.split(" ")[0]);
		}
		
		model.addAttribute("schedulelist",bbslist);
		
		return "schedule.tiles";
	}
	
	@RequestMapping(value="AddSchedule.do", method= {RequestMethod.GET, RequestMethod.POST})
	public String AddSchedule(Model model)
	{
		logger.info("schedulecontroller AddSchedule " + new Data());
		
		List<LocationDto> locationList = locationService.getLocationList();
		List<TimetableDto> timetableList = timetableService.getTimeTable();
		
		model.addAttribute("locationList", locationList);
		model.addAttribute("timetableList", timetableList);
		
		return "AddSchedule.tiles";
	}
	
	@RequestMapping(value="AddScheduleAf.do", method= {RequestMethod.GET, RequestMethod.POST})
	public String AddScheduleAf(ScheduleBBSDto dto) throws Exception
	{
		logger.info("schedulecontroller AddScheduleAf " + new Data());
		
		System.out.println(dto.toString());
		
		scheduleBBSService.writeBbs(dto);
		
		return "redirect:/schedule.do";
	}
	// 디테일 (임시)
	@RequestMapping(value="scheduleDetail.do", method= {RequestMethod.GET, RequestMethod.POST})
	public String scheduleDetail(int seq, Model model) throws Exception
	{
		logger.info("schedulecontroller scheduleDetail" + new Data());
		
		ScheduleBBSDto dto = scheduleBBSService.getSchedule(seq);
		
		MemDto mdto = memberService.login(dto.getId());
		
		String splDate = dto.getScheduledate(); 
		dto.setScheduledate(splDate.split(" ")[0]);		
		
		model.addAttribute("meminfo", mdto);
		model.addAttribute("getSchedule", dto);
		
		return "scheduleDetail.tiles";
	}
	
	@RequestMapping(value="getProfile.do", method= {RequestMethod.GET, RequestMethod.POST})
    @ResponseBody
    public MemDto getProfile(HttpServletRequest req) throws Exception
    {
		logger.info("VideoBBSController getProfile " + new Date());
		
		String teamname = req.getParameter("teamname");
		System.out.println(teamname);
		
		MemDto dto = new MemDto();
		
		dto = memberService.login(teamname);
		
		System.out.println(dto.toString());
		
		/*req.setAttribute("prof", dto);*/
		return dto;
		
    }
	

	
	
}
