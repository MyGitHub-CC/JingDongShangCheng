package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

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
import entity.MakeOrderNum;
import entity.Order;
import entity.Product;
import entity.User;

@Controller
public class OrderController {

	@Autowired
	CartService cartService;
	@Autowired
	OrderService orderService;

	@RequestMapping(value = "order", method = { RequestMethod.POST,
			RequestMethod.GET })
	public ModelAndView order(String[] proIds, HttpServletRequest request,
			HttpServletResponse response) {
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

	@RequestMapping(value = "addOrder", method = { RequestMethod.POST,
			RequestMethod.GET })
	public ModelAndView addOrder(String[] proIds, HttpServletRequest request,
			HttpServletResponse response) {
		ModelAndView mv = new ModelAndView("order/addOrder");
		User user = (User) request.getSession().getAttribute("user");
		int uId = 0;
		if (user != null) {
			uId = user.getId();
			List<Cart> carts = cartService.searchByUIdAndProIds(uId, proIds);
			List<Product> products = new ArrayList<Product>();
			for (Cart cart : carts) {
				products.add(cart.getProduct());
			}
			int result1 = cartService.deleteByUIdAndProIds(uId, products);

			MakeOrderNum makeOrderNum = new MakeOrderNum();
			String orderNum = makeOrderNum.makeOrderNum();
			int payment = 0;
			int send = 0;
			boolean result2 = orderService.insert(uId, carts, orderNum,
					payment, send);

			String msg = "";
			if (result1 > 0 && result2 == true) {
				msg = "订单提交成功！";
				double sumPrice = 0;
				for (int i = 0; i < carts.size(); i++) {
					Product product = carts.get(i).getProduct();
					sumPrice += product.getPrice() * carts.get(i).getNum();
				}
				mv.addObject("sumPrice", sumPrice);
				mv.addObject("msg", msg);
				mv.addObject("orderNum", orderNum);
			} else {
				msg = "订单提交失败！";
			}
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

	@RequestMapping(value = "showOrder", method = { RequestMethod.POST,
			RequestMethod.GET })
	public ModelAndView showOrder(HttpServletRequest request,
			HttpServletResponse response) {
		ModelAndView mv = new ModelAndView("order/userOrder");
		User user = (User) request.getSession().getAttribute("user");
		if (user != null) {
			int uId = user.getId();
			List<Order> orders = orderService.searchByUId(uId);
			mv.addObject("orders", orders);
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

	@RequestMapping(value = "ModifyOrder", method = { RequestMethod.POST,
			RequestMethod.GET })
	public ModelAndView ModifyOrder(Order order, HttpServletRequest request,
			HttpServletResponse response) {
		ModelAndView mv = new ModelAndView("redirect:showOrder");
		User user = (User) request.getSession().getAttribute("user");
		if (user != null && order != null) {
			order.setuId(user.getId());

			int result = orderService.modify(order);
			String msg = "";
			if (result > 0) {
				msg = "付款成功！";
			} else {
				msg = "付款失败！";
			}
			mv.addObject("msg", msg);
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

	@RequestMapping(value = "ModifyOrderById", method = { RequestMethod.POST,
			RequestMethod.GET })
	public void ModifyOrderById(Order order, HttpServletRequest request,
			HttpServletResponse response) {
		User user = (User) request.getSession().getAttribute("user");
		try {
			PrintWriter out = response.getWriter();
			if (user != null && order != null) {
				order.setuId(user.getId());
				int result = orderService.modifyById(order);
				String msg = "";
				if (result > 0) {
					msg = "success";
				} else {
					msg = "fail";
				}
				out.print(msg);
			} else {
				try {
					response.sendRedirect("login");
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		} catch (IOException e1) {
			e1.printStackTrace();
		}
	}
	
}
