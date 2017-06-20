package controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
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
	
	@RequestMapping(value="searchProduct", method={RequestMethod.POST,RequestMethod.GET})
	public ModelAndView searchProduct(Integer ye) {
		ModelAndView mv = new ModelAndView("backManager/product/searchProduct");
		int count = productService.searchCount();
		int maxPage = (count - 1) / 5 + 1;
		if (ye == null || ye < 1) {
			ye = 1;
		} else if (ye > maxPage) {
			ye = maxPage;
		}
		int begin = (ye - 1) * 5;
		List<Product> products = productService.search(begin);
		mv.addObject("products", products);
		mv.addObject("maxPage", maxPage);
		mv.addObject("ye", ye);
		return mv;
	}
	
	@RequestMapping(value="productShowAdd", method={RequestMethod.POST, RequestMethod.GET})
	public String productShowAdd() {
		return "backManager/product/add";
	}
	
	@RequestMapping(value="productAdd", method={RequestMethod.POST, RequestMethod.GET})
	public void productAdd(Product product,HttpServletRequest request, HttpServletResponse response,
			@RequestParam(value="myfile") MultipartFile[] myfiles) {
		PrintWriter out = null;
		String newName = "";
		try {
			out = response.getWriter();
			request.setCharacterEncoding("utf-8");
			response.setContentType("text/html;charset=utf-8");
			String uploadPath = request.getSession().getServletContext().getRealPath("/") + "photo";
			MultipartFile myfile = myfiles[0];
			if (!myfile.isEmpty()) {
				String oldName = myfile.getOriginalFilename();
				UUID uuid = UUID.randomUUID();
				newName = uuid.toString() + oldName.substring(oldName.lastIndexOf("."));
				myfile.transferTo(new File(uploadPath + "/"+ newName)) ;
			} else {
				out.print("文件上传失败！");
			}
		} catch (IOException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
		product.setPhoto(newName);
		int reslut = productService.insert(product);
		if (reslut > 0) {
			out.print("<script>alert('添加成功！');location.href='user'</script>");
		} else {
			out.print("<script>alert('添加失败！');location.href='user'</script>");
		}
	}
}
