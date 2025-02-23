package com.example.demo.service;

import com.example.demo.model.Admin;
import java.util.List;

public interface AdminService {
    Admin saveAdmin(Admin admin);
    Admin getAdminById(int id);
    Admin getAdminByEmail(String email);
    List<Admin> getAllAdmins();
    void deleteAdmin(int id);
}
