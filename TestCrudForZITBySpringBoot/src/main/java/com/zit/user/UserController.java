package com.zit.user;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import jakarta.validation.Valid;

@RestController
@CrossOrigin(origins = "*")
public class UserController {
	@Autowired
	private UserServiceImp userServiceImp;
	
	@PostMapping("/userRegistration")
	public ResponseEntity<?> userRegistration(@Valid @RequestBody User user){
		return userServiceImp.userRegistration(user);
	}
	
	@PostMapping("/userLogin")
	public ResponseEntity<?> userLogin(@RequestBody User user){
		return userServiceImp.userLogin(user);
	}
	
	
	
}
