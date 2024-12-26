import 'package:flutter/material.dart';
import 'package:plant_nursery_zone/custom_widget/plant_item_widget.dart';
import 'package:plant_nursery_zone/model/cart_model.dart';
import 'package:plant_nursery_zone/customer/plant_detail.dart';
import 'package:plant_nursery_zone/customer/plant_item_tile.dart';
import 'package:plant_nursery_zone/customer/shopping_cart.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

class Home extends StatefulWidget {
  const Home({super.key,});


  @override
  State<Home> createState() => _HomeState();
}
class _HomeState extends State<Home> {
  Future<void> getPlantsApi()async{}
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
                Navigator.push(context, MaterialPageRoute(builder: (context)=>PlantDetail()));
              },
                
                child: Icon(Icons.shopping_cart,color: Colors.white,)),
            
            IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.search,
                  color: Colors.white,
                ))
          ],
        ),
        body: Expanded(child: Consumer<CartModel>(
            builder:(context, value, child){
              return GridView.builder(
                itemCount: value.shopItems.length,
                  padding:EdgeInsets.all(12),
                  gridDelegate:
                       const SliverGridDelegateWithFixedCrossAxisCount(
                           crossAxisCount: 2),
                  itemBuilder: (context, index){
                  var item = value.plants[index];
                    return PlantItemTile(
                      imagePath:item["image_url"],
                        itemName: item["name"],
                        itemPrice:item["price"],
                        onTap: (){
                        // Provider.of<CartModel>(context,listen: false).addItemToCart(index);
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>PlantDetail()));

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
