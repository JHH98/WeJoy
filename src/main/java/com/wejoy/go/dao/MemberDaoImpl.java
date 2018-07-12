package com.wejoy.go.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.wejoy.go.model.Member;

@Repository
public class MemberDaoImpl implements MemberDao{
	@Autowired
	private SqlSessionTemplate sst;
	
	public Member select(String id) {
		return sst.selectOne("memberns.select", id);
	}
	@Override
	public int SignUp1(Member member) {
		return sst.insert("memberns.SignUp1", member);
	}
	
	public void Update1(Member member) {
		// TODO Auto-generated method stub
		sst.update("memberns.Update1", member);
	}
	public void withdraw(String mm_id) {
		sst.update("memberns.withdraw", mm_id);
		
	}
	@Override
	public String findId(Member member) {
		return sst.selectOne("memberns.findId", member);
	}
	@Override
	public void update_pw(Member member) {
		sst.update("memberns.update_pw", member);
		
	}
}
