import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:plant_nursery_zone/customer/plant_detail.dart';
import 'package:plant_nursery_zone/customer/shopping_cart.dart';
import 'package:plant_nursery_zone/util/app_constant.dart';
import 'package:plant_nursery_zone/util/string_util.dart';

class PlantItemTile extends StatelessWidget {

   PlantItemTile({super.key,
    required this.itemPrice,
    required this.imagePath,
    required this.itemName,
    this.onTap
    // required this.color,
  });

  final String itemName;
  final String itemPrice;
  final String imagePath;
 void Function() ? onTap;

  // final color;


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4),
      child: InkWell(
        onTap:onTap,
        child: Card(
          child: Container(
            height: 300,
            width: 300,
            decoration: BoxDecoration(
                 color: Colors.grey.shade100,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //item name
               ClipRRect(
                   borderRadius: BorderRadius.only(topLeft:Radius.circular(12),topRight:Radius.circular(12)),
                   child:
                   Image.network(
                       height: 100,
                       (base_url+StringUtil.removeFirstSlash(imagePath)))),
                  Padding(
                    padding: const EdgeInsets.only(left: 5),
                    child: Text(itemName),
                  ),
                  // item Price
                  Padding(
                    padding: const EdgeInsets.only(left: 5),
                    child: Text('RS:'+itemPrice),
                  ),
              ]
                    ),
            )
          ),
        ),
      ),
    );

  }
}
