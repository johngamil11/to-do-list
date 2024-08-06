import 'package:flutter/material.dart';
import 'package:new_todo_list/app_color.dart';
import 'package:new_todo_list/auth/register/custom_text_form_field.dart';

class Register extends StatelessWidget {
static const String routeName = 'register_screen' ;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
            color: AppColor.lightBackGround,
            child: Image.asset('assets/images/background.png' ,
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.fill,)),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar:
          AppBar(
            elevation: 0,
            backgroundColor: Colors.transparent,
            title: Text('Create Account'),
          centerTitle: true,

          ),
          body: Form(child: Column(
            children: [
              SizedBox(height: MediaQuery.of(context).size.height*0.25,),
              CustomTextFormField(),
              CustomTextFormField(),
              CustomTextFormField(),
              CustomTextFormField(),
            ],
          )),
        )
      ],
    );
  }
}
