import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:student_data_app/Utils/global.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  GlobalKey<FormState> studentKey = GlobalKey<FormState>();
  TextEditingController studentNameInfo = TextEditingController();
  TextEditingController studentStdInfo = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        leading: GestureDetector(
          onTap: () {
            showDialog(
              context: context,
              builder: (BuildContext) {
                return AlertDialog(
                  content: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            Navigator.of(context).pushNamed('ProfilePage');
                          });
                        },
                        child: Container(
                          alignment: Alignment.center,
                          height: 80,
                          width: 320,
                          decoration: BoxDecoration(
                              color: Colors.blue,
                              borderRadius: BorderRadius.circular(12)),
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              CircleAvatar(
                                radius: 25,
                              ),
                              Text(
                                "Student Name",
                                style: TextStyle(
                                    fontSize: 20, color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                  title: const Text("All Student Details"),
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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
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
                          height: MediaQuery.of(context).size.height / 4.2,
                          width: MediaQuery.of(context).size.width / 1.2,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const CircleAvatar(
                                radius: 35,
                                child: Icon(Icons.add),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 88, right: 80),
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
                                  decoration: const InputDecoration(
                                    hintText: "Enter student name",
                                  ),
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 88, right: 80),
                                child: TextFormField(
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
                                  decoration: const InputDecoration(
                                    hintText: "Enter student id",
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height / 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        Row(
                          children: [
                            Container(
                              child: const Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  CircleAvatar(
                                    child: Icon(
                                      Icons.menu_book,
                                      size: 35,
                                    ),
                                    radius: 28,
                                  ),
                                  Text("Syllabus"),
                                ],
                              ),
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
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            Container(
                              child: const Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  CircleAvatar(
                                    child: Icon(
                                      Icons.date_range,
                                      size: 35,
                                    ),
                                    radius: 28,
                                  ),
                                  Text("Attendence"),
                                ],
                              ),
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
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            Container(
                              child: const Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  CircleAvatar(
                                    child: Icon(
                                      Icons.pending_actions_rounded,
                                      size: 35,
                                    ),
                                    radius: 28,
                                  ),
                                  Text("Home Work"),
                                ],
                              ),
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
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            Container(
                              child: const Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  CircleAvatar(
                                    child: Icon(
                                      Icons.find_in_page,
                                      size: 35,
                                    ),
                                    radius: 28,
                                  ),
                                  Text("Result"),
                                ],
                              ),
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
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 12, left: 12, bottom: 12),
                    child: Text(
                      "Teachers",
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ],
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(
                        left: 18,
                      ),
                      height: 50,
                      width: 50,
                      color: Colors.grey,
                    ),
                    Container(
                      margin: const EdgeInsets.only(
                        left: 18,
                      ),
                      height: 50,
                      width: 50,
                      color: Colors.grey,
                    ),
                    Container(
                      margin: const EdgeInsets.only(
                        left: 18,
                      ),
                      height: 50,
                      width: 50,
                      color: Colors.grey,
                    ),
                    Container(
                      margin: const EdgeInsets.only(
                        left: 18,
                      ),
                      height: 50,
                      width: 50,
                      color: Colors.grey,
                    ),
                    Container(
                      margin: const EdgeInsets.only(
                        left: 18,
                      ),
                      height: 50,
                      width: 50,
                      color: Colors.grey,
                    ),
                    Container(
                      margin: const EdgeInsets.only(
                        left: 18,
                      ),
                      height: 50,
                      width: 50,
                      color: Colors.grey,
                    ),
                    Container(
                      margin: const EdgeInsets.only(
                        left: 18,
                      ),
                      height: 50,
                      width: 50,
                      color: Colors.grey,
                    ),
                    Container(
                      margin: const EdgeInsets.only(
                        left: 18,
                      ),
                      height: 50,
                      width: 50,
                      color: Colors.grey,
                    ),
                    Container(
                      margin: const EdgeInsets.only(
                        left: 18,
                      ),
                      height: 50,
                      width: 50,
                      color: Colors.grey,
                    ),
                    Container(
                      margin: const EdgeInsets.only(
                        left: 18,
                      ),
                      height: 50,
                      width: 50,
                      color: Colors.grey,
                    ),
                    Container(
                      margin: const EdgeInsets.only(
                        left: 18,
                      ),
                      height: 50,
                      width: 50,
                      color: Colors.grey,
                    ),
                    Container(
                      margin: const EdgeInsets.only(
                        left: 18,
                      ),
                      height: 50,
                      width: 50,
                      color: Colors.grey,
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      if (studentKey.currentState!.validate()) {
                        studentKey.currentState!.save();

                        Global.allData.add(TextEditingController());
                        studentKey.currentState!.reset();
                        studentNameInfo.clear();
                        studentStdInfo.clear();
                        print(Global.allData);
                      }
                    },
                    child: Container(
                      alignment: Alignment.center,
                      margin: const EdgeInsets.only(top: 24, bottom: 10),
                      decoration: BoxDecoration(
                        color: Colors.blueAccent,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      height: 50,
                      width: 360,
                      child: const Text(
                        "Add Student Data ",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
