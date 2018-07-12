package com.wejoy.go.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wejoy.go.dao.HobbyDao;
import com.wejoy.go.dao.Mem_hobDao;
import com.wejoy.go.dao.MemberDao;
import com.wejoy.go.dao.like_funcDao;
import com.wejoy.go.model.Hobby;
import com.wejoy.go.model.Mem_hob;
import com.wejoy.go.model.Member;
import com.wejoy.go.model.Like_func;

@Service
public class MemberServiceImpl implements MemberService {
	@Autowired
	private MemberDao md;
	@Autowired
	private HobbyDao hd;
	@Autowired
	private Mem_hobDao mhd;
	@Autowired
	private like_funcDao lhd;
	
	public Member select(String id) {
		return md.select(id);
	}
	
	public List<Hobby> hobbyList() {
		return hd.list();
	}
	@Override
	public int SignUp1(Member member) {
		return md.SignUp1(member);
	}
	@Override
	public int SignUp2(Mem_hob M_hobby) { 
		return mhd.SignUp2(M_hobby);
	}

	public String getId(Like_func like) {
		// TODO Auto-generated method stub
		return lhd.select(like);
	}

	public int like(Like_func like) {
		// TODO Auto-generated method stub
		return lhd.like(like);
	}

	@Override
	public List<Mem_hob> findMemHobes(String id) {
		// TODO Auto-generated method stub
		return mhd.findMemHobes(id);
	}

	@Override
	public void Update1(Member member) {
		// TODO Auto-generated method stub
		md.Update1(member);
	}

	@Override
	public void Update2(Mem_hob m_hobby) {
		// TODO Auto-generated method stub
		mhd.Update2(m_hobby);
	}


	public void delete(String mm_id) {
		// TODO Auto-generated method stub
		 mhd.delete(mm_id);
	}

	public void withdraw(String mm_id) {
		// TODO Auto-generated method stub
		md.withdraw(mm_id);
	}
	
	public String findId(Member member) {
		return md.findId(member);
	}

	@Override
	public void update_pw(Member member) {
		md.update_pw(member);
	}

}
