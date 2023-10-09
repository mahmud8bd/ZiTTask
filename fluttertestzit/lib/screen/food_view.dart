import 'package:flutter/material.dart';
import 'package:fluttertestzit/component/constants.dart';
import 'package:fluttertestzit/model/food.dart';
import 'package:fluttertestzit/screen/food_add.dart';
import 'package:fluttertestzit/service/api_service.dart';

class FoodView extends StatefulWidget {
  const FoodView({super.key});

  @override
  State<FoodView> createState() => _FoodViewState();
}

class _FoodViewState extends State<FoodView> {
  ApiService _apiService = ApiService();

  @override
  void initState() {
    super.initState();
    _apiService.fetchFood();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ZiT HomeWork'),
        centerTitle: true,
        backgroundColor: sPrimaryColor,
      ),
      body: FutureBuilder<List<Food>?>(
        future: _apiService.fetchFood(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No data available'));
          } else {
            final data = snapshot.data;
            return ListView.builder(
                itemCount: data?.length,
                itemBuilder: (context, index) {
                  return Container(
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [Colors.white60, sPrimaryLightColor])),
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10.0),
                        child: Container(
                          decoration: BoxDecoration(
                              gradient: LinearGradient(
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                  colors: [Color(0xFFB3E5FC), sPrimaryColor])),
                          child: ListTile(
                            leading: CircleAvatar(
                              backgroundColor: sPrimaryColor,
                              child: Text(data![index].foodId.toString()),
                            ),
                            title: Text(
                              data![index].foodName,
                              style: TextStyle(color: Colors.black),
                            ),
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 8.0),
                                  child: Text(data![index].foodDescription),
                                ),
                                Text(
                                    'Quantity: ${data![index].foodQuantity.toString()}'),
                                Text(
                                    'Price: ${data![index].foodPrice.toString()}'),
                              ],
                            ),
                            contentPadding: EdgeInsets.all(5),
                            //trailing: Text('Price: \$${data![index].price}'),
                            trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                IconButton(
                                  onPressed: () {
                                    showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return AlertDialog(
                                          backgroundColor: sPrimaryColor,
                                          title: Center(
                                              child: (Text('Food Details'))),
                                          content: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              Center(
                                                child: CircleAvatar(
                                                  child: Icon(Icons
                                                      .production_quantity_limits),
                                                ),
                                              ),
                                              Text(
                                                  'Name: ${data[index].foodName}'),
                                              Text(
                                                  'Description: ${data[index].foodDescription}'),
                                              Text(
                                                  'Quantity: ${data[index].foodQuantity.toString()}'),
                                              Text(
                                                  'Price: \$${data[index].foodPrice.toStringAsFixed(2)}'),
                                            ],
                                          ),
                                          actions: <Widget>[
                                            TextButton(
                                                onPressed: () {
                                                  Navigator.pop(context);
                                                },
                                                child: Icon(Icons.close))
                                          ],
                                        );
                                      },
                                    );
                                  },
                                  visualDensity: VisualDensity.compact,
                                  icon: Icon(Icons.remove_red_eye_sharp,
                                      color: Colors.white),
                                ),
                                IconButton(
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              FoodAdd(foodToEdit: data[index]),
                                        ));
                                  },
                                  visualDensity: VisualDensity.compact,
                                  icon: Icon(Icons.edit,
                                      color: Colors.yellowAccent),
                                ),
                                IconButton(
                                    onPressed: () {
                                      showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return AlertDialog(
                                            backgroundColor: sPrimaryLightColor,
                                            title: (Text('Confim Delete')),
                                            content: Text(
                                                'Are you sure you want to delete this product?'),
                                            actions: <Widget>[
                                              TextButton(
                                                  onPressed: () {
                                                    Navigator.pop(context);
                                                  },
                                                  child: Text('Cancel')),
                                              TextButton(
                                                  onPressed: () {
                                                    _apiService.deleteFood(
                                                        data[index].foodId);
                                                    Navigator.push(
                                                        context,
                                                        MaterialPageRoute(
                                                          builder: (context) =>
                                                              FoodView(),
                                                        ));
                                                  },
                                                  child: Text('Delete'))
                                            ],
                                          );
                                        },
                                      );
                                    },
                                    visualDensity: VisualDensity.compact,
                                    icon:
                                        Icon(Icons.delete, color: Colors.red)),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                });
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => FoodAdd(),
              ));
        },
        child: Icon(Icons.add),
        backgroundColor: sPrimaryColor,
      ),
    );
  }
}
