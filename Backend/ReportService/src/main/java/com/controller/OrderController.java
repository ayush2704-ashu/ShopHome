package com.controller;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import com.entity.Order;
import com.service.OrderService;

@RestController
@RequestMapping("/report")
@CrossOrigin
public class OrderController {

	@Autowired
	OrderService orderservice;
	
	
	@GetMapping(value = "/orders")
	public List<Order> findOrders() {
		return orderservice.findOrders();
	}
	
}
