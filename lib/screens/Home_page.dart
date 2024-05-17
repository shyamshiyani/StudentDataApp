import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:student_data_app/Utils/global.dart';
import 'package:student_data_app/Utils/modal.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  XFile? xFile;
  ImagePicker imagePicker = ImagePicker();
  String? path;
  GlobalKey<FormState> studentKey = GlobalKey<FormState>();
  TextEditingController studentNameInfo = TextEditingController();
  TextEditingController studentStdInfo = TextEditingController();
  TextEditingController studentConInfo = TextEditingController();
  TextEditingController studentEmaInfo = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        leading: GestureDetector(
          onTap: () {
            (Global.learners.isNotEmpty)
                ? showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            ...Global.learners.map(
                              (e) => GestureDetector(
                                onTap: () {
                                  setState(() {
                                    Navigator.of(context)
                                        .pushNamed('ProfilePage', arguments: e);
                                  });
                                },
                                child: Align(
                                  alignment: Alignment.center,
                                  child: Container(
                                    margin: const EdgeInsets.only(bottom: 10),
                                    height: 80,
                                    width: 320,
                                    decoration: BoxDecoration(
                                        color: Colors.blue,
                                        borderRadius:
                                            BorderRadius.circular(12)),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        CircleAvatar(
                                          backgroundImage:
                                              FileImage(File(e.savefile)),
                                          radius: 25,
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                              e.fullName,
                                              style: const TextStyle(
                                                  fontSize: 20,
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            const SizedBox(
                                              width: 100,
                                            ),
                                            GestureDetector(
                                              onTap: () {
                                                setState(() {
                                                  Global.learners.remove(e);
                                                });
                                              },
                                              child: const Icon(
                                                Icons.delete,
                                                color: Colors.white,
                                              ),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  )
                : showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return const AlertDialog(
                        content: Text("No Student Details"),
                      );
                    },
                  );
          },
          child: const Icon(
            Icons.list_outlined,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        title: const Text(
          "DASHBOARD",
          style: TextStyle(color: Colors.white),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Icon(
              Icons.notifications,
              color: Colors.white,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Form(
          key: studentKey,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Stack(
                      alignment: Alignment.topCenter,
                      children: [
                        Container(
                          alignment: Alignment.center,
                          decoration: const BoxDecoration(
                            color: Colors.blueAccent,
                            borderRadius: BorderRadius.only(
                              bottomRight: Radius.circular(30),
                              bottomLeft: Radius.circular(30),
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
                            height: MediaQuery.of(context).size.height / 2.5,
                            width: MediaQuery.of(context).size.width / 1.2,
                            child: SingleChildScrollView(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  GestureDetector(
                                      onTap: () {
                                        showDialog(
                                          context: context,
                                          builder: (BuildContext context) {
                                            return AlertDialog(
                                              title: const Text(
                                                "Pick Image",
                                              ),
                                              content: const Text(
                                                "Choose Image From Gallery or Camera",
                                              ),
                                              actions: [
                                                FloatingActionButton(
                                                  mini: true,
                                                  onPressed: () async {
                                                    xFile = await imagePicker
                                                        .pickImage(
                                                            source: ImageSource
                                                                .camera);
                                                    setState(() {
                                                      if (xFile != null) {
                                                        path = xFile!.path;
                                                      }
                                                      Navigator.of(context)
                                                          .pop();
                                                    });
                                                  },
                                                  elevation: 3,
                                                  child: const Icon(
                                                      Icons.camera_alt),
                                                ),
                                                FloatingActionButton(
                                                  mini: true,
                                                  onPressed: () async {
                                                    xFile = await imagePicker
                                                        .pickImage(
                                                            source: ImageSource
                                                                .gallery);
                                                    setState(() {
                                                      if (xFile != null) {
                                                        path = xFile!.path;
                                                      }
                                                      Navigator.of(context)
                                                          .pop();
                                                    });
                                                  },
                                                  elevation: 3,
                                                  child:
                                                      const Icon(Icons.image),
                                                )
                                              ],
                                            );
                                          },
                                        );
                                      },
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            top: 18, bottom: 12),
                                        child: Column(
                                          children: [
                                            CircleAvatar(
                                              backgroundImage: (path != null)
                                                  ? FileImage(File(path!))
                                                  : null,
                                              radius: 45,
                                              child: Icon((path == null)
                                                  ? Icons.add
                                                  : null),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 75, right: 75),
                                              child: TextFormField(
                                                validator: (val) {
                                                  if (val!.isEmpty) {
                                                    return "Enter the name First";
                                                  }
                                                  return null;
                                                },
                                                controller: studentNameInfo,
                                                onSaved: (val) {
                                                  Global.fullName = val!;
                                                },
                                                decoration:
                                                    const InputDecoration(
                                                  hintText:
                                                      "Enter student name",
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 75, right: 75),
                                              child: TextFormField(
                                                keyboardType:
                                                    TextInputType.number,
                                                validator: (val) {
                                                  if (val!.isEmpty) {
                                                    return "Enter the Standard First";
                                                  }
                                                  return null;
                                                },
                                                controller: studentStdInfo,
                                                onSaved: (val) {
                                                  Global.id = val!;
                                                },
                                                decoration:
                                                    const InputDecoration(
                                                  hintText: "Enter student id",
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 75, right: 75),
                                              child: TextFormField(
                                                keyboardType:
                                                    TextInputType.phone,
                                                validator: (val) {
                                                  if (val!.isEmpty) {
                                                    return "Enter the Contact Number First";
                                                  }
                                                  return null;
                                                },
                                                controller: studentConInfo,
                                                onSaved: (val) {
                                                  Global.mobielnumber = val!;
                                                },
                                                decoration:
                                                    const InputDecoration(
                                                  hintText:
                                                      "Enter Contact_number",
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 75, right: 75),
                                              child: TextFormField(
                                                keyboardType:
                                                    TextInputType.emailAddress,
                                                validator: (val) {
                                                  if (val!.isEmpty) {
                                                    return "Enter the Email First";
                                                  }
                                                  return null;
                                                },
                                                controller: studentEmaInfo,
                                                onSaved: (val) {
                                                  Global.email = val!;
                                                },
                                                decoration:
                                                    const InputDecoration(
                                                  hintText:
                                                      "Enter student Email",
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      )),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height / 30, bottom: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          Row(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    boxShadow: const <BoxShadow>[
                                      BoxShadow(
                                        color: Colors.black12,
                                        spreadRadius: 2,
                                        blurRadius: 10,
                                      ),
                                    ],
                                    borderRadius: BorderRadius.circular(8)),
                                height: 110,
                                width: 140,
                                child: const Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    CircleAvatar(
                                      radius: 28,
                                      child: Icon(
                                        Icons.menu_book,
                                        size: 35,
                                      ),
                                    ),
                                    Text("Syllabus"),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              Container(
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    boxShadow: const <BoxShadow>[
                                      BoxShadow(
                                        color: Colors.black12,
                                        spreadRadius: 2,
                                        blurRadius: 10,
                                      ),
                                    ],
                                    borderRadius: BorderRadius.circular(8)),
                                height: 110,
                                width: 140,
                                child: const Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    CircleAvatar(
                                      radius: 28,
                                      child: Icon(
                                        Icons.date_range,
                                        size: 35,
                                      ),
                                    ),
                                    Text("Attendance"),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    boxShadow: const <BoxShadow>[
                                      BoxShadow(
                                        color: Colors.black12,
                                        spreadRadius: 2,
                                        blurRadius: 10,
                                      ),
                                    ],
                                    borderRadius: BorderRadius.circular(8)),
                                height: 110,
                                width: 140,
                                child: const Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    CircleAvatar(
                                      radius: 28,
                                      child: Icon(
                                        Icons.pending_actions_rounded,
                                        size: 35,
                                      ),
                                    ),
                                    Text("Home Work"),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              Container(
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    boxShadow: const <BoxShadow>[
                                      BoxShadow(
                                        color: Colors.black12,
                                        spreadRadius: 2,
                                        blurRadius: 10,
                                      ),
                                    ],
                                    borderRadius: BorderRadius.circular(8)),
                                height: 110,
                                width: 140,
                                child: const Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    CircleAvatar(
                                      radius: 28,
                                      child: Icon(
                                        Icons.find_in_page,
                                        size: 35,
                                      ),
                                    ),
                                    Text("Result"),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
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

                              path = null;
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
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20),
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              if (studentKey.currentState!.validate() &&
                                  path != null) {
                                studentKey.currentState!.save();
                                Global.savefile = path!;

                                Learner learner = Learner(
                                    fullName2: Global.fullName2,
                                    id: Global.id,
                                    fullName: Global.fullName,
                                    mobielnumber: Global.mobielnumber,
                                    savefile: Global.savefile,
                                    email: Global.email);
                                studentKey.currentState!.reset();
                                studentNameInfo.clear();
                                studentStdInfo.clear();
                                studentConInfo.clear();
                                studentEmaInfo.clear();

                                Global.learners.add(learner);
                                path = null;
                                setState(() {});
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
                              }
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
                                "Add Student Data ",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20),
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
      ),
    );
  }
}
