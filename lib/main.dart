import 'package:flutter/material.dart';
import 'package:student_data_app/screens/Home_page.dart';
import 'package:student_data_app/screens/PRofile_page.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    routes: {
      '/': (context) => const HomePage(),
      'ProfilePage': (context) => const Profile_Page(),
    },
  ));
}
