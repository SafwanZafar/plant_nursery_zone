import 'package:flutter/material.dart';

import '../custom_widget/button.dart';
import '../custom_widget/textfield.dart';

class DelieveryBoy extends StatefulWidget {
  const DelieveryBoy({super.key});

  @override
  State<DelieveryBoy> createState() => _DelieveryBoyState();
}

class _DelieveryBoyState extends State<DelieveryBoy> {
  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController contactNumberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'Delievery Boy',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.green,
        centerTitle: true,
        leading: IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.arrow_back,
              color: Colors.white,
            )),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 20,
              ),
              Center(
                  child: Text(
                'Register Delivery Associate',
                style: TextStyle(
                    color: Colors.green,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              )),
              Center(
                child: Card(
                  elevation: 4,
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 10,
                        ),
                        Text('Full Name'),
                        Textfield(
                          Controller: fullNameController,
                          icon: Icon(
                            Icons.person,
                            color: Colors.green,
                            size: 16,
                          ),
                          hint: 'Enter full name',
                        ),
                        SizedBox(
                          height: 40,
                        ),
                        Text('Email'),
                        Textfield(
                          Controller: emailController,
                          icon: Icon(
                            Icons.email,
                            color: Colors.green,
                            size: 16,
                          ),
                          hint: 'Enter email address',
                        ),
                        SizedBox(
                          height: 40,
                        ),
                        Text('Password'),
                        Textfield(
                          obscure: true,
                          keyboardType: TextInputType.number,
                          Controller: passwordController,
                          icon: Icon(
                            Icons.lock,
                            size: 16,
                            color: Colors.green,
                          ),
                          hint: 'Enter password',
                        ),
                        SizedBox(
                          height: 40,
                        ),
                        Text('Address'),
                        Textfield(
                          keyboardType: TextInputType.number,
                          Controller: addressController,
                          icon: Icon(
                            Icons.numbers,
                            size: 16,
                            color: Colors.green,
                          ),
                          hint: 'Enter address',
                        ),
                        SizedBox(
                          height: 40,
                        ),
                        Text('Contact Number'),
                        Textfield(
                          Controller: contactNumberController,
                          icon: Icon(
                            Icons.picture_in_picture,
                            size: 16,
                            color: Colors.green,
                          ),
                          hint: 'Enter contact number',
                        ),
                        SizedBox(
                          height: 40,
                        ),
                        Button(
                            onpress: () {},
                            buttonName: 'Add Delivery Boy',
                            height: 40,
                            weight: 300),
                        SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
