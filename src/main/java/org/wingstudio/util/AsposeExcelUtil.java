package org.wingstudio.util;

import com.aspose.cells.License;
import com.aspose.cells.Workbook;
import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;

public class AsposeExcelUtil
{
  public static boolean getLicense()
  {
    boolean result = false;
    try {
      InputStream is = AsposeExcelUtil.class.getClassLoader().getResourceAsStream("license.xml");
      License aposeLic = new License();
      aposeLic.setLicense(is);
      result = true;
    } catch (Exception e) {
      e.printStackTrace();
    }
    return result;
  }

  public static void excel2pdf(String filePath, String pdfPath)
  {
    if (!(getLicense()))
      return;
    try
    {
      File pdfFile = new File(pdfPath);
      Workbook wb = new Workbook(filePath);
      FileOutputStream fileOS = new FileOutputStream(pdfFile);
      wb.save(fileOS, 13);
      fileOS.close();
    } catch (Exception e) {
      e.printStackTrace();
    }
  }
}