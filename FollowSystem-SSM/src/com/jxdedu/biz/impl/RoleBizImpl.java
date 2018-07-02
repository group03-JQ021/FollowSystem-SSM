package com.jxdedu.biz.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jxdedu.biz.RoleBiz;
import com.jxdedu.dao.RoleDao;
import com.jxdedu.entity.Roletable;
@Service("role")
public class RoleBizImpl implements RoleBiz{
	@Autowired
	private RoleDao dao;
	@Override
	public boolean addRole(Roletable role) {
		// TODO Auto-generated method stub
		return dao.addRole(role);
	}

	@Override
	public boolean editRole(Roletable role) {
		// TODO Auto-generated method stub
		return dao.editRole(role);
	}

	@Override
	public boolean delRole(int roleid) {
		// TODO Auto-generated method stub
		return dao.delRole(roleid);
	}

	@Override
	public List<Roletable> getAllRole() {
		// TODO Auto-generated method stub
		return dao.getAllRole();
	}

	@Override
	public List<Roletable> getSubRole(int startIndex, int endIndex) {
		// TODO Auto-generated method stub
		return dao.getSubRole(startIndex, endIndex);
	}

	@Override
	public int getRowNum() {
		// TODO Auto-generated method stub
		return dao.getRowNum();
	}

	@Override
	public Roletable getRoleByuserId(int userid) {
		// TODO Auto-generated method stub
		return dao.getRoleByuserId(userid);
	}

}
