package com.zit.user;

import org.springframework.http.ResponseEntity;

public interface UserService {
	ResponseEntity<?> userRegistration(User user);

	ResponseEntity<?> userLogin(User user);

	ResponseEntity<?> getUserById(int id);
	
	ResponseEntity<?> getUserByEmail(String userEmail);

}
