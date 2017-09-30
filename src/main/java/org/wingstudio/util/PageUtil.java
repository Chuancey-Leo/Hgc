package org.wingstudio.util;

/**
 * 分页工具类
 * @author Administrator
 *
 */
public class PageUtil {

	/**
	 * 生成分页代码
	 *
	 * @param targetUrl   目标地址
	 * @param totalNum    总记录数
	 * @param currentPage 当前页
	 * @param pageSize    每页大小
	 * @return
	 */
	public static String genPagination(String targetUrl, long totalNum,
									   int currentPage, int pageSize) {
		long totalPage = totalNum % pageSize == 0 ? totalNum / pageSize : totalNum / pageSize + 1;
		StringBuffer pageCode = new StringBuffer();
		if (totalPage == 0) {
			return "未查询到数据";
		} else if (totalPage < 5) {
			if (currentPage > 1) {
				pageCode.append("<li><a href='" + targetUrl + "?page=" + (currentPage - 1) + "'>«</a></li>");
			} else {
				pageCode.append("<li class='disabled'><a href='#'>«</a></li>");
			}
			for (int i = 1; i <= totalPage; i++) {
				if (i == currentPage) {
					pageCode.append("<li class='active'><a href='" + targetUrl + "?page=" + i + "'>" + i + "</a></li>");
				} else {
					pageCode.append("<li><a href='" + targetUrl + "?page=" + i + "'>" + i + "</a></li>");
				}
			}
			if (currentPage < totalPage) {
				pageCode.append("<li><a href='" + targetUrl + "?page=" + (currentPage + 1) + "'>»</a></li>");
			} else {
				pageCode.append("<li class='disabled'><a href='#'>»</a></li>");
			}
			return pageCode.toString();
		} else {

			if (currentPage > 1) {
				pageCode.append("<li><a href='" + targetUrl + "?page=" + (currentPage - 1) + "'>«</a></li>");
			} else {
				pageCode.append("<li class='disabled'><a href='#'>«</a></li>");
			}
			/*for(int i=currentPage-2;i<=currentPage+2;i++){
				if(i<1||i>totalPage){
					continue;
				}
				if(i==currentPage){
					pageCode.append("<li class='active'><a href='"+targetUrl+"?page="+i+"'>"+i+"</a></li>");
				}else{
					pageCode.append("<li><a href='"+targetUrl+"?page="+i+"'>"+i+"</a></li>");
				}
			}*/
			if (currentPage <= 3) {
				for (int i = 1; i <= 5; i++) {
					if (i == currentPage) {
						pageCode.append("<li class='active'><a href='" + targetUrl + "?page=" + i + "'>" + i + "</a></li>");
					} else {
						pageCode.append("<li><a href='" + targetUrl + "?page=" + i + "'>" + i + "</a></li>");
					}
				}
			} else {
				if (currentPage <= totalPage - 2) {
					for (int i = currentPage - 2; i <= currentPage + 2; i++) {
						if (i == currentPage) {
							pageCode.append("<li class='active'><a href='" + targetUrl + "?page=" + i + "'>" + i + "</a></li>");
						} else {
							pageCode.append("<li><a href='" + targetUrl + "?page=" + i + "'>" + i + "</a></li>");
						}
					}
				} else if (currentPage == totalPage - 1) {
					for (int i = currentPage - 3; i <= totalPage; i++) {
						if (i == currentPage) {
							pageCode.append("<li class='active'><a href='" + targetUrl + "?page=" + i + "'>" + i + "</a></li>");
						} else {
							pageCode.append("<li><a href='" + targetUrl + "?page=" + i + "'>" + i + "</a></li>");
						}
					}
				} else if (currentPage == totalPage) {
					for (int i = currentPage - 4; i <= currentPage; i++) {
						if (i == currentPage) {
							pageCode.append("<li class='active'><a href='" + targetUrl + "?page=" + i + "'>" + i + "</a></li>");
						} else {
							pageCode.append("<li><a href='" + targetUrl + "?page=" + i + "'>" + i + "</a></li>");
						}
					}
				}
			}
			if (currentPage < totalPage) {
				pageCode.append("<li><a href='" + targetUrl + "?page=" + (currentPage + 1) + "'>»</a></li>");
			} else {
				pageCode.append("<li class='disabled'><a href='#'>»</a></li>");
			}
			return pageCode.toString();
		}
	}

	
	
}
