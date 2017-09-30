package org.wingstudio.controller.admin;

import java.awt.image.BufferedImage;
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
import org.wingstudio.lucene.FileIndex;
import org.wingstudio.service.FileService;
import org.wingstudio.service.FileTypeService;
import org.wingstudio.service.PictureService;
import org.wingstudio.util.AsposeUtil;
import org.wingstudio.util.PageUtil;
import org.wingstudio.util.ResponseUtil;
import org.wingstudio.util.StringUtil;

@Controller
@RequestMapping({"/user/admin"})
public class FileController
{

  @Resource
  private FileService fileService;

  @Resource
  private FileTypeService fileTypeService;

  @Resource
  private PictureService pictureService;
  private FileIndex fileIndex;

  public FileController()
  {
    this.fileIndex = new FileIndex(); }

  @RequestMapping({"/addFile"})
  public ModelAndView addFile() throws Exception {
    ModelAndView modelAndView = new ModelAndView();
    List fileTypes = this.fileTypeService.countList();
    modelAndView.addObject("fileTypes", fileTypes);
    modelAndView.setViewName("user/admin/build/file");
    return modelAndView;
  }

  @RequestMapping(value={"/upload"}, method={org.springframework.web.bind.annotation.RequestMethod.POST})
  public String upload(HttpServletRequest request, HttpServletResponse response, @RequestParam("file") MultipartFile file, ModelMap model, org.wingstudio.entity.File file2)
    throws Exception
  {
    if (file.isEmpty())
    {
      file2.setFileName(null);

      if ((file2.getFileTypeId().intValue() == 1) || (file2.getFileTypeId().intValue() == 2) || (file2.getFileTypeId().intValue() == 3)) {
        String content = file2.getContent();

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
          BufferedImage bufferedImage = ImageIO.read(new java.io.File("C:\\hgc\\apache-tomcat-9.0.0.M17\\webapps\\ROOT" + p.getImgUrl()));
          if (bufferedImage.getWidth() > 680) {
            String testContent1 = file2.getContent();
            String testContent = testContent1.replace("src=\"" + p.getImgUrl() + "\"", "src=\"" + p.getImgUrl() + "\" style=\"width:87%\"");
            file2.setContent(testContent);
          }
          p.setFlag(Integer.valueOf(picture.getFlag().intValue() + 1));
          this.pictureService.add(p);
          this.pictureService.remove();
        }

      }

      this.fileService.add(file2);

      org.wingstudio.entity.File testFile = this.fileService.getLast();
      this.fileIndex.addIndex(testFile);

      JSONObject result = new JSONObject();
      result.put("success", Boolean.valueOf(true));
      ResponseUtil.write(response, result);
      return null;
    }
    String path = request.getSession().getServletContext().getRealPath("/static/files");
    String pathFilePDF = request.getSession().getServletContext().getRealPath("/static/filesPDF");
    String path2 = request.getSession().getServletContext().getRealPath("/static");
    String testFileName = file.getOriginalFilename();
    String prefix = testFileName.substring(testFileName.lastIndexOf(".") + 1);
    String name = String.valueOf(Calendar.getInstance().getTimeInMillis());
    String fileName = name + "." + prefix;
    String fileNamePDF = name + ".pdf";
    file2.setFileName(fileNamePDF);
    long fileSize2 = file.getSize();
    String fileSize3;
    if (fileSize2 / 1024L < 1000L) {
      fileSize3 = String.valueOf(fileSize2 / 1024L) + "KB";
      file2.setFileSize(fileSize3);
    } else {
      fileSize3 = String.valueOf(fileSize2 / 1048576L) + "M";
      file2.setFileSize(fileSize3);
    }

    if (prefix.equals("pdf")) {
      java.io.File targetFile1 = new java.io.File(pathFilePDF, fileNamePDF);
      try
      {
        file.transferTo(targetFile1);
      } catch (Exception e) {
        e.printStackTrace();
      }
    } else {
      java.io.File targetFile2 = new java.io.File(path, fileName);
      try
      {
        file.transferTo(targetFile2);
      } catch (Exception e) {
        e.printStackTrace();
      }
    }

    if ((file2.getFileTypeId().intValue() == 1) || (file2.getFileTypeId().intValue() == 2) || (file2.getFileTypeId().intValue() == 3)) {
      String content = file2.getContent() + " ";

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
        BufferedImage bufferedImage = ImageIO.read(new java.io.File("C:\\hgc\\apache-tomcat-9.0.0.M17\\webapps\\ROOT" + p.getImgUrl()));
        if (bufferedImage.getWidth() > 680) {
          String testContent1 = file2.getContent();
          String testContent = testContent1.replace("src=\"" + p.getImgUrl() + "\"", "src=\"" + p.getImgUrl() + "\" style=\"width:87%\"");
          file2.setContent(testContent);
        }
        p.setFlag(Integer.valueOf(picture.getFlag().intValue() + 1));
        this.pictureService.add(p);
        this.pictureService.remove();
      }

    }

    this.fileService.add(file2);
    org.wingstudio.entity.File testFile = this.fileService.getLast();

    this.fileIndex.addIndex(testFile);

    if ((prefix.equals("doc")) || (prefix.equals("docx")) || (prefix.equals("txt")) || 
      (prefix
      .equals("xls"))) {
      try
      {
        AsposeUtil.docToPdf(path + "/" + fileName, pathFilePDF + "/" + name + ".pdf");
      }
      catch (Exception doc) {
        System.out.println(e);
      }
    }

    JSONObject result = new JSONObject();
    result.put("success", Boolean.valueOf(true));
    ResponseUtil.write(response, result);
    return null;
  }

  @RequestMapping({"/policy"})
  public ModelAndView listPolicys(@RequestParam(value="page", required=false) String page, HttpServletRequest request)
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
    map.put("fileTypeId", Integer.valueOf(1));
    List policyList = this.fileService.listFile(map);
    Long sum = this.fileService.getTotal(map);
    modelAndView.addObject("sum", sum);
    modelAndView.addObject("pageCode", PageUtil.genPagination(request.getContextPath() + "/user/admin/policy", this.fileService
      .getTotal(map)
      .longValue(), Integer.parseInt(page), 10));
    modelAndView.addObject("policyList", policyList);
    modelAndView.setViewName("user/admin/file/policyManage");
    return modelAndView;
  }

  @RequestMapping({"/manage"})
  public ModelAndView listManages(@RequestParam(value="page", required=false) String page, HttpServletRequest request)
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
    map.put("fileTypeId", Integer.valueOf(2));
    List manageList = this.fileService.listFile(map);

    Long sum = this.fileService.getTotal(map);
    modelAndView.addObject("sum", sum);
    modelAndView.addObject("pageCode", PageUtil.genPagination(request.getContextPath() + "/user/admin/manage", this.fileService
      .getTotal(map)
      .longValue(), Integer.parseInt(page), 10));
    modelAndView.addObject("manageList", manageList);
    modelAndView.setViewName("user/admin/file/schoolManage");
    return modelAndView;
  }

  @RequestMapping({"/house"})
  public ModelAndView listHouses(@RequestParam(value="page", required=false) String page, HttpServletRequest request)
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
    map.put("fileTypeId", Integer.valueOf(3));
    List houseList = this.fileService.listFile(map);

    Long sum = this.fileService.getTotal(map);
    modelAndView.addObject("sum", sum);
    modelAndView.addObject("pageCode", PageUtil.genPagination(request.getContextPath() + "/user/admin/house", this.fileService
      .getTotal(map)
      .longValue(), Integer.parseInt(page), 10));
    modelAndView.addObject("houseList", houseList);
    modelAndView.setViewName("user/admin/file/houseManage");
    return modelAndView;
  }

  @RequestMapping({"/deleteFile"})
  public String deleteFile(@RequestParam("id") String id, HttpServletResponse response)
    throws Exception
  {
    this.fileService.delete(Integer.valueOf(Integer.parseInt(id)));
    JSONObject result = new JSONObject();
    result.put("success", Boolean.valueOf(true));
    ResponseUtil.write(response, result);
    return null;
  }

  @RequestMapping({"/findFileById"})
  public String findFileById(@RequestParam("id") String id, HttpServletResponse response)
    throws Exception
  {
    org.wingstudio.entity.File file = this.fileService.findFileById(Integer.valueOf(Integer.parseInt(id)));
    JSONObject jsonObject = JSONObject.fromObject(file);
    ResponseUtil.write(response, jsonObject);
    return null;
  }

  @RequestMapping({"/updateFile/{id}"})
  public ModelAndView get(@PathVariable("id") Integer id) throws Exception {
    ModelAndView modelAndView = new ModelAndView();

    org.wingstudio.entity.File file = this.fileService.findFileById(id);
    List fileTypes = this.fileTypeService.countList();
    modelAndView.addObject("fileTypes", fileTypes);
    modelAndView.addObject("file", file);
    modelAndView.setViewName("user/admin/update/file");
    return modelAndView;
  }

  @RequestMapping(value={"/updateFile"}, method={org.springframework.web.bind.annotation.RequestMethod.POST})
  public String updateFile(HttpServletRequest request, @RequestParam("file") MultipartFile file, ModelMap model, org.wingstudio.entity.File file2, HttpServletResponse response)
    throws Exception
  {
    if (file.isEmpty())
    {
      if ((file2.getFileTypeId().intValue() == 1) || (file2.getFileTypeId().intValue() == 2) || (file2.getFileTypeId().intValue() == 3)) {
        String content = file2.getContent();

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
          BufferedImage bufferedImage = ImageIO.read(new java.io.File("C:\\hgc\\apache-tomcat-9.0.0.M17\\webapps\\ROOT" + p.getImgUrl()));
          if (bufferedImage.getWidth() > 680) {
            String testContent1 = file2.getContent();
            String testContent = testContent1.replace("src=\"" + p.getImgUrl() + "\"", "src=\"" + p.getImgUrl() + "\" style=\"width:87%\"");
            file2.setContent(testContent);
          }
          p.setFlag(Integer.valueOf(picture.getFlag().intValue() + 1));
          this.pictureService.add(p);
          this.pictureService.remove();
        }

      }

      this.fileService.update(file2);
      JSONObject result = new JSONObject();
      result.put("success", Boolean.valueOf(true));
      ResponseUtil.write(response, result);
      return null;
    }

    String path = request.getSession().getServletContext().getRealPath("/static/files");
    String pathFilePDF = request.getSession().getServletContext().getRealPath("/static/filesPDF");
    String path2 = request.getSession().getServletContext().getRealPath("/static");
    String testFileName = file.getOriginalFilename();
    String prefix = testFileName.substring(testFileName.lastIndexOf(".") + 1);
    String name = String.valueOf(Calendar.getInstance().getTimeInMillis());
    String fileName = name + "." + prefix;
    String fileNamePDF = name + ".pdf";
    file2.setFileName(fileNamePDF);
    long fileSize2 = file.getSize();
    String fileSize3;
    if (fileSize2 / 1024L < 1000L) {
      fileSize3 = String.valueOf(fileSize2 / 1024L) + "KB";
      file2.setFileSize(fileSize3);
    } else {
      fileSize3 = String.valueOf(fileSize2 / 1048576L) + "M";
      file2.setFileSize(fileSize3);
    }

    if (prefix.equals("pdf")) {
      java.io.File targetFile1 = new java.io.File(pathFilePDF, fileNamePDF);
      try
      {
        file.transferTo(targetFile1);
      } catch (Exception e) {
        e.printStackTrace();
      }
    } else {
      java.io.File targetFile2 = new java.io.File(path, fileName);
      try
      {
        file.transferTo(targetFile2);
      } catch (Exception e) {
        e.printStackTrace();
      }
    }

    if ((file2.getFileTypeId().intValue() == 1) || (file2.getFileTypeId().intValue() == 2) || (file2.getFileTypeId().intValue() == 3)) {
      String content = file2.getContent();

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
        BufferedImage bufferedImage = ImageIO.read(new java.io.File("C:\\hgc\\apache-tomcat-9.0.0.M17\\webapps\\ROOT" + p.getImgUrl()));
        if (bufferedImage.getWidth() > 680) {
          String testContent1 = file2.getContent();
          String testContent = testContent1.replace("src=\"" + p.getImgUrl() + "\"", "src=\"" + p.getImgUrl() + "\" style=\"width:87%\"");
          file2.setContent(testContent);
        }
        p.setFlag(Integer.valueOf(picture.getFlag().intValue() + 1));
        this.pictureService.add(p);
        this.pictureService.remove();
      }

    }

    this.fileService.update(file2);
    org.wingstudio.entity.File testFile = this.fileService.getLast();

    this.fileIndex.addIndex(testFile);

    if ((prefix.equals("doc")) || (prefix.equals("docx")) || (prefix.equals("txt")) || 
      (prefix
      .equals("xls"))) {
      try
      {
        AsposeUtil.docToPdf(path + "/" + fileName, pathFilePDF + "/" + name + ".pdf");
      }
      catch (Exception doc) {
        System.out.println(e);
      }
    }

    JSONObject result = new JSONObject();
    result.put("success", Boolean.valueOf(true));
    ResponseUtil.write(response, result);
    return null;
  }

  @RequestMapping({"/searchFile"})
  public ModelAndView search(HttpServletRequest request) throws Exception
  {
    ModelAndView modelAndView = new ModelAndView();
    String content = request.getParameter("content");

    List fileList = this.fileIndex.searchFile(content);

    modelAndView.addObject("fileList", fileList);
    modelAndView.setViewName("user/admin/file/searchResult");
    return modelAndView;
  }
}