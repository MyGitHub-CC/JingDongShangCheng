package controller;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import service.ProductService;
import entity.Product;

@Controller
public class ProductController {

	@Autowired
	ProductService productService;
	
	@RequestMapping(value="showList", method={RequestMethod.POST, RequestMethod.GET})
	public ModelAndView showList(Integer cId, String ye) {
		ModelAndView mv = new ModelAndView("product/list");
		int count = productService.searchCount(cId);
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
		List<Product> products = productService.searchProsAndPubs(cId, begin);
		mv.addObject("products", products);
		mv.addObject("maxPage", maxPage);
		mv.addObject("page", page);
		mv.addObject("cId", cId);
		return mv;
	}
	
	@RequestMapping(value="showDetail", method={RequestMethod.POST, RequestMethod.GET})
	public ModelAndView showDetail(String proId,HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("product/detail");
		int id = 10;
		if(request.getSession().getAttribute("proId") != null){
			id = (Integer) request.getSession().getAttribute("proId");
		}
		if (proId != null) {
			id = Integer.parseInt(proId);
		}
		Product product = productService.searchById(id);
		mv.addObject("product", product);
		return mv;
	}
	
}
