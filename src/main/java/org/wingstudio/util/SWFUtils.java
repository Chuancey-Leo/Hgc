package org.wingstudio.util;

import java.io.BufferedReader;
import java.io.File;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 * @author tangjialin on 0017 2016-04-17.
 */
public class SWFUtils {
	public static final SWFUtils utils = new SWFUtils();
	private Logger logger = Logger.getLogger(getClass().getName());
	private String CONVERT_COMMAND = "C:\\Program Files (x86)\\SWFTools\\pdf2swf \"%s\" -o \"%s\" -f -T 9";
	private String defaultCharset = null;
	private SWFUtils(){
		defaultCharset = System.getProperty("os.name").indexOf("Win") != -1 ? "GBK" : "UTF-8";
	}

	/**
	 * 转换PDF到SWF,如果SWF已存在,则覆盖
	 * @param pdf 转换的PDF文件
	 * @param swf 转换后的SWF文件
	 * @return 返回转换结果
	 */
	public boolean pdf2swf(String pdf, String swf) {
		return pdf2swf(new File(pdf), new File(swf), true);
	}

	/**
	 * 转换PDF到SWF
	 * @param pdf 转换的PDF文件
	 * @param swf 转换后的SWF文件
	 * @param force 是否强制转换.true:如果SWF已存在,则覆盖;false:如果SWF文件已存在,则跳过转换不走
	 * @return 返回转换结果
	 */
	public boolean pdf2swf(String pdf, String swf, boolean force) {
		return pdf2swf(new File(pdf), new File(swf), force);
	}

	/**
	 * 转换PDF到SWF,如果SWF已存在,则覆盖
	 * @param pdf 转换的PDF文件
	 * @param swf 转换后的SWF文件
	 * @return 返回转换结果
	 */
	public boolean pdf2swf(File pdf, File swf) {
		return pdf2swf(pdf, swf, true);
	}

	/**
	 * 转换PDF到SWF
	 * @param pdf 转换的PDF文件
	 * @param swf 转换后的SWF文件
	 * @param force 是否强制转换.true:如果SWF已存在,则覆盖;false:如果SWF文件已存在,则跳过转换不走
	 * @return 返回转换结果
	 */
	public boolean pdf2swf(File pdf, File swf, boolean force) {
		BufferedReader stdout = null;
		boolean isSuccess = false;
		try {
			String pdfPath = pdf.getPath();
			if (!pdfPath.toLowerCase().endsWith(".pdf")) throw new IllegalArgumentException("错误的文件类型,必须是PDF. File" + pdfPath);
			if (!pdf.exists()) throw new IllegalArgumentException("找不到文件. File:" + pdfPath);

			String swfPath = swf.getPath();
			if (swfPath.endsWith("/") || swf.isDirectory()) throw new IllegalArgumentException("错误的输出路径,不能是一个目录. File:" + swfPath);
			swfPath = swfPath.toLowerCase().endsWith(".swf") ? swfPath : swfPath + ".swf";
			if (swf.exists() && !force) {
				logger.info("文件已存在,跳过转换步骤. File:" + swfPath);
				return true;
			}
			File swfFolder = swf.getParentFile();
			if (!swfFolder.exists()) swfFolder.mkdirs();
			String command = String.format(CONVERT_COMMAND, pdfPath, swfPath);
			Runtime r = Runtime.getRuntime();
			Process process = r.exec(command);
			if (logger.isLoggable(Level.INFO)) {
				stdout = new BufferedReader(new InputStreamReader(process.getInputStream(), defaultCharset));
				String line = null;
				while ((line = stdout.readLine()) != null) { logger.info(line); }
			}

			process.waitFor(); // 等待转换完成
			isSuccess = process.exitValue() == 0;
			process.destroy();
		} catch (Exception e) {
			logger.log(Level.SEVERE, e.getLocalizedMessage());
			isSuccess = false;
		}
		try { stdout.close(); } catch (IOException e) {}
		return isSuccess;
	}

	public static void main(String[] args) {
		System.out.println(SWFUtils.utils.pdf2swf("G:/HugeChm - 副本.pdf", "G:/a/abc.swf"));
	}

}

