package com.wejoy.go.service;

import java.util.List;

import com.wejoy.go.model.Comments;

public interface CommentsService {

	List<Comments> list(int num);
	void insert(Comments cs);
	void delete(int cno);
	void update(Comments cs);
	int total(int num);
	

}
