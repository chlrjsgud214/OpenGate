package com.og.opengate.model;

import java.sql.Date;

import lombok.Data;

@Data
public class NoticeReplyBoard {
	private int rno;
	private int bno;
	private String replytext;
	private String replyer;
	private String password;
	private Date reg_date;
	private Date updatedate;
	private String del;
}
