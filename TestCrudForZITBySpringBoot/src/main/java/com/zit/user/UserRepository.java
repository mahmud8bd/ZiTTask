package com.zit.user;

import org.springframework.data.jpa.repository.JpaRepository;
/**
 * 
 *  This interface extends JpaRepository, which provides basic CRUD 
 *  (Create, Read, Update, Delete) operations for the User entity. 
 * */
public interface UserRepository extends JpaRepository<User, Integer> {
	//Custom query method to find a user by their email address.
	User findByUserEmail(String userEmail);
}
