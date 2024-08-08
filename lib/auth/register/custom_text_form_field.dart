import 'package:flutter/material.dart';
import 'package:new_todo_list/app_color.dart';

typedef myValidator = String? Function(String?)?;

class CustomTextFormField extends StatelessWidget {
  String label;

  myValidator validator;

  TextEditingController controller;

  TextInputType keyboard;

  bool obscure;

  CustomTextFormField(
      {required this.label,
      required this.validator,
      required this.controller,
      this.keyboard = TextInputType.text,
      this.obscure = false});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
          decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide(
                color: AppColor.primaryAppColor
                    ,width: 2
              )
            ),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide(
                    color: AppColor.primaryAppColor
                    ,width: 2
                )
            ),
            focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide(
                    color: AppColor.primaryAppColor
                    ,width: 2
                )
            ),
            labelText: label,
            labelStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        validator: validator,
        controller: controller,
        keyboardType: keyboard,
        obscureText: obscure,
      ),
    );

  }}