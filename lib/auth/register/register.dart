import 'package:flutter/material.dart';
import 'package:new_todo_list/app_color.dart';
import 'package:new_todo_list/auth/register/custom_text_form_field.dart';

class Register extends StatelessWidget {
static const String routeName = 'register_screen' ;

TextEditingController nameController = TextEditingController();
  TextEditingController emilController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  var formKey = GlobalKey<FormState>();
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
            title: Text(
              'Create Account',
              style: TextStyle(color: AppColor.whiteColor),
            ),
            centerTitle: true,

          ),
          body: Form(
              key: formKey,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.25,
                    ),
                    CustomTextFormField(
                      label: 'User Name',
                      controller: nameController,
                      keyboard: TextInputType.number,
                      validator: (text) {
                        if (text == null || text.trim().isEmpty) {
                          return 'Please Enter User Name';
                        }
                        return null;
                      },
                    ),
                    CustomTextFormField(
                      label: 'Emil',
                      controller: emilController,
                      keyboard: TextInputType.emailAddress,
                      validator: (text) {
                        if (text == null || text.trim().isEmpty) {
                          return 'Please Enter Emil';
                        }
                        final bool emailValid = RegExp(
                                r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                            .hasMatch(text);
                        if (!emailValid) {
                          return 'Please enter valid emil';
                        }
                        return null;
                      },
                    ),
                    CustomTextFormField(
                      label: 'Password',
                      obscure: true,
                      controller: passwordController,
                      keyboard: TextInputType.text,
                      validator: (text) {
                        if (text == null || text.trim().isEmpty) {
                          return 'Please Enter Password';
                        }
                        if (text.length < 6) {
                          return 'password should be at least 6 chars';
                        }
                        return null;
                      },
                    ),
                    CustomTextFormField(
                      label: 'Confirm Password',
                      obscure: true,
                      controller: confirmPasswordController,
                      keyboard: TextInputType.text,
                      validator: (text) {
                        if (text == null || text.trim().isEmpty) {
                          return 'Please Enter Confirm passeord';
                        }
                        if (text != passwordController.text) {
                          return "confirm password doesn't match password.";
                        }
                        return null;
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ElevatedButton(
                          onPressed: () {
                            register();
                          },
                          style: ElevatedButton.styleFrom(
                              backgroundColor: AppColor.primaryAppColor),
                          child: Text(
                            'Create Account',
                            style: Theme.of(context).textTheme.titleLarge,
                          )),
                    )
                  ],
                ),
              )),
        )
      ],
    );
  }

void register() {
    if (formKey.currentState?.validate() == true) {}
  }
}
