import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:student_data_app/Utils/modal.dart';

class Profile_Page extends StatefulWidget {
  const Profile_Page({super.key});

  @override
  State<Profile_Page> createState() => _Profile_PageState();
}

class _Profile_PageState extends State<Profile_Page> {
  @override
  Widget build(BuildContext context) {
    Learner lar = ModalRoute.of(context)!.settings.arguments as Learner;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        leading: GestureDetector(
          onTap: () {
            Navigator.of(context).pop('/');
          },
          child: const Icon(
            Icons.arrow_back,
            size: 30,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        title: const Text(
          "PROFILE",
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: IconButton(
              onPressed: () {
                Navigator.of(context).pushNamed('EditPage', arguments: lar);
              },
              icon: Icon(Icons.edit),
            ),
          ),
        ],
      ),
      body: Column(
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
                      height: MediaQuery.of(context).size.height / 3,
                      width: MediaQuery.of(context).size.width / 1.2,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(
                            children: [
                              CircleAvatar(
                                backgroundImage: FileImage(File(lar.savefile)),
                                radius: 35,
                              ),
                              Text(
                                lar.fullName,
                                style: const TextStyle(
                                    fontSize: 22, color: Colors.black),
                              ),
                              Text(
                                lar.id,
                                style: const TextStyle(color: Colors.grey),
                              ),
                            ],
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
                                  padding: EdgeInsets.only(left: 15, right: 15),
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
                ],
              ),
            ],
          ),
          Padding(
            padding:
                EdgeInsets.only(top: MediaQuery.of(context).size.height / 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 280),
                      child: Container(
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
                        height: 100,
                        width: 340,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 15, left: 12, right: 12),
                              child: Row(
                                children: [
                                  const Padding(
                                    padding: EdgeInsets.only(right: 12),
                                    child: Icon(Icons.call),
                                  ),
                                  Text(
                                    lar.mobielnumber,
                                    style: const TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 12, right: 12, bottom: 15),
                              child: Row(
                                children: [
                                  const Padding(
                                    padding: EdgeInsets.only(right: 12),
                                    child: Icon(Icons.email),
                                  ),
                                  Text(
                                    lar.email,
                                    style: const TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
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
          ),
        ],
      ),
    );
  }
}
