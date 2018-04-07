package com.sigma.dao;

import org.springframework.data.repository.CrudRepository;

import com.sigma.model.Product;

public interface ProductDAO extends CrudRepository<Product, Integer>{

}
