package com.og.model;

import java.sql.Date;

import lombok.Data;

@Data
public class Notice {
	private int num;
	private String writer;
	private String subject;
	private String content;
	private String email;
	private int readcount;
	private String password;
	private String ip;
	private Date reg_date;
	private String del;
	// paging 용
	private int startRow;
	private int endRow;
	// 검색용
	private String search;
	private String keyword;
}
