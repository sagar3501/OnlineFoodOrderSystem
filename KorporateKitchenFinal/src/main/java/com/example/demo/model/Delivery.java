package com.example.demo.model;

import jakarta.persistence.*;

@Entity
@Table(name = "delivery")
public class Delivery {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int delivery_id;

    @ManyToOne
    @JoinColumn(name = "order_id")
    private Order order;

    @Enumerated(EnumType.STRING)
    @Column(name = "delivery_status")
    private DeliveryStatus deliveryStatus = DeliveryStatus.pending;

    public enum DeliveryStatus {
        pending,
        delivered,
        failed
    }

    // Getters and Setters
    public int getDelivery_id() {
        return delivery_id;
    }

    public void setDelivery_id(int delivery_id) {
        this.delivery_id = delivery_id;
    }

    public Order getOrder() {
        return order;
    }

    public void setOrder(Order order) {
        this.order = order;
    }

    public DeliveryStatus getDeliveryStatus() {
        return deliveryStatus;
    }

    public void setDeliveryStatus(DeliveryStatus deliveryStatus) {
        this.deliveryStatus = deliveryStatus;
    }
}
