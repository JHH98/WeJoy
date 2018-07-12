package com.wejoy.go.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.wejoy.go.model.Like_func;

@Repository
public class like_fucDaoImpl implements like_funcDao {
	@Autowired
	private SqlSessionTemplate sst;

	@Override
	public String select(Like_func like) {
		// TODO Auto-generated method stub
		return sst.selectOne("like_hobns.select",like);
	}

	@Override
	public int like(Like_func like) {
		// TODO Auto-generated method stub
		return sst.insert("like_hobns.like",like);
	}
}
