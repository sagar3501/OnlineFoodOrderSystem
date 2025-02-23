package com.example.demo.model;

import jakarta.persistence.*;
import java.math.BigDecimal;
import java.time.LocalDateTime;

@Entity
@Table(name = "bank")
public class Bank {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int bankId;

    @Column(name = "transaction_id")
    private int transactionId;

    @Column(precision = 10, scale = 2)
    private BigDecimal totalPrice;

    @Column(name = "order_date")
    private LocalDateTime orderDate;
    
    // Relationship to Payment (using transaction_id as join column)
    @ManyToOne
    @JoinColumn(name = "transaction_id", referencedColumnName = "transaction_id", insertable = false, updatable = false)
    private Payment payment;

    // Getters and Setters
    public int getBankId() {
        return bankId;
    }
    public void setBankId(int bankId) {
        this.bankId = bankId;
    }
    public int getTransactionId() {
        return transactionId;
    }
    public void setTransactionId(int transactionId) {
        this.transactionId = transactionId;
    }
    public BigDecimal getTotalPrice() {
        return totalPrice;
    }
    public void setTotalPrice(BigDecimal totalPrice) {
        this.totalPrice = totalPrice;
    }
    public LocalDateTime getOrderDate() {
        return orderDate;
    }
    public void setOrderDate(LocalDateTime orderDate) {
        this.orderDate = orderDate;
    }
    public Payment getPayment() {
        return payment;
    }
    public void setPayment(Payment payment) {
        this.payment = payment;
    }
}

