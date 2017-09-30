package org.wingstudio.util;

import com.aspose.words.Document;

/**
 * Created by liao on 16-11-21.
 */
public class AsposeUtil {
    public static void docToPdf(String filePath,String pdfPath) throws Exception{
        Document document=new Document(filePath);
        document.save(pdfPath);
    }
}
