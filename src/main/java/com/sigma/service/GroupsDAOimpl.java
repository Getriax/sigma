package com.sigma.service;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sigma.dao.GroupCDAO;
import com.sigma.dao.GroupFDAO;
import com.sigma.model.GroupC;
import com.sigma.model.GroupF;

/**
 * @author Nikodem
 * Service that provide accesing groups of products in data base
 */
@Service
public class GroupsDAOimpl 
{
	@Autowired
	GroupFDAO groupFDAO;
	
	@Autowired
	GroupCDAO groupCDAO;
	
	/**
	 * @return All of fertilizers groups form data base
	 */
	public Iterable<GroupF> getFertilizeGroupAll()
	{
		return groupFDAO.findAll();
	}
	/**
	 * @return All of carbon groups form data base
	 */
	public Iterable<GroupC> getCarbonGroupAll()
	{
		return groupCDAO.findAll();
	}
	/**
	 * @param id of fertilizer group
	 * @return group of fertilizer
	 */
	public GroupF getFertilizerGroupById(int id)
	{
		return groupFDAO.findOne(id);
	}
	/**
	 * @param id of carbon group
	 * @return group of carbon
	 */
	public GroupC getCarbonGroupById(int id)
	{
		return groupCDAO.findOne(id);
	}
}
