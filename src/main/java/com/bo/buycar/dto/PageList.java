package com.bo.buycar.dto;

import java.util.List;

import org.springframework.data.domain.Page;

import com.bo.buycar.model.Advertisment;

public class PageList {

	
	public static final int COUNT = 3;
	 int totalPageCount;
	 int totalCount;
	 int currentPage;
	 List<Advertisment> listAdvertisments;
	
	public PageList(int page, List<Advertisment> list) {
		this.currentPage = page;
		listAdvertisments = list;
	}

	public int getTotalPageCount() {
		return totalPageCount;
	}

	public void setTotalPageCount(int totalPageCount) {
		this.totalPageCount = totalPageCount;
	}

	public int getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}

	public List<Advertisment> getListAdvertisments() {
		return listAdvertisments;
	}

	public void setListAdvertisments(List<Advertisment> listAdvertisments) {
		this.listAdvertisments = listAdvertisments;
	}

	public int getTotalCount() {
		return totalCount;
	}

	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
System.out.println(totalCount + "total countr");
		int pageCount = (int)(getListAdvertisments().size()/PageList.COUNT);
		System.out.println(pageCount);
		setTotalPageCount(pageCount); 
	}

	@Override
	public String toString() {
		return "PageList [totalPageCount=" + totalPageCount + ", totalCount=" + totalCount + ", currentPage="
				+ currentPage + ", listAdvertisments=" + listAdvertisments + "]";
	}


}
