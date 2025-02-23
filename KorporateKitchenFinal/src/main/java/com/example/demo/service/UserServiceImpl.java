package com.example.demo.service;

import com.example.demo.model.User;
import com.example.demo.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.List;

@Service
public class UserServiceImpl implements UserService {
    
    @Autowired
    private UserRepository userRepository;
    
    @Override
    public User saveUser(User user) {
        return userRepository.save(user);
    }
    
    @Override
    public User getUserByEmail(String email) {
        return userRepository.findByEmail(email);
    }
    
    @Override
    public List<User> getAllUsers() {
        return userRepository.findAll();
    }
    
    @Override
    public void deleteUser(int id) {
        userRepository.deleteById(id);
    }
    
    @Override
    public long countUsers() {
        return userRepository.count();
    }
}
