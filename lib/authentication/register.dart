import 'dart:convert';
import 'package:flutter/material.dart';
import '../custom_widget/button.dart';
import '../custom_widget/textfield.dart';
import '../util/app_constant.dart';
import 'login.dart';
import 'package:http/http.dart' as http;

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  Future<void> call_register_user_api() async {
    Map<String, dynamic> request_data = {
      'email': emailController.text,
      'name': nameController.text,
      'address': addressController.text,
      'contact_number': phoneController.text,
      'password_hash': passwordController.text,
      'is_nursery': is_nursery
    };
    var url = Uri.parse(base_url).resolve(register_url);
    var response = await http.post( url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(request_data)
    );
    print(response.body);
    if(response.statusCode ==200 ){

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Registration Sucessfully ")),
      );
      Navigator.push(context, MaterialPageRoute(builder: (context)=>Login()));
    }
    else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Failed Try Again")),
      );
    }
  }
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool is_nursery = false;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

  String newpassword = '';
  int? _value = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  top: 100,
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
                'Register',
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w400,
                    color: Colors.black),
              ),
              SizedBox(
                height: 50,
              ),
              Textfield(
                name: 'Name',
                Controller: nameController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Enter Name";
                  }
                  return null;
                },
              ),
              Textfield(
                name: 'Address',
                Controller: addressController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Enter Address";
                  } else {
                    return null;
                  }
                },
              ),
              Textfield(
                  name: 'Email',
                  Controller: emailController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please Enter Email";
                    } else if (!RegExp(r'^[^@]+@[^@]+\.[^@]+$')
                        .hasMatch(value)) {
                      return 'Please enter a valid email address';
                    }
                    return null;
                  }),
              Textfield(
                name: 'PhoneNumber',
                Controller: phoneController,
                validator: (value) {
                  if(value == null || value.isEmpty)
                  { return "Enter PhoneNumber"; }
                  return null;
                },
              ),
              Textfield(
                name: 'Password',
                Controller: passwordController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Enter Password";
                  } else if (value.length < 8) {
                    return "Password must be at least 8 characters ";
                  }
                  newpassword = value;
                  return null;
                },
              ),
              Textfield(
                name: 'Confirm Password',
                Controller: confirmPasswordController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Confirm Password";
                  } else if (value.length < 8) {
                    return "password must be at least 8 charater";
                  } else if (value != newpassword) {
                    return "Password not match";
                  }
                  return null;
                },
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(children: [
                    Radio(
                        value:1,
                        groupValue: _value,
                        onChanged: (value) {
                          setState(() {
                            _value = value;
                            _value==1?is_nursery=false:is_nursery=true;
                          });
                        }),
                    SizedBox(
                      width: 5,
                    ),
                    Text('Customer'),
                    Radio(
                        value: 2,
                        groupValue: _value,
                        onChanged: (value) {
                          setState(() {
                            _value = value;
                            _value==1?is_nursery=false:is_nursery=true;
                          });
                        }),
                    SizedBox(
                      width: 5,
                    ),
                    Text('Nursery')
                  ]),
                ],
              ),
              Button(buttonName: 'Register',
                height: 50,weight: 357,
                onpress: () {
                call_register_user_api();
                },
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Already have an account? ',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                        fontSize: 15),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Login()));
                    },
                    child: Text(
                      'Login',
                      style: TextStyle(
                          color: Colors.green,
                          fontSize: 17,
                          fontWeight: FontWeight.w500),
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
