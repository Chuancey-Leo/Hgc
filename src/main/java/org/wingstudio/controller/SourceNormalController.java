package org.wingstudio.controller;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import org.apache.commons.io.FileUtils;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.wingstudio.entity.PageBean;
import org.wingstudio.entity.Source;
import org.wingstudio.service.SourceService;
import org.wingstudio.util.PageUtil;
import org.wingstudio.util.StringUtil;

@Controller
@RequestMapping({"/source"})
public class SourceNormalController
{

  @Resource
  private SourceService sourceService;

  @RequestMapping({"/preview/{id}"})
  public ModelAndView preview(@PathVariable("id") Integer id, HttpServletRequest request)
    throws Exception
  {
    ModelAndView modelAndView = new ModelAndView();
    Source source = this.sourceService.findSourceById(id);
    modelAndView.addObject("source", source);
    modelAndView.setViewName("user/source/viewSource");
    return modelAndView; }

  @RequestMapping({"/download/{id}"})
  public ResponseEntity<byte[]> download(@PathVariable("id") Integer id) throws IOException {
    Source source = this.sourceService.findSourceById(id);
    source.setDownHit(Integer.valueOf(source.getDownHit().intValue() + 1));
    this.sourceService.update(source);
    String sourceName = source.getSourceName();

    String path = "C:\\hgc\\apache-tomcat-9.0.0.M17\\webapps\\ROOT\\static\\source\\" + sourceName;
    File file = new File(path);
    HttpHeaders headers = new HttpHeaders();

    String fileName = new String(sourceName.getBytes("UTF-8"), "iso-8859-1");
    headers.setContentDispositionFormData("attachment", fileName);
    headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
    return new ResponseEntity(FileUtils.readFileToByteArray(file), headers, HttpStatus.CREATED);
  }

  @RequestMapping({"/general"})
  public ModelAndView general(@RequestParam(value="page", required=false) String page, HttpServletRequest request)
  {
    ModelAndView modelAndView = new ModelAndView();
    if (StringUtil.isEmpty(page)) {
      page = "1";
    }
    PageBean pageBean = new PageBean(Integer.parseInt(page), 10);
    Map map = new HashMap();
    map.put("start", Integer.valueOf(pageBean.getStart()));
    map.put("size", Integer.valueOf(pageBean.getPageSize()));
    map.put("sourceTypeId", Integer.valueOf(1));
    List sourceList = this.sourceService.listSource(map);

    modelAndView.addObject("pageCode", PageUtil.genPagination(request.getContextPath() + "/source/general", this.sourceService
      .getTotal(map)
      .longValue(), Integer.parseInt(page), 10));
    modelAndView.addObject("sourceList", sourceList);
    modelAndView.setViewName("user/source/general");

    return modelAndView;
  }

  @RequestMapping({"/learn"})
  public ModelAndView learn(@RequestParam(value="page", required=false) String page, HttpServletRequest request)
  {
    ModelAndView modelAndView = new ModelAndView();
    if (StringUtil.isEmpty(page)) {
      page = "1";
    }
    PageBean pageBean = new PageBean(Integer.parseInt(page), 10);
    Map map = new HashMap();
    map.put("start", Integer.valueOf(pageBean.getStart()));
    map.put("size", Integer.valueOf(pageBean.getPageSize()));
    map.put("sourceTypeId", Integer.valueOf(2));
    List sourceList = this.sourceService.listSource(map);

    modelAndView.addObject("pageCode", PageUtil.genPagination(request.getContextPath() + "/source/learn", this.sourceService
      .getTotal(map)
      .longValue(), Integer.parseInt(page), 10));
    modelAndView.addObject("sourceList", sourceList);
    modelAndView.setViewName("user/source/learn");

    return modelAndView;
  }
}