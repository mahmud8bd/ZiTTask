import 'dart:convert';
import 'package:fluttertestzit/model/food.dart';
import 'package:fluttertestzit/model/user.dart';
import 'package:http/http.dart' as http;

class ApiService {
  final String _baseUrl = 'http://192.168.45.98:8080';

  Future<void> addFood(Food food) async {
    final url = '$_baseUrl/savefood';
    final uri = Uri.parse(url);
    final response = await http.post(uri,
        headers: {"content-type": "application/json"},
        body: jsonEncode(food.toJson()));
    if (response.statusCode == 200) {}
    print(response.body);
  }

  Future<List<Food>?> fetchFood() async {
    final url = '$_baseUrl/';
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    if (response.statusCode == 200) {
      final List<Food> data = foodFromJson(response.body);
      return data;
    } else {
      throw Exception('Fail to load data');
    }
  }

  Future<void> deleteFood(int foodId) async {
    final url = '$_baseUrl/deletefood/$foodId';
    final uri = Uri.parse(url);
    final response = await http.delete(uri);

    if (response.statusCode == 204) {
      // The 204 status code indicates a successful deletion with no content.
      // You can handle this case accordingly.
    } else if (response.statusCode == 404) {
      throw Exception('Product not found'); // Handle not found case
    } else {
      throw Exception('Failed to delete product'); // Handle other errors
    }
  }

  Future<void> addUser(User user) async {
    final url = '$_baseUrl/userRegistration';
    final uri = Uri.parse(url);
    final response = await http.post(uri,
        headers: {"content-type": "application/json"},
        body: jsonEncode(user.toJson()));
    if (response.statusCode == 200) {}
    print(response.body);
  }

  Future<bool> userLogin(User user) async {
    final response = await http.post(
      Uri.parse('$_baseUrl/userLogin'),
      // Replace with your actual API endpoint
      body: {
        'userEmail': user.userEmail,
        'userPassword': user.userPassword,
      },
    );
    if (response.statusCode == 200) {
      // Login successful
      return true;
    } else if (response.statusCode == 401) {
      // Login failed
    } else {
      // Handle other status codes if necessary
    }
    return false;
  }

}
