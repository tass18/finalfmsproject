package com.klu.jfsd.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.klu.jfsd.model.Admin;
import com.klu.jfsd.model.Farmer;
import com.klu.jfsd.model.Feedback;
import com.klu.jfsd.model.Product;
import com.klu.jfsd.model.User;
import com.klu.jfsd.service.AdminService;
import com.klu.jfsd.service.FarmerService;
import com.klu.jfsd.service.FeedbackService;
import com.klu.jfsd.service.ProductService;
import com.klu.jfsd.service.UserService;

import jakarta.mail.internet.MimeMessage;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class AdminController {

	@Autowired
	AdminService adminService;

    @Autowired
    private FarmerService farmerService;	
    
    @Autowired
    private UserService userService;
    
    @Autowired
    private ProductService productService;
    
   @Autowired
   private FeedbackService feedbackService;
    
    
    @Autowired
    private JavaMailSender mailSender;
	
   
	//regular home page before any logins
	@GetMapping("/home")
	public ModelAndView homePage() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("home");
		return mv;
	}
	@GetMapping("/")
	public ModelAndView nullpage() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("redirect:/home");
		return mv;
	}
	//..............................................................................>
    @GetMapping("aboutus")
	public ModelAndView aboutUs() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("homeaboutus");
		return mv;
	}
    @GetMapping("feedbackus")
   	public ModelAndView feedbackUs() {
   		ModelAndView mv = new ModelAndView();
   		mv.setViewName("homefeedbackus");
   		return mv;
   	}
    @PostMapping("/submitContact")
    public String submitContact(@RequestParam("name") String name,
                                @RequestParam("userType") String userType,
                                @RequestParam("email") String email,
                                @RequestParam("subject") String subject,
                                @RequestParam("message") String message,
                                Model model) {
        // Create a Feedback object
        Feedback feedback = new Feedback();
        feedback.setName(name);
        feedback.setAccessor(userType);
        feedback.setEmail(email);
        feedback.setSubject(subject);
        feedback.setMessage(message);

        // Save feedback in the database
        feedbackService.saveFeedback(feedback);

        // Add a success message for the user
        model.addAttribute("message", "Feedback submitted successfully!");

        return "contactus";  // Return to the Contact Us page or another view
    }

    
    @GetMapping("services")
   	public ModelAndView services() {
   		ModelAndView mv = new ModelAndView();
   		mv.setViewName("homeservices");
   		return mv;
   	}
    
    @GetMapping("help")
   	public ModelAndView help() {
   		ModelAndView mv = new ModelAndView();
   		mv.setViewName("home247");
   		return mv;
   	}
    
    //......................................................................................................>
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	//admin login.........................................................>
	@GetMapping("/adminlogin")
	public ModelAndView  adminLogin() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("adminlogin");
		return mv;
	}
	@PostMapping("checkadminlogin")
	public ModelAndView checkAdminLogin(HttpServletRequest request ,  HttpSession session) {
		String name = request.getParameter("admin-username");
		String Password  = request.getParameter("admin-password");
		
		Admin admin = adminService.checkAdminLogin(name, Password);
		
		ModelAndView mv = new ModelAndView();
		
		if(admin != null) {
			session.setAttribute("loggedAdmin", admin);
			mv.setViewName("redirect:/adminhome");
		}
		else {
			mv.setViewName("adminlogin");
			mv.addObject("message", "login failed! Please try again");
		}
		return mv;
	}
	
	//next to login goto admin home
	
	@GetMapping("adminhome")
	public ModelAndView adminhome() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("adminhome");
		return mv;
	}
	
	@GetMapping("/admin/dashboard")
	public ModelAndView showAdminDashboard() {
	    ModelAndView modelAndView = new ModelAndView("adminviewanalytics");

	    // Fetch data from the database
	    int farmersCount = farmerService.getCount();
	    int usersCount = userService.getCount();
	    int productsCount = productService.getCount();
	    int feedbackCount = adminService.getCount();
	    double income = 0 ; // Assuming income is derived from orders

	    // Add data to the model
	    modelAndView.addObject("farmersCount", farmersCount);
	    modelAndView.addObject("usersCount", usersCount);
	    modelAndView.addObject("productsCount", productsCount);
	    modelAndView.addObject("feedbackCount", feedbackCount);
	    modelAndView.addObject("income", income);

	    return modelAndView;
	}

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	//performing c-r-u-d operations
	//add
	//functions
	@GetMapping("addfarmer")
	public ModelAndView addFarmer() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("addfarmer");
		return mv;
	}
	@PostMapping("adminaddfarmer")
	public ModelAndView adminAddFarmer(HttpServletRequest request) {
	    ModelAndView mv = new ModelAndView();
	    
	    // Retrieve form parameters
	    String name = request.getParameter("name");
	    String phone = request.getParameter("phone");
	    String username = request.getParameter("username");
	    String address = request.getParameter("address");
	    String state = request.getParameter("state");
	    String password = request.getParameter("password");
	    String image = request.getParameter("image");
	    // Create a Farmer object
	    Farmer farmer = new Farmer();
	    farmer.setName(name);
	    farmer.setPhone(phone);
	    farmer.setUsername(username);
	    farmer.setAddress(address);
	    farmer.setState(state);
	    farmer.setPassword(password);
	    farmer.setImage(image);
	    // Call the adminService to add the farmer
	    String message = adminService.addFarmer(farmer);
	    
	    // Set view name and add attributes
	    mv.setViewName("addfarmer"); // Adjust the view name to your farmer-specific page
	    mv.addObject("message", message);
	    
	    return mv;
	}

	
	
	
	
	
	
	
	
	
	
	@GetMapping("adduser")
	public ModelAndView addUser() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("adduser");
		return mv;
	}
	
	@PostMapping("adminaddUser")
	public ModelAndView adminAddUser(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView();
		String name = request.getParameter("name");
        String phone = request.getParameter("phone");
        String username = request.getParameter("username");
        String address = request.getParameter("address");
        String state = request.getParameter("state");
        String password = request.getParameter("password");
        String image = request.getParameter("image");
        User user = new User();
        user.setName(name);
        user.setPhone(phone);
        user.setUsername(username);
        user.setAddress(address);
        user.setState(state);
        user.setPassword(password);
       
		user.setImageUrl(image);
		
        String Message = adminService.addUser(user);
        mv.setViewName("adduser");
        
        mv.addObject("message",Message);
        return mv;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	@GetMapping("addproduct")
	public ModelAndView addProduct() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("addproduct");
		return mv;
	}
	
    @PostMapping("adminaddproduct")
    public ModelAndView addProduct(HttpServletRequest request) {
        ModelAndView mv = new ModelAndView();

        // Retrieve the form fields from the HttpServletRequest
        String name = request.getParameter("name");
        String type = request.getParameter("type");
        String price = request.getParameter("price");
        String location = request.getParameter("location");
        String contact = request.getParameter("contact");
        String specification = request.getParameter("specification");
        String date = request.getParameter("date");
        // Convert price from String to double (since it's a number)
        //List image = request.getParameter("image");

        // Create a new Product object and set the values from the form
        Product product = new Product();
        product.setName(name);
        product.setType(type);
        product.setPrice(price);
        product.setLocation(location);
        product.setContact(contact);
        product.setSpecification(specification);
        product.setDate(date);
        product.setState("AndhraPradesh");
        //product.setImages(image);
        // Call the service to add the product (this method should be defined in your service class)
        String message = adminService.addProduct(product);

        // Add the message to the ModelAndView object to pass it to the view
        mv.setViewName("addproduct");  // You can change this to your desired JSP or view name
        mv.addObject("message", message);

        return mv;
    }

	

    @GetMapping("/adminassistrequest")
    public ModelAndView showProductsForAdmin() {
        List<Product> products = productService.getProductsByRequest(0); // Get products with request = 0
        ModelAndView modelAndView = new ModelAndView("adminassistrequest"); // Your JSP page
        modelAndView.addObject("products", products); // Add the list of products to the model
        return modelAndView;
    }

    // Method to handle product update
    @PostMapping("/updateProduct")
    public String updateProduct(@RequestParam("id") int id,
                                @RequestParam("name") String name,
                                @RequestParam("specification") String specification,
                                @RequestParam("type") String type,
                                @RequestParam("price") String price,
                                @RequestParam("quantity") String quantity,
                                @RequestParam("location") String location,
                                @RequestParam("state") String state,
                                @RequestParam("image") String image,
                                @RequestParam("description") String description) {
        // Fetch the product by ID from the database
        Product product = productService.getProductById(id);
        
        // Update the product's attributes
        product.setName(name);
        product.setSpecification(specification);
        product.setType(type);
        product.setPrice(price);
        product.setQuantity(quantity);
        product.setLocation(location);
        product.setState(state);
        product.setImage(image);
        product.setDescription(description);
        product.setRequest(1);
        // Save the updated product
        productService.updateProduct(product);

        return "redirect:/adminassistrequest"; // Redirect to the page where the updated product list is displayed
    }
	
	
	@GetMapping("adminviewallfarmers")
    public ModelAndView userViewAllFarmers() {
    	ModelAndView modelAndView = new ModelAndView("adminviewallfarmers");
        List<Farmer> farmers = adminService.viewAllFarmers();
        if (farmers == null || farmers.isEmpty()) {
            System.out.println("No farmers found!"); // Debugging
        }
        modelAndView.addObject("farmerslist", farmers);
        return modelAndView;
    }
	
	@GetMapping("/admindeletefarmers")
    public ModelAndView viewFarmers() {
        List<Farmer> farmers = adminService.viewAllFarmers();
        ModelAndView mav = new ModelAndView("admindeletefarmer");
        mav.addObject("farmerslist", farmers);
        return mav;
    }
	
	//@EventListener(ApplicationReadyEvent.class)
	@PostMapping("/deleteFarmer")
    public ModelAndView deleteFarmer(@RequestParam("id") int id, @RequestParam("reason") String reason) throws Exception {
        Farmer farmer = farmerService.getFarmerById(id);
        MimeMessage mimeMessage = mailSender.createMimeMessage();
        MimeMessageHelper helper = new MimeMessageHelper(mimeMessage, true);
         String email = farmer.getEmail();
        
        int otp = (int)(Math.random() * 99999); // random number generation 
        helper.setTo(email);
        helper.setSubject("Regarding the removal of account");
        helper.setFrom("deepak.yaramala@gmail.com");
        
        helper.setText(reason, true);
        mailSender.send(mimeMessage);
        farmerService.deleteFarmer( id, reason);
        
        ModelAndView mv = new ModelAndView("admindeletefarmer");
        mv.addObject("message", "Email Sent Successfully");
        return mv;
        
    }
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	@GetMapping("adminviewallusers")
	public ModelAndView adminViewAllUsers() {
	    ModelAndView modelAndView = new ModelAndView("adminviewallusers");
	    List<User> users = adminService.viewAllUsers();
	    if (users == null || users.isEmpty()) {
	        System.out.println("No users found!"); // Debugging
	    }
	    modelAndView.addObject("userslist", users);
	    return modelAndView;
	}

	
	
	 @GetMapping("admindeleteusers")
	    public ModelAndView viewUsers() {
	        List<User> users = adminService.viewAllUsers();
	        ModelAndView mav = new ModelAndView("admindeleteusers");
	        mav.addObject("userslist", users);
	        return mav;
	    }
	
	 @PostMapping("/deleteUser")
	    public ModelAndView deleteUser(@RequestParam("id") int id, @RequestParam("reason") String reason) {
	        User user = userService.getUserById(id);
	        if (user != null) {
	            userService.deleteUser(id, reason);
	        }
	        return new ModelAndView("redirect:/admindeleteusers");
	    }
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	@GetMapping("adminviewallproducts")
	public ModelAndView adminViewAllProducts() {
	    ModelAndView modelAndView = new ModelAndView("adminviewallproducts");
	    List<Product> products = adminService.viewAllProducts();
	    if (products == null || products.isEmpty()) {
	        System.out.println("No users found!"); // Debugging
	    }
	    modelAndView.addObject("productslist", products);
	    return modelAndView;
	}



	public ModelAndView viewUnapprovedFarmers2() {
        List<Farmer> unapprovedFarmers = farmerService.getUnapprovedFarmers();

        // Debugging output
        System.out.println("Unapproved Farmers Count: " + unapprovedFarmers.size());
        for (Farmer farmer : unapprovedFarmers) {
            System.out.println("Farmer ID: " + farmer.getId());
            System.out.println("Farmer Name: " + farmer.getName());
            System.out.println("Farmer Approved: " + farmer.isApproved());
        }

        ModelAndView modelAndView = new ModelAndView("adminapprovefarmer");
        modelAndView.addObject("farmers", unapprovedFarmers);
        return modelAndView;
    }



	 @GetMapping("/adminapprovefarmers")
	    public ModelAndView viewUnapprovedFarmers() {
	        List<Farmer> unapprovedFarmers = farmerService.getUnapprovedFarmers();
	        ModelAndView modelAndView = new ModelAndView("adminapprovefarmer");
	        modelAndView.addObject("farmers", unapprovedFarmers);
	        System.out.println("Farmers sent to JSP: " + unapprovedFarmers);
	        return modelAndView;
	        
	    }

	 @PostMapping("/approvefarmer")
	    public ModelAndView approveFarmer(@RequestParam("farmerId") int farmerId) {
	        farmerService.approveFarmer(farmerId);
	        return new ModelAndView("redirect:/adminapprovefarmers");
	    }

	    // Reject a farmer
	    @PostMapping("/rejectfarmer")
	    public ModelAndView rejectFarmer(@RequestParam("farmerId") int farmerId) {
	        farmerService.deleteFarmer(farmerId);
	        return new ModelAndView("redirect:/adminapprovefarmers");
	    }
    
    
	    

	    @GetMapping("/adminapproveusers")
	    public ModelAndView showPendingUsers() {
	        List<User> pendingUsers = userService.getAllPendingUsers();
	        ModelAndView modelAndView = new ModelAndView("adminapproveuser");
	        modelAndView.addObject("users", pendingUsers);
	        return modelAndView;
	    }

	    @PostMapping("/approveuser")
	    public String approveUser(@RequestParam("userId") int userId) {
	        userService.approveUser(userId);
	        return "redirect:/adminapproveusers";
	    }

	    @PostMapping("/rejectuser")
	    public String rejectUser(@RequestParam("userId") int userId) {
	        userService.rejectUser(userId);
	        return "redirect:/adminapproveusers";
	    }
	    
	    
	    
	    
	    
	    
	    
	    
	    
	    
	    
	    
	    @GetMapping("/adminupdateprofile")
	    public ModelAndView adminProfile(HttpSession session) {
	        Admin admin = (Admin) session.getAttribute("loggedAdmin");

	        ModelAndView mv = new ModelAndView();
	        if (admin == null) {
	            mv.setViewName("adminlogin");
	            mv.addObject("message", "Session expired. Please log in again.");
	        } else {
	            mv.setViewName("adminupdateprofile");
	            mv.addObject("admin", admin);
	        }
	        return mv;
	    }

	    @PostMapping("/updateAdminProfile")
	    public ModelAndView updateAdminProfile(HttpSession session, String email, String newPassword, String currentPassword) {
	        Admin admin = (Admin) session.getAttribute("loggedAdmin");

	        ModelAndView mv = new ModelAndView();
	        if (admin == null) {
	            mv.setViewName("adminlogin");
	            mv.addObject("message", "Session expired. Please log in again.");
	            return mv;
	        }

	        String message = adminService.updateAdminProfile(email, currentPassword, newPassword);

	        mv.setViewName("adminupdateprofile");
	        mv.addObject("admin", adminService.getAdminByEmail(email));
	        mv.addObject("message", message);
	        mv.addObject("status", message.contains("successfully") ? "success" : "error");

	        return mv;
	    }
	    
	    
	    
	    
	    
	    
	    
	    
	    
	    
	    
	    
	    
	    @GetMapping("/adminlogout")
	    public String adminLogout(HttpSession session) {
	        session.invalidate(); // Invalidate session
	        return "redirect:/adminlogin";
	    }
}

