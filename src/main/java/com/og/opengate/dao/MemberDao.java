package com.og.opengate.dao;
import com.og.opengate.model.Member;
public interface MemberDao {
	Member select(String id);
	int insert(Member member);
	int update(Member member);
}
