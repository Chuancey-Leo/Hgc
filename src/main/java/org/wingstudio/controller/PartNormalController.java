package org.wingstudio.controller;

import java.util.List;
import javax.annotation.Resource;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.wingstudio.entity.Leader;
import org.wingstudio.entity.Part;
import org.wingstudio.service.LeaderService;
import org.wingstudio.service.PartService;

@Controller
@RequestMapping({"/part"})
public class PartNormalController
{

  @Resource
  private LeaderService leaderService;

  @Resource
  private PartService partService;

  @RequestMapping({"/leader"})
  public ModelAndView leader()
  {
    ModelAndView modelAndView = new ModelAndView();

    List leaderList = this.leaderService.list();
    Leader leader1 = (Leader)leaderList.get(0);
    leaderList.remove(0);
    modelAndView.addObject("leader1", leader1);
    modelAndView.addObject("leaderList", leaderList);
    modelAndView.setViewName("user/part/leader");
    return modelAndView;
  }

  @RequestMapping({"/introduce"})
  public ModelAndView introduce() {
    ModelAndView modelAndView = new ModelAndView();

    Part part = this.partService.getPart(Integer.valueOf(5));
    modelAndView.addObject("part", part);
    modelAndView.setViewName("user/part/introduce");
    return modelAndView;
  }

  @RequestMapping({"/office"})
  public ModelAndView office() {
    ModelAndView modelAndView = new ModelAndView();
    Part part = this.partService.getPart(Integer.valueOf(1));
    modelAndView.addObject("part", part);
    modelAndView.setViewName("user/part/office");
    return modelAndView;
  }

  @RequestMapping({"/base"})
  public ModelAndView base() {
    ModelAndView modelAndView = new ModelAndView();
    Part part = this.partService.getPart(Integer.valueOf(2));
    modelAndView.addObject("part", part);
    modelAndView.setViewName("user/part/base");
    return modelAndView;
  }

  @RequestMapping({"/equipment"})
  public ModelAndView equipment() {
    ModelAndView modelAndView = new ModelAndView();
    Part part = this.partService.getPart(Integer.valueOf(3));
    modelAndView.addObject("part", part);
    modelAndView.setViewName("user/part/equipment");
    return modelAndView;
  }

  @RequestMapping({"/land"})
  public ModelAndView land() {
    ModelAndView modelAndView = new ModelAndView();
    Part part = this.partService.getPart(Integer.valueOf(4));
    modelAndView.addObject("part", part);
    modelAndView.setViewName("user/part/land");
    return modelAndView;
  }
}