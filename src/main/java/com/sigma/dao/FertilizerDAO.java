package com.sigma.dao;

import org.springframework.data.repository.CrudRepository;

import com.sigma.model.Fertilizer;

public interface FertilizerDAO extends CrudRepository<Fertilizer, Integer>
{
	
}
