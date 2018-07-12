package com.wejoy.go.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.wejoy.go.model.Ps_hob;
@Repository
public class Ps_hobDaoImpl implements Ps_hobDao {
	@Autowired
	private SqlSessionTemplate sst;
	
	public void inserH(Ps_hob p_hobby) {
		// TODO Auto-generated method stub
		sst.insert("ps_hobns.upload", p_hobby);
	}

	public void updateH(Ps_hob p_hobby) {
		// TODO Auto-generated method stub
		sst.update("ps_hobns.update", p_hobby);
	}

}
