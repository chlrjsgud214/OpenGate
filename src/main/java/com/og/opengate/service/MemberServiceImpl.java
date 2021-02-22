package com.og.opengate.service;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.og.opengate.dao.MemberDao;
import com.og.opengate.model.Member;
@Service
public class MemberServiceImpl implements MemberService{
	@Autowired
	public MemberDao md;
	@Override
	public Member select(String id) {
		return md.select(id);
	}
	@Override
	public int insert(Member member) {
		return md.insert(member);
	}
}
