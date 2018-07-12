package com.wejoy.go.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.wejoy.go.model.Post;
@Repository
public class PostDaoImpl implements PostDao {
	@Autowired
	private SqlSessionTemplate sst;
	
	public int total(Post post) {
		// TODO Auto-generated method stub
		return sst.selectOne("postns.total",post);
	}

	@Override
	public Post select(int ps_id) {
		// TODO Auto-generated method stub
		return sst.selectOne("postns.select",ps_id);
	}

	@Override
	public int getMaxNum() {
		// TODO Auto-generated method stub
		return sst.selectOne("postns.maxnum");
	}

	public int insert(Post post) {
		
		return sst.insert("postns.insert", post);
	}

	@Override
	public List<Post> getList(Post post) {
		// TODO Auto-generated method stub
		return sst.selectList("postns.list",post);
	}

	public void updateReadCount(int ps_id) {
		// TODO Auto-generated method stub
		sst.update("postns.updateReadCount",ps_id);
	}

	public int update(Post post) {
		// TODO Auto-generated method stub
		return sst.update("postns.update", post);
	}

	public int delete(int num) {
		// TODO Auto-generated method stub
		return sst.update("postns.delete", num);
	}

	public List<Post> getPage(String mm_id) {
		// TODO Auto-generated method stub
		return sst.selectList("postns.getPage",mm_id);
	}

	@Override
	public List<Post> getPage2(Post post) {
		// TODO Auto-generated method stub
		return sst.selectList("postns.getPage2",post);
	}

	public void likecount(int ps_id) {
		// TODO Auto-generated method stub
		sst.update("postns.likeCount",ps_id);
	}

	public List<Post> getBestList(Post post) {
		// TODO Auto-generated method stub
		return sst.selectList("postns.bestList",post);
	}

	public int bestTotal(Post post) {
		// TODO Auto-generated method stub
		return sst.selectOne("postns.bestTotal",post);
	}

}
