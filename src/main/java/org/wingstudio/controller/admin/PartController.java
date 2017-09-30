package org.wingstudio.controller.admin;

import java.io.File;
import java.io.PrintStream;
import java.util.Calendar;
import java.util.List;
import javax.annotation.Resource;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import net.sf.json.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.wingstudio.entity.Leader;
import org.wingstudio.entity.Part;
import org.wingstudio.service.LeaderService;
import org.wingstudio.service.PartService;
import org.wingstudio.util.ResponseUtil;

@Controller
@RequestMapping({"/user/admin"})
public class PartController
{

  @Resource
  private LeaderService leaderService;

  @Resource
  private PartService partService;

  @RequestMapping(value={"/addLeader"}, method={org.springframework.web.bind.annotation.RequestMethod.POST})
  public String addLeader(HttpServletRequest request, HttpServletResponse response, @RequestParam("file") MultipartFile file, ModelMap model, Leader leader)
    throws Exception
  {
    String path = request.getSession().getServletContext().getRealPath("/static/leaderImg");
    String path2 = request.getSession().getServletContext().getRealPath("/static");
    String testFileName = file.getOriginalFilename();
    String prefix = testFileName.substring(testFileName.lastIndexOf(".") + 1);
    String name = String.valueOf(Calendar.getInstance().getTimeInMillis());
    String fileName = name + "." + prefix;
    leader.setAvatar(fileName);

    File targetFile = new File(path, fileName);
    this.leaderService.addLeader(leader);
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

  @RequestMapping(value={"/updateLeader"}, method={org.springframework.web.bind.annotation.RequestMethod.POST})
  public String updateLeader(HttpServletRequest request, HttpServletResponse response, @RequestParam("file") MultipartFile file, ModelMap model, Leader leader)
    throws Exception
  {
    if (file.isEmpty()) {
      this.leaderService.updateLeader(leader);
      JSONObject result = new JSONObject();
      result.put("success", Boolean.valueOf(true));
      ResponseUtil.write(response, result);
      return null;
    }
    String path = request.getSession().getServletContext().getRealPath("/static/leaderImg");
    String path2 = request.getSession().getServletContext().getRealPath("/static");
    String testFileName = file.getOriginalFilename();
    String prefix = testFileName.substring(testFileName.lastIndexOf(".") + 1);
    String name = String.valueOf(Calendar.getInstance().getTimeInMillis());
    String fileName = name + "." + prefix;
    leader.setAvatar(fileName);

    File targetFile = new File(path, fileName);
    this.leaderService.updateLeader(leader);
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

  @RequestMapping({"/deleteLeader"})
  public String deleteLeader(@RequestParam("element") String id, HttpServletResponse response)
    throws Exception
  {
    this.leaderService.delete(Integer.valueOf(Integer.parseInt(id)));
    JSONObject result = new JSONObject();
    result.put("success", Boolean.valueOf(true));
    ResponseUtil.write(response, result);
    return null;
  }

  @RequestMapping({"/leader"})
  public ModelAndView listLeaders() throws Exception {
    ModelAndView modelAndView = new ModelAndView();
    List leaders = this.leaderService.list();
    modelAndView.addObject("leaders", leaders);
    modelAndView.setViewName("user/admin/part/leaderManage");
    return modelAndView;
  }

  @RequestMapping({"/introduce"})
  public ModelAndView getintroduce() throws Exception
  {
    ModelAndView modelAndView = new ModelAndView();
    Part introduce = this.partService.getPart(Integer.valueOf(5));
    modelAndView.addObject("introduce", introduce);
    modelAndView.setViewName("user/admin/part/introduceManage");
    return modelAndView; }

  @RequestMapping({"updateIntro"})
  public ModelAndView updateIntro() throws Exception {
    ModelAndView modelAndView = new ModelAndView();
    Part introduce = this.partService.getPart(Integer.valueOf(5));
    modelAndView.addObject("introduce", introduce);
    modelAndView.setViewName("user/admin/updatePart/introduce");
    return modelAndView;
  }

  @RequestMapping({"/saveIntro"})
  public String saveIntro(Part part, HttpServletResponse response) throws Exception
  {
    Integer i = this.partService.update(part);
    JSONObject result = new JSONObject();
    result.put("success", Boolean.valueOf(true));
    ResponseUtil.write(response, result);
    return null;
  }

  @RequestMapping({"/office"})
  public ModelAndView getOffice() throws Exception {
    ModelAndView modelAndView = new ModelAndView();
    Part office = this.partService.getPart(Integer.valueOf(1));
    modelAndView.addObject("office", office);
    modelAndView.setViewName("user/admin/part/officeManage");
    return modelAndView; }

  @RequestMapping({"updateOffice"})
  public ModelAndView updateOffice() throws Exception {
    ModelAndView modelAndView = new ModelAndView();
    Part office = this.partService.getPart(Integer.valueOf(1));
    modelAndView.addObject("office", office);
    modelAndView.setViewName("user/admin/updatePart/office");
    return modelAndView;
  }

  @RequestMapping({"/saveOffice"})
  public String saveOffice(Part part, HttpServletResponse response) throws Exception
  {
    Integer i = this.partService.update(part);
    JSONObject result = new JSONObject();
    result.put("success", Boolean.valueOf(true));
    ResponseUtil.write(response, result);
    return null;
  }

  @RequestMapping({"/base"})
  public ModelAndView getBase() throws Exception
  {
    ModelAndView modelAndView = new ModelAndView();
    Part base = this.partService.getPart(Integer.valueOf(2));
    modelAndView.addObject("base", base);
    modelAndView.setViewName("user/admin/part/baseManage");
    return modelAndView;
  }

  @RequestMapping({"updateBase"})
  public ModelAndView updateBase() throws Exception {
    ModelAndView modelAndView = new ModelAndView();
    Part base = this.partService.getPart(Integer.valueOf(2));
    modelAndView.addObject("base", base);
    modelAndView.setViewName("user/admin/updatePart/base");
    return modelAndView;
  }

  @RequestMapping({"/land"})
  public ModelAndView getLand() throws Exception {
    ModelAndView modelAndView = new ModelAndView();
    Part land = this.partService.getPart(Integer.valueOf(3));
    modelAndView.addObject("land", land);
    System.out.println("test land:" + land.getContent());
    modelAndView.setViewName("user/admin/part/landManage");
    return modelAndView;
  }

  @RequestMapping({"/updateLand"})
  public ModelAndView updateLand() throws Exception {
    ModelAndView modelAndView = new ModelAndView();
    Part land = this.partService.getPart(Integer.valueOf(3));
    modelAndView.addObject("land", land);
    modelAndView.setViewName("user/admin/updatePart/land");
    return modelAndView;
  }

  @RequestMapping({"/equipment"})
  public ModelAndView getEquipment() throws Exception {
    ModelAndView modelAndView = new ModelAndView();
    Part equipment = this.partService.getPart(Integer.valueOf(4));
    modelAndView.addObject("equipment", equipment);
    modelAndView.setViewName("user/admin/part/equipmentManage");
    return modelAndView;
  }

  @RequestMapping({"/updateEquipment"})
  public ModelAndView updateEquipment() throws Exception {
    ModelAndView modelAndView = new ModelAndView();
    Part equipment = this.partService.getPart(Integer.valueOf(4));
    modelAndView.addObject("equipment", equipment);
    modelAndView.setViewName("user/admin/updatePart/equipment");
    return modelAndView;
  }
}