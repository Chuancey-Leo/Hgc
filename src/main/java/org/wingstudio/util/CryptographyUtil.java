package org.wingstudio.util;

import org.apache.shiro.crypto.hash.Md5Hash;

/**
 * md5加密工具
 */
public class CryptographyUtil {

	/**
	 * Md5加密
	 * @param str
	 * @param salt
	 * @return
	 */
	public static String md5(String str,String salt){
		return new Md5Hash(str,salt).toString();
	}
	
	public static void main(String[] args) {
		String password="123";
		System.out.println(CryptographyUtil.md5(password, "liaochuanhu"));
	}
}
