package com.spring.board.vo;

import java.util.Arrays;

public class PageVo {
	
	private int pageNo = 0;
	private String[] filter;

	public String[] getFilter() {
		return filter;
	}

	public void setFilter(String[] filter) {
		this.filter = filter;
	}

	public int getPageNo() {
		return pageNo;
	}

	public void setPageNo(int pageNo) {
		this.pageNo = pageNo;
	}

	@Override
	public String toString() {
		return "PageVo [pageNo=" + pageNo + ", filter=" + Arrays.toString(filter) + "]";
	}
	
}
