package com.wejoy.go.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.wejoy.go.model.Mem_hob;
@Repository
public class Mem_hobDaoImpl implements Mem_hobDao {
	@Autowired
	private SqlSessionTemplate sst;
	@Override
	public int SignUp2(Mem_hob M_hobby) {
		return sst.insert("mem_hobns.SignUp2", M_hobby);
	}
	public List<Mem_hob> findMemHobes(String mm_id) {
		// TODO Auto-generated method stub
		return sst.selectList("mem_hobns.list",mm_id);
	}
	public void Update2(Mem_hob m_hobby) {
		// TODO Auto-generated method stub
		 sst.update("mem_hobns.Update2", m_hobby);
	}
	public void delete(String mm_id) {
		// TODO Auto-generated method stub
			sst.delete("mem_hobns.delete",mm_id);
	}
	

}
