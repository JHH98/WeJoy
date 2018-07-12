package com.wejoy.go.service;

import java.util.List;

import com.wejoy.go.model.Post;
import com.wejoy.go.model.Ps_hob;

public interface  PostService {
	int total(Post post);
	Post select(int ps_id);
	int getMaxNum();
	int insert(Post post);
	List<Post> getList(Post post);
	void updateReadCount(int ps_id);
	int update(Post post);
	int delete(int num);
	List<Post> getPage(String mm_id);
	void insertH(Ps_hob p_hobby);
	List<Post> getPage2(Post post);
	void likeCount(int ps_id);
	void updateH(Ps_hob p_hobby);
	int bestTotal(Post post);
	List<Post> getBestList(Post post);

}
