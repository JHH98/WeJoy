package com.wejoy.go.dao;

import java.util.List;

import com.wejoy.go.model.Comments;

public interface CommentsDao {

	List<Comments> list(int pno);

	void insert(Comments cs);

	void delete(int cno);

	void update(Comments cs);


	int total(int num);



}
