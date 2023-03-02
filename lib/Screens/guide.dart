import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Guide extends StatefulWidget {
  const Guide({Key? key,}) : super(key: key);

  @override
  State<Guide> createState() => _GuideState();
}

class _GuideState extends State<Guide> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text("How_it_works?".tr),
        backgroundColor: const Color.fromARGB(255,130,36,50),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children:  [
            Center(child: Container(
                padding: const EdgeInsets.only(top: 20,bottom: 40),
                child:  Text("steps".tr, style: const TextStyle(fontSize: 25,fontWeight: FontWeight.bold),))),
             ListTile(
              leading: const Text('1.',style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
              title: Text('Select_items'.tr,style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
              subtitle: Text('collect'.tr,style: TextStyle(fontSize: 15),),
            ),

            Container(
              padding: const EdgeInsets.only(top: 30),
              child:  ListTile(
                leading: const Text('2.',style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
                title: Text('Choose_date'.tr,style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
                subtitle: Text('executives'.tr,style: const TextStyle(fontSize: 15),),
              ),
            ),

            Container(
              padding: const EdgeInsets.only(top: 30),
              child:  ListTile(
                leading: const Text('3.',style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
                title: Text('scheduled'.tr,style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
                subtitle: Text('pickup'.tr,style: const TextStyle(fontSize: 15),),
              ),
            ),

            Container(
              padding: const EdgeInsets.only(top: 30,bottom: 30),
              child:  ListTile(
                leading: const Text('4.',style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
                title: Text('sold'.tr,style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
                subtitle: Text('bill'.tr,style: const TextStyle(fontSize: 15),),
              ),
            ),
          ],
        ),
      ),
    );
  }

}
