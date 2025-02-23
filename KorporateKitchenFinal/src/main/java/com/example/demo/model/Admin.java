package com.example.demo.model;

import jakarta.persistence.*;

@Entity
@Table(name = "admin")
public class Admin {
    
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int admin_id;
    
    @Column(name = "user_name", nullable = false, length = 50)
    private String userName;
    
    @Column(nullable = false, unique = true, length = 100)
    private String email;
    
    @Column(nullable = false, length = 255)
    private String password;
    
    @Column(length = 15)
    private String contact;
    
    @Lob
    private byte[] image;
    
    // Getters and Setters
    public int getAdmin_id() {
        return admin_id;
    }
    public void setAdmin_id(int admin_id) {
        this.admin_id = admin_id;
    }
    public String getUserName() {
        return userName;
    }
    public void setUserName(String userName) {
        this.userName = userName;
    }
    public String getEmail() {
        return email;
    }
    public void setEmail(String email) {
        this.email = email;
    }
    public String getPassword() {
        return password;
    }
    public void setPassword(String password) {
        this.password = password;
    }
    public String getContact() {
        return contact;
    }
    public void setContact(String contact) {
        this.contact = contact;
    }
    public byte[] getImage() {
        return image;
    }
    public void setImage(byte[] image) {
        this.image = image;
    }
}
