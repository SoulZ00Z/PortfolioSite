/* Login Controller for Spring Boot */
package com.portfolio;

import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

/**
 * Spring Boot Controller for Login
 * 
 * Converts LoginServlet to Spring Boot Controller.
 * Uses @Controller to redirect to JSP pages. (View)
 */
@Controller
public class LoginController {

    // Spring injects GuestDAO dependency.
    @Autowired
    private GuestDAO guestDAO;

    /**
     * GET requests - Redirect to login.jsp.
     * Ex. : doGet() in LoginServlet.
     */
    @GetMapping("/LoginServlet")
    public String sendToLogin() {
        return "redirect:login.jsp";
    }

    /**
     * POST requests - Process login form.
     * Ex. : doPost() in LoginServlet.
     * 
     * @RequestParam gets form parameters.
     * Model is like request.setAttribute().
     * HttpSession is like session in Servlet.
     */
    @PostMapping("/LoginServlet")
    public String verifyLogin(
            @RequestParam("GuestID") String guestID,
            @RequestParam("PW") String pwString,
            HttpSession session,
            Model model) {
        
        // Verify input fields.
        if (guestID == null || guestID.trim().isEmpty() || 
            pwString == null || pwString.trim().isEmpty()) {
            model.addAttribute("errorMessage", "Please fill in every field.");
            return "login"; // Returns login.jsp (Spring sets .jsp)
        }
        
        try {
            // Verify guest info.
            GuestBO guest = guestDAO.verifyGuest(guestID.trim(), pwString.trim());
            
            if (guest != null) {
                // Login success! - Set session info.
                session.setAttribute("guest", guest);
                session.setAttribute("isLoggedIn", true);
                session.setAttribute("userType", "guest");
                return "redirect:guest.jsp";
            } else {
                // Login fail!
                model.addAttribute("errorMessage", "Incorrect Guest ID or PW!");
                return "login";
            }
            
        } catch (Exception e) {
            System.err.println("Login Failed!: " + e.getMessage());
            e.printStackTrace();
            model.addAttribute("errorMessage", "Login Failed!: " + e.getMessage());
            return "login";
        }
    }
}

