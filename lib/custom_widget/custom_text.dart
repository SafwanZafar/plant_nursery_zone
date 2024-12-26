import 'dart:math';

import 'package:flutter/cupertino.dart';

class CustomText extends StatelessWidget {
   CustomText({super.key,
  required this.text,
     this.fontFamily,
    this.fontWeight,
     this.fontColor,
     this.fontSize,
     this.maxLines,
     this.softWrap,
     this.textOverflow,

  });

  final String text;
   Color? fontColor;
   double? fontSize;
   FontWeight? fontWeight;
      String? fontFamily;
      int? maxLines;
      bool? softWrap;
      TextOverflow? textOverflow;
  @override
  Widget build(BuildContext context) {
    return Text(
      softWrap: softWrap,
      maxLines: maxLines,
      overflow: textOverflow,
      text,style: TextStyle(fontSize:fontSize,
      color: fontColor,
      fontWeight: fontWeight, fontFamily: fontFamily),);
  }
}
