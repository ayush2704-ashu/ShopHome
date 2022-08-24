package com.service;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;

import com.entity.Discount;

public interface DiscountService {

	void createCoupon(String code, List<String> emails);

	Page<Discount> findAll(PageRequest request);

	//void deleteCoupon(String code);

	List<Discount> findAll();

	void deleteCoupon(Long code);

	List<Discount> findAll(String email);

}
