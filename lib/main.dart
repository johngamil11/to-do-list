import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:new_todo_list/auth/login/login.dart';
import 'package:new_todo_list/auth/register/register.dart';
import 'package:new_todo_list/my%20theme%20data.dart';
import 'package:new_todo_list/provider/app_config_provider.dart';
import 'package:new_todo_list/provider/provider.dart';
import 'package:provider/provider.dart';

import 'hom_screen.dart';

void main()async{
  WidgetsFlutterBinding.ensureInitialized();
  Platform.isAndroid
      ? await Firebase.initializeApp(
          options: const FirebaseOptions(
              apiKey: 'AIzaSyAnfYLKYSwIn7dRZXKKCjQAmzBDGVlGCXo',
              appId: 'com.example.new_todo_list',
              messagingSenderId: '583458705425',
              projectId: 'todo-app-bb341'))
      : await Firebase.initializeApp();
  await FirebaseFirestore.instance.disableNetwork();
  FirebaseFirestore.instance.settings =
      const Settings(cacheSizeBytes: Settings.CACHE_SIZE_UNLIMITED);
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (context) => ListProvider()),
    ChangeNotifierProvider(create: (context) => AppConfigProvider()),
  ], child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var appConfigProvider = Provider.of<AppConfigProvider>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: MyThemeData.lightTheme,
      darkTheme: MyThemeData.darkTheme,
      themeMode: appConfigProvider.appTheme,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      locale: Locale(appConfigProvider.appLanguage),
      initialRoute: Login.routeName,
      routes: {
        HomeScreen.routeName: (context) => HomeScreen(),
        Register.routeName: (context) => Register(),
        Login.routeName: (context) => Login(),
      },
    );
  }
}
