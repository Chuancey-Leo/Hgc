package org.wingstudio.controller.admin;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.annotation.Resource;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import net.sf.json.JsonConfig;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.support.RequestContextUtils;
import org.wingstudio.entity.Link;
import org.wingstudio.entity.PageBean;
import org.wingstudio.service.LinkService;
import org.wingstudio.util.ResponseUtil;

@Controller
@RequestMapping({"/user/admin"})
public class LinkController
{

  @Resource
  private LinkService linkService;

  @RequestMapping({"saveLink"})
  public String saveLink(Link link, HttpServletResponse response, HttpServletRequest request)
    throws Exception
  {
    ServletContext application = RequestContextUtils.getWebApplicationContext(request).getServletContext();
    this.linkService.add(link);
    List linkList = this.linkService.list();
    application.setAttribute("linkList", linkList);
    JSONObject result = new JSONObject();
    result.put("success", Boolean.valueOf(true));
    ResponseUtil.write(response, result);
    return null;
  }

  @RequestMapping({"/link"})
  public ModelAndView setLink() throws Exception {
    ModelAndView modelAndView = new ModelAndView();
    List linkList = this.linkService.list();
    modelAndView.addObject("linkList", linkList);
    modelAndView.setViewName("user/admin/system/linkManage");
    return modelAndView;
  }

  @RequestMapping({"/listLink"})
  public String listLink(@RequestParam(value="page", required=false) String page, @RequestParam(value="rows", required=false) String rows, HttpServletResponse response)
    throws Exception
  {
    PageBean pageBean = new PageBean(Integer.parseInt(page), Integer.parseInt(rows));
    Map map = new HashMap();
    map.put("start", Integer.valueOf(pageBean.getStart()));
    map.put("size", Integer.valueOf(pageBean.getPageSize()));

    List newsList = this.linkService.list();
    Long total = this.linkService.getTotal(map);
    JSONObject result = new JSONObject();
    JsonConfig jsonConfig = new JsonConfig();

    JSONArray jsonArray = JSONArray.fromObject(newsList, jsonConfig);
    result.put("rows", jsonArray);
    result.put("total", total);
    ResponseUtil.write(response, result);
    return null;
  }

  @RequestMapping({"/findLinkById"})
  public String findLinkById(@RequestParam("id") String id, HttpServletResponse response)
    throws Exception
  {
    Link link = this.linkService.findLinkById(Integer.valueOf(Integer.parseInt(id)));
    JSONObject jsonObject = JSONObject.fromObject(link);
    ResponseUtil.write(response, jsonObject);
    return null;
  }

  @RequestMapping({"/updateLink"})
  public String updateLink(@RequestParam("id") String id, Link link, HttpServletResponse response)
    throws Exception
  {
    Map map = new HashMap();
    map.put("id", Integer.valueOf(Integer.parseInt(id)));
    map.put("link", link.getLink());
    map.put("linkName", link.getLinkName());
    this.linkService.updateLink(map);
    JSONObject result = new JSONObject();
    result.put("success", Boolean.valueOf(true));
    ResponseUtil.write(response, result);
    return null;
  }

  @RequestMapping({"/deleteLink"})
  public String deleteLink(@RequestParam("id") String id, HttpServletResponse response, HttpServletRequest request)
    throws Exception
  {
    this.linkService.deleteLink(Integer.valueOf(Integer.parseInt(id)));
    ServletContext application = RequestContextUtils.getWebApplicationContext(request).getServletContext();
    List linkList = this.linkService.list();
    application.setAttribute("linkList", linkList);
    JSONObject result = new JSONObject();
    result.put("success", Boolean.valueOf(true));
    ResponseUtil.write(response, result);
    return null;
  }
}