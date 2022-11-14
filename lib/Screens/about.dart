import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

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
        title: const Text("About"),
        backgroundColor: const Color.fromARGB(255,130,36,50),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children:  [
            Center(child: Container(
                padding: const EdgeInsets.only(top: 20,bottom: 40),
                child: const Text("Scrapify is a doorstep service\nintends to help out people to sell their\nhousehold scrap like Newspaper, iron,\nplastic books, copies, metal etc. and get\npaid for it.\n\nIt is intended to recycle, reuse, reduce up-\ncycle and resell the scrap.It is a platform\nfor the residents to participate in\nresponsible waste management and is\nbest in class technology, logistics to\nprocess the scrap.", style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),))),

          ],
        ),
      ),
    );
  }

}
