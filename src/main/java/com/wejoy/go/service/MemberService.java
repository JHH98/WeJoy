package com.wejoy.go.service;
import java.util.List;

import com.wejoy.go.model.Hobby;
import com.wejoy.go.model.Mem_hob;
import com.wejoy.go.model.Member;
import com.wejoy.go.model.Like_func;
public interface MemberService {
	Member select(String id);
	List<Hobby> hobbyList();
	int SignUp1(Member member);
	int SignUp2(Mem_hob M_hobby);
	String getId(Like_func like);
	int like(Like_func like);
	List<Mem_hob> findMemHobes(String id);
	void Update1(Member member);
	void Update2(Mem_hob m_hobby);
	void delete(String mm_id);
	void withdraw(String mm_id);
	String findId(Member member);
	void update_pw(Member member);
	
}
