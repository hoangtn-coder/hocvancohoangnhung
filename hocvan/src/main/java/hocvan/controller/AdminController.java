package hocvan.controller;

import java.io.File;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.io.IOUtils;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;

import common.util.Formater;
import hocvan.entity.BaseMessage;
import hocvan.entity.News;
import hocvan.repository.NewsDAO;

@Controller
@RequestMapping("/admin")
public class AdminController {
	
	private static Logger logger = Logger.getLogger(AdminController.class);
	
	@Autowired
	private NewsDAO newsDAO;

	@RequestMapping(value = {"/management/news"})
	public ModelAndView main() {
		ModelAndView model = new ModelAndView("admin/management/news");
		List<News> lstNews = newsDAO.findAll();
		model.addObject("lstNews", lstNews);
		return model;
	}
	
	@RequestMapping(value = {"/management/news/edit"}, method = RequestMethod.GET, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public ResponseEntity<String> edit(@RequestParam(value = "id", required = false) int id) {
		Gson gson = new Gson();
		String rs = gson.toJson(newsDAO.findById(id));
		return new ResponseEntity<String>(rs, HttpStatus.OK);
	}
	
	private static final String UPLOAD_DIRECTORY = "D:/Project/Demo/hocvan/src/main/webapp/resources/CKFinderJava/userfiles/images";
	
	@RequestMapping(value = {"/management/news/save"}, method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public ResponseEntity<String> save(News news ,MultipartHttpServletRequest  rq, HttpServletResponse rp) throws Exception {
		Gson gson = new Gson();
	 	BaseMessage baseMessage = new BaseMessage();
		MultipartFile multipartFile = rq.getFile("imgInp");
		try {
			if(multipartFile.getSize() != 0) {
				String fileName = formatUtf8(news.getImgInp().getOriginalFilename());
			    File file = new File(UPLOAD_DIRECTORY, fileName);
			    multipartFile.transferTo(file);
			    news.setPreviewImage("resources/CKFinderJava/userfiles/images/"+ fileName);
			}
			news.setTitle(formatUtf8(news.getTitle()));
			news.setTag(formatUtf8(news.getTag()));
			news.setDescription(formatUtf8(news.getDescription()));
			news.setContentNew(formatUtf8(news.getContentNew()));
			
		    if(Formater.isNull(news.getId())) {//add
		    	news.setCreatedBy(rq.getUserPrincipal().getName());
		    	news.setCreatedDate(new Date());
		    	newsDAO.save(news);
		    }else {//update
		    	News newsUpdate =  newsDAO.findById(news.getId());
		    	newsUpdate.setTitle(news.getTitle());
		    	newsUpdate.setTag(news.getTag());
		    	newsUpdate.setDescription(news.getDescription());
		    	newsUpdate.setContentNew(news.getContentNew());		
		    	newsUpdate.setPreviewImage(news.getPreviewImage());
		    	newsUpdate.setModifiedBy(rq.getUserPrincipal().getName());
		    	newsUpdate.setModifiedDate(new Date());
		    	newsDAO.update(newsUpdate);
		    }
		    baseMessage.setDescription("Thành công");
	    } catch (Exception e) {
	    	logger.error(e);
	    	baseMessage.setDescription("Thất bại");
	    }
	 	
	 	String rs = gson.toJson(baseMessage);
	 	return new ResponseEntity<String>(rs, HttpStatus.OK);
	}
	
	private String formatUtf8(String text) {
		String result = null;
		try {
			result = new String(text.getBytes("ISO-8859-1"), "UTF-8");
		} catch (UnsupportedEncodingException e) {
			logger.error(e);
		}
		return result;
	}
	
//	@RequestMapping(value = {"/management/news/save"}, method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
//	@ResponseBody
//	public ResponseEntity<String> save(
//	    		@RequestParam(value = "id", required = false) int id,
//	    		@RequestParam(value = "title", required = false) String title,
//	    		@RequestParam(value = "description", required = false) String description,
//	    		@RequestParam(value = "tag", required = false) String tag,
//	    		@RequestParam(value = "content", required = false) String content,
//			MultipartHttpServletRequest  rq, HttpServletResponse rp) throws Exception {
//		Gson gson = new Gson();
//	 	BaseMessage baseMessage = new BaseMessage();
//		MultipartFile multipartFile = rq.getFile("imgInp");
//	String id =  rq.getParameter("id");
//	String title =  rq.getParameter("title");
//	String description =  rq.getParameter("description");
//	String tag =  rq.getParameter("tag");
//	String content =  rq.getParameter("content");
//		try {
//		    String fileName = new String(multipartFile.getOriginalFilename().getBytes("ISO-8859-1"), "UTF-8");
//		    File file = new File(UPLOAD_DIRECTORY, fileName);
//		    multipartFile.transferTo(file);
//		    baseMessage.setDescription("Thành công");
//	    } catch (Exception e) {
//	    	logger.error(e);
//	    	baseMessage.setDescription("Thất bại");
//	    }
//	 	
//	 	String rs = gson.toJson(baseMessage);
//	 	return new ResponseEntity<String>(rs, HttpStatus.OK);
//	}
}
