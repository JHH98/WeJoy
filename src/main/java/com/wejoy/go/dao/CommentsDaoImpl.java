package com.wejoy.go.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.wejoy.go.model.Comments;
@Repository
public class CommentsDaoImpl implements CommentsDao {

	@Autowired
	private SqlSessionTemplate sst;
	
	public List<Comments> list(int pno) {
		// TODO Auto-generated method stub
		return sst.selectList("commentsns.list",pno);
	}

	public void insert(Comments cs) {
		// TODO Auto-generated method stub
		sst.insert("commentsns.insert",cs);
	}

	public void delete(int cno) {
		// TODO Auto-generated method stub
		sst.update("commentsns.delete",cno);
	}

	public void update(Comments cs) {
		// TODO Auto-generated method stub
		sst.update("commentsns.update", cs);
	}

	public int total(int pno) {
		// TODO Auto-generated method stub
		return sst.selectOne("commentsns.total",pno);
	}



}
