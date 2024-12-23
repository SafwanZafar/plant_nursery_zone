import 'package:flutter/material.dart';
import 'package:plant_nursery_zone/admin/Nurseries_request.dart';
import 'package:plant_nursery_zone/admin/registered_nurseries.dart';
import 'customers.dart';

class AdminDashboard extends StatefulWidget {
  const AdminDashboard({super.key});

  @override
  State<AdminDashboard> createState() => _AdminDashboardState();
}

class _AdminDashboardState extends State<AdminDashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      body: Column(
        children: [
          Container(
            height: 300,
            width: double.infinity,
            decoration: BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20))),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  textAlign: TextAlign.left,
                  'Welcome',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.w500),
                ),
                Text(
                  'Name',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.w500),
                ),
              ],
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: (){
                      Navigator.push(context,MaterialPageRoute(builder: (context)=>Customers()));
                    },
                    child: Container(
                      height: 150,
                      width: 150,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.person,
                            size: 60,
                          ),
                          SizedBox(
                            height: 4,
                          ),
                          Text(
                            'Customer',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Container(
                    height: 150,
                    width: 150,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.library_books,
                          size: 60,
                        ),
                        SizedBox(
                          height: 4,
                        ),
                        InkWell(
                          onTap: (){
                            Navigator.push(context,MaterialPageRoute(builder: (context)=>RegisteredNurseries()));

                          },
                          child: Text(
                            'Reg Nurseries',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                height: 150,
                width: 150,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.library_add,
                      size: 60,
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    InkWell(
                      onTap: (){
              Navigator.push(context,MaterialPageRoute(builder: (context)=>NurseriesRequest()));
              },
                      child: Text(
                        'Nurseries Req',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
