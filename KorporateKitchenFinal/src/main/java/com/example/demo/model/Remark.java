package com.example.demo.model;

import jakarta.persistence.*;
import java.time.LocalDateTime;
import org.hibernate.annotations.CreationTimestamp;

@Entity
@Table(name = "remarks")
public class Remark {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int remarkId;
    
    @ManyToOne
    @JoinColumn(name = "user_id")
    private User user;
    
    @Column(columnDefinition = "TEXT")
    private String userRemark;
    
    @CreationTimestamp
    @Column(name = "remark_date", nullable = false, updatable = false)
    private LocalDateTime remarkDate;

    // Getters and Setters
    public int getRemarkId() {
        return remarkId;
    }
    public void setRemarkId(int remarkId) {
        this.remarkId = remarkId;
    }
    public User getUser() {
        return user;
    }
    public void setUser(User user) {
        this.user = user;
    }
    public String getUserRemark() {
        return userRemark;
    }
    public void setUserRemark(String userRemark) {
        this.userRemark = userRemark;
    }
    public LocalDateTime getRemarkDate() {
        return remarkDate;
    }
    public void setRemarkDate(LocalDateTime remarkDate) {
        this.remarkDate = remarkDate;
    }
}
