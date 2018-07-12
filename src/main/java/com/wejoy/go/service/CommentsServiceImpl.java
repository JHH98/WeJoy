package com.wejoy.go.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wejoy.go.dao.CommentsDao;
import com.wejoy.go.model.Comments;

@Service
public class CommentsServiceImpl implements CommentsService {

	@Autowired
	private CommentsDao csd;
	
	@Override
	public List<Comments> list(int pno) {
		// TODO Auto-generated method stub
		return csd.list(pno);
	}

	@Override
	public void insert(Comments cs) {
		// TODO Auto-generated method stub
		csd.insert(cs);
	}

	@Override
	public void delete(int cno) {
		// TODO Auto-generated method stub
		csd.delete(cno);
	}

	@Override
	public void update(Comments cs) {
		// TODO Auto-generated method stub
		csd.update(cs);
	}

	public int total(int num) {
		// TODO Auto-generated method stub
		return csd.total(num);
	}

	

}
