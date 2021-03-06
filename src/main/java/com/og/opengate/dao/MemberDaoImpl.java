package com.og.opengate.dao;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import com.og.opengate.model.Member;
@Repository
public class MemberDaoImpl implements MemberDao{
	@Autowired
	private SqlSessionTemplate sst;
	@Override
	public Member select(String id) {
		return sst.selectOne("memberns.select", id);
	}
	@Override
	public int insert(Member member) {
		return sst.insert("memberns.insert", member);
	}
	@Override
	public int update(Member member) {
		return sst.update("memberns.update", member);
	}
	@Override
	public int delete(String id) {
		return sst.delete("memberns.delete", id);
	}
}
