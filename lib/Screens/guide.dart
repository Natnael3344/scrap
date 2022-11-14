import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

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
        title: const Text("How it works?"),
        backgroundColor: const Color.fromARGB(255,130,36,50),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children:  [
            Center(child: Container(
                padding: const EdgeInsets.only(top: 20,bottom: 40),
                child: const Text("Sell your scrap in 4 easy steps", style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),))),
            const ListTile(
              leading: Text('1.',style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
              title: Text('Select scrap items for selling',style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
              subtitle: Text('we collect scrap from wide list of\nitems like Newspaper, iron, Electronic\nmachine, Beer Bottle etc. we do not\npick up cloth, wood and glass',style: TextStyle(fontSize: 15),),
            ),

            Container(
              padding: const EdgeInsets.only(top: 30),
              child: const ListTile(
                leading: Text('2.',style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
                title: Text('Choose a date for scrap pickup',style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
                subtitle: Text('Choose a date when you want our\nexecutives to come for scrap pickup.\nYou can book a request for the next\nday. Our pickup time will be between\n10 am to 6 pm.',style: TextStyle(fontSize: 15),),
              ),
            ),

            Container(
              padding: const EdgeInsets.only(top: 30),
              child: const ListTile(
                leading: Text('3.',style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
                title: Text('On the scheduled day',style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
                subtitle: Text('Our pickup executives will call you 1\nhour before coming. They will bring an\nelectronic machine to weigh each\nscrap item separately.',style: TextStyle(fontSize: 15),),
              ),
            ),

            Container(
              padding: const EdgeInsets.only(top: 30,bottom: 30),
              child: const ListTile(
                leading: Text('4.',style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
                title: Text('Scrap sold :)',style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
                subtitle: Text('You will get a bill on your mobile and\nthe amount will be transferred to your\nbank account immediately. The rates\nare non-negotiable, please check the\nrates before booking a pickup request.',style: TextStyle(fontSize: 15),),
              ),
            ),
          ],
        ),
      ),
    );
  }

}
