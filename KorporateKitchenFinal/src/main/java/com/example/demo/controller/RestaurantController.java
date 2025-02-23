package com.example.demo.controller;

import com.example.demo.model.MasterMenuItem;
import com.example.demo.model.Order;
import com.example.demo.model.Restaurant;
import com.example.demo.model.Bank;
import com.example.demo.service.MasterMenuItemService;
import com.example.demo.service.OrderService;
import com.example.demo.service.RestaurantService;
import com.example.demo.service.BankService;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import java.util.List;

@Controller
@RequestMapping("/restaurant")
public class RestaurantController {

    @Autowired
    private RestaurantService restaurantService;
    
    @Autowired
    private MasterMenuItemService masterMenuItemService;
    
    @Autowired
    private OrderService orderService;
    
    @Autowired
    private BankService bankService;
    
    // Portal page for restaurant login/register options
    @GetMapping("/portal")
    public String restaurantPortal() {
        return "restaurantPortal";
    }
    
    // Restaurant Registration Form
    @GetMapping("/register")
    public String showRegistrationForm() {
        return "restaurantRegister";
    }
    
    // Process Restaurant Registration
    @PostMapping("/register")
    public String registerRestaurant(@ModelAttribute Restaurant restaurant, Model model) {
        Restaurant savedRestaurant = restaurantService.saveRestaurant(restaurant);
        model.addAttribute("savedRestaurant", savedRestaurant);
        return "restaurantRegisterSuccess";
    }
    
    // Restaurant Login Form
    @GetMapping("/login")
    public String showLoginForm() {
        return "restaurantLogin";
    }
    
    // Process Restaurant Login
    @PostMapping("/login")
    public String loginRestaurant(@RequestParam String email,
                                  @RequestParam String password,
                                  HttpSession session,
                                  Model model) {
        Restaurant restaurant = restaurantService.getRestaurantByEmail(email);
        if (restaurant != null && restaurant.getPassword().equals(password)) {
            session.setAttribute("restaurant", restaurant);
            return "redirect:/restaurant/dashboard";
        } else {
            model.addAttribute("error", "Invalid email or password");
            return "restaurantLogin";
        }
    }
    
    // Restaurant Dashboard
    @GetMapping("/dashboard")
    public String dashboard(HttpSession session) {
        Restaurant restaurant = (Restaurant) session.getAttribute("restaurant");
        if (restaurant == null) {
            return "redirect:/restaurant/login";
        }
        return "restaurantDashboard";
    }
    
    // Manage Menu – displays all menu items for the logged-in restaurant
    @GetMapping("/manageMenu")
    public String manageMenu(HttpSession session, Model model) {
        Restaurant restaurant = (Restaurant) session.getAttribute("restaurant");
        if (restaurant == null) {
            return "redirect:/restaurant/login";
        }
        List<MasterMenuItem> menuItems = masterMenuItemService.getMenuItemsByRestaurantId(restaurant.getRestaurantId());
        model.addAttribute("menuItems", menuItems);
        return "manageMenu";
    }
    
    // Show Add New Menu Item Form
    @GetMapping("/addMenuItem")
    public String showAddMenuItemForm(HttpSession session) {
        // Ensure restaurant is logged in
        Restaurant restaurant = (Restaurant) session.getAttribute("restaurant");
        if (restaurant == null) {
            return "redirect:/restaurant/login";
        }
        return "addMenuItem";
    }	
    // Process Add New Menu Item Form
    @PostMapping("/addMenuItem")
    public String addMenuItem(@ModelAttribute MasterMenuItem menuItem, HttpSession session) {
        Restaurant restaurant = (Restaurant) session.getAttribute("restaurant");
        if (restaurant == null) {
            return "redirect:/restaurant/login";
        }
        // Associate the new menu item with the logged-in restaurant
        menuItem.setRestaurant(restaurant);
        masterMenuItemService.saveMenuItem(menuItem);
        return "redirect:/restaurant/manageMenu";
    }
    
    // Show Edit Menu Item Form
    @GetMapping("/editMenuItem")
    public String showEditMenuItemForm(@RequestParam int itemId, Model model, HttpSession session) {
        Restaurant restaurant = (Restaurant) session.getAttribute("restaurant");
        if (restaurant == null) {
            return "redirect:/restaurant/login";
        }
        MasterMenuItem menuItem = masterMenuItemService.getMenuItemById(itemId);
        if (menuItem == null) {
            model.addAttribute("error", "Menu item not found.");
            return "redirect:/restaurant/manageMenu";
        }
        model.addAttribute("menuItem", menuItem);
        return "editMenuItem";
    }
    
    // Process Edit Menu Item Form
    @PostMapping("/editMenuItem")
    public String editMenuItem(@ModelAttribute MasterMenuItem menuItem, HttpSession session) {
        Restaurant restaurant = (Restaurant) session.getAttribute("restaurant");
        if (restaurant == null) {
            return "redirect:/restaurant/login";
        }
        // Ensure the menu item is associated with the logged-in restaurant
        menuItem.setRestaurant(restaurant);
        masterMenuItemService.saveMenuItem(menuItem);
        return "redirect:/restaurant/manageMenu";
    }
    
    // Process Delete Menu Item
    @PostMapping("/deleteMenuItem")
    public String deleteMenuItem(@RequestParam int itemId, HttpSession session) {
        Restaurant restaurant = (Restaurant) session.getAttribute("restaurant");
        if (restaurant == null) {
            return "redirect:/restaurant/login";
        }
        masterMenuItemService.deleteMenuItem(itemId);
        return "redirect:/restaurant/manageMenu";
    }
    
    // Orders endpoint for restaurant orders
    @GetMapping("/orders")
    public String orders(HttpSession session, Model model) {
        Restaurant restaurant = (Restaurant) session.getAttribute("restaurant");
        if (restaurant == null) {
            return "redirect:/restaurant/login";
        }
        List<Order> orders = orderService.getOrdersByRestaurantId(restaurant.getRestaurantId());
        model.addAttribute("orders", orders);
        return "restaurantOrders";
    }
    
    // Bank Details Endpoint
    @GetMapping("/bank")
    public String bankDetails(HttpSession session, Model model) {
        Restaurant restaurant = (Restaurant) session.getAttribute("restaurant");
        if (restaurant == null) {
            return "redirect:/restaurant/login";
        }
        List<Bank> bankDetails = bankService.getBankDetailsByRestaurantId(restaurant.getRestaurantId());
        model.addAttribute("bankDetails", bankDetails);
        return "restaurantBank";
    }
    
    // Logout Endpoint for Restaurant
    @GetMapping("/logout")
    public String logout(HttpSession session) {
        session.invalidate();
        return "redirect:/restaurant/portal";
    }
}




