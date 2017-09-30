package org.wingstudio.controller;

import java.io.PrintStream;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.annotation.Resource;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import net.sf.json.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.support.RequestContextUtils;
import org.wingstudio.entity.Picture;
import org.wingstudio.service.FileService;
import org.wingstudio.service.LinkService;
import org.wingstudio.service.NewsService;
import org.wingstudio.service.PictureService;
import org.wingstudio.service.ScrollPictureService;
import org.wingstudio.service.SourceService;
import org.wingstudio.service.StyleService;
import org.wingstudio.util.ResponseUtil;

@Controller
@RequestMapping({"/"})
public class IndexController
{

  @Resource
  private NewsService newsService;

  @Resource
  private FileService fileService;

  @Resource
  private SourceService sourceService;

  @Resource
  private ScrollPictureService scrollPictureService;

  @Resource
  private LinkService linkService;

  @Resource
  private PictureService pictureService;

  @Resource
  private StyleService styleService;

  @RequestMapping({"index"})
  public ModelAndView index()
  {
    ModelAndView modelAndView = new ModelAndView();

    Map mapWorkTop = new HashMap();
    mapWorkTop.put("start", Integer.valueOf(0));
    mapWorkTop.put("size", Integer.valueOf(8));
    mapWorkTop.put("newsTypeId", Integer.valueOf(1));
    List newsListHot = this.newsService.listIndexTop(mapWorkTop);

    Map mapWorkEnd = new HashMap();
    mapWorkEnd.put("start", Integer.valueOf(0));
    mapWorkEnd.put("size", Integer.valueOf(8 - newsListHot.size()));
    mapWorkEnd.put("newsTypeId", Integer.valueOf(1));

    List listWorkEnd = this.newsService.listIndexEnd(mapWorkEnd);

    modelAndView.addObject("newsListHot", newsListHot);
    modelAndView.addObject("listWorkEnd", listWorkEnd);

    System.out.println("work" + newsListHot.size());

    Map mapServiceTop = new HashMap();
    mapServiceTop.put("start", Integer.valueOf(0));
    mapServiceTop.put("size", Integer.valueOf(8));
    mapServiceTop.put("newsTypeId", Integer.valueOf(2));
    List serviceListHot = this.newsService.listIndexTop(mapServiceTop);

    Map mapServiceEnd = new HashMap();
    mapServiceEnd.put("start", Integer.valueOf(0));
    mapServiceEnd.put("size", Integer.valueOf(8 - serviceListHot.size()));
    mapServiceEnd.put("newsTypeId", Integer.valueOf(2));

    List listServiceEnd = this.newsService.listIndexEnd(mapServiceEnd);
    modelAndView.addObject("serviceListHot", serviceListHot);
    modelAndView.addObject("listServiceEnd", listServiceEnd);

    System.out.println("service:" + serviceListHot.size());

    Map mapTenderTop = new HashMap();
    mapTenderTop.put("start", Integer.valueOf(0));
    mapTenderTop.put("size", Integer.valueOf(8));
    mapTenderTop.put("newsTypeId", Integer.valueOf(3));
    List tenderListHot = this.newsService.listIndexTop(mapTenderTop);

    Map mapTenderEnd = new HashMap();
    mapTenderEnd.put("start", Integer.valueOf(0));
    mapTenderEnd.put("size", Integer.valueOf(8 - tenderListHot.size()));
    mapTenderEnd.put("newsTypeId", Integer.valueOf(3));

    List listTenderEnd = this.newsService.listIndexEnd(mapTenderEnd);
    modelAndView.addObject("tenderListHot", tenderListHot);
    modelAndView.addObject("listTenderEnd", listTenderEnd);

    modelAndView.setViewName("user/index");

    Map map3 = new HashMap();
    map3.put("start", Integer.valueOf(0));
    map3.put("size", Integer.valueOf(8));
    map3.put("fileTypeId", Integer.valueOf(1));
    List fileList1 = this.fileService.listFile(map3);
    modelAndView.addObject("fileList1", fileList1);

    Map map4 = new HashMap();
    map4.put("start", Integer.valueOf(0));
    map4.put("size", Integer.valueOf(8));
    map4.put("fileTypeId", Integer.valueOf(2));
    List fileList2 = this.fileService.listFile(map4);
    modelAndView.addObject("fileList2", fileList2);

    Map map5 = new HashMap();
    map5.put("start", Integer.valueOf(0));
    map5.put("size", Integer.valueOf(8));
    map5.put("fileTypeId", Integer.valueOf(3));
    List fileList3 = this.fileService.listFile(map5);
    modelAndView.addObject("fileList3", fileList3);

    Map map6 = new HashMap();
    map6.put("start", Integer.valueOf(0));
    map6.put("size", Integer.valueOf(8));
    map6.put("sourceTypeId", Integer.valueOf(1));
    List sourceList1 = this.sourceService.listSource(map6);
    modelAndView.addObject("sourceList1", sourceList1);

    Map map7 = new HashMap();
    map7.put("start", Integer.valueOf(0));
    map7.put("size", Integer.valueOf(8));
    map7.put("sourceTypeId", Integer.valueOf(2));
    List sourceList2 = this.sourceService.listSource(map7);
    modelAndView.addObject("sourceList2", sourceList2);

    List pictures = this.scrollPictureService.list();
    modelAndView.addObject("picture1", pictures.get(0));
    modelAndView.addObject("picture2", pictures.get(1));
    modelAndView.addObject("picture3", pictures.get(2));
    modelAndView.setViewName("user/index");
    return modelAndView;
  }

  @RequestMapping({"/user/setColor"})
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
}