package org.wingstudio.util;

import java.io.File;
import java.io.PrintStream;

public class DocumentPreviewTest
{
  public void preview(String path2, String fileName)
  {
    try
    {
      String path = System.getProperty("user.dir");
      System.out.println(path);

      String pdfFolder = path + "/pdf/";

      String folder = path + "/test/test.doc";
      File localFile = DocumentConverterUtil.conver(folder, pdfFolder, false, false);
    }
    catch (Exception e)
    {
      System.out.println("test fileconvert");
      if (e.getClass() == RuntimeException.class) {
        System.out.println(e.getMessage());
      }
      e.printStackTrace();
    }
  }
}