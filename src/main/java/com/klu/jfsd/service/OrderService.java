package com.klu.jfsd.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.klu.jfsd.model.Order;

@Service
public interface OrderService {
	  void saveOrder(Order order);
	    List<Order> getOrdersByUserId(int userId);
}
