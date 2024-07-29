import 'package:flutter/material.dart';
import 'package:new_todo_list/app_color.dart';

class Settings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(10),
          child: Text('Language' ,style:  Theme.of(context).textTheme.titleMedium?.copyWith(fontSize: 18) ),
        ),
        Container(
          margin: EdgeInsets.only(right: 10 , left: 10 , top: 10 , bottom: 5),
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: AppColor.whiteColor,
            border: Border.all(color: AppColor.primaryAppColor)

          ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('English' , style: Theme.of(context).textTheme.titleMedium?.copyWith(color: AppColor.primaryAppColor),),
            Icon(Icons.arrow_drop_down , size: 35,color: AppColor.primaryAppColor,)
          ],
        ),
        )
      ],
    );

  }
}
