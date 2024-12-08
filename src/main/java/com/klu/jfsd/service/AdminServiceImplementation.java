package com.klu.jfsd.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.klu.jfsd.model.Admin;
import com.klu.jfsd.model.Farmer;
import com.klu.jfsd.model.Feedback;
import com.klu.jfsd.model.Product;
import com.klu.jfsd.model.User;
import com.klu.jfsd.repository.AdminRepository;
import com.klu.jfsd.repository.FarmerRepository;
import com.klu.jfsd.repository.FeedbackRepository;
import com.klu.jfsd.repository.ProductRepository;
import com.klu.jfsd.repository.UserRepository;

@Service
public class AdminServiceImplementation implements AdminService {

    @Autowired
    private AdminRepository adminRepository;

    @Autowired
    private FarmerRepository farmerRepository;

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private ProductRepository productRepository;

    @Autowired 
    private FeedbackRepository feedbackRepository;
    
    @Override
    public int getCount() {
        return feedbackRepository.countAll();
    }
    
    @Override
    public List<Farmer> viewAllFarmers() {
        return farmerRepository.findAll();
    }

    @Override
    public List<Product> viewAllProducts() {
        return productRepository.findAll();
    }

    @Override
    public List<User> viewAllUsers() {
        return userRepository.findAll();
    }

    @Override
    public Admin checkAdminLogin(String username, String password) {
        return adminRepository.checkAdminLogin(username, password);
    }
   
    @Override
    public Admin getAdminByEmail(String email) {
        return adminRepository.findByUsername(email);
    }

    @Override
    public String updateAdminProfile(String email, String currentPassword, String newPassword) {
        Admin admin = adminRepository.findByUsername(email);
        if (admin != null && admin.getPassword().equals(currentPassword)) {
            admin.setPassword(newPassword);
            adminRepository.save(admin);
            return "Profile updated successfully!";
        }
        return "Current password is incorrect!";
    }

    

    @Override
    public String addFarmer(Farmer farmer) {
        try {
            farmerRepository.save(farmer);
            return "Farmer added successfully!";
        } catch (Exception e) {
            e.printStackTrace();
            return "Something went wrong while adding farmer. Please try again.";
        }
    }

    @Override
    public String addUser(User user) {
        try {
            userRepository.save(user);
            return "User added successfully!";
        } catch (Exception e) {
            e.printStackTrace();
            return "Something went wrong while adding user. Please try again.";
        }
    }

    @Override
    public String addProduct(Product product) {
        try {
            productRepository.save(product);
            return "Product added successfully!";
        } catch (Exception e) {
            e.printStackTrace();
            return "Something went wrong while adding product. Please try again.";
        }
    }

    public String collectfeedback(Feedback feedback) {
        try {
            feedbackRepository.save(feedback); // Save the feedback object
            return "Feedback submitted successfully!";
        } catch (Exception e) {
            e.printStackTrace();
            return "Failed to submit feedback!";
        }
    }

	@Override
	public String takeFeedback(Feedback feedback) {
		try {
		feedbackRepository.save(feedback);
		return "feedback posted sucessfully wait for reply! Thank(ing)you ,ADMIN";
		}
		catch(Exception e) {
			e.printStackTrace();
			return "Something went wrong during Submission , try again";
		}
	}


  
	}
     
     

