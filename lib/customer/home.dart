import 'package:flutter/material.dart';
import 'package:plant_nursery_zone/customer/order_tracking.dart';
import 'package:plant_nursery_zone/customer/shopping_cart.dart';
import 'package:provider/provider.dart';
import 'package:plant_nursery_zone/custom_widget/search_bar_widget.dart';
import 'package:plant_nursery_zone/customer/plant_detail.dart';
import 'package:plant_nursery_zone/customer/plant_item_tile.dart';
import '../provider/plant_provider.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String _searchQuery = '';
  Map<String,dynamic> param = {
    "skip": 0.toString(),
    "limit": 20.toString()
  };
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<PlantProvider>(context, listen: false).getPlants(param);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text(
          'Nursing Plant Zone',
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context)=>ShoppingCart()));// Navigate to cart
            },
            icon: Icon(Icons.shopping_cart, color: Colors.white),
          ),
          IconButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context)=>OrderTracking())); // Navigate to order tracking
            },
            icon: Icon(Icons.delivery_dining, color: Colors.white),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            // Search Bar Widget
            SearchBarWidget(
              onSearchChanged: (query) {
                setState(() {
                  _searchQuery = query;
                });
              },
              hintText: 'Search for a plant...',
            ),
            SizedBox(height: 12),

            // Plant List (GridView)
            Expanded(
              child: Consumer<PlantProvider>(
                builder: (context, plantProvider, child) {
                  final plants = plantProvider.plants;

                  // Filter plants based on the search query
                  final filteredPlants = _searchQuery.isEmpty
                      ? plants
                      : plants
                      .where((plant) => plant.name
                      .toLowerCase()
                      .contains(_searchQuery.toLowerCase()))
                      .toList();

                  if (filteredPlants.isEmpty) {
                    return Center(
                      child: Text(
                        'No results found',
                        style: TextStyle(fontSize: 16, color: Colors.grey),
                      ),
                    );
                  }

                  return GridView.builder(
                    itemCount: filteredPlants.length,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                    ),
                    itemBuilder: (context, index) {
                      final plant = filteredPlants[index];
                      return PlantItemTile(
                        imagePath: plant.image_Url,
                        itemName: plant.name,
                        itemPrice: plant.price,
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => PlantDetail(plantDetails: plant),
                            ),
                          );
                        },
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}