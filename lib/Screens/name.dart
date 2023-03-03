import 'dart:convert';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'home_page.dart';

class Name extends StatefulWidget {
  const Name({Key? key, required this.phone}) : super(key: key);
  final String phone;
  @override
  State<Name> createState() => _NameState();
}

class _NameState extends State<Name> {
  final _formKey = GlobalKey<FormState>();
  bool check = false; //  to check checkbox
  String? selectedValue; // selected value for dropdown menu
 TextEditingController fName=TextEditingController();
 TextEditingController lName= TextEditingController();
 TextEditingController email= TextEditingController();

  late DatabaseReference _ref;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _ref = FirebaseDatabase.instance.ref().child("Customers").child(widget.phone).child('Profile');
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: Container(
          width: double.maxFinite,
          margin: const EdgeInsets.all(20),
          height: 50,
          child: ElevatedButton(
              style: ButtonStyle(backgroundColor: MaterialStateProperty.all(const Color.fromARGB(255,130,36,50))
              ),
              onPressed: (){
                if (_formKey.currentState!.validate()) {
                  ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Processing Data....')));
                  saveConfirmation();
                  // log();
                }
                // Navigator.push(context,
                //   MaterialPageRoute (
                //     builder: (BuildContext context) =>     Money(phone: widget.phone, priceItems: widget.priceItems, date: widget.date, address: widget.address,),
                //   ),
                // );

              },
              child: Container(margin: const EdgeInsets.only(left: 20,right: 20),child: const Text("Sign up",style: TextStyle(fontSize: 16),))),
        ),
        body: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                 Padding(
                  padding: const EdgeInsets.only(top: 75,bottom: 75),
                  child: Text("Sign_up".tr,style: const TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
                ),


                textField(
                        (value) {
                      if (value!.isEmpty) {
                        return "name is empty";
                      }
                      return null;
                    },
                        (val) {
                          fName.text=val;
                    }, TextEditingController(text: fName.text), "First_name".tr,
                    "Enter_first".tr, keyboard: TextInputType.name),
                textField(
                        (value) {
                      if (value!.isEmpty) {
                        return "name is empty";
                      }
                      return null;
                    },
                        (val) {
                          lName.text=val;
                    }, TextEditingController(text: lName.text), "Last_name".tr,
                    "Enter_last".tr, keyboard: TextInputType.name),
                // Email
            textField(
                    (value) {
                  if (value!.isEmpty) {
                    return "email is empty";
                  }
                  return null;
                },
                    (val) {
                      email.text=val;
                }, TextEditingController(text: email.text), "Email".tr,
                "Enter_Email".tr, keyboard: TextInputType.emailAddress),
                // Password


                // submit button

              ],
            ),
          ),

        ),
      ),
    );
  }

  Padding textField(String?Function(String?) validator,
      Function(String) onChanged, TextEditingController controller,
      String labelText, String hintText,
      {GestureDetector? icon, TextInputType? keyboard, bool? cover, String? use}) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: TextFormField(
        obscureText: cover ?? false,
        keyboardType: keyboard,
        controller: controller,
        onChanged: onChanged,

        validator: validator,
        decoration: InputDecoration(
          contentPadding:
          const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          labelText: labelText,
          hintText: hintText,
          errorMaxLines: 2,
          hintStyle: const TextStyle(fontSize: 14),
          suffix: icon,
          floatingLabelBehavior: FloatingLabelBehavior.always,
        ),
      ),
    );
  }
  void saveConfirmation() {

    Map<String, dynamic> save = {
      'First name': fName.text,
      'Last name':  lName.text,
      'email':      email.text,
    };

    _ref.set(save).then((value) {
      // if(select==true||select1==true||select2==true||select3==true) {
        Navigator.push(context,
          MaterialPageRoute(
              builder: (context) =>  HomePage(phone: widget.phone,)),);
      // }
    });
  }
}
