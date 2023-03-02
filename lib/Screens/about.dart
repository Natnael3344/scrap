import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class About extends StatefulWidget {
  const About({Key? key,}) : super(key: key);

  @override
  State<About> createState() => _AboutState();
}

class _AboutState extends State<About> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text("About".tr),
        backgroundColor: const Color.fromARGB(255,130,36,50),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children:  [
            Center(child: Container(
                padding: const EdgeInsets.only(top: 20,bottom: 40),
                child:  Text("doorstep".tr, style: const TextStyle(fontSize: 16,fontWeight: FontWeight.bold),))),

          ],
        ),
      ),
    );
  }

}
