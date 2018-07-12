package com.wejoy.go.dao;

import java.util.List;

import com.wejoy.go.model.Post;

public interface PostDao {
	int total(Post post);

	Post select(int ps_id);

	int getMaxNum();

	int insert(Post post);

	List<Post> getList(Post post);

	void updateReadCount(int ps_id);

	int update(Post post);

	int delete(int num);

	List<Post> getPage(String mm_id);

	List<Post> getPage2(Post post);

	void likecount(int ps_id);

	List<Post> getBestList(Post post);

	int bestTotal(Post post);

}
