package com.example.demo.controller;

import com.example.demo.model.DeliveryAgent;
import com.example.demo.service.DeliveryAgentService;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("/delivery")
public class DeliveryController {

    @Autowired
    private DeliveryAgentService deliveryAgentService;
    
    // Delivery Portal: Offers options to register or log in
    @GetMapping("/portal")
    public String deliveryPortal() {
        return "deliveryPortal"; // JSP: /WEB-INF/jsp/deliveryPortal.jsp
    }
    
    // Registration form for delivery agent
    @GetMapping("/register")
    public String showRegisterForm() {
        return "deliveryRegister"; // JSP: /WEB-INF/jsp/deliveryRegister.jsp
    }
    
    // Process registration for delivery agent
    @PostMapping("/register")
    public String registerDeliveryAgent(@ModelAttribute DeliveryAgent agent, Model model) {
        DeliveryAgent savedAgent = deliveryAgentService.saveDeliveryAgent(agent);
        model.addAttribute("savedAgent", savedAgent);
        return "deliveryRegisterSuccess"; // JSP: /WEB-INF/jsp/deliveryRegisterSuccess.jsp
    }
    
    // Login form for delivery agent
    @GetMapping("/login")
    public String showLoginForm() {
        return "deliveryLogin"; // JSP: /WEB-INF/jsp/deliveryLogin.jsp
    }
    
    // Process login for delivery agent
    @PostMapping("/login")
    public String loginDeliveryAgent(@RequestParam String email,
                                     @RequestParam String password,
                                     HttpSession session,
                                     Model model) {
        DeliveryAgent agent = deliveryAgentService.getDeliveryAgentByEmail(email);
        if (agent != null && agent.getPassword().equals(password)) {
            session.setAttribute("deliveryAgent", agent);
            return "redirect:/delivery/dashboard";
        } else {
            model.addAttribute("error", "Invalid email or password");
            return "deliveryLogin";
        }
    }
    
    // (Other endpoints like dashboard, profile, logout would be here)
    
    @GetMapping("/dashboard")
    public String dashboard(HttpSession session) {
        DeliveryAgent agent = (DeliveryAgent) session.getAttribute("deliveryAgent");
        if (agent == null) {
            return "redirect:/delivery/login";
        }
        return "deliveryDashboard";
    }
    
    @GetMapping("/profile")
    public String deliveryProfile(HttpSession session, Model model) {
        DeliveryAgent agent = (DeliveryAgent) session.getAttribute("deliveryAgent");
        if (agent == null) {
            return "redirect:/delivery/login";
        }
        model.addAttribute("agent", agent);
        return "deliveryProfile";
    }
    
    @GetMapping("/logout")
    public String logout(HttpSession session) {
        session.invalidate();
        return "redirect:/delivery/portal";
    }
}


