package com.klu.jfsd.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.klu.jfsd.model.Feedback;
import com.klu.jfsd.repository.FeedbackRepository;

@Service
public class FeedbackService {
	
	@Autowired
	private FeedbackRepository feedbackRepository;
	
	

    

    public void saveFeedback(Feedback feedback) {
        feedbackRepository.save(feedback);
    }

}
