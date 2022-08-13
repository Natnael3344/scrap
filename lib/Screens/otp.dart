import 'package:flutter/material.dart';
import 'package:scrap/Screens/home.dart';

class Otp extends StatelessWidget {
  const Otp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        titleSpacing: -10,
        iconTheme: const IconThemeData(color: Colors.black),
        title: const Text("Verify Phone Number",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black),),
        actions:  [
          Center(child: Container(margin: const EdgeInsets.only(right: 10),child: TextButton(onPressed: (){

          }, child: TextButton( onPressed: (){
            Navigator.push(context,
              MaterialPageRoute (
                builder: (BuildContext context) => const Home(),
              ),);
          },child: const Text("SUBMIT",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18,color: Colors.black),)))))
        ],
      ),
      body: Column(
        children: [
          Container(margin: const EdgeInsets.only(top: 20),child: const Text("Please enter the code sent to \n        +917028431151 ",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),)),
          Container(margin: const EdgeInsets.only(top: 40),child: const Text("ENTER VERIFICATION CODE",style: TextStyle(fontSize: 15,color:Colors.black38),)),
          Container(
            margin: const EdgeInsets.only(left: 30,right: 30,top: 40,bottom: 20),
            child: const TextField(

            ),
          ),
          const Text("Request new code",style: TextStyle(color: Colors.black38),)
        ],
      ),
    );
  }
}
