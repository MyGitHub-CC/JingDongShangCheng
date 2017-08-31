package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import service.CartService;
import entity.Cart;
import entity.User;

@Controller
public class CartController {
	
	@Autowired
	CartService cartService;
	
	@RequestMapping(value="cart", method={RequestMethod.POST, RequestMethod.GET})
	public ModelAndView cart(HttpServletRequest request,HttpServletResponse response) {
		ModelAndView mv = new ModelAndView("cart/cart");
		User user = (User) request.getSession().getAttribute("user");
		int uId = 0;
		if (user != null) {
			uId = user.getId();
			List<Cart> carts = cartService.searchByUId(uId);
			mv.addObject("carts", carts);
			return mv;
		}else {
			try {
				response.sendRedirect("login");
			} catch (IOException e) {
				e.printStackTrace();
			}
			return null;
		}
	}
	
	@RequestMapping(value="addCart", method={RequestMethod.POST, RequestMethod.GET})
	public void addCart(int proId, int num,HttpServletRequest request, HttpServletResponse response) {
		User user = (User) request.getSession().getAttribute("user");
		int uId = 0;
		PrintWriter out;
		try {
			out = response.getWriter();
			if (user != null) {
				uId = user.getId(); 
				int result = cartService.insert(uId, proId, num);
				if(result > 0){
					out.print("success");
				} else {
					out.print("加入购物车失败！");
				}
			} else {
				request.getSession().setAttribute("proId", proId);
				out.print("请先登录！");
			}
		} catch (IOException e1) {
			e1.printStackTrace();
		}
		
	}
	
	@RequestMapping(value="updateCart", method={RequestMethod.POST, RequestMethod.GET})
	public void updateCart(int proId, int num, HttpServletRequest request, HttpServletResponse response) {
		User user = (User) request.getSession().getAttribute("user");
		int uId = 0;
		if (user != null) {
			uId = user.getId(); 
		}
		int result = cartService.update(uId, proId, num);
		try {
			PrintWriter out = response.getWriter();
			if(result > 0){
				out.print("success");
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	@RequestMapping(value="deleteCart", method={RequestMethod.POST, RequestMethod.GET})
	public void deteleCart(Integer[] proIds,HttpServletRequest request,HttpServletResponse response) {
		User user = (User) request.getSession().getAttribute("user");
		int uId = 0;
		if (user != null) {
			uId = user.getId(); 
		}
		int result = cartService.delete(uId, proIds);
		try {
			PrintWriter out = response.getWriter();
			if(result > 0){
				out.print("success");
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
//	@RequestMapping(value="/a", method={RequestMethod.POST, RequestMethod.GET})
//	public ModelAndView a() {
//		ModelAndView mv = new ModelAndView("redirect: b");
//		int uId = 1;
//		Cart cart = new Cart();
//		cart.setId(2);
//		cart.setNum(5);
//		mv.addObject("uId", uId);
//		mv.addObject("cart", cart);
//		return mv;
//	}
//	
//	@RequestMapping(value="/b", method={RequestMethod.POST, RequestMethod.GET})
//	public ModelAndView b(int uId,Cart cart) {
//		ModelAndView mv = new ModelAndView("cart/c");
//		int id = 1;
//		mv.addObject("uId", uId);
//		mv.addObject("id", id);
//		return mv;
//	}
}
