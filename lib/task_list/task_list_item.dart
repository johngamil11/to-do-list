import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:new_todo_list/app_color.dart';

import '../model/task.dart';

class TaskListItem extends StatelessWidget {
  Task task;

  TaskListItem({required this.task});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return  Container(
      margin: EdgeInsets.all(8),
      child: Slidable(
        // The start action pane is the one at the left or the top side.
        startActionPane: ActionPane(
          extentRatio: 0.25,
          // A motion is a widget used to control how the pane animates.
          motion: const StretchMotion(),

          children:  [
            SlidableAction(
              borderRadius: BorderRadius.circular(15),

              onPressed: (context){},
              backgroundColor: AppColor.redColor,
              foregroundColor: Colors.white,
              icon: Icons.delete,
              label: 'Delete',

            ),
            // SlidableAction(
            //   onPressed: (context){},
            //   backgroundColor: AppColor.greenColor,
            //   foregroundColor: Colors.white,
            //   icon: Icons.edit,
            //   label: 'Edit',
            // ),
          ],
        ),
        endActionPane:  ActionPane(
          extentRatio: 0.25,
          motion: ScrollMotion(),
          children: [
            SlidableAction(
              borderRadius: BorderRadius.circular(15),
              onPressed: (context){},
              backgroundColor: Color(0xFF7BC043),
              foregroundColor: Colors.white,
              icon: Icons.edit,
              label: 'Edit',
            ),

          ],
        ),
        child:

        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: AppColor.whiteColor,
          ),
          child: Row(

            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                margin: EdgeInsets.all(12),
                color: AppColor.primaryAppColor,
                height: height*0.1,
                width: width*0.01,
              ),
              Expanded(child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    task.title,
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        color: AppColor.primaryAppColor,
                    fontSize: 22
                  ),),
                  Text(task.description,
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium
                          ?.copyWith(fontSize: 16
                  )),
                ],
              )),
              Container(
                margin: EdgeInsets.all(10),
                padding: EdgeInsets.symmetric(horizontal: 8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: AppColor.primaryAppColor,
                ),
                child: IconButton(onPressed: (){},
                    icon: Icon(Icons.check, color: AppColor.whiteColor, size: 35,)),
              ),


            ],
          ),
        ),
      ),
    );
  }
}
