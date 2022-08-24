package com;

//import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
//import org.springframework.boot.context.event.ApplicationReadyEvent;
import org.springframework.cloud.netflix.eureka.EnableEurekaClient;
//import org.springframework.context.event.EventListener;

@SpringBootApplication
@EnableEurekaClient
public class SpringEmailApplication {

//	@Autowired
//	private EmailSenderService sendService;
	
	public static void main(String[] args) {
		SpringApplication.run(SpringEmailApplication.class, args);
	}

//	@EventListener(ApplicationReadyEvent.class)
//	public void sendEMail() {
//		sendService.sendEmail("krishvedantam25@gmail.com", "This is subject", "This is Body");
//	}
}
