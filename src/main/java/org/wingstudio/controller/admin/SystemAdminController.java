package org.wingstudio.controller.admin;

import java.io.File;
import java.io.PrintStream;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.annotation.Resource;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import net.sf.json.JSONObject;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.subject.Subject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.support.RequestContextUtils;
import org.wingstudio.entity.Picture;
import org.wingstudio.entity.ScrollPicture;
import org.wingstudio.entity.User;
import org.wingstudio.service.FileTypeService;
import org.wingstudio.service.LinkService;
import org.wingstudio.service.NewsService;
import org.wingstudio.service.NewsTypeService;
import org.wingstudio.service.PictureService;
import org.wingstudio.service.ScrollPictureService;
import org.wingstudio.service.StyleService;
import org.wingstudio.service.UserService;
import org.wingstudio.util.CryptographyUtil;
import org.wingstudio.util.ResponseUtil;

@Controller
@RequestMapping({"/user/admin"})
public class SystemAdminController
{

  @Resource
  private NewsTypeService newsTypeService;

  @Resource
  private FileTypeService fileTypeService;

  @Resource
  private UserService userService;

  @Resource
  private StyleService styleService;

  @Resource
  private ScrollPictureService scrollPictureService;

  @Resource
  private LinkService linkService;

  @Resource
  private NewsService newsService;

  @Resource
  private PictureService pictureService;

  @RequestMapping({"/refreshSystem"})
  public String refreshSystem(HttpServletRequest request, HttpServletResponse response)
    throws Exception
  {
    ServletContext application = RequestContextUtils.getWebApplicationContext(request)
      .getServletContext();
    List newsTypeList = this.newsTypeService.countList();
    List fileTypeList = this.fileTypeService.countList();

    application.setAttribute("newsTypeList", newsTypeList);
    application.setAttribute("fileTypeList", fileTypeList);
    JSONObject result = new JSONObject();
    result.put("success", Boolean.valueOf(true));
    ResponseUtil.write(response, result);
    return null;
  }

  @RequestMapping({"/logout"})
  public String logout()
    throws Exception
  {
    SecurityUtils.getSubject().logout();
    return "redirect:/loginRedirect.jsp";
  }

  @RequestMapping({"/modifyPassword"})
  public String modifyPassword(String newPassword, HttpServletResponse response) throws Exception
  {
    System.out.println("test password:" + newPassword);
    User user = new User();
    user.setPassword(CryptographyUtil.md5(newPassword, "liaochuanhu"));
    Integer resultTotal = this.userService.update(user);
    JSONObject result = new JSONObject();
    if (resultTotal.intValue() > 0)
      result.put("success", Boolean.valueOf(true));
    else {
      result.put("success", Boolean.valueOf(false));
    }
    ResponseUtil.write(response, result);
    return null;
  }

  @RequestMapping({"/color"})
  public ModelAndView color() throws Exception {
    ModelAndView modelAndView = new ModelAndView();
    modelAndView.setViewName("user/admin/system/colorManage");
    return modelAndView;
  }

  @RequestMapping({"/setColor"})
  public String setColor(@RequestParam("id") String id, HttpServletRequest request, HttpServletResponse response)
    throws Exception
  {
    ServletContext application = RequestContextUtils.getWebApplicationContext(request).getServletContext();
    this.styleService.init();
    this.styleService.set(Integer.valueOf(Integer.parseInt(id)));
    if (Integer.parseInt(id) == 1)
      application.setAttribute("color", "red.css");
    else if (Integer.parseInt(id) == 2)
      application.setAttribute("color", "black.css");
    else if (Integer.parseInt(id) == 3) {
      application.setAttribute("color", "brown.css");
    }
    List linkList = this.linkService.list();
    application.setAttribute("linkList", linkList);
    List recentNews = this.newsService.getRecent();
    application.setAttribute("recentNews", recentNews);

    List pictureList = this.pictureService.list();
    Picture p1 = (Picture)pictureList.get(0);
    Picture p2 = (Picture)pictureList.get(1);
    Picture p3 = (Picture)pictureList.get(2);
    Picture p4 = (Picture)pictureList.get(3);
    Picture p5 = (Picture)pictureList.get(4);

    application.setAttribute("p1", p1);
    application.setAttribute("p2", p2);
    application.setAttribute("p3", p3);
    application.setAttribute("p4", p4);
    application.setAttribute("p5", p5);

    JSONObject result = new JSONObject();
    result.put("success", Boolean.valueOf(true));
    ResponseUtil.write(response, result);
    return null;
  }

  @RequestMapping({"/picture"})
  public ModelAndView setPicture() throws Exception {
    ModelAndView modelAndView = new ModelAndView();
    List scrollPictureList = this.scrollPictureService.list();
    modelAndView.addObject("scrollPictureList", scrollPictureList);
    modelAndView.setViewName("user/admin/system/pictureManage");
    return modelAndView;
  }

  @RequestMapping(value={"/updatePic"}, method={org.springframework.web.bind.annotation.RequestMethod.POST})
  public String updatePic(HttpServletRequest request, HttpServletResponse response, @RequestParam("file") MultipartFile file, ModelMap model, ScrollPicture scrollPicture)
    throws Exception
  {
    String path = request.getSession().getServletContext().getRealPath("/static/scrollPic");
    String path2 = request.getSession().getServletContext().getRealPath("/static");
    String testFileName = file.getOriginalFilename();
    String prefix = testFileName.substring(testFileName.lastIndexOf(".") + 1);
    String name = String.valueOf(Calendar.getInstance().getTimeInMillis());
    String imgName = name + "." + prefix;
    scrollPicture.setImgUrl(imgName);
    File targetFile = new File(path, imgName);
    Map map = new HashMap();
    map.put("imgUrl", imgName);
    map.put("id", scrollPicture.getId());
    this.scrollPictureService.update(map);
    try
    {
      file.transferTo(targetFile);
    } catch (Exception e) {
      e.printStackTrace();
    }

    JSONObject result = new JSONObject();
    result.put("success", Boolean.valueOf(true));
    ResponseUtil.write(response, result);
    return null;
  }

  @RequestMapping({"/setting"})
  public ModelAndView setting() throws Exception {
    ModelAndView modelAndView = new ModelAndView();

    modelAndView.setViewName("user/admin/system/userManage");
    return modelAndView;
  }

  @RequestMapping({"/modify"})
  public String modify(User user, HttpServletRequest request, HttpServletResponse response)
    throws Exception
  {
    CryptographyUtil cryptographyUtil = new CryptographyUtil();
    String password = request.getParameter("password");
    if (request.getParameter("userName") != null) {
      String userName = request.getParameter("userName");
      user.setUserName(userName);
    }
    User user1 = this.userService.check(CryptographyUtil.md5(password, "liaochuanhu"));
    JSONObject result;
    if (user1 != null) {
      user.setPassword(CryptographyUtil.md5(request.getParameter("password1"), "liaochuanhu"));

      this.userService.update(user);
      result = new JSONObject();
      result.put("success", Boolean.valueOf(true));
      ResponseUtil.write(response, result);
    } else {
      result = new JSONObject();
      result.put("success", Boolean.valueOf(false));
      ResponseUtil.write(response, result);
    }

    return null;
  }
}