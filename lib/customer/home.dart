import 'package:flutter/material.dart';
import 'package:plant_nursery_zone/custom_widget/plant_item_widget.dart';
import 'package:plant_nursery_zone/customer/order_tracking.dart';
import 'package:plant_nursery_zone/model/cart_model.dart';
import 'package:plant_nursery_zone/customer/plant_detail.dart';
import 'package:plant_nursery_zone/customer/plant_item_tile.dart';
import 'package:plant_nursery_zone/customer/shopping_cart.dart';
import 'package:plant_nursery_zone/util/app_constant.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

import '../provider/plant_provider.dart';

class Home extends StatefulWidget {
  const Home({super.key,});


  @override
  State<Home> createState() => _HomeState();
}
class _HomeState extends State<Home> {
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<PlantProvider>(context,listen: false).getPlants();
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
          actions: <Widget>[
            InkWell(
              onTap: (){
                // Navigator.push(context, MaterialPageRoute(builder: (context)=>PlantDetail()));
              },
                
                child: Icon(Icons.shopping_cart,color: Colors.white,)),
            
            IconButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>OrderTracking()));
                },
                icon: Icon(
                  Icons.search,
                  color: Colors.white,
                ))
          ],
        ),
        body: Expanded(
          child: Consumer<PlantProvider>(
              builder:(context, value, child){
                final plants = value.plants;
                return GridView.builder(
                  itemCount: plants.length,
                    padding:EdgeInsets.all(12),
                    gridDelegate:
                         const SliverGridDelegateWithFixedCrossAxisCount(
                             crossAxisCount: 2),
                    itemBuilder: (context, index){
                    var item = plants[index];
                      return PlantItemTile(
                        imagePath: item.image_Url,
                          itemName:item.name,
                          itemPrice:item.price,
                          onTap: (){
                          // Provider.of<CartModel>(context,listen: false).addItemToCart(index);
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>PlantDetail(plantDetails: item,)));

                          },
                        // color: Colors.grey);
                      );

                    }
                    );
              }
              ),
        ),
    );
  }
}
