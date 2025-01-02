import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:plant_nursery_zone/nurseries/manage_plant.dart';
import 'package:plant_nursery_zone/provider/plant_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../custom_widget/button.dart';
import '../custom_widget/textfield.dart';
import 'package:provider/provider.dart';


class AddPlant extends StatefulWidget {
  final String ? plant_id;
  final String buttonName;
   AddPlant({super.key, this.buttonName= 'Add Plant', this.plant_id});

  @override
  State<AddPlant> createState() => _AddPlantState();
}

class _AddPlantState extends State<AddPlant> {
  final TextEditingController plantNameController = TextEditingController();
  final TextEditingController discriptionController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController stockController = TextEditingController();
  final TextEditingController imageController = TextEditingController();
  final ImagePicker _picker = ImagePicker();
   File? image;
  String? _user_id;
  Future<void> load_data() async{
    final pref = await SharedPreferences.getInstance();
    setState(() {
      _user_id = pref.getString('id');
    });

  }


  Future<void> selectImage() async {
    final XFile? _image = await _picker.pickImage(source: ImageSource.gallery);
    if (_image != null) {
      setState(() {
        imageController.text = _image.path;
        image = File(_image.path);
        // Store image path in the TextField
      });
    }
    else {
      setState(() {
        imageController.text = '';  // Store image path in the TextField
      });
    }
  }
  bool validateFields() {
    if (plantNameController.text.isEmpty ||
        discriptionController.text.isEmpty ||
        priceController.text.isEmpty ||
        stockController.text.isEmpty ||
        imageController.text.isEmpty) {
      return false;  // If any field is empty
    }
    return true;  // All fields are filled
  }

  @override
  void initState() {
    load_data();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<PlantProvider>(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'Add Plant',
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 20,
            ),
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
                      Text('Name'),
                      Textfield(
                        Controller: plantNameController,
                        icon: Icon(
                          Icons.person,
                          color: Colors.green,
                          size: 16,
                        ),
                        hint: 'Enter plant name',
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      Text('Description'),
                      Textfield(
                        Controller: discriptionController,
                        icon: Icon(
                          Icons.book,
                          color: Colors.green,
                          size: 16,
                        ),
                        hint: 'Enter Description',
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      Text('Price'),
                      Textfield(
                        keyboardType: TextInputType.number,
                        Controller: priceController,
                        icon: Icon(
                          Icons.euro,
                          size: 16,
                          color: Colors.green,
                        ),
                        hint: 'Enter price',
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      Text('Stock'),
                      Textfield(
                        keyboardType: TextInputType.number,
                        Controller: stockController,
                        icon: Icon(
                          Icons.numbers,
                          size: 16,
                          color: Colors.green,
                        ),
                        hint: 'Enter stock quantity',
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      Text('Select_image'),
                      InkWell(
                        onTap: selectImage,
                        child: AbsorbPointer(
                          child: Textfield(
                            readOnly: true,
                            Controller: imageController,

                            icon: Icon(
                              Icons.picture_in_picture,
                              size: 16,
                              color: Colors.green,
                            ),
                            hint: 'Select Image',
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      Button(
                          onpress:(){
                            if (validateFields()) {
                              // Proceed to the next screen
                              Map<String,dynamic> request_data = {
                                'nursery_id':_user_id.toString(),
                                'name':plantNameController.text,
                                'description':discriptionController.text,
                                'price':priceController.text,
                                'stock':stockController.text,
                                'image':imageController.text
                              };
                              print(request_data);
                              provider.add_plant(request_data);
                              setState(() {

                              if(provider.add_plant_response!=null){
                                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Plant added successfully.')));
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => ManagePlant()),
                                );
                                plantNameController.clear();
                                discriptionController.clear();
                                priceController.clear();
                                stockController.clear();
                                imageController.clear();
                              }
                              });

                            } else {
                              // Show a message if any field is empty
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text('Please fill all fields!')),
                              );
                            }
                          },
                          buttonName: widget.buttonName,
                          height: 40,
                          weight: 300)
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
