package controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.databind.ObjectMapper;

import domain.Book;

@Controller
@RequestMapping("/json")
public class BookController {
	private static final Log logger = LogFactory.getLog(BookController.class);
	//@RequestBody 根据json数据，转换成对应的Object
	@RequestMapping("/testRequestBody")
	public void setJson(@RequestBody Book book,HttpServletResponse response) throws Exception{
		//ObjectMapper类是Jackson库的主要类。它提供一些功能将Java对象转化为对应的JSON格式的数据
		ObjectMapper mapper = new ObjectMapper();
		//将book对象转换成json输出
		logger.info(mapper.writeValueAsString(book));
		book.setAuthor("LXM");
		response.setContentType("text/html;charset=UTF-8");
		//将book对象转换成json写出到客户端
		response.getWriter().println(mapper.writeValueAsString(book));
	}
	
	@RequestMapping("/testRequestBody2")
	//@ResponseBody会将集合数据转换为json格式并将其返回客户端，注意：不是@RequestBody
	@ResponseBody
	public Object getJson(){
		List<Book> list = new ArrayList<Book>();
		list.add(new Book(1,"葵花宝典","LXM"));
		list.add(new Book(2,"菊花宝典","LXM2"));
		return list;
	}
}
