package com.example.demo.controller;

import com.example.demo.model.User;
import com.example.demo.model.Restaurant;
import com.example.demo.model.MasterMenuItem;
import com.example.demo.model.Cart;
import com.example.demo.model.Order;
import com.example.demo.service.UserService;
import com.example.demo.service.RestaurantService;
import com.example.demo.service.MasterMenuItemService;
import com.example.demo.service.CartService;
import com.example.demo.service.OrderService;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import java.math.BigDecimal;
import java.util.List;
import org.springframework.transaction.annotation.Transactional;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import com.example.demo.model.Remark;
import com.example.demo.service.RemarkService;

@Controller
@RequestMapping("/user")
public class UserController {

    private static final Logger logger = LoggerFactory.getLogger(UserController.class);

    @Autowired
    private UserService userService;
    
    @Autowired
    private RestaurantService restaurantService;
    
    @Autowired
    private MasterMenuItemService masterMenuItemService;
    
    @Autowired
    private CartService cartService;
    
    @Autowired
    private OrderService orderService;
    @Autowired
    private RemarkService remarkService;
    
    // POST mapping for user login
    @PostMapping("/login")
    public String loginUser(@RequestParam String email,
                            @RequestParam String password,
                            HttpSession session,
                            Model model) {
        User user = userService.getUserByEmail(email);
        if (user != null && user.getPassword().equals(password)) {
            session.setAttribute("user", user);
            logger.info("User logged in: {}", user.getUserName());
            return "redirect:/user/home";
        } else {
            model.addAttribute("error", "Invalid email or password");
            logger.error("Login failed for email: {}", email);
            return "login";
        }
    }
    
    // POST mapping for user registration
    @PostMapping("/register")
    public String registerUser(@ModelAttribute User user, Model model) {
        User savedUser = userService.saveUser(user);
        model.addAttribute("registeredUser", savedUser);
        logger.info("User registered: {}", savedUser.getUserName());
        return "registerSuccess"; // Renders /WEB-INF/jsp/registerSuccess.jsp
    }
    
    // Home Dashboard – displays user info and available restaurants
    @GetMapping("/home")
    public String userHome(HttpSession session, Model model) {
        User user = (User) session.getAttribute("user");
        if (user == null) {
            logger.error("User not found in session for home");
            return "redirect:/login";
        }
        model.addAttribute("user", user);
        List<Restaurant> restaurants = restaurantService.getAllRestaurants();
        model.addAttribute("restaurants", restaurants);
        return "homeDashboard"; // Renders /WEB-INF/jsp/homeDashboard.jsp
    }
    
    // User Profile Page
    @GetMapping("/profile")
    public String userProfile(HttpSession session, Model model) {
        User user = (User) session.getAttribute("user");
        if (user == null) {
            logger.error("User not found in session for profile");
            return "redirect:/login";
        }
        model.addAttribute("user", user);
        return "userProfile"; // Renders /WEB-INF/jsp/userProfile.jsp
    }
    
    // Display Restaurant Menu – expects ?restaurantId= parameter
    @GetMapping("/restaurantMenu")
    public String restaurantMenu(@RequestParam int restaurantId, Model model, HttpSession session) {
        Restaurant restaurant = restaurantService.getRestaurantById(restaurantId);
        if (restaurant == null) {
            model.addAttribute("error", "Restaurant not found");
            logger.error("Restaurant not found for id: {}", restaurantId);
            return "homeDashboard";
        }
        // Set currentRestaurant in session for order placement
        session.setAttribute("currentRestaurant", restaurant);
        logger.info("Set currentRestaurant in session: {}", restaurant.getRestaurantName());
        List<MasterMenuItem> menuItems = masterMenuItemService.getMenuItemsByRestaurantId(restaurantId);
        model.addAttribute("restaurant", restaurant);
        model.addAttribute("menuItems", menuItems);
        return "restaurantMenu"; // Renders /WEB-INF/jsp/restaurantMenu.jsp
    }
    
    // Add a menu item to the cart
    @PostMapping("/addToCart")
    public String addToCart(@RequestParam int itemId, HttpSession session) {
        MasterMenuItem item = masterMenuItemService.getMenuItemById(itemId);
        if (item != null) {
            User user = (User) session.getAttribute("user");
            Cart cart = new Cart();
            cart.setUser(user);
            cart.setItemName(item.getItemName());
            cart.setItemPrice(item.getPrice());
            cart.setTotalPrice(item.getPrice()); // assume quantity 1
            cartService.saveCartItem(cart);
            logger.info("Added item to cart: {}", item.getItemName());
        }
        return "redirect:/user/cart";
    }
    
    // Display Cart Dashboard
    @GetMapping("/cart")
    public String viewCart(HttpSession session, Model model) {
        User user = (User) session.getAttribute("user");
        if (user == null) {
            logger.error("User not found in session for cart");
            return "redirect:/login";
        }
        List<Cart> cartItems = cartService.getCartItemsByUserId(user.getUserId());
        model.addAttribute("cartItems", cartItems);
        BigDecimal total = BigDecimal.ZERO;
        for (Cart c : cartItems) {
            total = total.add(c.getTotalPrice());
        }
        model.addAttribute("totalPrice", total);
        return "cartDashboard"; // Renders /WEB-INF/jsp/cartDashboard.jsp
    }
    
    // Remove an item from the cart
    @PostMapping("/removeFromCart")
    public String removeFromCart(@RequestParam int cartId) {
        cartService.deleteCartItem(cartId);
        logger.info("Removed cart item with id: {}", cartId);
        return "redirect:/user/cart";
    }
    
    // Increase quantity endpoint
    @PostMapping("/increaseQuantity")
    public String increaseQuantity(@RequestParam int cartId) {
        cartService.incrementQuantity(cartId);
        logger.info("Increased quantity for cart id: {}", cartId);
        return "redirect:/user/cart";
    }
    
    // Decrease quantity endpoint
    @PostMapping("/decreaseQuantity")
    public String decreaseQuantity(@RequestParam int cartId) {
        cartService.decrementQuantity(cartId);
        logger.info("Decreased quantity for cart id: {}", cartId);
        return "redirect:/user/cart";
    }
    
    // Display Payment Gateway Page
    @GetMapping("/payment")
    public String paymentGateway(HttpSession session, Model model) {
        User user = (User) session.getAttribute("user");
        if (user == null) {
            logger.error("User not found in session for payment");
            return "redirect:/login";
        }
        List<Cart> cartItems = cartService.getCartItemsByUserId(user.getUserId());
        BigDecimal total = BigDecimal.ZERO;
        for (Cart c : cartItems) {
            total = total.add(c.getTotalPrice());
        }
        model.addAttribute("totalPrice", total);
        return "paymentGateway"; // Renders /WEB-INF/jsp/paymentGateway.jsp
    }
    
    // Confirm Payment and Place Order – saves the order and clears the cart
    @Transactional
    @PostMapping("/confirmPayment")
    public String confirmPayment(HttpSession session, Model model) {
        try {
            User user = (User) session.getAttribute("user");
            if (user == null) {
                logger.error("User not found in session during order confirmation");
                return "redirect:/login";
            }
            List<Cart> cartItems = cartService.getCartItemsByUserId(user.getUserId());
            if (cartItems == null || cartItems.isEmpty()) {
                model.addAttribute("error", "Your cart is empty!");
                logger.error("Cart is empty for user: {}", user.getUserName());
                return "paymentGateway";
            }
            BigDecimal total = BigDecimal.ZERO;
            StringBuilder items = new StringBuilder();
            for (Cart c : cartItems) {
                total = total.add(c.getTotalPrice());
                items.append(c.getItemName()).append(", ");
            }
            Order order = new Order();
            order.setUser(user);
            Restaurant currentRestaurant = (Restaurant) session.getAttribute("currentRestaurant");
            if (currentRestaurant == null) {
                logger.error("Current restaurant not set in session for user: {}", user.getUserName());
            } else {
                order.setRestaurant(currentRestaurant);
                logger.info("Order will be placed for restaurant: {}", currentRestaurant.getRestaurantName());
            }
            order.setItems(items.toString());
            order.setQuantity(cartItems.size());
            order.setTotalPrice(total);
            order.setOrder_status(Order.OrderStatus.completed);
            
            logger.info("Saving order: {}", order);
            Order savedOrder = orderService.saveOrder(order);
            if (savedOrder == null || savedOrder.getOrderId() <= 0) {
                model.addAttribute("error", "There was an error processing your order. Please try again.");
                logger.error("Order not saved for user: {}", user.getUserName());
                return "paymentGateway";
            }
            logger.info("Order saved successfully with orderId: {}", savedOrder.getOrderId());
            
            // Clear the cart after order placement
            for (Cart c : cartItems) {
                cartService.deleteCartItem(c.getCartId());
            }
            session.setAttribute("paymentMessage", "Payment Successful! Your order has been placed.");
            return "redirect:/user/confirmPayment";
        } catch (Exception e) {
            logger.error("Exception during confirmPayment: ", e);
            model.addAttribute("error", "There was an error processing your order. Please try again.");
            return "paymentGateway";
        }
    }
    
    // Display Payment Confirmation Page
    @GetMapping("/confirmPayment")
    public String confirmPaymentPage(HttpSession session, Model model) {
        String message = (String) session.getAttribute("paymentMessage");
        if (message == null) {
            message = "Payment Successful! Your order has been placed.";
        }
        model.addAttribute("message", message);
        session.removeAttribute("paymentMessage");
        return "confirmPayment"; // Renders /WEB-INF/jsp/confirmPayment.jsp
    }
    
    // User Orders Dashboard Endpoint
    @GetMapping("/orders")
    public String userOrders(HttpSession session, Model model) {
        User user = (User) session.getAttribute("user");
        if (user == null) {
            return "redirect:/login";
        }
        List<Order> orders = orderService.getOrdersByUserId(user.getUserId());
        model.addAttribute("orders", orders);
        return "userOrders"; // Renders /WEB-INF/jsp/userOrders.jsp
    }
    
    // Repeat Order Endpoint – adds a previous order’s items to the cart
    @GetMapping("/repeatOrder")
    public String repeatOrder(@RequestParam int orderId, HttpSession session) {
        User user = (User) session.getAttribute("user");
        if (user == null) {
            return "redirect:/login";
        }
        Order order = orderService.getOrderById(orderId);
        if (order != null) {
            Cart cart = new Cart();
            cart.setUser(user);
            cart.setItemName(order.getItems());
            cart.setItemPrice(order.getTotalPrice());
            cart.setTotalPrice(order.getTotalPrice());
            cartService.saveCartItem(cart);
        }
        return "redirect:/user/payment";
    }
    
    // Logout Endpoint for User
    @GetMapping("/logout")
    public String logout(HttpSession session) {
        session.invalidate();
        return "redirect:/";
    }
    
    // Forgot Password: GET mapping to display form
    @GetMapping("/forgotPassword")
    public String showForgotPasswordForm() {
        return "forgotPassword"; // Renders /WEB-INF/jsp/forgotPassword.jsp
    }
    
    // Forgot Password: POST mapping to process reset
    @PostMapping("/forgotPassword")
    public String processForgotPassword(@RequestParam String email,
                                        @RequestParam String newPassword,
                                        @RequestParam String confirmPassword,
                                        Model model) {
        if (!newPassword.equals(confirmPassword)) {
            model.addAttribute("error", "Passwords do not match.");
            return "forgotPassword";
        }
        User user = userService.getUserByEmail(email);
        if (user == null) {
            model.addAttribute("error", "Email not found.");
            return "forgotPassword";
        }
        user.setPassword(newPassword);
        userService.saveUser(user);
        model.addAttribute("message", "Password reset successfully. Please login with your new password.");
        return "login";
    }
    @GetMapping("/remarks")
    public String showRemarks(HttpSession session, Model model) {
        User user = (User) session.getAttribute("user");
        if(user == null) {
            return "redirect:/login";
        }
        model.addAttribute("remarks", remarkService.getRemarksByUserId(user.getUserId()));
        return "remarks"; // Renders /WEB-INF/jsp/remarks.jsp
    }

    // New: Show form to add a new remark
    @GetMapping("/addRemark")
    public String showAddRemarkForm(HttpSession session, Model model) {
        User user = (User) session.getAttribute("user");
        if(user == null) {
            return "redirect:/login";
        }
        return "addRemark"; // Renders /WEB-INF/jsp/addRemark.jsp
    }

    // New: Process new remark submission
    @PostMapping("/addRemark")
    public String addRemark(@RequestParam String userRemark, HttpSession session) {
        User user = (User) session.getAttribute("user");
        if(user == null) {
            return "redirect:/login";
        }
        Remark remark = new Remark();
        remark.setUser(user);
        remark.setUserRemark(userRemark);
        remarkService.saveRemark(remark);
        return "redirect:/user/remarks";
    }
}
