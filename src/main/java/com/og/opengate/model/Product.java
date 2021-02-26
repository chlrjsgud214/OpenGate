package com.og.opengate.model;

import java.sql.Date;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class Product {
	private String tema;
	private String content;
	private String fileName;
	private Date startdate;
	private Date enddate;
	private Date restdate;
	private String difficulty;
	private String fear;
	private String active;
	
	private MultipartFile fileName1;
	
	private int startRow;
	private int endRow;
	
}
