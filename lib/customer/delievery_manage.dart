import 'package:flutter/material.dart';
import 'package:plant_nursery_zone/custom_widget/delievery_manage_widget.dart';
import 'package:plant_nursery_zone/provider/delivery_provider.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DelieveryManage extends StatefulWidget {
  const DelieveryManage({super.key});


  @override
  State<DelieveryManage> createState() => _DelieveryManageState();
}

class _DelieveryManageState extends State<DelieveryManage> {
  String? _user_id;
  String? selectedValue;
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp){
      _loadData();
    });

  }
  void onDropdownValueChanged(String value) {
    setState(() {
      selectedValue = value;
    });
  }

  Future<void> _loadData()async{
    final pref = await SharedPreferences.getInstance();
    setState(() {
      _user_id = pref.getString('id');
      if(_user_id != null){
        Provider.of<DeliveryProvider>(context,listen: false).getDeliveries(_user_id.toString());
      }
    });}
  @override
  Widget build(BuildContext context) {
    final deliveryProvider = Provider.of<DeliveryProvider>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
      ),


      body:Consumer<DeliveryProvider>(
        builder: (context, value, child){
          final delivers = value.delivers;

          return ListView.builder(
            itemCount: delivers.length,
            itemBuilder:(context,index){
              var item = delivers[index];
              return DelieveryManageWidget(
                  orderId: item.order_id.toString(),
                  name: item.name,
                  address: item.address,
                  contactNumber: item.contact_number,
                  ScheduleDate: item.schedule_date,
                  status: item.status,
                onValueChanged: (value){
                    setState(() {
                      selectedValue=value;
                      deliveryProvider.updateDeliveryStatus(item.order_id.toString(), selectedValue);
                      if(deliveryProvider.updateDeliver!=null){
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Status Changed Successfully')));
                        deliveryProvider.removeItem(index);
                      }
                    });
                },
                  selectedValue: selectedValue,

              );

            }
        );
        },
      )



    );
  }
}
