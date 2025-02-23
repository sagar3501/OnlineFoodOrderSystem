package com.example.demo.model;

import jakarta.persistence.*;

@Entity
@Table(name = "delivery_agent")
public class DeliveryAgent {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int agentId;

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
    public int getAgentId() {
        return agentId;
    }
    public void setAgentId(int agentId) {
        this.agentId = agentId;
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

