import 'package:flutter/material.dart';

class Textfield extends StatefulWidget {
  final String? Function(String?)? validator;
  TextEditingController Controller = TextEditingController();
  final TextInputType keyboardType;
  bool obscure ;
  bool readOnly;
   Icon? icon;
  final VoidCallback ? onTap;
  String hint;
  Textfield(
      {super.key,
        this.obscure=false,
      required this.hint, this.keyboardType=TextInputType.text,this.readOnly=false,
      this.validator,
      this.onTap,
         this.icon,
      required this.Controller});

  @override
  State<Textfield> createState() => _TextfieldState();
}

class _TextfieldState extends State<Textfield> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
        child: Container(
      height: 40,
      width: 300,
      child: TextFormField(
        obscureText: widget.obscure,
        readOnly: widget.readOnly,
        keyboardType: widget.keyboardType,
        controller: widget.Controller,
        decoration: InputDecoration(
          prefixIcon: widget.icon,
            hintText: widget.hint,
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: Colors.grey.shade100)),
            filled: true,
            fillColor: Colors.grey.shade100,
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: Colors.grey.shade100)
            ),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(
                color: Colors.grey.shade100
              )
            ),
          contentPadding: EdgeInsets.only(left: 20),


        ),
        validator: widget.validator,
      ),
    ));
  }
}
