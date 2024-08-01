import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:new_todo_list/my%20theme%20data.dart';

import 'hom_screen.dart';

void main()async{
  WidgetsFlutterBinding.ensureInitialized();
  //await FirebaseFirestore.instance.disableNetwork();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: MyThemeData.lightTheme,
      darkTheme: MyThemeData.darkTheme,
      initialRoute: HomeScreen.routeName,
      routes: {
        HomeScreen.routeName: (context) => HomeScreen(),
      },
    );
  }
}
