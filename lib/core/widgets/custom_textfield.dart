// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final String? hintText;
  final String? label;
  final IconData? prefix;
  final IconData? supfix;
  final ValueSetter? onChanged;
  final TextInputType? inputType;
   final ValueSetter? onSaved;
 final  bool isClickable = true;
 final String? validation;
 final String?  initialValue;
 final TextEditingController? controller;

 


  const CustomTextFormField({
    Key? key,
    @required this.inputType,
   @required this.hintText,
   this.label,
   this.supfix,
  this.prefix,
    this.onChanged,
    this.onSaved,
    @required this.validation,
    this.initialValue,
    this.controller,
    
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
     
    
      height:50,
      child: TextFormField(
        controller: controller,
        initialValue: initialValue,
        keyboardType: inputType,
        onSaved: onSaved,
        onChanged: onChanged,
       enabled: isClickable,
       validator: (value)
       {
        if(value!.isEmpty){
          return validation;
        }else{
          return null;
        }
       },
        decoration: InputDecoration(
          fillColor: Colors.grey,
          hintText: hintText,
          labelText: label,
          prefixIcon: Icon(prefix),
          suffixIcon: Icon(supfix),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: BorderSide(
              color: Color.fromARGB(255, 151, 150, 150),
            ),
          ),
        ),
      ),
    );
  }
}
