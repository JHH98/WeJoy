package com.wejoy.go.dao;

import java.util.List;

import com.wejoy.go.model.Mem_hob;

public interface Mem_hobDao {
	int SignUp2(Mem_hob M_hobby);

	List<Mem_hob> findMemHobes(String id);

	void Update2(Mem_hob m_hobby);

	void delete(String mm_id);
}
