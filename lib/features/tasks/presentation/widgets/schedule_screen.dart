

import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:intl/intl.dart';
import 'package:todo_algoriza/core/widgets/constants.dart';
import 'package:todo_algoriza/core/widgets/custom_buttons.dart';

class ScheduleScreen extends StatelessWidget {
   ScheduleScreen({Key? key}) : super(key: key);
   DateTime  selectedDate = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    appBar: AppBar(
        
        backgroundColor: Colors.white,
        title: Text('Schedule',style: TextStyle(fontSize:20.0,fontWeight: FontWeight.bold,color: Colors.black),),
        leading: IconButton(icon: Icon(Icons.arrow_circle_left,color: Colors.black,),onPressed: (){Navigator.pop(context);},),
        elevation: 0.1,
       ),
       body: Column(
         children: [
         
            Container(
           margin: EdgeInsets.all(20),
              child: DatePicker(
                
                DateTime.now(),
                height:100 ,
                width: 80,
                initialSelectedDate:DateTime.now(),
                selectionColor: KmainColor,
                selectedTextColor: Colors.white,
                dateTextStyle: TextStyle(fontSize: 15),
                onDateChange: (date){

                  selectedDate = date;
                },
                ),
                
            ),
             const Divider(
              height: 0.1,
              color: Colors.black,
              thickness:0.1,
            ),
            Row(children: [

             Expanded(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Text('Today',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
              )),
             
             Padding(
               padding: const EdgeInsets.all(20),
               child: Text( DateFormat.yMMMMd().format(DateTime.now()),
               ),
             ),

            ],),
          
           
           



         ],

       ),
    );
    
  }
}