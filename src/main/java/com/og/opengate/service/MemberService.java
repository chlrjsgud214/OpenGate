package com.og.opengate.service;
import com.og.opengate.model.Member;
public interface MemberService {
	Member select(String id);
	int insert(Member member);
}
