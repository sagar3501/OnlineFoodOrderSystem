package com.example.demo.controller;

import com.example.demo.model.Admin;
import com.example.demo.model.User;
import com.example.demo.model.Restaurant;
import com.example.demo.model.DeliveryAgent;
import com.example.demo.service.AdminService;
import com.example.demo.service.UserService;
import com.example.demo.service.RestaurantService;
import com.example.demo.service.DeliveryAgentService;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequestMapping("/admin")
public class AdminController {

    @Autowired
    private AdminService adminService;
    
    @Autowired
    private UserService userService;
    
    @Autowired
    private RestaurantService restaurantService;
    
    @Autowired
    private DeliveryAgentService deliveryAgentService;
    
    // ----- Portal & Authentication -----
    
    // Admin Portal: offers options to log in or register
    @GetMapping("/portal")
    public String adminPortal() {
        return "adminPortal";
    }
    
    // Registration Form
    @GetMapping("/register")
    public String showRegisterForm() {
        return "adminRegister";
    }
    
    // Process Registration
    @PostMapping("/register")
    public String registerAdmin(@ModelAttribute Admin admin, Model model) {
        Admin savedAdmin = adminService.saveAdmin(admin);
        model.addAttribute("savedAdmin", savedAdmin);
        return "adminRegisterSuccess";
    }
    
    // Login Form
    @GetMapping("/login")
    public String showLoginForm() {
        return "adminLogin";
    }
    
    // Process Login
    @PostMapping("/login")
    public String loginAdmin(@RequestParam String email,
                             @RequestParam String password,
                             HttpSession session,
                             Model model) {
        Admin admin = adminService.getAdminByEmail(email);
        if (admin != null && admin.getPassword().equals(password)) {
            session.setAttribute("admin", admin);
            return "redirect:/admin/dashboard";
        } else {
            model.addAttribute("error", "Invalid email or password");
            return "adminLogin";
        }
    }
    
    // Logout
    @GetMapping("/logout")
    public String logout(HttpSession session) {
        session.invalidate();
        return "redirect:/admin/portal";
    }
    
    // ----- Dashboard & Management -----
    
    // Admin Dashboard – shows counts and a slide-out menu
    @GetMapping("/dashboard")
    public String dashboard(Model model) {
        long totalUsers = userService.countUsers();
        long totalRestaurants = restaurantService.countRestaurants();
        long totalDeliveryAgents = deliveryAgentService.countDeliveryAgents();
        model.addAttribute("totalUsers", totalUsers);
        model.addAttribute("totalRestaurants", totalRestaurants);
        model.addAttribute("totalDeliveryAgents", totalDeliveryAgents);
        return "adminDashboard";
    }
    
    // Admin Profile Page
    @GetMapping("/profile")
    public String adminProfile(HttpSession session, Model model) {
        Admin admin = (Admin) session.getAttribute("admin");
        if (admin == null) {
            return "redirect:/admin/login";
        }
        model.addAttribute("admin", admin);
        return "adminProfile";
    }
    
    // User Management – list all users with delete option
    @GetMapping("/users")
    public String userManagement(Model model) {
        List<User> users = userService.getAllUsers();
        model.addAttribute("users", users);
        return "userManagement";
    }
    
    @PostMapping("/deleteUser")
    public String deleteUser(@RequestParam int userId) {
        userService.deleteUser(userId);
        return "redirect:/admin/users";
    }
    
    // Restaurant Management – list all restaurants with delete option
    @GetMapping("/restaurants")
    public String restaurantManagement(Model model) {
        List<Restaurant> restaurants = restaurantService.getAllRestaurants();
        model.addAttribute("restaurants", restaurants);
        return "restaurantManagement";
    }
    
    @PostMapping("/deleteRestaurant")
    public String deleteRestaurant(@RequestParam int restaurantId) {
        restaurantService.deleteRestaurant(restaurantId);
        return "redirect:/admin/restaurants";
    }
    
    // Delivery Agent Management – list all delivery agents with delete option
    @GetMapping("/delivery")
    public String deliveryAgentManagement(Model model) {
        List<DeliveryAgent> agents = deliveryAgentService.getAllDeliveryAgents();
        model.addAttribute("agents", agents);
        return "deliveryAgentManagement";
    }
    
    @PostMapping("/deleteDeliveryAgent")
    public String deleteDeliveryAgent(@RequestParam int agentId) {
        deliveryAgentService.deleteDeliveryAgent(agentId);
        return "redirect:/admin/delivery";
    }
}

