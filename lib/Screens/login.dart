import 'package:flutter/material.dart';

import 'otp.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        titleSpacing: -10,
        iconTheme: const IconThemeData(color: Colors.black),
        title: const Text("Login/Sign Up",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black),),
        actions:  [
          Center(child: Container(margin: const EdgeInsets.only(right: 10),child: TextButton(onPressed:(){
            Navigator.push(context, MaterialPageRoute (
              builder: (BuildContext context) => const Otp(),
            ),);
          },child: const Text("NEXT",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18,color: Colors.black),))))
        ],
      ),
      body: Column(
        children: [
          Container(margin: const EdgeInsets.only(top: 20),child: const Text("We will send you a code to verify your number.",style: TextStyle(fontSize: 15),)),
          Container(
            margin: const EdgeInsets.only(left: 10,right: 10,top: 40,bottom: 20),
            child: const TextField(
              decoration: InputDecoration(
                prefixIcon: Text("+91",style: TextStyle(fontSize: 18),),
                prefixIconConstraints: BoxConstraints(),
              ),
            ),
            ),
          const Text("Standard SMS fees may apply",style: TextStyle(color: Colors.black38),)
        ],
      ),
    );
  }
}
