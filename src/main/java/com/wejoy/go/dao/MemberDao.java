package com.wejoy.go.dao;

import com.wejoy.go.model.Member;
public interface MemberDao {
	Member select(String id);
	int SignUp1(Member member);
	void Update1(Member member);
	void withdraw(String mm_id);
	String findId(Member member);
	void update_pw(Member member);
}
