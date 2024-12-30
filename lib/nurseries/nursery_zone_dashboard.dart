import 'package:flutter/material.dart';
import 'package:plant_nursery_zone/nurseries/add_plant.dart';
import 'package:plant_nursery_zone/nurseries/chat_screen.dart';

import '../custom_widget/custom_card.dart';
import 'delievery_boy.dart';

class NurseryZoneDashboard extends StatefulWidget {
  const NurseryZoneDashboard({super.key});

  @override
  State<NurseryZoneDashboard> createState() => _NurseryZoneDashboardState();
}

class _NurseryZoneDashboardState extends State<NurseryZoneDashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text(
          'Nursery Zone Dashboard',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back,
              color: Colors.white,
            )),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          children: [
            InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => AddPlant()));
                },
                child: CustomContainer(
                    titleText: 'Add Plant',
                    descriptionText: 'Add new plants to your inventory,')),
            CustomContainer(
              titleText: 'Manage\n Plants',
              descriptionText: 'Edit, delete and manage your plants inventory ',
            ),
            CustomContainer(
              titleText: 'Manage\n Orders',
              descriptionText: 'Track and manage customers orders',
            ),
            CustomContainer(
              titleText: 'Customer \n Reviews',
              descriptionText: 'Monitor customers feedback and ratings',
            ),
            InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => DelieveryBoy()));
                },
                child: CustomContainer(
                  titleText: 'Add Delivery \n Boy',
                  descriptionText: 'Add and manage delivery boy,',
                )),
            InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => ChatScreen()));
                },
                child: CustomContainer(
                  titleText: 'Chat with \n Gemini',
                  descriptionText: 'Get AI assistance for your quries',
                ))
          ],
        ),
      ),
    );
  }
}
