package com.zit.food;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;

@Service
public class FoodServiceImp implements FoodService {
	@Autowired
	private FoodRepository foodRepository; // food repository interface

	// Retrieve a list of all food items.
	@Override
	public ResponseEntity<?> getAllFood() {
		List<Food> foodList = foodRepository.findAll();
		if (!foodList.isEmpty()) {
			return new ResponseEntity<>(foodList, HttpStatus.OK);
		}
		return new ResponseEntity<>("Food not Found", HttpStatus.BAD_REQUEST);
	}

	// Save a new food item to the repository.
	@Override
	public ResponseEntity<?> saveFood(Food food) {
		Food savedFood = foodRepository.save(food);
		if (savedFood != null) {
			return new ResponseEntity<>(savedFood, HttpStatus.CREATED);
		} else {
			return new ResponseEntity<>("Failed to save food", HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}

	// Retrieve a food item by its unique identifier (ID).
	@Override
	public ResponseEntity<?> getFoodById(int foodId) {
		Optional<Food> foodOptional = foodRepository.findById(foodId);

		if (foodOptional.isPresent()) {
			Food food = foodOptional.get();
			return new ResponseEntity<>(food, HttpStatus.OK);
		} else {
			return new ResponseEntity<>("Food not found for ID: " + foodId, HttpStatus.NOT_FOUND);
		}
	}

	// Delete a food item by its unique identifier (ID).
	@Override
	public ResponseEntity<?> deleteFoodById(int foodId) {
		Optional<Food> foodOptional = foodRepository.findById(foodId);
		if (foodOptional.isPresent()) {
			foodRepository.deleteById(foodId);
			return new ResponseEntity<>("Food with ID " + foodId + " has been deleted", HttpStatus.OK);
		} else {
			return new ResponseEntity<>("Food not found for ID: " + foodId, HttpStatus.NOT_FOUND);
		}
	}

	// Update an existing food item by its unique identifier (ID).
	@Override
	public ResponseEntity<?> updateFood(int foodId, Food food) {
		Optional<Food> foodOptional = foodRepository.findById(foodId);
		if (foodOptional.isPresent()) {
			Food savedFood = foodRepository.save(food);
			return new ResponseEntity<>(savedFood, HttpStatus.CREATED);
		} else {
			return new ResponseEntity<>("Food not found for ID: " + foodId, HttpStatus.NOT_FOUND);
		}
	}

}
