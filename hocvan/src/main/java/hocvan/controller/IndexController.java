package hocvan.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import hocvan.entity.News;
import hocvan.entity.Slide;
import hocvan.repository.NewsDAO;
import hocvan.repository.SlideDAO;

@Controller
public class IndexController {
	
	@Autowired
	private NewsDAO newsDAO;
	
	@Autowired
	private SlideDAO slideDAO;
	
	@RequestMapping(value = {"/","","/index"}, method = RequestMethod.GET)
	public ModelAndView index(HttpSession session, Model m) {
		ModelAndView model = new ModelAndView("index");
		
		//News
		List<News> lstNews = newsDAO.find(1, 3,"");
		model.addObject("lstNews", lstNews);
		
		//Slide
		List<Slide> lstSlide = slideDAO.getAll(Slide.class);
		model.addObject("lstSlide", lstSlide);
		return model;	
	}
}
