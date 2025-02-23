package com.example.demo.service;

import com.example.demo.model.Cart;
import java.util.List;

public interface CartService {
    Cart saveCartItem(Cart cart);
    List<Cart> getCartItemsByUserId(int userId);
    void deleteCartItem(int cartId);
    void incrementQuantity(int cartId);
    void decrementQuantity(int cartId);
}
