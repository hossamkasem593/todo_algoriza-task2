import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:todo_algoriza/core/widgets/custom_buttons.dart';
import 'package:todo_algoriza/features/tasks/presentation/widgets/addtask_Screen.dart';

class TaskScreen extends StatelessWidget {
  const TaskScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          elevation: 0.6,
          title: Text(
            'Board',
            style: TextStyle(color: Colors.black),
          ),
          backgroundColor: Colors.white,
        ),
        body: Column(
          children: [
            
            Container(
           
              child: const TabBar(
                isScrollable: true,
                labelColor: Colors.black,
                indicatorColor: Colors.black,
                indicatorSize: TabBarIndicatorSize.label,
                tabs: [
                  Tab(
                    child: Text('All'),
                  ),
                  Tab(
                    child: Text('completed'),
                  ),
                  Tab(
                    child: Text('uncompleted'),
                  ),
                  Tab(
                    child: Text('favourite'),
                  ),
                ],
              ),
            ),
            const Divider(
              height: 0.1,
              color: Colors.grey,
              thickness: 0.5,
            ),
            const Expanded(
              child: Padding(
                padding: EdgeInsets.all(20.0),
                child: TabBarView(
                  children: [
                    Text('All'),
                    Text('completed'),
                    Text('uncompleted'),
                    Text('favourite'),
                  ],
                ),
              ),
            ),
           Padding(
            padding: EdgeInsets.all(20),
              child: CustomButtom(text: 'Add a Task',
               onPressed: () 
               {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => AddTasksScreen(),));
                 
               }
               ),
            ),
          ],
        ),
      ),
    );
  }
}
