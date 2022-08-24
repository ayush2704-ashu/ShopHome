package com;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("email")
@CrossOrigin
public class Controller {

	@Autowired
	EmailSenderService service;
	
	@PostMapping("/data")
	public String sendEmail(@RequestBody Email email) {
		service.sendEmail(email.getEmail(),email.getSubject(), email.getBody());
//		service.sendEmail("krishvedantam25@gmail.com", "This is subject", "This is Body");
		return "Sent email Successfully";
	}
}
