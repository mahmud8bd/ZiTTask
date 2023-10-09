package com.zit.user;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;

@Service
public class UserServiceImp implements UserService {

	@Autowired
	private UserRepository userRepository;

	// Register a new user.
	@Override
	public ResponseEntity<?> userRegistration(User user) {
		User savedUser = userRepository.save(user);
		if (savedUser != null) {
			return new ResponseEntity<>(savedUser, HttpStatus.CREATED);
		} else {
			return new ResponseEntity<>("Registration Fail Try again later....", HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}

	// Log in a user.
	@Override
	public ResponseEntity<?> userLogin(User user) {
		User foundUser = userRepository.findByUserEmail(user.getUserEmail());
		if (foundUser != null && foundUser.getUserPassword().equals(user.getUserPassword())) {
			// User exists and provided the correct password from database and show userName
			return new ResponseEntity<>("Login successful || Welcome " + foundUser.getUserName(), HttpStatus.OK);
		} else {
			// User not found or incorrect email and password
			return new ResponseEntity<>("Login failed || Your Email and password incorrect...",
					HttpStatus.UNAUTHORIZED);
		}
	}

	@Override
	public ResponseEntity<?> getUserById(int id) {
		return null;
	}

	@Override
	public ResponseEntity<?> getUserByEmail(String userEmail) {
		// TODO Auto-generated method stub
		return null;
	}

}
