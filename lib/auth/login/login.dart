import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:new_todo_list/app_color.dart';
import 'package:new_todo_list/auth/register/custom_text_form_field.dart';
import 'package:new_todo_list/auth/register/register.dart';

class Login extends StatelessWidget {
static const String routeName = 'login_screen' ;

  TextEditingController emilController = TextEditingController(text: 'Johngamil10@gmail.com');
  TextEditingController passwordController = TextEditingController(text: '123456');
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
              'Login In',
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
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('Welcome Back!', style: Theme.of(context).textTheme.titleMedium,),
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
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ElevatedButton(
                          onPressed: () {
                            login();
                          },
                          style: ElevatedButton.styleFrom(
                              backgroundColor: AppColor.primaryAppColor),
                          child: Text(
                            'Login In',
                            style: Theme.of(context).textTheme.titleLarge,
                          )),

                    ),
                    TextButton(onPressed: (){
                      Navigator.of(context).pushNamed(Register.routeName);
                    }, child: Text('OR Create Account'))

                  ],
                ),
              )),
        ),
      ],
    );
  }

void login() async {
    if (formKey.currentState?.validate() == true) {try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emilController.text,
          password: passwordController.text
      );
      print(credential.user?.uid ?? '');
      print('login successfully');
    }
    // on FirebaseAuthException catch (e) {
    //   if (e.code == 'user-not-found') {
    //     print('No user found for that email.');
    //   } else if (e.code == 'wrong-password') {
    //     print('Wrong password provided for that user.');
    //   }}
    catch(e){
        print(e.toString());
    }
    }}
  }

