import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:todo_algoriza/core/widgets/custom_buttons.dart';
import 'package:todo_algoriza/features/tasks/presentation/widgets/add_task_item_Screen.dart';
import 'package:todo_algoriza/features/tasks/presentation/widgets/schedule_screen.dart';

class AddTasksScreen extends StatefulWidget {
  final String? title;

  AddTasksScreen({
    Key? key,
    this.title,
  }) : super(key: key);

  @override
  State<AddTasksScreen> createState() => _AddTasksScreenState();
}

class _AddTasksScreenState extends State<AddTasksScreen> {
  @override
  void initState() {
    super.initState();
  }

  late DateTime selectedDate = DateTime.now();
  String endDate = '9:30 PM';
  String startDate = DateFormat('hh:mm a').format(DateTime.now()).toString();
  int selectedRemind = 5;
  List <int> remidList = [
    5,
    10,
    15,
    20,

  ];
    String selectedRpeat = 'None';
  List <String> repeatList = [
    'none',
    'Daily',
    'weakly',
    'monthly',

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'Board',
          style: TextStyle(
              fontSize: 20.0, fontWeight: FontWeight.bold, color: Colors.black),
        ),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_circle_left,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        elevation: 0.1,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Divider(
              height: 0.1,
              color: Colors.black,
              thickness: 0.1,
            ),
            SizedBox(
              height: 10,
            ),
            TaskItemScreen(
              initialValue: 'Deasign to team',
              title: 'Title',
              hintText: 'Enter Data',
              inputType: TextInputType.text,
              label: '',
              validation: 'please enter data',
              width: double.infinity,
            ),
            TaskItemScreen(
              initialValue: DateFormat.yMd().format(selectedDate).toString(),
              title: 'Deadline',
              hintText: 'Enter Data',
              inputType: TextInputType.datetime,
              label: '',
              validation: 'please enter data',
              widget: IconButton(
                  icon: Icon(
                    Icons.calendar_today_outlined,
                    color: Colors.grey,
                  ),
                  onPressed: () {
                    print('hello');
                    getDateFromUser(context);
                  }),
            ),
            Row(
              children: [
                Expanded(
                  child: TaskItemScreen(
                    initialValue: startDate,
                    title: 'Start time',
                    hintText: 'Enter Data',
                    inputType: TextInputType.text,
                    label: '',
                    validation: 'please enter data',
                    widget: IconButton(
                        icon: Icon(
                          Icons.access_time_rounded,
                          color: Colors.grey,
                        ),
                        onPressed: () {
                          getTimeFromUser(isStartTime:true);
                          print('start');
                          
                        }),
                  ),
                ),
                Expanded(
                  child: TaskItemScreen(
                    initialValue: endDate,
                    title: 'end time',
                    hintText: 'Enter Data',
                    inputType: TextInputType.text,
                    label: '',
                    validation: 'please enter data',
                     widget: IconButton(
                        icon: Icon(
                          Icons.access_time_rounded,
                          color: Colors.grey,
                        ),
                        onPressed: () {
                          getTimeFromUser(isStartTime:false);
                          
                          print('end');
                         
                        }),
                  ),
                ),
              ],
            ),
            TaskItemScreen(
              initialValue: '$selectedRemind minute early',
              title: 'Remind',
              hintText: 'Enter Data',
              inputType: TextInputType.text,
              label: '',
              validation: 'please enter data',
              widget:DropdownButton(
                onChanged: (String? newValue) 
                {setState(() {
                  selectedRemind = int.parse(newValue!);
                  
                });
                },
                items:remidList.map<DropdownMenuItem<String>>((int value){
                  return DropdownMenuItem<String>(
                    value: value.toString(),
                   child: Text(value.toString()),
                  );
                }
                ).toList(),
              
               icon: Icon(Icons.keyboard_arrow_down,color: Colors.grey,),
               iconSize: 32,
               elevation: 4,
               underline: Container(height: 0,),

               ),
            ),
            TaskItemScreen(
              initialValue: '$selectedRpeat',
              title: 'Repeat',
              hintText: 'Enter Data',
              inputType: TextInputType.text,
              label: '',
              validation: 'please enter data',
              widget:DropdownButton(
                onChanged: (String? newValue) 
                {setState(() {
                  selectedRpeat = newValue!;
                  
                });
                },
                items:repeatList.map<DropdownMenuItem<String>>((String? value){
                  return DropdownMenuItem<String>(
                    value: value.toString(),
                   child: Text(value.toString()),
                  );
                }
                ).toList(),
              
               icon: Icon(Icons.keyboard_arrow_down,color: Colors.grey,),
               iconSize: 32,
               elevation: 4,
               underline: Container(height: 0,),

               ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 30, right: 30, top: 100, bottom: 30),
              child: CustomButtom(
                  text: 'Create a Task',
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => ScheduleScreen()));
                  }),
            ),
          ],
        ),
      ),
    );
  }

  void getDateFromUser(context) async {
    DateTime? pickerDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2015),
      lastDate: DateTime(2121),
    );
    if (pickerDate != null) {
      setState(() {
        selectedDate = pickerDate;
        print(selectedDate);
      });
    } else {
      print('it is null or some error');
    }
   
    
  }
  void    getTimeFromUser( {@required  bool? isStartTime })async
    {
   var pickerTime = await showTimePicker(
        initialEntryMode: TimePickerEntryMode.input,
        context: context, 
        initialTime:TimeOfDay(
          hour:int.parse(startDate.split(":")[0]) ,
         minute:int.parse(startDate.split(":")[1].split(" ")[0]),
         
           ),
        );
        //  String formatedTime = pickerTime.format(context);
        if (pickerTime==null){
          print('error time');
        }else if(isStartTime == true)
        {
          setState(() {
            startDate = pickerTime.toString();
          });
         
        }else if(isStartTime == false)
        {
         endDate = pickerTime.toString();
        }

         
                    
    }
}
