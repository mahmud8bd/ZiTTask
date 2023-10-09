package com.zit.food;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import jakarta.validation.Valid;

@RestController
@CrossOrigin(origins = "*")
public class FoodController {
	@Autowired
	private FoodServiceImp foodServiceImp;

	@GetMapping("/")
	public ResponseEntity<?> getAllFoods() {
		return foodServiceImp.getAllFood();
	}

	@PostMapping("/savefood")
	public ResponseEntity<?> saveFood(@Valid @RequestBody Food food) {
		return foodServiceImp.saveFood(food);
	}

	@GetMapping("/{id}")
	public ResponseEntity<?> getFoodById(@PathVariable("id") int foodId) {
		return foodServiceImp.getFoodById(foodId);
	}

	@DeleteMapping("/deletefood/{id}")
	public ResponseEntity<?> deleteById(@PathVariable("id") int foodId) {
		return foodServiceImp.deleteFoodById(foodId);

	}

	@PostMapping("/updatefood/{id}")
	public ResponseEntity<?> updateFood(@PathVariable("id") int foodId, @Valid @RequestBody Food food) {
		return foodServiceImp.updateFood(foodId, food);
	}

}
