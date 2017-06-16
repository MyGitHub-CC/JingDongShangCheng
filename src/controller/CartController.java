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
		if (user != null) {
			uId = user.getId(); 
		}
		int result = cartService.insert(uId, proId, num);
		try {
			PrintWriter out = response.getWriter();
			if(result > 0){
				out.print("success");
			} else {
				out.print("加入购物车失败！");
			}
		} catch (IOException e) {
			e.printStackTrace();
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
	public void deteleCart(int proId,HttpServletRequest request,HttpServletResponse response) {
		User user = (User) request.getSession().getAttribute("user");
		int uId = 0;
		if (user != null) {
			uId = user.getId(); 
		}
		int result = cartService.delete(uId, proId);
		try {
			PrintWriter out = response.getWriter();
			if(result > 0){
				out.print("success");
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
}
