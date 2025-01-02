import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:plant_nursery_zone/custom_widget/search_bar_widget.dart';

class PlantItemWidget extends StatelessWidget {
  const PlantItemWidget({super.key,
  required this.plantName, 
    required this.price,
    required this.imageUrl
  });

final String plantName;
final String price;
final String imageUrl;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
      ),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //Image url
         const SizedBox(
            height: 7,
          ),
          Center(
            child: Container(
              height: 80,
              width: 150,
              decoration: BoxDecoration(color: Colors.green.shade100),
              child: Image(image: NetworkImage(imageUrl)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
                textAlign: TextAlign.left,
                plantName,
                style: const TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.bold)),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8,),
            child: Text('RS:$price',style: const TextStyle(color: Colors.red,fontWeight: FontWeight.bold,),),
          ),
        ],
      ),
    );
  }
}
