package controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import service.UserService;

import entity.CreateMD5;
import entity.RandomNumber;
import entity.User;

@Controller
public class LoginController {

	@Autowired
	UserService userService;
	
	@RequestMapping(value="login", method={RequestMethod.POST, RequestMethod.GET})
	public ModelAndView login(HttpServletResponse response) {
		ModelAndView mv = new ModelAndView("login/login");
		return mv;
	}
	
	@RequestMapping(value="randomImage", method={RequestMethod.POST, RequestMethod.GET})
	public void randomImage(HttpServletRequest request, HttpServletResponse response) {
		RandomNumber randomNumber = new RandomNumber();
		try {
			String sRand= randomNumber.generateImage(response);
			request.getSession().setAttribute("sRand",sRand);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	@RequestMapping(value="doLogin", method={RequestMethod.POST, RequestMethod.GET})
	public void doLogin(User conditionUser, String iRand,
			HttpServletRequest request, HttpServletResponse response) {
		    String sRand = (String) request.getSession().getAttribute("sRand");
			PrintWriter out = null;
			try {
				out = response.getWriter();
			} catch (IOException e) {
				e.printStackTrace();
			}
			if (iRand != null && sRand != null && sRand.equals(iRand)) {
				String oldPass = conditionUser.getPassword();
				String newPass = CreateMD5.getMd5(oldPass);
				conditionUser.setPassword(newPass);
				
				User user = userService.searchByCondition(conditionUser);
				if (user != null) {
					User personUser = new User();
					personUser.setId(user.getId());
					personUser.setUsername(user.getUsername());
					request.getSession().setAttribute("user", personUser);
				    if (request.getSession().getAttribute("proId") != null) {
						out.print("showDetail");
					}else {
						out.print("success");
					}
				} else {
					out.print("用户名或密码错误！");
				}
			} else {
				out.print("验证码输入有误！");
			}
		}
	
	@RequestMapping(value="register", method={RequestMethod.POST, RequestMethod.GET})
	public ModelAndView register(HttpServletResponse response) {
		ModelAndView mv = new ModelAndView("login/register");
		return mv;
	}
	
	@RequestMapping(value="doRegister", method={RequestMethod.POST, RequestMethod.GET})
	public void doRegister(User registerUser, String iRand,
			HttpServletRequest request, HttpServletResponse response) {
		    String sRand = (String) request.getSession().getAttribute("sRand");
			PrintWriter out = null;
			try {
				out = response.getWriter();
			} catch (IOException e) {
				e.printStackTrace();
			}
			if (sRand != null && sRand.equals(iRand)) {
				//MD5加密
				String oldPass = registerUser.getPassword();
			    String newPass = CreateMD5.getMd5(oldPass);
				registerUser.setPassword(newPass);
				
				int result = userService.add(registerUser);
				if(result > 0) {
					out.print("success");
				}
			} else {
				out.print("验证码输入有误！");
			}
		}
}
