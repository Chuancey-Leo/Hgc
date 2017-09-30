package org.wingstudio.controller.admin;

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.PrintStream;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.annotation.Resource;
import javax.imageio.ImageIO;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import net.sf.json.JSONObject;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.wingstudio.entity.PageBean;
import org.wingstudio.entity.Picture;
import org.wingstudio.entity.Source;
import org.wingstudio.lucene.SourceIndex;
import org.wingstudio.service.PictureService;
import org.wingstudio.service.SourceService;
import org.wingstudio.service.SourceTypeService;
import org.wingstudio.util.AsposeExcelUtil;
import org.wingstudio.util.AsposeUtil;
import org.wingstudio.util.PageUtil;
import org.wingstudio.util.ResponseUtil;
import org.wingstudio.util.StringUtil;

@Controller
@RequestMapping({"/user/admin"})
public class SourceController
{

  @Resource
  private SourceService sourceService;

  @Resource
  private SourceTypeService sourceTypeService;

  @Resource
  private PictureService pictureService;
  private SourceIndex sourceIndex;

  public SourceController()
  {
    this.sourceIndex = new SourceIndex(); }

  @RequestMapping({"/addSource"})
  public ModelAndView addSource() { ModelAndView modelAndView = new ModelAndView();
    List sourceTypes = this.sourceTypeService.countList();
    modelAndView.addObject("sourceTypes", sourceTypes);
    modelAndView.setViewName("user/admin/build/source");
    return modelAndView;
  }

  @RequestMapping(value={"/uploadSource"}, method={org.springframework.web.bind.annotation.RequestMethod.POST})
  public String uploadSource(HttpServletRequest request, HttpServletResponse response, @RequestParam("file") MultipartFile file, ModelMap model, Source source)
    throws Exception
  {
    String path = request.getSession().getServletContext().getRealPath("/static/source");
    String pathSourcePDF = request.getSession().getServletContext().getRealPath("/static/sourcePDF");
    String testFileName = file.getOriginalFilename();
    String prefix = testFileName.substring(testFileName.lastIndexOf(".") + 1);
    String name = String.valueOf(Calendar.getInstance().getTimeInMillis());
    String sourceName = name + "." + prefix;
    String sourceNamePDF = name + ".pdf";
    source.setSourceName(sourceName);
    long fileSize2 = file.getSize();
    String fileSize3;
    if (fileSize2 / 1024L < 1000L) {
      fileSize3 = String.valueOf(fileSize2 / 1024L) + "KB";
      source.setSourceSize(fileSize3);
    } else {
      fileSize3 = String.valueOf(fileSize2 / 1048576L) + "M";
      source.setSourceSize(fileSize3);
    }

    File targetFile = new File(path, sourceName);

    if ((source.getSourceTypeId().intValue() == 1) || (source.getSourceTypeId().intValue() == 2)) {
      String content = source.getContent() + "  ";

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
          String testContent1 = source.getContent();
          String testContent = testContent1.replace("src=\"" + p.getImgUrl() + "\"", "src=\"" + p.getImgUrl() + "\" style=\"width:87%\"");
          source.setContent(testContent);
        }
        p.setFlag(Integer.valueOf(picture.getFlag().intValue() + 1));
        this.pictureService.add(p);
        this.pictureService.remove();
      }

    }

    this.sourceService.add(source);
    Source testSource = this.sourceService.getLast();
    this.sourceIndex.addIndex(testSource);

    if (prefix.equals("pdf")) {
      File targetFile1 = new File(pathSourcePDF, sourceNamePDF);
      try
      {
        file.transferTo(targetFile1);
      } catch (Exception e) {
        e.printStackTrace();
      }
    } else {
      File targetFile2 = new File(path, sourceName);
      try
      {
        file.transferTo(targetFile2);
      } catch (Exception e) {
        e.printStackTrace();
      }
    }

    if ((prefix.equals("doc")) || (prefix.equals("docx")) || (prefix.equals("txt")))
      try
      {
        AsposeUtil.docToPdf(path + "/" + sourceName, pathSourcePDF + "/" + name + ".pdf");
      }
      catch (Exception e)
      {
        System.out.println(e);
      }
    else if ((prefix.equals("xls")) || (prefix.equals("xlsx"))) {
      try {
        AsposeExcelUtil.excel2pdf(path + "/" + sourceName, pathSourcePDF + "/" + name + ".pdf");
      }
      catch (Exception e)
      {
        System.out.println(e);
      }
    }
    model.addAttribute("fileUrl", request.getContextPath() + "/static/files/" + sourceName);
    JSONObject result = new JSONObject();
    result.put("success", Boolean.valueOf(true));
    ResponseUtil.write(response, result);
    return null;
  }

  @RequestMapping({"/deleteSource"})
  public String deleteSource(@RequestParam("id") String id, HttpServletResponse response)
    throws Exception
  {
    this.sourceService.delete(Integer.valueOf(Integer.parseInt(id)));
    JSONObject result = new JSONObject();
    result.put("success", Boolean.valueOf(true));
    ResponseUtil.write(response, result);
    return null;
  }

  @RequestMapping({"/general"})
  public ModelAndView listGenarals(@RequestParam(value="page", required=false) String page, HttpServletRequest request)
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
    map.put("sourceTypeId", Integer.valueOf(1));
    List generalList = this.sourceService.listSource(map);

    Long sum = this.sourceService.getTotal(map);
    modelAndView.addObject("sum", sum);
    modelAndView.addObject("pageCode", PageUtil.genPagination(request.getContextPath() + "/user/admin/general", this.sourceService
      .getTotal(map)
      .longValue(), Integer.parseInt(page), 10));
    modelAndView.addObject("generalList", generalList);
    modelAndView.setViewName("user/admin/source/generalManage");
    return modelAndView;
  }

  @RequestMapping({"/updateSource/{id}"})
  public ModelAndView get(@PathVariable("id") Integer id) throws Exception {
    ModelAndView modelAndView = new ModelAndView();

    Source file = this.sourceService.findSourceById(id);
    List fileTypes = this.sourceTypeService.countList();
    modelAndView.addObject("fileTypes", fileTypes);
    modelAndView.addObject("file", file);
    modelAndView.setViewName("user/admin/update/file");
    return modelAndView;
  }

  @RequestMapping({"/learn"})
  public ModelAndView listLearns(@RequestParam(value="page", required=false) String page, HttpServletRequest request)
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
    map.put("sourceTypeId", Integer.valueOf(2));
    List learnList = this.sourceService.listSource(map);

    Long sum = this.sourceService.getTotal(map);
    modelAndView.addObject("sum", sum);
    modelAndView.addObject("pageCode", PageUtil.genPagination(request.getContextPath() + "/user/admin/learn", this.sourceService
      .getTotal(map)
      .longValue(), Integer.parseInt(page), 10));
    modelAndView.addObject("learnList", learnList);
    modelAndView.setViewName("user/admin/source/learnManage");
    return modelAndView;
  }

  @RequestMapping({"/searchSource"})
  public ModelAndView search(HttpServletRequest request) throws Exception {
    ModelAndView modelAndView = new ModelAndView();
    String content = request.getParameter("content");

    List sourceList = this.sourceIndex.searchSource(content);

    modelAndView.addObject("sourceList", sourceList);
    modelAndView.setViewName("user/admin/source/searchResult");
    return modelAndView;
  }
}