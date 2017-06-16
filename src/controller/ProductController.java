package controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import entity.Product;

import service.ProductService;

@Controller
public class ProductController {

	@Autowired
	ProductService productService;
	
	@RequestMapping(value="showList", method={RequestMethod.POST, RequestMethod.GET})
	public ModelAndView showList(String ye) {
		ModelAndView mv = new ModelAndView("product/list");
		int count = productService.searchCount();
		int maxPage = (count - 1) / 8 + 1;
		int page = 1;
		if (ye != null) {
			page = Integer.parseInt(ye);
			if (page < 1) {
				page = 1;
			}
			if (page >= maxPage) {
				page = maxPage;
			}
		}
		int begin = (page - 1) * 8; 
		List<Product> products = productService.searchProsAndPubs(begin);
		mv.addObject("products", products);
		mv.addObject("maxPage", maxPage);
		mv.addObject("page", page);
		return mv;
	}
	
	@RequestMapping(value="showDetail", method={RequestMethod.POST, RequestMethod.GET})
	public ModelAndView showDetail(String proId) {
		ModelAndView mv = new ModelAndView("product/detail");
		int id = 10;
		if (proId != null) {
			id = Integer.parseInt(proId);
		}
		Product product = productService.searchById(id);
		mv.addObject("product", product);
		return mv;
	}
}
