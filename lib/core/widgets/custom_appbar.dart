// ignore_for_file: public_member_api_docs, sort_constructors_first



import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class CustomAppBar extends StatelessWidget {
 final String? title;
  const CustomAppBar({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        
        backgroundColor: Colors.white,
        title: Text(title!,style: TextStyle(fontSize:20.0,fontWeight: FontWeight.bold,color: Colors.black),),
        leading: IconButton(icon: Icon(Icons.arrow_circle_left,color: Colors.black,),onPressed: (){Navigator.pop(context);},),
        elevation: 0.1,
       ),
    );
  }
}
