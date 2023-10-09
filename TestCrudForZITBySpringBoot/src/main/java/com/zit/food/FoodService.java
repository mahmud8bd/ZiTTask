package com.zit.food;

import org.springframework.http.ResponseEntity;

public interface FoodService {
	ResponseEntity<?> getAllFood();

	ResponseEntity<?> saveFood(Food food);

	ResponseEntity<?> getFoodById(int foodId);

	ResponseEntity<?> deleteFoodById(int foodId);

	ResponseEntity<?> updateFood(int foodId, Food food);

}
