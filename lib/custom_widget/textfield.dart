import 'package:flutter/material.dart';

class Textfield extends StatefulWidget {
  final String? Function(String?)? validator;
  TextEditingController Controller = TextEditingController();
  String name;
  Textfield(
      {super.key,
      required this.name,
      this.validator,
      required this.Controller});

  @override
  State<Textfield> createState() => _TextfieldState();
}

class _TextfieldState extends State<Textfield> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, left: 16, right: 16),
      child: InkWell(
          child: Container(
        height: 64,
        width: 357,
        child: TextFormField(
          controller: widget.Controller,
          decoration: InputDecoration(
              hintText: widget.name,
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(width: 2, color: Colors.green))),
          validator: widget.validator,
        ),
      )),
    );
  }
}
