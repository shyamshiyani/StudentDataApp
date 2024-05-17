import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Utils/global.dart';
import '../Utils/modal.dart';

class Edit_page extends StatefulWidget {
  const Edit_page({super.key});

  @override
  State<Edit_page> createState() => _Edit_pageState();
}

class _Edit_pageState extends State<Edit_page> {
  GlobalKey<FormState> studentKey = GlobalKey<FormState>();
  TextEditingController studentNameInfo = TextEditingController();
  TextEditingController studentStdInfo = TextEditingController();
  TextEditingController studentConInfo = TextEditingController();
  TextEditingController studentEmaInfo = TextEditingController();
  @override
  Widget build(BuildContext context) {
    Learner use = ModalRoute.of(context)!.settings.arguments as Learner;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Edit Profile"),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: studentKey,
          child: Column(
            children: [
              Stack(
                alignment: Alignment.topCenter,
                children: [
                  Container(
                    decoration: const BoxDecoration(
                      color: Colors.blueAccent,
                      borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(
                          30,
                        ),
                        bottomLeft: Radius.circular(
                          30,
                        ),
                      ),
                    ),
                    height: 150,
                    width: 384,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 30),
                    child: Container(
                      decoration: BoxDecoration(
                        boxShadow: const <BoxShadow>[
                          BoxShadow(
                              offset: Offset(-1, 1),
                              color: Colors.black26,
                              blurRadius: 10,
                              spreadRadius: 2)
                        ],
                        borderRadius: BorderRadius.circular(12),
                        color: Colors.white,
                      ),
                      height: MediaQuery.of(context).size.height / 2,
                      width: MediaQuery.of(context).size.width / 1.2,
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            SingleChildScrollView(
                              child: Column(
                                children: [
                                  CircleAvatar(
                                    backgroundImage:
                                        FileImage(File(use.savefile)),
                                    radius: 35,
                                  ),
                                  Row(
                                    children: [
                                      const Padding(
                                        padding: EdgeInsets.only(top: 10),
                                        child: Expanded(
                                          flex: 2,
                                          child: Text(
                                            "Name:",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 20),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        flex: 7,
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                            top: 8,
                                            right: 8,
                                          ),
                                          child: TextFormField(
                                            controller: studentNameInfo,
                                            onChanged: (val) {
                                              Global.fullName2 = val;
                                            },
                                            decoration: InputDecoration(
                                                border: OutlineInputBorder(),
                                                hintStyle: const TextStyle(
                                                    fontSize: 20),
                                                hintText: "${use.fullName}"),
                                            style: const TextStyle(
                                                fontSize: 22,
                                                color: Colors.black),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      const Padding(
                                        padding: EdgeInsets.only(top: 10),
                                        child: Expanded(
                                          flex: 2,
                                          child: Text(
                                            "GRID:",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 20),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        flex: 7,
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              top: 8, right: 8, left: 8),
                                          child: TextFormField(
                                            controller: studentStdInfo,
                                            onChanged: (val) {
                                              Global.id = val;
                                            },
                                            decoration: InputDecoration(
                                                border: OutlineInputBorder(),
                                                hintStyle: const TextStyle(
                                                    fontSize: 20),
                                                hintText: "${use.id}"),
                                            style: const TextStyle(
                                                fontSize: 22,
                                                color: Colors.black),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      const Padding(
                                        padding: EdgeInsets.only(top: 10),
                                        child: Expanded(
                                          flex: 2,
                                          child: Text(
                                            "Num:",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 20),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        flex: 7,
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              top: 8, right: 8, left: 8),
                                          child: TextFormField(
                                            controller: studentConInfo,
                                            onChanged: (val) {
                                              Global.mobielnumber = val;
                                            },
                                            decoration: InputDecoration(
                                                border: OutlineInputBorder(),
                                                hintStyle: const TextStyle(
                                                    fontSize: 20),
                                                hintText:
                                                    "${use.mobielnumber}"),
                                            style: const TextStyle(
                                                fontSize: 22,
                                                color: Colors.black),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      const Padding(
                                        padding: EdgeInsets.only(top: 10),
                                        child: Expanded(
                                          flex: 2,
                                          child: Text(
                                            "Email:",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 20),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        flex: 7,
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                            top: 8,
                                            right: 8,
                                          ),
                                          child: TextFormField(
                                            controller: studentEmaInfo,
                                            onChanged: (val) {
                                              Global.email = val;
                                            },
                                            decoration: InputDecoration(
                                                border: OutlineInputBorder(),
                                                hintStyle: const TextStyle(
                                                    fontSize: 20),
                                                hintText: "${use.email}"),
                                            style: const TextStyle(
                                                fontSize: 22,
                                                color: Colors.black),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.only(left: 20, right: 20),
                              child: Divider(),
                            ),
                            const Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Expanded(
                                  child: Padding(
                                    padding:
                                        EdgeInsets.only(left: 15, right: 15),
                                    child: Text(
                                      "I am student at Red & White MultiMedia Education,Now I am In Flutter Development Course.This is nice place to study and get knowledge about it filed.",
                                      style: TextStyle(
                                          fontSize: 12, color: Colors.grey),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            studentKey.currentState!.reset();
                            studentNameInfo.clear();
                            studentStdInfo.clear();
                            studentConInfo.clear();
                            studentEmaInfo.clear();
                            setState(() {});
                          },
                          child: Container(
                            margin: EdgeInsets.only(bottom: 5),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: Colors.blueAccent,
                              borderRadius: BorderRadius.circular(30),
                            ),
                            height: 50,
                            width: 360,
                            child: const Text(
                              "Clear",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            studentKey.currentState!.save();

                            setState(() {
                              Global.fullName = Global.fullName2;
                            });

                            print(use.fullName);
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                behavior: SnackBarBehavior.floating,
                                action: SnackBarAction(
                                  label: "View",
                                  onPressed: () {
                                    Navigator.of(context)
                                        .pushNamed('Profile_Page');
                                  },
                                  // textColor: primaryWhite,
                                ),
                                content: const Text(
                                  "Information Saved SuccessFully!!!",
                                ),
                              ),
                            );
                          },
                          child: Container(
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: Colors.blueAccent,
                              borderRadius: BorderRadius.circular(30),
                            ),
                            height: 50,
                            width: 360,
                            child: const Text(
                              "Add Changes",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
