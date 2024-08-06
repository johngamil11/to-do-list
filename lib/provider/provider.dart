import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../firebase_utils.dart';
import '../model/task.dart';

class ListProvider extends ChangeNotifier {
  List<Task> tasksList = [];
  DateTime selectDate = DateTime.now();

  void getAllTasksFromFireStore() async {
    QuerySnapshot<Task> querySnapshot =
        await FirebaseUtils.getTasksCollection().get();
// List<QueryDocumentSnapshot<Task>>
    tasksList = querySnapshot.docs.map((doc) {
      return doc.data();
    }).toList();

    /// task list sorting = filter 

   tasksList  = tasksList.where((task){
      if (selectDate.day == task.dateTime.day &&
      selectDate.month == task.dateTime.month &&
      selectDate.year == task.dateTime.year
      ){return true ;
      } return false ;
    }).toList();


   tasksList.sort((Task task1 , Task task2){
     return task1.dateTime.compareTo(task2.dateTime);
    });

    notifyListeners();
  }

  void changeSelectDate (DateTime newSelectTime){
    selectDate = newSelectTime ;
    getAllTasksFromFireStore();
    notifyListeners();
  }


}
