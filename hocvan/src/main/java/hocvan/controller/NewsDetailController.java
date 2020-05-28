package hocvan.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import common.util.Formater;
import common.util.Utils;
import hocvan.entity.News;
import hocvan.entity.SideWidget;
import hocvan.entity.TagWidget;
import hocvan.repository.NewsDAO;

@Controller
@RequestMapping("/news-detail")
public class NewsDetailController {
	
	@Autowired
	private NewsDAO newsDAO;
	
	@RequestMapping(value = {"/",""}, method = RequestMethod.GET)
	public ModelAndView newsDetail(@RequestParam(value = "newsId",required = false) Integer newsId,
			HttpSession session, Model m) {
		ModelAndView model = new ModelAndView("news-detail");		
		News news = newsDAO.findById(newsId);
		
		//News content
		model.addObject("titleNews", news.getTitle());
		model.addObject("previewImage", news.getPreviewImage());
		model.addObject("createDate", Formater.sdfNews(news.getCreatedDate()));
		model.addObject("content", news.getContentNew());
		
		//Side Widget
		List<News> lstNews = newsDAO.find(1, 3,"");
		model.addObject("lstNews", lstNews);
		
		
		//Tag Widget
		List<TagWidget> lsTagtWidget = new ArrayList<TagWidget>();
		List<String> lstTag = Utils.splitListFile(news.getTag(),",");
		for (String tag : lstTag) {
			TagWidget tagWidget = new TagWidget();
			tagWidget.setTitleWidget(tag);
			tagWidget.setUrlWidget("/hocvan/news?keyWord="+tag);
			lsTagtWidget.add(0, tagWidget);
		}
		model.addObject("lsTagtWidget", lsTagtWidget);
		
		return model;
	}
}
