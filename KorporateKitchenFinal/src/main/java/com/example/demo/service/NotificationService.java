package com.example.demo.service;

import com.example.demo.model.Notification;
import java.util.List;

public interface NotificationService {
    Notification saveNotification(Notification notification);
    Notification getNotificationById(int id);
    List<Notification> getNotificationsByUserId(int userId);
    List<Notification> getAllNotifications();
    void deleteNotification(int id);
}
