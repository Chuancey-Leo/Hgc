package org.wingstudio.util;

import com.artofsolving.jodconverter.DocumentConverter;
import com.artofsolving.jodconverter.openoffice.connection.OpenOfficeConnection;
import com.artofsolving.jodconverter.openoffice.connection.OpenOfficeException;
import com.artofsolving.jodconverter.openoffice.connection.SocketOpenOfficeConnection;
import com.artofsolving.jodconverter.openoffice.converter.OpenOfficeDocumentConverter;
import java.io.BufferedInputStream;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintStream;
import java.net.ConnectException;
import java.util.concurrent.Callable;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.FutureTask;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.TimeoutException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class DocumentConverterUtil
{
  private static Logger logger = LoggerFactory.getLogger(DocumentConverterUtil.class);
  private static final int DEFAULT_PORT = 8100;
  private File FILE;
  private File PDF_FILE;

  public static File conver(String filePath, String pdfFolderPath, boolean constraint, boolean deletePdf)
    throws Exception
  {
    DocumentConverterUtil dc = new DocumentConverterUtil();

    if (isEmptyPath(filePath)) {
      throw new RuntimeException("路径不能为空");
    }

    dc.init(filePath, pdfFolderPath);
    dc.converterToPDF(constraint);

    return dc.PDF_FILE;
  }

  public static boolean isEmptyPath(String path)
  {
    return ((null == path) || (path.isEmpty()));
  }

  public static boolean isPDF(String fileName)
  {
    if (isEmptyPath(fileName)) return false;
    String regex = ".*\\.pdf";
    return fileName.toLowerCase().matches(regex);
  }

  private static void loadStream(InputStream in)
    throws IOException
  {
    in = new BufferedInputStream(in);
    while (in.read() != -1);
    in.close();
  }

  public String converterToPDF(boolean constraint) throws Exception {
    if (!(this.FILE.exists())) {
      log("PDF转换异常，需要转换的文档不存在，无法转换");
      throw new RuntimeException("PDF转换异常，需要转换的文档不存在，无法转换");
    }
    if ((!(this.PDF_FILE.exists())) || (constraint))
    {
      if (!(this.PDF_FILE.getParentFile().exists())) {
        this.PDF_FILE.getParentFile().mkdirs();
      }
      ExecutorService executor = Executors.newSingleThreadExecutor();

      OpenOfficeConnection connection = new SocketOpenOfficeConnection(8100);
      FutureTask future = new FutureTask(new Callable(connection) {
        public Boolean call() throws Exception {
          try {
            this.val$connection.connect();
            DocumentConverter converter = new OpenOfficeDocumentConverter(this.val$connection);
            converter.convert(DocumentConverterUtil.this.FILE, DocumentConverterUtil.this.PDF_FILE);
            return Boolean.valueOf(true);
          } catch (ConnectException e) {
            String msg1 = "PDF转换器异常，OpenOffice服务未启动！";
            DocumentConverterUtil.access$200(msg1);
            throw new RuntimeException(msg1 + "\r\n", e);
          } catch (OpenOfficeException e) {
            DocumentConverterUtil.access$200("PDF转换器异常，读取转换文件失败");
            throw new RuntimeException("PDF转换器异常，读取转换文件失败", e);
          }
        }
      });
      try {
        executor.execute(future);
        boolean isSuccess = ((Boolean)future.get(60L, TimeUnit.SECONDS)).booleanValue();
        if (!(isSuccess)) throw new RuntimeException("文件转换失败,转换超时");
      } catch (RuntimeException e) {
      }
      catch (java.util.concurrent.ExecutionException e) {
      }
      catch (TimeoutException e) {
      }
      finally {
        if (null != connection) connection.disconnect();
        if ((null != executor) && (!(executor.isShutdown()))) executor.shutdown();
      }
      log(new StringBuilder().append("PDF转换成功，PDF输出：").append(this.PDF_FILE.getPath()).toString());
    } else {
      log("已经转换为PDF，不需要再进行转换");
    }
    log(this.PDF_FILE.getPath());
    return null;
  }

  private void init(String filePath, String pdfFolderPath)
  {
    System.out.println(new StringBuilder().append("test filePathhehehehhehehehehhe：").append(filePath).toString());
    this.FILE = new File(filePath);
    if (this.FILE.exists()) {
      System.out.println("存在！");
    }

    String outPath = filePath.substring(0, filePath.lastIndexOf("."));
    String fileName = this.FILE.getName();
    System.out.println(new StringBuilder().append("test fileName:").append(fileName).toString());
    fileName = new StringBuilder().append(File.separator).append(fileName.substring(0, fileName.lastIndexOf("."))).toString();

    if (isPDF(filePath))
      this.PDF_FILE = new File(filePath);
    else
      this.PDF_FILE = new File(new StringBuilder().append((isEmptyPath(pdfFolderPath)) ? outPath : new StringBuilder().append(pdfFolderPath).append(fileName).toString()).append(".pdf").toString());
  }

  private static void log(String msg)
  {
    if (logger.isDebugEnabled())
      logger.debug(msg);
  }
}