package com.service;

import java.util.Collection;

import com.entity.Cart;
import com.entity.ProductInOrder;
import com.entity.User;


public interface CartService {
    Cart getCart(User user);

    void mergeLocalCart(Collection<ProductInOrder> productInOrders, User user);

    void delete(String itemId, User user);

    void checkout(User user);
}
