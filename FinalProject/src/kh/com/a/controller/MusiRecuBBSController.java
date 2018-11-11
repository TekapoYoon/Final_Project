package kh.com.a.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mysql.cj.api.Session;

import kh.com.a.model.MemDto;
import kh.com.a.model.MusiRecuBBSDto;
import kh.com.a.model.Param;
import kh.com.a.model.PerformCastBBSDto;
import kh.com.a.model.RecuMusiInfoDto;
import kh.com.a.service.MusiRecuBBSService;
import kh.com.a.service.PerformCastBBSService;

@Controller
public class MusiRecuBBSController {

	private static final Logger logger = LoggerFactory.getLogger(MusiRecuBBSController.class);

	@Autowired
	MusiRecuBBSService musiRecuBBSService;
	
	@Autowired
	PerformCastBBSService performCastBBSService;

	@RequestMapping(value = "musireculist.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String musireculist(Model model,Param param) {
		logger.info("MusiRecuBBSController musireculist " + new Date());

		Date from = new Date();

		SimpleDateFormat transFormat = new SimpleDateFormat("yyyy-MM-dd");

		String now = transFormat.format(from);

		model.addAttribute("now", now);
		//model.addAttribute("musiRecuList", musiRecuBBSService.getMusiRecuList());
		
		// paging 처리
		int sn = param.getPageNumber();
		logger.info("PageNumber "+sn);
		int start = (sn) * param.getRecordCountPerPage() + 1;
		int end = (sn + 1) * param.getRecordCountPerPage();
		
		param.setStart(start);
		param.setEnd(end);
		
		// 글 개수
		int totalRecordCount = musiRecuBBSService.getMusiRecuBBSCount(param);
		
		List<MusiRecuBBSDto> list = musiRecuBBSService.getMusiRecuPagingList(param);
		
		model.addAttribute("musiRecuList", list);
		model.addAttribute("pageNumber", sn);
		model.addAttribute("pageCountPerScreen", 10);
		model.addAttribute("recordCountPerPage", param.getRecordCountPerPage());
		model.addAttribute("totalRecordCount", totalRecordCount);

		model.addAttribute("s_category", param.getS_category());
		model.addAttribute("s_keyword", param.getS_keyword());
		
		
		return "musireculist.tiles";
	}
	@RequestMapping(value = "musirecudetail.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String musirecudetail(HttpSession session,Model model, int musi_recu_seq) {
		
		
		Date from = new Date();

		SimpleDateFormat transFormat = new SimpleDateFormat("yyyy-MM-dd");

		String now = transFormat.format(from);

		model.addAttribute("now", now);
		
		MusiRecuBBSDto dto = musiRecuBBSService.getMusiRecuBBSDetail(musi_recu_seq);
		model.addAttribute("musiRecuBBSDto",dto);
	
		PerformCastBBSDto pDto = performCastBBSService.getPerformCastInfo(dto.getPerform_seq());
		model.addAttribute("performCastBBSDto",pDto);
		System.out.println(pDto.getLati());
		
		
		RecuMusiInfoDto recuMusiInfoDto = new RecuMusiInfoDto();
		recuMusiInfoDto.setMusi_recu_seq(musi_recu_seq);
		
		MemDto mem = (MemDto)session.getAttribute("user");
		recuMusiInfoDto.setMusiid(mem.getId());
		
		int check = musiRecuBBSService.getRecuMusiInfo(recuMusiInfoDto);
		
		//0이 아니면 이미 신청한 유저
		if(check!=0) {
			model.addAttribute("check",false);
		}else {
			model.addAttribute("check",true);
		}
		
		model.addAttribute("musiCount",musiRecuBBSService.getRecuMusiCount(recuMusiInfoDto));
		return "musirecudetail.tiles";
	}
	
	@ResponseBody
	@RequestMapping(value = "recu_musi.do", method = { RequestMethod.GET, RequestMethod.POST })
	public Map<String,Object> recu_musi(Model model,RecuMusiInfoDto recuMusiInfoDto) {
		
		
		Map<String, Object> map = new HashMap<>();
	
		musiRecuBBSService.addRecuMusiInfo(recuMusiInfoDto);
		int count = musiRecuBBSService.getRecuMusiCount(recuMusiInfoDto);
		
		map.put("count", count);
		
		return map;
	}
	
	@ResponseBody
	@RequestMapping(value = "recu_musi_cancel.do", method = { RequestMethod.GET, RequestMethod.POST })
	public Map<String,Object> recu_musi_cancel(Model model,RecuMusiInfoDto recuMusiInfoDto) {
		
		
		Map<String, Object> map = new HashMap<>();
		
		musiRecuBBSService.delRecuMusiInfo(recuMusiInfoDto);;
		int count = musiRecuBBSService.getRecuMusiCount(recuMusiInfoDto);
		
		map.put("count", count);
		
		return map;
	}
	
	@RequestMapping(value = "musi_recu_deadline.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String musi_recu_deadline(Model model) {
		
		
		model.addAttribute("musiRecuDeadLineList", musiRecuBBSService.getRecuMusiDeadLineList());
		return "musi_recu_deadline.tiles";
	}

	@ResponseBody
	@RequestMapping(value="moreMusiRecuDeadLineList.do", method= {RequestMethod.GET, RequestMethod.POST})
	public List<MusiRecuBBSDto> moreMusiRecuDeadLineList() {
		
		List<MusiRecuBBSDto> list = musiRecuBBSService.moreMusiRecuDeadLineList();
		
		return list;
		
	}
	
	
	
	@RequestMapping(value = "musirecudeadlinedetail.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String musirecudeadlinedetail(Model model,int musi_recu_seq) {
		
		MusiRecuBBSDto dto = musiRecuBBSService.getMusiRecuBBSDetail(musi_recu_seq);
		model.addAttribute("musiRecuBBSDto",dto);
		
		PerformCastBBSDto pDto = performCastBBSService.getPerformCastInfo(dto.getPerform_seq());
		
		model.addAttribute("performCastBBSDto",pDto);
		
		RecuMusiInfoDto recuMusiInfoDto = new RecuMusiInfoDto();
		recuMusiInfoDto.setMusi_recu_seq(musi_recu_seq);
		model.addAttribute("musiCount",musiRecuBBSService.getRecuMusiCount(recuMusiInfoDto));
		
		return "musirecudeadlinedetail.tiles";
	}
}
