import 'package:flutter/material.dart';
import 'package:new_todo_list/app_color.dart';
import 'package:new_todo_list/settings/settings.dart';
import 'package:new_todo_list/task_list/add_task_bottom_sheet.dart';
import 'package:new_todo_list/task_list/task_list_tab.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = 'home_screen';
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0 ;

  @override
  Widget build(BuildContext context) {

    return  Scaffold(
      appBar:AppBar(
         toolbarHeight: MediaQuery.of(context).size.height*0.20,
        backgroundColor: AppColor.primaryAppColor,
        title: Text('To Do List' , style: Theme.of(context).textTheme.titleLarge,),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add ,size: 35, color: AppColor.whiteColor,),
          onPressed: (){
          showAddTaskBottomSheet();
          },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        padding: EdgeInsets.only(bottom: MediaQuery.of(context).size.height*0.001),
        shape: CircularNotchedRectangle(),
        notchMargin: 8,
        child: BottomNavigationBar(
          currentIndex: selectedIndex,
          onTap: (index){
            selectedIndex = index ;
            setState(() {

            });

          },
          items: [
          BottomNavigationBarItem(icon: Icon(Icons.list, size: 35, ), label: 'List' ),
          BottomNavigationBarItem(icon: Icon(Icons.settings , size: 35, ), label: 'settings'),
        ],),
      ),
      body:
          Column(
            children: [
              // Container(
              //   height: MediaQuery.of(context).size.height*0.15,
              //   color: AppColor.primaryAppColor,
              // ),
              Expanded(child: tabs[selectedIndex]),

            ],
          ),

    );
  }
  List<Widget>tabs= [TaskListTab(),Settings()];

  void showAddTaskBottomSheet() {
    showModalBottomSheet(context: context,
        builder: (context) => AddTaskBottomSheet());
  }
}
