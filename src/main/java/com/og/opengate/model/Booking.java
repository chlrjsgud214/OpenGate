package com.og.opengate.model;
import java.sql.Date;

import lombok.Data;
@Data
public class Booking {
	private String tema;
    private String locName;
    private String id;
    private String name;
    private String phone;
    private String note;
    private Date bookDate;
    private Date time;
}
