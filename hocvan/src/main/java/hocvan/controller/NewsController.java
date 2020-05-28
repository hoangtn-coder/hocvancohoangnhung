package hocvan.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import hocvan.entity.News;
import hocvan.repository.NewsDAO;

@Controller
public class NewsController {
	
	@Autowired
	private NewsDAO newsDAO;
	
	@RequestMapping(value = {"/news"}, method = RequestMethod.GET)
	public ModelAndView newsDetail() {
		return findNews(1,"");
	}
	
	@RequestMapping(value = {"/news-search"}, method = RequestMethod.GET)
	public ModelAndView search1(@RequestParam(value = "keyWord",required = false) String keyWord,
			@RequestParam(value = "page", required = false) int page,
			HttpSession session, Model m) {
		return findNews(page ,keyWord);
	}
	
	private ModelAndView findNews(int page,String keyWord) {
		int pageSize = 6; // TODO: put this into configuration
		Long totalCount = newsDAO.getTotalResults(keyWord);
		int totalPages = totalCount.intValue() % pageSize == 0 ? totalCount.intValue() / pageSize : (totalCount.intValue() / pageSize) + 1;
		List<News> lstNews = newsDAO.find(page, pageSize,keyWord);
		ModelAndView model = new ModelAndView("news");
		model.addObject("currentPage", page);
		model.addObject("pageSize", pageSize);
		model.addObject("totalPages", totalPages);
		model.addObject("lstNews", lstNews);
		model.addObject("keyWord", keyWord);
		return model;
	}
}
