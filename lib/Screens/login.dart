import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'otp.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255,130,36,50),
        title: const Text("Login/Sign Up",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(children: [
            Container(
              margin: const EdgeInsets.only(top: 60),
              child:  Center(
                child: Text(
                  'Enter_phone_number'.tr,
                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 28),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 40, right: 10, left: 10),
              child: TextField(
                cursorColor: const Color.fromARGB(255,130,36,50),
                decoration:  InputDecoration(
                  focusedBorder: const UnderlineInputBorder(borderSide: BorderSide(color:  Color.fromARGB(255,130,36,50))),
                  hintText: 'Phone_Number'.tr,
                  prefix: const Padding(
                    padding: EdgeInsets.all(4),
                    child: Text('+91'),
                  ),
                ),
                maxLength: 10,
                keyboardType: TextInputType.number,
                controller: _controller,
              ),
            )
          ]),
          Container(
            width: double.maxFinite,
            margin: const EdgeInsets.all(20),
            height: 50,
            child: ElevatedButton(
                style: ButtonStyle(backgroundColor: MaterialStateProperty.all(const Color.fromARGB(255,130,36,50))
                ),
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => OTPScreen(_controller.text)));
                },
                child: Container(margin: const EdgeInsets.only(left: 20,right: 20),child:  Text("Next".tr,style: const TextStyle(fontSize: 18,fontWeight: FontWeight.bold),))),
          )
        ],
      ),
    );
  }
}
