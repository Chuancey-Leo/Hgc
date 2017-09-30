package org.wingstudio.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.wingstudio.entity.News;
import org.wingstudio.entity.PageBean;
import org.wingstudio.lucene.FileIndex;
import org.wingstudio.lucene.NewsIndex;
import org.wingstudio.lucene.SourceIndex;
import org.wingstudio.service.NewsService;
import org.wingstudio.util.PageUtil;
import org.wingstudio.util.StringUtil;

@Controller
@RequestMapping({"/"})
public class NewsNormalController
{

  @Resource
  private NewsService newsService;
  private FileIndex fileIndex;
  private NewsIndex newsIndex;
  private SourceIndex sourceIndex;

  public NewsNormalController()
  {
    this.fileIndex = new FileIndex();
    this.newsIndex = new NewsIndex();
    this.sourceIndex = new SourceIndex(); }

  @RequestMapping({"/news/{id}"})
  public ModelAndView news(@PathVariable("id") Integer id, HttpServletRequest request) throws Exception {
    ModelAndView modelAndView = new ModelAndView();

    News news = this.newsService.findById(id);
    news.setClickHit(Integer.valueOf(news.getClickHit().intValue() + 1));
    this.newsService.update(news);
    modelAndView.addObject("news", news);
    modelAndView.setViewName("user/newsView/viewNews");
    return modelAndView;
  }

  @RequestMapping({"/work"})
  public ModelAndView work(@RequestParam(value="page", required=false) String page, HttpServletRequest request)
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

    modelAndView.addObject("pageCode", PageUtil.genPagination(request.getContextPath() + "/work", this.newsService
      .getTotal(map)
      .longValue(), Integer.parseInt(page), 10));
    modelAndView.addObject("workList", newsList);
    modelAndView.setViewName("user/news/work");

    return modelAndView;
  }

  @RequestMapping({"/service"})
  public ModelAndView service(@RequestParam(value="page", required=false) String page, HttpServletRequest request)
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

    modelAndView.addObject("pageCode", PageUtil.genPagination(request.getContextPath() + "/service", this.newsService
      .getTotal(map)
      .longValue(), Integer.parseInt(page), 10));
    modelAndView.addObject("serviceList", newsList);
    modelAndView.setViewName("user/news/service");

    return modelAndView;
  }

  @RequestMapping({"/tender"})
  public ModelAndView tender(@RequestParam(value="page", required=false) String page, HttpServletRequest request)
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

    modelAndView.addObject("pageCode", PageUtil.genPagination(request.getContextPath() + "/tender", this.newsService
      .getTotal(map)
      .longValue(), Integer.parseInt(page), 10));
    modelAndView.addObject("tenderList", newsList);
    modelAndView.setViewName("user/news/tender");

    return modelAndView;
  }

  @RequestMapping({"/search"})
  public ModelAndView search(HttpServletRequest request) throws Exception {
    ModelAndView modelAndView = new ModelAndView();
    String content = request.getParameter("content");
    List newsList = this.newsIndex.searchNews(content);
    List fileList = this.fileIndex.searchFile(content);
    List sourceList = this.sourceIndex.searchSource(content);

    modelAndView.addObject("sourceList", sourceList);
    modelAndView.addObject("fileList", fileList);
    modelAndView.addObject("newsList", newsList);
    modelAndView.setViewName("user/searchResult");
    return modelAndView;
  }
}