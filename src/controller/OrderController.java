package controller;

import java.io.IOException;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import service.CartService;
import service.OrderService;
import entity.Cart;
import entity.Product;
import entity.User;

@Controller
public class OrderController {
	
	@Autowired
	CartService cartService;
	@Autowired
	OrderService orderService;
	
	@RequestMapping(value="order", method={RequestMethod.POST, RequestMethod.GET})
	public ModelAndView order(String[] proIds, HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mv = new ModelAndView("order/order");
		User user = (User) request.getSession().getAttribute("user");
		int uId = 0;
		if (user != null) {
			uId = user.getId();
			List<Cart> carts = cartService.searchByUIdAndProIds(uId, proIds);
			mv.addObject("carts", carts);
			mv.addObject("proIds", proIds);
			return mv;
		} else {
			try {
				response.sendRedirect("login");
			} catch (IOException e) {
				e.printStackTrace();
			}
			return null;
		}
	}
	
	
	@RequestMapping(value="addOrder", method={RequestMethod.POST, RequestMethod.GET})
	public ModelAndView addOrder(HttpServletRequest request, HttpServletResponse response) {
		List<Cart> carts = (List<Cart>) request.getSession().getAttribute("carts");
		ModelAndView mv = new ModelAndView("order/addOrder");
		User user = (User) request.getSession().getAttribute("user");
		int uId = 0;
		if (user != null && carts != null) {
			uId = user.getId();
			boolean result1 = cartService.deleteByUIdAndProIds(uId, carts);
			
			UUID uuid = UUID.randomUUID();
			String uuId = uuid.toString();
			boolean result2 = orderService.insert(uId, carts, uuId);
			
			String msg = "";
			if (result1 == true && result2 == true) {
				msg = "订单提交成功！";
				double sumPrice = 0;
				for (int i = 0; i < carts.size(); i++) {
					Product product = carts.get(i).getProduct();
					sumPrice += product.getPrice() * carts.get(i).getNum();
				}
				mv.addObject("sumPrice", sumPrice);
			} else {
				msg = "订单提交失败！";
			}
			mv.addObject("msg", msg);
			mv.addObject("uuId", uuId);
			return mv;
		} else {
			try {
				response.sendRedirect("index");
			} catch (IOException e) {
				e.printStackTrace();
			}
			return null;
		}
	}
	
}
