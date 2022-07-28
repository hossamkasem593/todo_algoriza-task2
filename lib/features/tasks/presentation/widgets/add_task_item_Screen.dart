import 'package:flutter/material.dart';


class TaskItemScreen extends StatelessWidget {
  final String title;
  final String hintText;
  final TextEditingController? controller;
  final Widget? widget;
  final TextInputType inputType;
  final String? label;
  final IconData? subfix;
  final String? validation;
  final double? width;
  final String? initialValue;

  const TaskItemScreen({
    Key? key,
    required this.title,
    required this.hintText,
    this.controller,
    this.widget,
    required this.inputType,
    this.label,
    this.subfix,
    this.width = double.infinity,
    @required this.validation,
    this.initialValue,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(
          title,
          style:  TextStyle(
              fontSize: 15.0, color: Colors.black, fontWeight: FontWeight.bold),
        ),
        Container(
          padding: EdgeInsets.only(left: 10),
          height:50,
          margin: EdgeInsets.symmetric(vertical:15),
              decoration: BoxDecoration(
              border: Border.all(color: Colors.white24),
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(12.0)),
          child: Row(
            children: [
              Expanded(
                child: TextFormField(
                  readOnly: widget==null?false:true,
                 
                  validator:(value) {
                    if (value!.isEmpty) {
                      return 'please enter data';
                    } else {
                      return null;
                    }
                  }, 
                  
                  initialValue: initialValue,
                  controller: controller,
                  keyboardType: inputType,
                    
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    labelText: label,
                    hintText: hintText,
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                      color: Colors.white, width:0
                        ),
                  ),
                  enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                      color: Colors.white, width:0
                        ),


                  ),
                  
                  ),
                  
                ),
              ),
              widget == null ?Container():Container(child: widget,)
            ],
          ),
        ),
      ]),
    );
    // return Padding(
    //   padding: const EdgeInsets.symmetric(horizontal: 20),
    //   child: Column(
    //    crossAxisAlignment: CrossAxisAlignment.start,
    //     children: [
    //       Padding(
    //         padding: EdgeInsets.only(left:10),
    //         child: Text(
    //           title,
    //           style: TextStyle(
    //             fontSize: 15.0, color: Colors.black, fontWeight: FontWeight.bold),
    //         ),
    //       ),
    //       Container(

    //        width:width ,
    //         padding: EdgeInsets.all(15),
    //         child: CustomTextFormField(
    //           initialValue:  initialValue,
    //           inputType: inputType,
    //           hintText: hintText,
    //           label: label,
    //           supfix: subfix,
    //           validation: validation,
    //         ),
    //       ),

    //     ],
    //   ),
    // );
  }
}
