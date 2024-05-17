import 'package:flutter/material.dart';
import 'package:student_data_app/screens/Home_page.dart';
import 'package:student_data_app/screens/PRofile_page.dart';
import 'package:student_data_app/screens/edit.dart';
import 'package:student_data_app/screens/splash.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: 'splashScreen',
    routes: {
      'splashScreen': (context) => const splashScreen(),
      '/': (context) => const HomePage(),
      'ProfilePage': (context) => const Profile_Page(),
      'EditPage': (context) => const Edit_page(),
    },
  ));
}
