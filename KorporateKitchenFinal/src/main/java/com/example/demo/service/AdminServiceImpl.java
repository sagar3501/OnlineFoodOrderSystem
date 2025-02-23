package com.example.demo.service;

import com.example.demo.model.Admin;
import com.example.demo.repository.AdminRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.List;

@Service
public class AdminServiceImpl implements AdminService {

    @Autowired
    private AdminRepository adminRepository;
    
    @Override
    public Admin saveAdmin(Admin admin) {
        return adminRepository.save(admin);
    }
    
    @Override
    public Admin getAdminById(int id) {
        return adminRepository.findById(id).orElse(null);
    }
    
    @Override
    public Admin getAdminByEmail(String email) {
        return adminRepository.findByEmail(email);
    }
    
    @Override
    public List<Admin> getAllAdmins() {
        return adminRepository.findAll();
    }
    
    @Override
    public void deleteAdmin(int id) {
        adminRepository.deleteById(id);
    }
}

