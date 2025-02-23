package com.example.demo.service;

import com.example.demo.model.Cart;
import com.example.demo.repository.CartRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.math.BigDecimal;
import java.util.List;
import java.util.Optional;

@Service
public class CartServiceImpl implements CartService {
    
    @Autowired
    private CartRepository cartRepository;
    
    @Override
    public Cart saveCartItem(Cart cart) {
        return cartRepository.save(cart);
    }
    
    @Override
    public List<Cart> getCartItemsByUserId(int userId) {
        return cartRepository.findByUserUserId(userId);
    }
    
    @Override
    public void deleteCartItem(int cartId) {
        cartRepository.deleteById(cartId);
    }
    
    @Override
    public void incrementQuantity(int cartId) {
        Optional<Cart> optionalCart = cartRepository.findById(cartId);
        if (optionalCart.isPresent()) {
            Cart cart = optionalCart.get();
            int newQty = cart.getQuantity() + 1;
            cart.setQuantity(newQty);
            cart.setTotalPrice(cart.getItemPrice().multiply(new BigDecimal(newQty)));
            cartRepository.save(cart);
        }
    }
    
    @Override
    public void decrementQuantity(int cartId) {
        Optional<Cart> optionalCart = cartRepository.findById(cartId);
        if (optionalCart.isPresent()) {
            Cart cart = optionalCart.get();
            int currentQty = cart.getQuantity();
            if (currentQty <= 1) {
                // Remove item if quantity would drop below 1
                cartRepository.delete(cart);
            } else {
                int newQty = currentQty - 1;
                cart.setQuantity(newQty);
                cart.setTotalPrice(cart.getItemPrice().multiply(new BigDecimal(newQty)));
                cartRepository.save(cart);
            }
        }
    }
}


