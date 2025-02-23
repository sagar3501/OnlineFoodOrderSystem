package com.example.demo.service;

import com.example.demo.model.User;
import java.util.List;

public interface UserService {
    User saveUser(User user);
    User getUserByEmail(String email);
    List<User> getAllUsers();
    void deleteUser(int id);
    long countUsers();
}
