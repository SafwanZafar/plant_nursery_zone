import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:plant_nursery_zone/admin/admin_dashboard.dart';
import 'package:plant_nursery_zone/authentication/register.dart';
import 'package:plant_nursery_zone/customer/delievery_manage.dart';
import 'package:plant_nursery_zone/customer/home.dart';
import 'package:plant_nursery_zone/util/app_constant.dart';
import 'package:http/http.dart' as http;
import '../custom_widget/button.dart';
import '../custom_widget/textfield.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {

  Future<void> call_login_api() async {
    Map<String, dynamic> params = {
      'email': emailController.text,
      'password': passwordController.text
    };
    var url = Uri.parse(base_url).resolve(login_url).replace(queryParameters: params);
    var response = await http.get(
      url,
      headers: {'Content-Type': 'application/json'},
    );
    print(response.body);
    if (response.statusCode == 200) {
      var response_data = jsonDecode(response.body);
      SharedPreferences sp =await SharedPreferences.getInstance();
      String user_id = response_data['user_id'].toString()??'';
      String userEmail = response_data['email'].toString()??'';
      String userName = response_data['name'].toString()??'';
      String userContactNumber = response_data['contact_number'].toString()??'';
      String userAddress = response_data['address'].toString()??'';
      sp.setString('id', user_id);
      sp.setString('email', userEmail);
      sp.setString('name', userName);
      sp.setString('address', userAddress);
      sp.setString('contact_number', userContactNumber);

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Login Sucessfully ")),
      );
      if(response_data['role'] == "Customer"){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>Home()));
      }
      else if(response_data['role'] == "Nursery"){
        //****NAvigate to Nusery Dashbaord
      }
      else if (response_data['role']== "DeliveryBoy"){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>DelieveryManage()));
      }
      else{
        Navigator.push(context, MaterialPageRoute(builder: (context)=>AdminDashboard()));
      }
    }
    else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Failed Try Again")),
      );
    }
  }
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  top: 150,
                ),
                child: Text(
                  'Plant Nursery Zone',
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w700,
                      color: Colors.green),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'LogIn',
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w400,
                    color: Colors.black),
              ),
              SizedBox(
                height: 50,
              ),
              Textfield(
                name: 'Email',
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please Enter Email";
                  } else if (!RegExp(r'^[^@]+@[^@]+\.[^@]+$').hasMatch(value)) {
                    return 'Please enter a valid email address';
                  }
                  return null;
                },
                Controller: emailController,
              ),
              Textfield(
                name: 'Password',
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Enter Password";
                  } else if (value.length < 8) {
                    return "Password must be at least 8 characters ";
                  }
                  return null;
                },
                Controller: passwordController,
              ),
              Button(
                buttonName: 'Login',
                height: 50,weight: 357,
                onpress: () async {
                  call_login_api();
                },
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Didn't have an account? ",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                        fontSize: 15),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Register()));
                    },
                    child: Text(
                      'SignUp',
                      style: TextStyle(
                          color: Colors.green,
                          fontSize: 17,
                          fontWeight: FontWeight.w400),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
