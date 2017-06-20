package controller.back;

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

import service.UserService;
import entity.User;

@Controller
public class UserController {

	@Autowired
	UserService userService;
	
	@RequestMapping(value="user", method={RequestMethod.POST, RequestMethod.GET})
	public ModelAndView user(Integer ye) {
		ModelAndView mv = new ModelAndView("backManager/user/user");
		int count = userService.searchCount();
		int maxPage = (count - 1) / 5 + 1;
		if (ye == null || ye < 1) {
			ye = 1;
		} else if (ye > maxPage) {
			ye = maxPage;
		}
		int begin = (ye - 1 ) * 5 ;
		List<User> users = userService.search(begin);
		mv.addObject("users", users);
		mv.addObject("maxPage", maxPage);
		mv.addObject("ye", ye);
		return mv;
	}
	
	@RequestMapping(value="userShowAdd", method={RequestMethod.POST, RequestMethod.GET})
	public ModelAndView userShowAdd() {
		ModelAndView mv = new ModelAndView("backManager/user/add");
		
		return mv;
	}
	
	@RequestMapping(value="userAdd", method={RequestMethod.POST, RequestMethod.GET})
	public void userAdd(User user,HttpServletRequest request, HttpServletResponse response,
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
		user.setPhoto(newName);
		int reslut = userService.insert(user);
		if (reslut > 0) {
			out.print("<script>alert('添加成功！');location.href='user'</script>");
		} else {
			out.print("<script>alert('添加失败！');location.href='user'</script>");
		}
	}
	
	@RequestMapping(value="userShowModify", method={RequestMethod.POST, RequestMethod.GET})
	public ModelAndView userShowModify(Integer uId) {
		ModelAndView mv = new ModelAndView("backManager/user/modify");
		User user = userService.searchById(uId);
		mv.addObject("user", user);
		return mv;
	}
	
	@RequestMapping(value="userModify", method={RequestMethod.POST, RequestMethod.GET})
	public void userModify(User user,HttpServletRequest request, HttpServletResponse response,
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
		user.setPhoto(newName);
		int reslut = userService.update(user);
		if (reslut > 0) {
			out.print("<script>alert('更新成功！');location.href='user'</script>");
		} else {
			out.print("<script>alert('更新失败！');location.href='user'</script>");
		}
	}
	
	@RequestMapping(value="userDelete", method={RequestMethod.POST, RequestMethod.GET})
	public void userDelete(Integer uId, HttpServletResponse response) {
		int result = userService.delete(uId);
		try {
			PrintWriter out = response.getWriter();
			if (result > 0) {
				out.print("<script>alert('删除成功！');window.location.href='user'</script>");
			} else {
				out.print("<script>alert('删除失败！');window.location.href='user'</script>");
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
}
