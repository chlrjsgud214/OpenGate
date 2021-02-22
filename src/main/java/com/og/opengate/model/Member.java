package com.og.opengate.model;
import java.sql.Date;
import lombok.Data;
@Data
public class Member {
	private String id;
    private String password;
    private String name;
    private String phone;
    private String email;
    private String address;
    private Date reg_date;
}
