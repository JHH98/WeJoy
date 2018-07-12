package com.wejoy.go.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.wejoy.go.model.Hobby;

@Repository
public class HobbyDaoImpl implements HobbyDao {
	@Autowired
	private SqlSessionTemplate sst;

	@Override
	public List<Hobby> list() {
		return sst.selectList("hobbyns.list");
	}
}