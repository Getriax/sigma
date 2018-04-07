package com.sigma.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sigma.dao.CarbonDAO;
import com.sigma.dao.FertilizerDAO;
import com.sigma.dao.ProductDAO;
import com.sigma.model.Carbon;
import com.sigma.model.Fertilizer;
import com.sigma.model.Product;

/**
 * @author Nikodem
 * products managing
 */
@Service
public class ProductsDAOimpl 
{
	@Autowired
	FertilizerDAO fertilizerDAO;
	
	@Autowired
	CarbonDAO carbonDAO;
	
	@Autowired
	ProductDAO productDAO;
	
	/**
	 * save the fertilizer in the database 
	 * @param fertilizer to save
	 */
	public void FertilizerSave(Fertilizer fertilizer)
	{
		fertilizerDAO.save(fertilizer);
	}
	/**
	 * save the carbon in the database 
	 * @param carbon to save
	 */
	public void CarbonSave(Carbon carbon)
	{
		carbonDAO.save(carbon);
	}
	/**
	 * save the product in the database 
	 * @param product to save
	 */
	public void ProductSave(Product product)
	{
		productDAO.save(product);
	}
	public Fertilizer getFertilizerById(int id)
	{
		return fertilizerDAO.findOne(id);
	}
	public Carbon getCarbonById(int id)
	{
		return carbonDAO.findOne(id);
	}
	public Product getProductById(int id)
	{
		return productDAO.findOne(id);
	}
	public Iterable<Fertilizer> getFertilizersAll()
	{
		return fertilizerDAO.findAll();
	}
	public Iterable<Carbon> getCarbonsAll()
	{
		return carbonDAO.findAll();
	}
	public Iterable<Product> getProductsAll()
	{
		return productDAO.findAll();
	}
	public void deleteFertilizer(int id)
	{
		fertilizerDAO.delete(id);
	}
	public void deleteCarbon(int id)
	{
		carbonDAO.delete(id);
	}
	public void deleteProduct(int id)
	{
		productDAO.delete(id);
	}
}
