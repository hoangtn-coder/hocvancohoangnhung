package hocvan.controller;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;

import hocvan.entity.Slide;
import hocvan.repository.SlideDAO;

@Controller
@RequestMapping("/admin")
public class SlideController {
	
	private static Logger logger = Logger.getLogger(SlideController.class);
	
	@Autowired
	private SlideDAO slideDAO;
	
	@RequestMapping(value = {"/management/slide"})
	public ModelAndView main() {
		Gson gson = new Gson();
		ModelAndView model = new ModelAndView("admin/management/slide");
		List<Slide> lstSlide = slideDAO.getAll();
		
		model.addObject("lstSlide", gson.toJson(lstSlide));
		return model;
	}
	
//	@RequestMapping(value = {"/management/news/reLoad"}, method = RequestMethod.GET, produces = "application/json;charset=UTF-8")
//	@ResponseBody
//	public ResponseEntity<String> reLoad() {
//		BaseMessage baseMessage = new BaseMessage();
//		Gson gson = new Gson();
//		String rs;
//		try {
//			rs = gson.toJson(newsDAO.getAll());
//		} catch (Exception e) {
//			logger.error(e);
//	    	baseMessage.setDescription("Lỗi: " + e);
//	    	rs = gson.toJson(baseMessage);
//		}
//		return new ResponseEntity<String>(rs, HttpStatus.OK);
//	}
//	
//	@RequestMapping(value = {"/management/news/edit"}, method = RequestMethod.GET, produces = "application/json;charset=UTF-8")
//	@ResponseBody
//	public ResponseEntity<String> edit(@RequestParam(value = "id", required = false) String id) {
//		BaseMessage baseMessage = new BaseMessage();
//		Gson gson = new Gson();
//		String rs;
//		try {
//			rs = gson.toJson(newsDAO.findById(id));
//		} catch (Exception e) {
//			logger.error(e);
//	    	baseMessage.setDescription("Lỗi: " + e);
//	    	rs = gson.toJson(baseMessage);
//		}
//		return new ResponseEntity<String>(rs, HttpStatus.OK);
//	}
//	
//	@RequestMapping(value = {"/management/news/delete"}, method = RequestMethod.GET, produces = "application/json;charset=UTF-8")
//	@ResponseBody
//	public ResponseEntity<String> del(@RequestParam(value = "id", required = false) String id) {
//		BaseMessage baseMessage = new BaseMessage();
//		Gson gson = new Gson();
//		try {
//			News news = newsDAO.findById(id);
//			//newsDAO.delete(news);
//			newsDAO.temporaryDelete(news);
//			baseMessage.setDescription(" Xóa bản ghi.");
//		} catch (Exception e) {
//			logger.error(e);
//	    	baseMessage.setDescription("Lỗi: " + e);
//		}
//		String rs = gson.toJson(baseMessage);
//		return new ResponseEntity<String>(rs, HttpStatus.OK);
//	}
//	
//	private static final String UPLOAD_DIRECTORY = "D:/Project/Demo/hocvan/src/main/webapp/resources/CKFinderJava/userfiles/images";
//	
//	@RequestMapping(value = {"/management/news/save"}, method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
//	@ResponseBody
//	public ResponseEntity<String> save(News news ,MultipartHttpServletRequest  rq, HttpServletResponse rp) throws Exception {
//		Gson gson = new Gson();
//	 	BaseMessage baseMessage = new BaseMessage();
//		MultipartFile multipartFile = rq.getFile("imgInp");
//		try {
//			String fileName = null;
//			if(multipartFile.getSize() > 0) {//size > 0, get fileName
//				fileName = formatUtf8(news.getImgInp().getOriginalFilename());
//			    news.setPreviewImage("resources/CKFinderJava/userfiles/images/"+ fileName);
//			}
//			
//			news.setTitle(formatUtf8(news.getTitle()));
//			news.setTag(formatUtf8(news.getTag()));
//			news.setDescription(formatUtf8(news.getDescription()));
//			news.setContent(formatUtf8(news.getContent()));
//			
//		    if(Formater.isNull(news.getId())) {//add
//		    	news.setStatus("1");//active
//		    	news.setCreatedBy(rq.getUserPrincipal().getName());
//		    	news.setCreatedDate(new Date());
//		    	newsDAO.save(news);
//		    	
//		    	if(multipartFile.getSize() != 0) {//size > 0, upfile to folder
//				    File file = new File(UPLOAD_DIRECTORY, fileName);
//				    multipartFile.transferTo(file);
//				}
//		    	baseMessage.setDescription(" Thêm mới bản tin.");
//		    }else {//update
//		    	News newsUpdate =  newsDAO.findById(news.getId());
//		    	newsUpdate.setTitle(news.getTitle());
//		    	newsUpdate.setTag(news.getTag());
//		    	newsUpdate.setDescription(news.getDescription());
//		    	newsUpdate.setContent(news.getContent());		
//		    	newsUpdate.setPreviewImage(news.getPreviewImage());
//		    	newsUpdate.setModifiedBy(rq.getUserPrincipal().getName());
//		    	newsUpdate.setModifiedDate(new Date());
//		    	newsDAO.update(newsUpdate);
//		    	
//		    	if(multipartFile.getSize() != 0) {//size > 0, upfile to folder
//				    File file = new File(UPLOAD_DIRECTORY, fileName);
//				    multipartFile.transferTo(file);
//				}
//		    	baseMessage.setDescription(" Cập nhật bản tin.");
//		    }
//	    } catch (Exception e) {
//	    	logger.error(e);
//	    	baseMessage.setDescription("Lỗi: " + e);
//	    }
//	 	
//	 	String rs = gson.toJson(baseMessage);
//	 	return new ResponseEntity<String>(rs, HttpStatus.OK);
//	}
//	
//	private String formatUtf8(String text) {
//		String result = null;
//		try {
//			result = new String(text.getBytes("ISO-8859-1"), "UTF-8");
//		} catch (UnsupportedEncodingException e) {
//			logger.error(e);
//		}
//		return result;
//	}
	
}
