package com.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.entity.ProductInOrder;


public interface ProductInOrderRepository extends JpaRepository<ProductInOrder, Long> {

}
