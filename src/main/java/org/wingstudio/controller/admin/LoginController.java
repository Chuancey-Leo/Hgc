package org.wingstudio.controller.admin;

import javax.servlet.http.HttpServletRequest;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.Subject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.wingstudio.entity.User;
import org.wingstudio.util.CryptographyUtil;

@Controller
@RequestMapping({"/user"})
public class LoginController
{
  @RequestMapping({"/admin/login"})
  public ModelAndView toLogin(HttpServletRequest request)
  {
    ModelAndView modelAndView = new ModelAndView();
    modelAndView.setViewName("/user/admin/login");
    return modelAndView;
  }

  @RequestMapping({"/adminlogin"})
  public String adminLogin(User user, HttpServletRequest request)
  {
    Subject subject = SecurityUtils.getSubject();
    CryptographyUtil cryptographyUtil = new CryptographyUtil();

    UsernamePasswordToken token = new UsernamePasswordToken(user.getUserName(), 
      CryptographyUtil.md5(user
      .getPassword(), "liaochuanhu"));
    try {
      subject.login(token);
      SecurityUtils.getSubject().getSession().setAttribute("adminConsole", "<a class=\"btn btn-manage\" href=\"/user/admin/work\">后台</a>");
      return "mainRedirect";
    } catch (Exception e) {
      e.printStackTrace();
      SecurityUtils.getSubject().getSession().setAttribute("errorInfo", "用户名或密码错误！"); }
    return "loginRedirect";
  }

  @RequestMapping({"/admin/main"})
  public ModelAndView main()
  {
    ModelAndView modelAndView = new ModelAndView();

    modelAndView.setViewName("/user/admin/index");
    return modelAndView;
  }
}