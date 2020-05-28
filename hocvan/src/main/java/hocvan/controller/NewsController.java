package hocvan.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import hocvan.entity.SideWidget;
import hocvan.entity.TagWidget;

@Controller
@RequestMapping("/news")
public class NewsController {
	
	@RequestMapping(value = {"/",""}, method = RequestMethod.GET)
	public ModelAndView news(HttpSession session, Model m) {
		ModelAndView model = new ModelAndView("news");
		
		model.addObject("title", "Khai giảng lớp học văn cô Hoàng Nhung");
		model.addObject("previewImage", "resources/img/img2.jpg");
		model.addObject("createDate", "Thứ tư, 27/5/2020, 15:37 (GMT+7)");
		model.addObject("content", "Nam sinh gây sốt với bài văn dài 18 trang, cô giáo đọc xong không biết phải phê gì vì quá xuất sắc!\r\n" + 
				"\r\n" + 
				"		Viết hơn 18 trang cho một bài văn, nam sinh không chỉ khiến cô giáo của mình mà còn khiến nhiều người nhìn vào phải thán phục!\r\n" + 
				"		\r\n" + 
				"		Thời đi học ngoài những thần đồng Toán - Lý - Hóa ra, hội giỏi Văn cũng được nhiều người vô cùng ngưỡng mộ. Chuyện ngồi trong phòng thi chỉ mấy tiếng đồng hồ mà họ mà viết ra được 6,7 trang giấy thi tưởng chừng đã quá khủng khiếp rồi, nhưng nay bạn sẽ phải shock hơn khi biết một nam sinh đã viết được hẳn 18 trang giấy cho một bài văn.\r\n" + 
				"		\r\n" + 
				"		Cụ thể mới đây, trên trang fanpage của trường THPT Long Khánh (tỉnh Đồng Nai) đã đăng tải một bộ ảnh là một bài văn dài 18 trang giấy của cậu bạn Trần Hữu Thơ. Theo những gì được đăng tải, bài văn này đã khiến cô giáo không khỏi ngỡ ngàng vì không biết phê gì vào bài thi, thậm chí còn cho cậu bạn số điểm gần tuyệt đối là 9,5 điểm.\r\n" + 
				"		Đề bài yêu cầu nêu cảm nhận về một đoạn trích trong tác phẩm \"Những đứa con trong gia đình\" của Nguyễn Thi, từ đó rút ra suy nghĩ của mình về vai trò của gia đình trong cuộc sống hiện nay. Với khả năng cảm thụ văn học trời phú của mình, Hữu Thơ đã khiến nhiều người không khỏi shock khi viết hẳn 18 trang giấy, điều đáng nói là trang văn nào cũng trình bày sạch đẹp.\r\n" + 
				"		\r\n" + 
				"		Nhiều cô cậu học trò cũng để lại lời ngưỡng mộ dành cho cậu bạn. \"Thực sự là thời đi học mình nghĩ viết đến tờ thứ 2 thôi là bạn đó cũng quá giỏi rồi, đây cậu bạn này còn viết hẳn 18 trang, thực sự nể phục\", bạn Hoàng Long cho biết. \"Ngày xưa mình cũng từng nhận được điểm 9,5 môn Văn, cũng từng thi học sinh giỏi văn nên mình biết để đạt được điểm số này bạn này phải thực sự thấu hiểu được tác phẩm Những đứa con trong gia đình\", bạn Quỳnh Chi nói.\r\n" + 
				"		\r\n" + 
				"		Dưới đây là bản đầy đủ 18 trang văn của nam sinh đến từ Đồng Nai!\r\n" + 
				"		\r\n" + 
				"		🌹TÀI LIỆU ÔN THI theo MÔN và KHỐI LỚP🌹\r\n" + 
				"		\r\n" + 
				"		🍀 Môn Tiếng Anh:\r\n" + 
				"		1. 943 từ đồng nghĩa: https://bit.ly/2ujg6hA\r\n" + 
				"		2. 521 câu, cụm idiom thường gặp: https://bit.ly/2KHO3gz\r\n" + 
				"		3. Thì trong Tiếng anh kèm bài tập: https://bit.ly/2Dg4yg7\r\n" + 
				"		4. Bẫy thường gặp: https://bit.ly/2OvtqGk\r\n" + 
				"		5. Từ vựng tiếng anh lớp 11: https://bit.ly/2IJhz5E\r\n" + 
				"		6. Từ vựng, Ngữ pháp Anh 12: https://bit.ly/2ZdN8L5\r\n" + 
				"		7. Bài tập theo Unit: https://bit.ly/2SnQKHf\r\n" + 
				"		\r\n" + 
				"		🍀 Môn Toán 10\r\n" + 
				"		1. Đề cương ôn tập cả tự luận lẫn trắc nghiệm Toán: https://bit.ly/2vd2rFn\r\n" + 
				"		2. Phương pháp ghi nhớ siêu nhanh công thức lượng giac: https://bit.ly/2KvQa9H\r\n" + 
				"		3. Đề thi học kì có đáp án: https://bit.ly/2VUETB2\r\n" + 
				"		4. Tổng hợp Hình học 10: https://bit.ly/2ZORAQi\r\n" + 
				"		Toán 11: https://bit.ly/2OzUZOI\r\n" + 
				"		Toán 12:\r\n" + 
				"		\r\n" + 
				"		🍀 Môn Văn\r\n" + 
				"		Văn 9 : https://bit.ly/2PbLAfm\r\n" + 
				"		Văn 10: https://bit.ly/2v8ZCW2\r\n" + 
				"		Văn 11: https://bit.ly/31uTQxk và https://bit.ly/385JaaF\r\n" + 
				"		Văn 12: https://bit.ly/2UHHDnJ và https://bit.ly/35w3tfX\r\n" + 
				"		\r\n" + 
				"		🍀 BỘ ĐỀ TINH TÚY LOVEBOOK: https://bit.ly/2OOQCjd\r\n" + 
				"		🍀 Toàn bộ đề thi, đáp án full môn BGD: https://bit.ly/2RJjs5E\r\n" + 
				"		\r\n" + 
				"		📌 Đăng kí khóa online hoặc đặt mua sách Anh, Văn inbox fanpage hoặc link https://bit.ly/2VgkdEi ❤️");
		
		List<SideWidget> lstWidget = new ArrayList<SideWidget>();
		SideWidget sideWidget = new SideWidget();
		sideWidget.setImageWidget("resources/img/img2.jpg");
		sideWidget.setTitleWidget("YẾU TỐ VÀNG CHO LÀNG 9+ MÔN NGỮ VĂN");
		sideWidget.setUrlWidget("##");
		lstWidget.add(0, sideWidget);
		lstWidget.add(0, sideWidget);
		lstWidget.add(0, sideWidget);
		model.addObject("lstWidget", lstWidget);
		
		List<TagWidget> lsTagtWidget = new ArrayList<TagWidget>();
		TagWidget tagWidget = new TagWidget();
		tagWidget.setTitleWidget("Ngữ Văn");
		tagWidget.setUrlWidget("##");
		lsTagtWidget.add(0, tagWidget);
		tagWidget.setTitleWidget("Học Văn");
		tagWidget.setUrlWidget("##");
		lsTagtWidget.add(0, tagWidget);
		model.addObject("lsTagtWidget", lsTagtWidget);
		
		return model;
	}
}
