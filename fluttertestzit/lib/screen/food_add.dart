import 'package:flutter/material.dart';
import 'package:fluttertestzit/component/constants.dart';
import 'package:fluttertestzit/model/food.dart';
import 'package:fluttertestzit/screen/food_view.dart';
import 'package:fluttertestzit/service/api_service.dart';

class FoodAdd extends StatefulWidget {
  final Food? foodToEdit;

  const FoodAdd({super.key, this.foodToEdit});

  @override
  State<FoodAdd> createState() => _FoodAddState();
}

class _FoodAddState extends State<FoodAdd> {
  Food? food;
  ApiService _apiService = ApiService();
  bool isEditMode = false;
  TextEditingController foodId = TextEditingController(text: '1');
  TextEditingController foodName = TextEditingController();
  TextEditingController foodDescription = TextEditingController();
  TextEditingController foodQuantity = TextEditingController();
  TextEditingController foodPrice = TextEditingController();
  addFood() {
    try {
      food = Food(
        foodId: int.parse(foodId.text.toString()),
        foodName: foodName.text.toString(),
        foodDescription: foodDescription.text.toString(),
        foodQuantity: int.parse(foodQuantity.text.toString()),
        foodPrice: double.parse(foodPrice.text.toString()),
      );
      _apiService.addFood(food!);
    } catch (e) {
      // Handle the error, e.g., show an error message to the user
      print("Error parsing input: $e");
      // You may also show a message to the user, e.g., using a SnackBar
    }
  }

  @override
  void initState() {
    super.initState();
    _apiService = ApiService();
    if (widget.foodToEdit != null) {
      isEditMode = true;
      foodId =
          TextEditingController(text: widget.foodToEdit?.foodId.toString());
      foodName =
          TextEditingController(text: widget.foodToEdit?.foodName.toString());
      foodDescription = TextEditingController(
          text: widget.foodToEdit?.foodDescription.toString());
      foodQuantity = TextEditingController(
          text: widget.foodToEdit?.foodQuantity.toString());
      foodPrice =
          TextEditingController(text: widget.foodToEdit?.foodPrice.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    TextStyle? textStyle = Theme.of(context).textTheme.titleMedium;
    return Scaffold(
      appBar: AppBar(
        title: Text(isEditMode ? 'Update Food' : 'Add Food'),
        centerTitle: true,
        backgroundColor: sPrimaryColor,
      ),
      body: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Color(0xFFE0F7FA), Color(0xFFFFFDE7)])),
        child: Form(
          child: Padding(
            padding: const EdgeInsets.all(5 * 2),
            child: ListView(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 5, bottom: 5),
                  child: isEditMode
                      ? TextFormField(
                          style: textStyle,
                          controller: foodId,
                          readOnly: isEditMode,
                          validator: (String? value) {
                            if (value!.isEmpty) {
                              return 'please enter product id';
                            }
                          },
                          decoration: InputDecoration(
                            labelText: 'Food Id',
                            hintText: 'Enter food id',
                            labelStyle: textStyle,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: sPrimaryColor),
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey),
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                          ),
                        )
                      : Container(), // Hide the "Food ID" field when not in edit mode
                ),
                Padding(
                  padding: EdgeInsets.only(top: 5, bottom: 5),
                  child: TextFormField(
                    style: textStyle,
                    controller: foodName,
                    validator: (String? value) {
                      if (value!.isEmpty) {
                        return 'please enter food name';
                      }
                    },
                    decoration: InputDecoration(
                      labelText: 'Food Name',
                      hintText: 'Enter food name',
                      labelStyle: textStyle,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0)),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: sPrimaryColor),
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 5, bottom: 5),
                  child: TextFormField(
                    style: textStyle,
                    controller: foodDescription,
                    validator: (String? value) {
                      if (value!.isEmpty) {
                        return 'please enter food description';
                      }
                    },
                    decoration: InputDecoration(
                      labelText: 'Food Description',
                      hintText: 'Enter food description',
                      labelStyle: textStyle,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0)),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: sPrimaryColor),
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 5, bottom: 5),
                  child: TextFormField(
                    style: textStyle,
                    controller: foodQuantity,
                    validator: (String? value) {
                      if (value!.isEmpty) {
                        return 'please enter food quantity';
                      }
                    },
                    decoration: InputDecoration(
                      labelText: 'Food Quantity',
                      hintText: 'Enter food quantity',
                      labelStyle: textStyle,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0)),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: sPrimaryColor),
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 5, bottom: 5),
                  child: TextFormField(
                    style: textStyle,
                    controller: foodPrice,
                    validator: (String? value) {
                      if (value!.isEmpty) {
                        return 'please enter food price';
                      }
                    },
                    decoration: InputDecoration(
                      labelText: 'Food Price',
                      hintText: 'Enter food price',
                      labelStyle: textStyle,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0)),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: sPrimaryColor),
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      addFood();
                      Navigator.push(context, MaterialPageRoute(builder: (context) => FoodView(),));
                    });
                  },
                  child: Text(isEditMode ? 'Update' : 'Submit'),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                        sPrimaryColor), // Change the button color
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
