import 'package:flutter/material.dart';
import 'package:new_todo_list/firebase_utils.dart';
import 'package:new_todo_list/model/task.dart';
import 'package:provider/provider.dart';

import '../provider/provider.dart';

class AddTaskBottomSheet extends StatefulWidget {
  @override
  State<AddTaskBottomSheet> createState() => _AddTaskBottomSheetState();
}

class _AddTaskBottomSheetState extends State<AddTaskBottomSheet> {
  var selectedDate = DateTime.now();
  var formkey = GlobalKey<FormState>();
  String title = '';
  String description = '';

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Center(
            child: Text(
          'Add new Task',
          style: Theme.of(context).textTheme.titleMedium,
        )),
        Form(
            key: formkey,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: TextFormField(
                    onChanged: (text) {
                      title = text;
                    },
                    validator: (text) {
                      if (text == null || text.isEmpty) {
                        return 'please enter task title';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                        hintText: 'Enter Task Title',
                        hintStyle: Theme.of(context).textTheme.titleSmall),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: TextFormField(
                    onChanged: (text) {
                      description = text;
                    },
                    validator: (text) {
                      if (text == null || text.isEmpty) {
                        return 'please enter task Description';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      hintText: 'Enter Task Description ',
                      hintStyle: Theme.of(context).textTheme.titleSmall,
                    ),
                    maxLines: 5,
                  ),
                ),
                Text(
                  'Select date',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                InkWell(
                    onTap: () {
                      showCalender();
                    },
                    child: Text(
                      '${selectedDate.day}/${selectedDate.month}/${selectedDate.year}',
                      style: Theme.of(context).textTheme.titleMedium,
                    )),
                ElevatedButton(
                    onPressed: () {
                      addTask();
                    },
                    child: Icon(Icons.check))
              ],
            )),
      ],
    );
  }

  void showCalender() async {
    var chosenDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime.now(),
        lastDate: DateTime.now().add(Duration(days: 365)));
    selectedDate = chosenDate ?? selectedDate;
    setState(() {});
  }

  void addTask() {
    // var listProvider = Provider.of<ListProvider>(context);
    if (formkey.currentState?.validate() == true) {
      //add task
      Task task =
          Task(title: title, description: description, dateTime: selectedDate);
      var listProvider = Provider.of<ListProvider>(context, listen: false);

      ///Provider.of<ListProvider>(context);

      FirebaseUtils.addTaskToFireStore(task).timeout(Duration(seconds: 1),
          onTimeout: () {
        print('Task added successfully');
        listProvider.getAllTasksFromFireStore();
        // ListProvider.getAllTasksFromFireStore();
        Navigator.pop(context);
      });
    }
  }
}
