import 'dart:convert';

List<Food> foodFromJson(String str) => List<Food>.from(json.decode(str).map((x) => Food.fromJson(x)));

String foodToJson(List<Food> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Food {
  int foodId;
  String foodName;
  String foodDescription;
  int foodQuantity;
  double foodPrice;

  Food({
    required this.foodId,
    required this.foodName,
    required this.foodDescription,
    required this.foodQuantity,
    required this.foodPrice,
  });

  factory Food.fromJson(Map<String, dynamic> json) => Food(
    foodId: json["foodId"],
    foodName: json["foodName"],
    foodDescription: json["foodDescription"],
    foodQuantity: json["foodQuantity"],
    foodPrice: json["foodPrice"]?.toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "foodId": foodId,
    "foodName": foodName,
    "foodDescription": foodDescription,
    "foodQuantity": foodQuantity,
    "foodPrice": foodPrice,
  };
}
