package com.klu.jfsd.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.klu.jfsd.model.Farmer;
import com.klu.jfsd.model.Product;

@Service
public interface ProductService {
	
	public String updateProduct(Product product);
	
	 public List<Product> getProductsByType(String type);
	
	public List<Product> getAllProducts(); 
       
	public Product getProductById(int farmerId);
	
	
	
	
	
	
	 List<Product> getProductsByFarmer(Farmer farmer);
	   

		String deleteProduct(int productId);

		int getCount();

		List<Product> getProductsByRequest(int request);

		void updatefarmerProduct(Product product);
}
