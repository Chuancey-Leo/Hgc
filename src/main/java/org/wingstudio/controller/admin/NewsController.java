package org.wingstudio.controller.admin;

import java.awt.image.BufferedImage;
import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.annotation.Resource;
import javax.imageio.ImageIO;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import net.sf.json.JSONObject;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.support.RequestContextUtils;
import org.wingstudio.entity.News;
import org.wingstudio.entity.PageBean;
import org.wingstudio.entity.Picture;
import org.wingstudio.lucene.NewsIndex;
import org.wingstudio.service.NewsService;
import org.wingstudio.service.NewsTypeService;
import org.wingstudio.service.PictureService;
import org.wingstudio.util.PageUtil;
import org.wingstudio.util.ResponseUtil;
import org.wingstudio.util.StringUtil;

@Controller
@RequestMapping({"/user/admin"})
public class NewsController
{

  @Resource
  private NewsService newsService;

  @Resource
  private NewsTypeService newsTypeService;

  @Resource
  private PictureService pictureService;
  private NewsIndex newsIndex;

  public NewsController()
  {
    this.newsIndex = new NewsIndex();
  }

  @RequestMapping({"/addNews"})
  public ModelAndView addNews() throws Exception {
    ModelAndView modelAndView = new ModelAndView();

    List newsTypes = this.newsTypeService.countList();
    modelAndView.addObject("newsTypes", newsTypes);
    modelAndView.setViewName("user/admin/build/new");
    return modelAndView;
  }

  @RequestMapping({"/update"})
  public String update(News news, HttpServletResponse response, HttpServletRequest request)
    throws Exception
  {
    ServletContext application = RequestContextUtils.getWebApplicationContext(request)
      .getServletContext();

    News testNews = this.newsService.findById(news.getId());
    Document doc = Jsoup.parse(testNews.getContent());
    Elements elements = doc.select("img");
    List pictureListAll = this.pictureService.listAll();
    for (int i = 0; i < elements.size(); ++i) {
      Element element = (Element)elements.get(i);
      if (!(element.attr("src").equals(""))) {
        String url = element.attr("src");
        for (int j = 0; j < pictureListAll.size(); ++j) {
          if (url.equals(((Picture)pictureListAll.get(j)).getImgUrl())) {
            this.pictureService.delete(((Picture)pictureListAll.get(j)).getId().intValue());
          }
        }
      }
    }

    if ((news.getNewsTypeId().intValue() == 1) || (news.getNewsTypeId().intValue() == 2) || (news.getNewsTypeId().intValue() == 3)) {
      String content = news.getContent();

      Document doc1 = Jsoup.parse(content);
      Elements elements1 = doc1.select("img");

      for (int i = 0; i < elements1.size(); ++i) {
        Element element = (Element)elements1.get(i);
        Picture picture = this.pictureService.find();
        Picture p = new Picture();
        p.setImgUrl(element.attr("src"));

        String url = p.getImgUrl().substring(p.getImgUrl().length() - 3, p.getImgUrl().length());
        if (url.equals("gif")) {
          continue;
        }
        BufferedImage bufferedImage = ImageIO.read(new File("C:\\hgc\\apache-tomcat-9.0.0.M17\\webapps\\ROOT" + p.getImgUrl()));
        if (bufferedImage.getWidth() > 680) {
          String testContent1 = news.getContent();
          String testContent = testContent1.replace("src=\"" + p.getImgUrl() + "\"", "src=\"" + p.getImgUrl() + "\" style=\"width:87%\"");
          news.setContent(testContent);
        }
        p.setFlag(Integer.valueOf(picture.getFlag().intValue() + 1));
        this.pictureService.add(p);
        this.pictureService.remove();
      }

      Integer i = this.newsService.update(news);

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

      News testNew = this.newsService.getLast();
      List recentNews = this.newsService.getRecent();
      application.setAttribute("recentNews", recentNews);

      JSONObject result = new JSONObject();
      result.put("success", Boolean.valueOf(true));
      ResponseUtil.write(response, result);
    }
    else {
      JSONObject result = new JSONObject();
      result.put("success", Boolean.valueOf(false));
      ResponseUtil.write(response, result);
    }
    return null;
  }

  @RequestMapping({"/saveNews"})
  public String saveNews(News news, HttpServletResponse response, HttpServletRequest request)
    throws Exception
  {
    ServletContext application = RequestContextUtils.getWebApplicationContext(request)
      .getServletContext();
    if ((news.getNewsTypeId().intValue() == 1) || (news.getNewsTypeId().intValue() == 2) || (news.getNewsTypeId().intValue() == 3)) {
      String content = news.getContent();

      Document doc = Jsoup.parse(content);
      Elements elements = doc.select("img");

      for (int i = 0; i < elements.size(); ++i) {
        Element element = (Element)elements.get(i);
        Picture picture = this.pictureService.find();
        Picture p = new Picture();
        p.setImgUrl(element.attr("src"));

        String url = p.getImgUrl().substring(p.getImgUrl().length() - 3, p.getImgUrl().length());

        if (url.equals("gif")) {
          continue;
        }
        BufferedImage bufferedImage = ImageIO.read(new File("C:\\hgc\\apache-tomcat-9.0.0.M17\\webapps\\ROOT" + p.getImgUrl()));
        if (bufferedImage.getWidth() > 680) {
          String testContent1 = news.getContent();
          String testContent = testContent1.replace("src=\"" + p.getImgUrl() + "\"", "src=\"" + p.getImgUrl() + "\" style=\"width:87%\"");
          news.setContent(testContent);
        }
        p.setFlag(Integer.valueOf(picture.getFlag().intValue() + 1));
        this.pictureService.add(p);
      }

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

      Integer i = this.newsService.add(news);
      News testNew = this.newsService.getLast();
      List recentNews = this.newsService.getRecent();
      application.setAttribute("recentNews", recentNews);
      this.newsIndex.addIndex(testNew);
      JSONObject result = new JSONObject();
      result.put("success", Boolean.valueOf(true));
      ResponseUtil.write(response, result);
    }
    else {
      JSONObject result = new JSONObject();
      result.put("success", Boolean.valueOf(false));
      ResponseUtil.write(response, result);
    }
    return null;
  }

  @RequestMapping({"/work"})
  public ModelAndView listWorks(@RequestParam(value="page", required=false) String page, HttpServletRequest request)
    throws Exception
  {
    ModelAndView modelAndView = new ModelAndView();
    if (StringUtil.isEmpty(page)) {
      page = "1";
    }
    PageBean pageBean = new PageBean(Integer.parseInt(page), 10);
    Map map = new HashMap();
    map.put("start", Integer.valueOf(pageBean.getStart()));
    map.put("size", Integer.valueOf(pageBean.getPageSize()));
    map.put("newsTypeId", Integer.valueOf(1));
    List newsList = this.newsService.list(map);

    Long sum = this.newsService.getTotal(map);
    modelAndView.addObject("sum", sum);
    modelAndView.addObject("pageCode", PageUtil.genPagination(request.getContextPath() + "/user/admin/work", this.newsService
      .getTotal(map)
      .longValue(), Integer.parseInt(page), 10));
    modelAndView.addObject("workList", newsList);
    modelAndView.setViewName("user/admin/news/workManage");
    return modelAndView;
  }

  @RequestMapping({"/service"})
  public ModelAndView listServices(@RequestParam(value="page", required=false) String page, HttpServletRequest request)
    throws Exception
  {
    ModelAndView modelAndView = new ModelAndView();
    if (StringUtil.isEmpty(page)) {
      page = "1";
    }
    PageBean pageBean = new PageBean(Integer.parseInt(page), 10);
    Map map = new HashMap();
    map.put("start", Integer.valueOf(pageBean.getStart()));
    map.put("size", Integer.valueOf(pageBean.getPageSize()));
    map.put("newsTypeId", Integer.valueOf(2));
    List newsList = this.newsService.list(map);
    Long sum = this.newsService.getTotal(map);
    modelAndView.addObject("sum", sum);

    modelAndView.addObject("pageCode", PageUtil.genPagination(request.getContextPath() + "/user/admin/service", this.newsService
      .getTotal(map)
      .longValue(), Integer.parseInt(page), 10));
    modelAndView.addObject("serviceList", newsList);
    modelAndView.setViewName("user/admin/news/serviceManage");
    return modelAndView;
  }

  @RequestMapping({"/tender"})
  public ModelAndView listTenders(@RequestParam(value="page", required=false) String page, HttpServletRequest request)
    throws Exception
  {
    ModelAndView modelAndView = new ModelAndView();
    if (StringUtil.isEmpty(page)) {
      page = "1";
    }
    PageBean pageBean = new PageBean(Integer.parseInt(page), 10);
    Map map = new HashMap();
    map.put("start", Integer.valueOf(pageBean.getStart()));
    map.put("size", Integer.valueOf(pageBean.getPageSize()));
    map.put("newsTypeId", Integer.valueOf(3));
    List newsList = this.newsService.list(map);

    Long sum = this.newsService.getTotal(map);
    modelAndView.addObject("sum", sum);
    modelAndView.addObject("pageCode", PageUtil.genPagination(request.getContextPath() + "/user/admin/tender", this.newsService
      .getTotal(map)
      .longValue(), Integer.parseInt(page), 10));
    modelAndView.addObject("tenderList", newsList);
    modelAndView.setViewName("user/admin/news/tenderManage");
    return modelAndView;
  }

  @RequestMapping({"/findById"})
  public String findById(@RequestParam("id") String id, HttpServletResponse response)
    throws Exception
  {
    News news = this.newsService.findById(Integer.valueOf(Integer.parseInt(id)));

    JSONObject jsonObject = JSONObject.fromObject(news);
    ResponseUtil.write(response, jsonObject);
    return null;
  }

  @RequestMapping({"/delete"})
  public String delete(@RequestParam("element") String id, HttpServletResponse response, HttpServletRequest request)
    throws Exception
  {
    ServletContext application = RequestContextUtils.getWebApplicationContext(request)
      .getServletContext();

    News news = this.newsService.findById(Integer.valueOf(Integer.parseInt(id)));
    Document doc = Jsoup.parse(news.getContent());

    Elements elements = doc.select("img");

    List pictureListAll = this.pictureService.listAll();
    for (int i = 0; i < elements.size(); ++i) {
      Element element = (Element)elements.get(i);

      if (!(element.attr("src").equals(""))) {
        String url = element.attr("src");
        for (int j = 0; j < pictureListAll.size(); ++j) {
          if (url.equals(((Picture)pictureListAll.get(j)).getImgUrl())) {
            this.pictureService.delete(((Picture)pictureListAll.get(j)).getId().intValue());
          }

        }

      }

    }

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

    List recentNews = this.newsService.getRecent();
    application.setAttribute("recentNews", recentNews);

    this.newsService.delete(Integer.valueOf(Integer.parseInt(id)));

    JSONObject result = new JSONObject();
    result.put("success", Boolean.valueOf(true));
    ResponseUtil.write(response, result);
    return null;
  }

  @RequestMapping({"/updateNews/{id}"})
  public ModelAndView updateNews(@PathVariable("id") Integer id) throws Exception {
    ModelAndView modelAndView = new ModelAndView();
    News news = this.newsService.findById(id);
    List newsTypes = this.newsTypeService.countList();
    modelAndView.addObject("newsTypes", newsTypes);
    modelAndView.addObject("news", news);
    modelAndView.setViewName("user/admin/update/new");
    return modelAndView;
  }

  @RequestMapping({"/toTop"})
  public String toTopNews(@RequestParam("id") String id, HttpServletResponse response)
    throws Exception
  {
    News topNews = this.newsService.selectTop();
    Map map = new HashMap();
    map.put("top", Integer.valueOf(topNews.getToTop().intValue() + 1));
    map.put("id", Integer.valueOf(Integer.parseInt(id)));
    this.newsService.toTopNews(map);
    JSONObject result = new JSONObject();
    result.put("success", Boolean.valueOf(true));
    ResponseUtil.write(response, result);
    return null;
  }

  @RequestMapping({"cancelTop"})
  public String cancelTop(@RequestParam("id") String id, HttpServletResponse response) throws Exception
  {
    this.newsService.cancelTop(Integer.valueOf(Integer.parseInt(id)));
    JSONObject result = new JSONObject();
    result.put("success", Boolean.valueOf(true));
    ResponseUtil.write(response, result);
    return null;
  }

  @RequestMapping({"/search"})
  public ModelAndView search(HttpServletRequest request) throws Exception {
    ModelAndView modelAndView = new ModelAndView();
    String content = request.getParameter("content");
    List newsList = this.newsIndex.searchNews(content);

    modelAndView.addObject("newsList", newsList);
    modelAndView.setViewName("user/admin/news/searchResult");
    return modelAndView;
  }
}