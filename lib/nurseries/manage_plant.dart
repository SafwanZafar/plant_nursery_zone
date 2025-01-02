import 'dart:io';
import 'package:flutter/material.dart';
import 'package:plant_nursery_zone/nurseries/add_plant.dart';
import 'package:plant_nursery_zone/provider/plant_provider.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../util/app_constant.dart';
import '../util/string_util.dart';

class ManagePlant extends StatefulWidget {
  ManagePlant({
    super.key,
  });

  @override
  State<ManagePlant> createState() => _ManagePlantState();
}

class _ManagePlantState extends State<ManagePlant> {
  String? _user_id;
  bool showIcon =false;
  Future<void> load_data() async{
    final pref = await SharedPreferences.getInstance();
    setState(() {
      _user_id = pref.getString('id');
      Map<String,dynamic> param = {
        'nursery_id':int.parse(_user_id.toString()).toString(),
        "skip": 0.toString(),
        "limit": 20.toString()
      };
      WidgetsBinding.instance.addPostFrameCallback((timeStamp){
        Provider.of<PlantProvider>(context,listen:false).getPlants(param
        );
      });
      print("object===>>>$_user_id");
    });

  }
  @override
  void initState() {
    super.initState();
    load_data();
    print(_user_id);

  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<PlantProvider>(context);

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green,
          title: Text("Manage Plant",style: TextStyle(color: Colors.white),),
          leading: IconButton(onPressed: (){
            Navigator.pop(context);
          }, icon: Icon(Icons.arrow_back,color: Colors.white,)),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(12),
          child: Consumer<PlantProvider>(
              builder: (context,value,child){
                final plants = value.plants;
                return ListView.builder(
                itemCount:plants.length,
                itemBuilder: (context, index) {
                  var item = plants[index];
                  return Card(
                    elevation: 4,
                    margin: const EdgeInsets.symmetric(vertical: 8),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                          Stack(
                            children:[ ClipRRect(
                              borderRadius: BorderRadius.circular(12),
                              child: Image(height: 200,width: double.infinity,
                                  fit: BoxFit.fill,
                                  image:NetworkImage((base_url+StringUtil.removeFirstSlash(item.image_Url))),
                            ),),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                IconButton(onPressed: (){

                                showDialog(context: context, builder: (context)=>AddPlant(
                                    buttonName: 'Save Changes',
                                ));
                                }, icon: Icon(Icons.edit,color: Colors.green,)),


                                  /*Center(
                                      child: Card(
                                        elevation: 4,
                                        margin: const EdgeInsets.symmetric(vertical: 8),
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(12),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(12),
                                          child: Column(
                                            children: [
                                              Text('Edit Plant Details'),
                                              SizedBox(height: 10,),
                                              Text('Plant Name'),
                                              SizedBox(height: 5,),
                                              Textfield(hint: 'Sunflower',Controller: ,)
                                            ],
                                          ),
                                        ),
                                      ),
                                    )*/



                                //
                                // IconButton(onPressed: (){
                                //   provider.delete_plant(item.plant_id.toString());
                                //  if(provider.delete_response!=null){
                                //    plants.remove(item);
                                //  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Plant delete sucessfully')));
                                //  }
                                // },
                                //     icon: Icon(
                                //   Icons.delete,color: Colors.red,)
                                //
                                // )
                              ],)
                  ]
                          ),
                                    Padding(
                                      padding: const EdgeInsets.all(12),
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text('Name ${item.name}'),
                                          SizedBox(height: 10,),
                                          Text('Description ${item.description}'),
                                          SizedBox(height: 10,),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text('price ${item.price}'),
                                              Text('stock ${item.stock}')
                                            ],
                                          )

                                        ],
                                      ),
                                    ),

                                    // Make sure the URL is a direct link to the image
                      ],
                    ),
                  );
                });
          }
          ),
        )

    );
  }
}
