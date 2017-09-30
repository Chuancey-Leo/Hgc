package org.wingstudio.util;

import com.sun.pdfview.PDFFile;
import com.sun.pdfview.PDFPage;

import javax.imageio.ImageIO;
import java.awt.*;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.RandomAccessFile;
import java.nio.ByteBuffer;
import java.nio.channels.FileChannel;

public class PDFRenderer {

	public void pdf2png(File file) {
		PDFFile pdffile = null;
		try {
			RandomAccessFile raf = new RandomAccessFile(file, "r");
			FileChannel channel = raf.getChannel();
			ByteBuffer buf = channel.map(FileChannel.MapMode.READ_ONLY, 0, channel.size());
			pdffile = new PDFFile(buf);
			int pages = pdffile.getNumPages() + 1;
			// print出该pdf文档的页数
			System.out.println(pages);
			for (int page = 1; page < pages; page++) {
				// 设置将第pagen也生成png图片
				PDFPage pdfPage = pdffile.getPage(page);

				// create and configure a graphics object
				int width = (int) pdfPage.getBBox().getWidth();
				int height = (int) pdfPage.getBBox().getHeight();
				BufferedImage img = new BufferedImage(width, height, BufferedImage.TYPE_INT_ARGB);
				Graphics2D g2 = img.createGraphics();
				g2.setRenderingHint(RenderingHints.KEY_ANTIALIASING, RenderingHints.VALUE_ANTIALIAS_ON);

				// do the actual drawing
				com.sun.pdfview.PDFRenderer renderer = new com.sun.pdfview.PDFRenderer(pdfPage, g2, new Rectangle(0, 0, width, height), null, Color.WHITE);
				pdfPage.waitForFinish();
				renderer.run();
				g2.dispose();
				ImageIO.write(img, "gif", new File("G:/Image_" + page + ".gif"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public static void main(String args[]) {
		new PDFRenderer().pdf2png(new File("G:/GRXFJKHT20160416190357.pdf"));
	}
}