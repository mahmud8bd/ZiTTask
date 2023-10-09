package com.zit.food;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.validation.constraints.Min;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.Size;

/**
 * 
 * Food Entity class.
 *
 */
@Entity
public class Food {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int foodId;

	@NotBlank(message = "Food name is required.")
	@Size(min = 3, message = "Food Name at least three chrecters.")
	@Column(unique = true)
	private String foodName;

	@NotBlank(message = "Food Description is required.")
	private String foodDescription;

	@Min(1)
	private int foodQuantity;
	private double foodPrice;

	// NoArgument constructor
	public Food() {
		super();
	}

	// AllArgument constructor
	public Food(int foodId, String foodName, String foodDescription, int foodQuantity, double foodPrice) {
		super();
		this.foodId = foodId;
		this.foodName = foodName;
		this.foodDescription = foodDescription;
		this.foodQuantity = foodQuantity;
		this.foodPrice = foodPrice;
	}

	// Setters and Getters
	public int getFoodId() {
		return foodId;
	}

	public void setFoodId(int foodId) {
		this.foodId = foodId;
	}

	public String getFoodName() {
		return foodName;
	}

	public void setFoodName(String foodName) {
		this.foodName = foodName;
	}

	public String getFoodDescription() {
		return foodDescription;
	}

	public void setFoodDescription(String foodDescription) {
		this.foodDescription = foodDescription;
	}

	public int getFoodQuantity() {
		return foodQuantity;
	}

	public void setFoodQuantity(int foodQuantity) {
		this.foodQuantity = foodQuantity;
	}

	public double getFoodPrice() {
		return foodPrice;
	}

	public void setFoodPrice(double foodPrice) {
		this.foodPrice = foodPrice;
	}

}
