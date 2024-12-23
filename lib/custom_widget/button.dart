import 'package:flutter/material.dart';

class Button extends StatefulWidget {
  double height ;
  double weight ;
   Color color;
  final String buttonName ;
   final VoidCallback onpress;
   Button({super.key, required this.onpress,
     required this.buttonName ,
     this.color=Colors.green,
     required this.height,required this.weight});

  @override
  State<Button> createState() => _ButtonState();
}

class _ButtonState extends State<Button> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 30,left: 30,right: 30),
      child: InkWell(
        onTap:widget.onpress ,
        child: Container(
          height: widget.height,
          width: widget.weight,
          decoration: BoxDecoration(
            color: widget.color,
            borderRadius: BorderRadius.circular(10)
          ),
          child: Center(
            child: Text(
              widget.buttonName,
              style: TextStyle(
                  color: Colors.white, fontSize: 13, fontWeight: FontWeight.w500),
            ),
          ),
        ),
      ),
    );
  }
}