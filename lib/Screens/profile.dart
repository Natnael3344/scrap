import 'dart:io';

import 'package:checkout_screen_ui/checkout_page.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:scrap/Screens/money.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key,}) : super(key: key);

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
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile"),
        backgroundColor: const Color.fromARGB(255,130,36,50),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children:  [
                const Padding(
                  padding: EdgeInsets.only(left: 20,top: 20),
                  child: Text("Name",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25),),
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
                const Padding(
                  padding: EdgeInsets.only(left: 20,top: 20),
                  child: Text("Mobile number",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25),),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20,top: 20),
                  child: Text("7028431151",style: const TextStyle(fontSize: 20),),
                )
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children:  [
                const Padding(
                  padding: EdgeInsets.only(left: 20,top: 20),
                  child: Text("Email",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25),),
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
    );
  }
  void readData() {
    final databasePaper = FirebaseDatabase.instance.ref()
        .child("Confirmation")
        .child("7028431151").child("Profile");
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
