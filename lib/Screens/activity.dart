import 'package:flutter/material.dart';

class Activity extends StatefulWidget {
  const Activity({Key? key}) : super(key: key);

  @override
  State<Activity> createState() => _ActivityState();
}

class _ActivityState extends State<Activity> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            title: const Text("Request history"),
            backgroundColor: const Color.fromARGB(255,130,36,50),
          ),
          body: const Center(
            child: Text("Activity"),
          ),
    ));
  }
}
