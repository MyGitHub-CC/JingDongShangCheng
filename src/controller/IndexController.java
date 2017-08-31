package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import service.CategoryService;
import service.KindService;
import service.ProvinceService;
import entity.Category;
import entity.Kind;
import entity.Province;
import entity.User;

@Controller
public class IndexController {

	@Autowired
	CategoryService categoryService;
	@Autowired
	KindService kindService;
	@Autowired
	ProvinceService provinceService;
	
	@RequestMapping(value="index", method={RequestMethod.POST, RequestMethod.GET})
	public ModelAndView index(String pId,String pName, User user, HttpServletRequest request) {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("index/index");
		mv.addObject("pId", pId);
		mv.addObject("pName", pName);
		List<Category> categories = categoryService.searchGCAndGS();
//		int cId = 1;
//		if (cIdString != null) {
//			cId = Integer.parseInt(cIdString);
//		}
		//List<Kind> kinds = kindService.searchKindAndClazz(cId);
		mv.addObject("categories", categories);
		//mv.addObject("kinds", kinds);
		mv.addObject("user", user);
		return mv;
	}
	
	@RequestMapping(value="searchProvince", method={RequestMethod.POST, RequestMethod.GET})
	public void searchProvince(HttpServletResponse response) {
		List<Province> provinces = provinceService.search();
		try {
			PrintWriter out = response.getWriter();
			JSONArray jsonArray = JSONArray.fromObject(provinces);
			out.print(jsonArray);
		} catch (IOException e1) {
			e1.printStackTrace();
		}
	}
	
	@RequestMapping(value="searchMenu", method={RequestMethod.POST, RequestMethod.GET})
	public void searchMenu( int cId, HttpServletResponse response) {
		response.setContentType("text/html;charset=utf-8");
		List<Kind> kinds = kindService.searchKindAndClazz(cId);
		try {
			PrintWriter out = response.getWriter();
			JSONArray jsonArray = JSONArray.fromObject(kinds);
			//System.out.println(jsonArray);
			out.print(jsonArray);
		} catch (IOException e1) {
			e1.printStackTrace();
		}
	}
	
}
