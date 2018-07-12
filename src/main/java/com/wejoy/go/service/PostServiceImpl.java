package com.wejoy.go.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wejoy.go.dao.Mem_hobDao;
import com.wejoy.go.dao.PostDao;
import com.wejoy.go.dao.Ps_hobDao;
import com.wejoy.go.model.Post;
import com.wejoy.go.model.Ps_hob;
@Service
public class PostServiceImpl implements PostService {
	@Autowired
	private PostDao pd;
	@Autowired
	private Ps_hobDao phd;
	public int total(Post post) {
		// TODO Auto-generated method stub
		return pd.total(post);
	}
	public Post select(int ps_id) {
		// TODO Auto-generated method stub
		return pd.select(ps_id);
	}
	public int getMaxNum() {
		// TODO Auto-generated method stub
		return pd.getMaxNum();
	}
	public int insert(Post post) {
		// TODO Auto-generated method stub
		return pd.insert(post);
	}
	public List<Post> getList(Post post) {
		// TODO Auto-generated method stub
		return pd.getList(post);
	}
	public void updateReadCount(int ps_id) {
		// TODO Auto-generated method stub
		pd.updateReadCount(ps_id);
		
	}
	public int update(Post post) {
		// TODO Auto-generated method stub
		return pd.update(post);
	}
	public int delete(int num) {
		// TODO Auto-generated method stub
		return pd.delete(num);
	}
	public List<Post> getPage(String mm_id) {
		// TODO Auto-generated method stub
		return pd.getPage(mm_id);
	}
	public void insertH(Ps_hob p_hobby) {
		// TODO Auto-generated method stub
	     phd.inserH(p_hobby);
	}
	public List<Post> getPage2(Post post) {
		// TODO Auto-generated method stub
		return pd.getPage2(post);
	}
	public void likeCount(int ps_id) {
		// TODO Auto-generated method stub
		pd.likecount(ps_id);
	}
	@Override
	public void updateH(Ps_hob p_hobby) {
		// TODO Auto-generated method stub
		 phd.updateH(p_hobby);
	}
	@Override
	public int bestTotal(Post post) {
		// TODO Auto-generated method stub
		return pd.bestTotal(post);
	}
	@Override
	public List<Post> getBestList(Post post) {
		// TODO Auto-generated method stub
		return pd.getBestList(post);
	}

}
