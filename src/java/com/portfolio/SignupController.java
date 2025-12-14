/* Signup Controller for Spring Boot */
package com.portfolio;

import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

/**
 * Spring Boot Controller for Signup.
 * 
 * Converts SignupServlet to Spring Boot Controller.
 * Uses @Controller to redirect to JSP pages. (View)
 */
@Controller
public class SignupController {

    // Spring injects GuestDAO dependency.
    @Autowired
    private GuestDAO guestDAO;

    /**
     * GET requests - Redirect to signup.jsp.
     * Ex. : doGet() in SignupServlet.
     */
    @GetMapping("/SignupServlet")
    public String sendToSignup() {
        return "redirect:signup.jsp";
    }

    @PostMapping("/SignupServlet")
    public String verifySignup(
            @RequestParam("GuestID") String guestID,
            @RequestParam("PW") String pwString,
            @RequestParam("confirmPW") String confirmPwString,
            @RequestParam(value = "PhoneNumber", required = false) String phoneNumber,
            HttpSession session,
            Model model) {
        
        // Verify input fields.
        if (guestID == null || guestID.trim().isEmpty() || 
            pwString == null || pwString.trim().isEmpty()) {
            model.addAttribute("errorMessage", "Guest ID & PW required.");
            return "signup";
        }
        
        // Verify PWs equal.
        if (confirmPwString == null || !pwString.equals(confirmPwString)) {
            model.addAttribute("errorMessage", "PWs different!");
            return "signup";
        }
        
        try {
            // Check if guest ID exists
            if (guestDAO.guestIDExists(guestID.trim())) {
                model.addAttribute("errorMessage", "Guest ID exists!");
                return "signup";
            }
            
            // Insert guest info. (ID, PW, PhoneNumber)
            String phoneNum = (phoneNumber != null && !phoneNumber.trim().isEmpty()) 
                ? phoneNumber.trim() : null;
            guestDAO.insertGuest(guestID.trim(), pwString, phoneNum);
            
            // Set success msg then redirect to login.jsp.
            session.setAttribute("successMessage", "Success! Time to login.");
            return "redirect:login.jsp";
            
        } catch (Exception e) {
            System.err.println("Signup error: " + e.getMessage());
            e.printStackTrace();
            model.addAttribute("errorMessage", "Signup Failed!: " + e.getMessage());
            return "signup";
        }
    }
}

