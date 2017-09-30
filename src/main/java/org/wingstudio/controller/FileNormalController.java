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
import org.wingstudio.entity.File;
import org.wingstudio.entity.PageBean;
import org.wingstudio.service.FileService;
import org.wingstudio.util.PageUtil;
import org.wingstudio.util.StringUtil;

@Controller
@RequestMapping({"/file"})
public class FileNormalController
{

  @Resource
  private FileService fileService;

  @RequestMapping({"/preview/{id}"})
  public ModelAndView preview(@PathVariable("id") Integer id, HttpServletRequest request)
    throws Exception
  {
    ModelAndView modelAndView = new ModelAndView();
    File file = this.fileService.findFileById(id);
    File testFile = new File();
    testFile.setClickHit(Integer.valueOf(file.getClickHit().intValue() + 1));
    testFile.setId(file.getId());
    this.fileService.updateFile(testFile);
    modelAndView.addObject("file", file);
    modelAndView.setViewName("user/file/file");
    return modelAndView;
  }

  @RequestMapping({"/policy"})
  public ModelAndView police(@RequestParam(value="page", required=false) String page, HttpServletRequest request)
  {
    ModelAndView modelAndView = new ModelAndView();
    if (StringUtil.isEmpty(page)) {
      page = "1";
    }
    PageBean pageBean = new PageBean(Integer.parseInt(page), 10);
    Map map = new HashMap();
    map.put("start", Integer.valueOf(pageBean.getStart()));
    map.put("size", Integer.valueOf(pageBean.getPageSize()));
    map.put("fileTypeId", Integer.valueOf(1));
    List newsList = this.fileService.listFile(map);

    modelAndView.addObject("pageCode", PageUtil.genPagination(request.getContextPath() + "/file/policy", this.fileService
      .getTotal(map)
      .longValue(), Integer.parseInt(page), 10));
    modelAndView.addObject("policyList", newsList);
    modelAndView.setViewName("user/file/policy");

    return modelAndView;
  }

  @RequestMapping({"/manage"})
  public ModelAndView manage(@RequestParam(value="page", required=false) String page, HttpServletRequest request)
  {
    ModelAndView modelAndView = new ModelAndView();
    if (StringUtil.isEmpty(page)) {
      page = "1";
    }
    PageBean pageBean = new PageBean(Integer.parseInt(page), 10);
    Map map = new HashMap();
    map.put("start", Integer.valueOf(pageBean.getStart()));
    map.put("size", Integer.valueOf(pageBean.getPageSize()));
    map.put("fileTypeId", Integer.valueOf(2));
    List newsList = this.fileService.listFile(map);

    modelAndView.addObject("pageCode", PageUtil.genPagination(request.getContextPath() + "/file/manage", this.fileService
      .getTotal(map)
      .longValue(), Integer.parseInt(page), 10));
    modelAndView.addObject("manageList", newsList);
    modelAndView.setViewName("user/file/manage");

    return modelAndView;
  }

  @RequestMapping({"/house"})
  public ModelAndView house(@RequestParam(value="page", required=false) String page, HttpServletRequest request)
  {
    ModelAndView modelAndView = new ModelAndView();
    if (StringUtil.isEmpty(page)) {
      page = "1";
    }
    PageBean pageBean = new PageBean(Integer.parseInt(page), 10);
    Map map = new HashMap();
    map.put("start", Integer.valueOf(pageBean.getStart()));
    map.put("size", Integer.valueOf(pageBean.getPageSize()));
    map.put("fileTypeId", Integer.valueOf(3));
    List newsList = this.fileService.listFile(map);

    modelAndView.addObject("pageCode", PageUtil.genPagination(request.getContextPath() + "/file/house", this.fileService
      .getTotal(map)
      .longValue(), Integer.parseInt(page), 10));
    modelAndView.addObject("houseList", newsList);
    modelAndView.setViewName("user/file/house");

    return modelAndView;
  }
}