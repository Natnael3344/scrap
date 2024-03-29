import 'dart:io';

import 'package:checkout_screen_ui/checkout_page.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:scrap/Screens/money.dart';

class Profile extends StatefulWidget {
  final String phone;
  const Profile({Key? key, required this.phone,}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {

  List profile=[];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    readData();
  }
  @override
  Widget build(BuildContext context) {
    return profile.isEmpty?const SafeArea(
      child: Scaffold(
          backgroundColor: Colors.white,
          // appBar: AppBar(
          // title: Text(indicator.toString().split('.').last),
          // ),
          body: Padding(
            padding: EdgeInsets.all(125),
            child: Center(
                child: LoadingIndicator(
                    indicatorType: Indicator.lineScalePulseOut,
                    colors: [
                      Color.fromARGB(255,130,36,50),
                    ],
                    strokeWidth: 0.5,
                    backgroundColor: Colors.white,
                    pathBackgroundColor: Colors.white
                )
            ),
          )
      ),
    ):SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title:  Text("Profile".tr),
          backgroundColor: const Color.fromARGB(255,130,36,50),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children:  [
                   Padding(
                    padding: const EdgeInsets.only(left: 20,top: 20),
                    child: Text("Name".tr,style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 25),),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20,top: 20),
                    child: Text("${profile[0]} ${profile[1]}",style: const TextStyle(fontSize: 20),),
                  )
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children:  [
                   Padding(
                    padding: const EdgeInsets.only(left: 20,top: 20),
                    child: Text("Mobile_Number".tr,style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 25),),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20,top: 20),
                    child: Text(widget.phone,style: const TextStyle(fontSize: 20),),
                  )
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children:  [
                   Padding(
                    padding: const EdgeInsets.only(left: 20,top: 20),
                    child: Text("Email".tr,style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 25),),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20,top: 20),
                    child: Text(profile[2].toString(),style: const TextStyle(fontSize: 20),),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
  void readData() {
    final databasePaper = FirebaseDatabase.instance.ref()
        .child("Customers")
        .child(widget.phone).child("Profile");
    databasePaper.once().then((event) {
      Map dataSnapshot = event.snapshot.value as Map;
      dataSnapshot.forEach((key, values) {
        setState(() {
          profile.add(values);
        });
      });
    });
  }
}
