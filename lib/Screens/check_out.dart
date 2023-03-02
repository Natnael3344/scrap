import 'dart:io';

import 'package:checkout_screen_ui/checkout_page.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scrap/Screens/money.dart';

class CheckOut extends StatefulWidget {
  const CheckOut({Key? key, required this.priceItems, required this.date, required this.phone, required this.address}) : super(key: key);
  final String phone;
  final String address;
  final List<PriceItem> priceItems;
  final String date;
  @override
  State<CheckOut> createState() => _CheckOutState();
}

class _CheckOutState extends State<CheckOut> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text("Confirmation".tr),
        backgroundColor: const Color.fromARGB(255,130,36,50),
      ),
      bottomNavigationBar: Container(
        width: double.maxFinite,
        margin: const EdgeInsets.all(20),
        height: 50,
        child: ElevatedButton(
            style: ButtonStyle(backgroundColor: MaterialStateProperty.all(const Color.fromARGB(255,130,36,50))
            ),
            onPressed: (){
              Navigator.push(context,
                MaterialPageRoute (
                  builder: (BuildContext context) =>     Money(phone: widget.phone, priceItems: widget.priceItems, date: widget.date, address: widget.address,),
                ),
              );

            },
            child: Container(margin: const EdgeInsets.only(left: 20,right: 20),child:  Text("Confirm".tr,style: const TextStyle(fontSize: 16),))),
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
                  child: Text("Scrap items",style: TextStyle(fontWeight: FontWeight.bold),),
                ),
                Container(
                  padding: const EdgeInsets.only(left: 5),
                  child: ListView.builder(
                      itemCount: widget.priceItems.length,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                    return  ListTile(
                      title: Text(widget.priceItems[index].name),
                      trailing: Text('₹${widget.priceItems[index].price}/kg'),
                    );
                  }),
                )
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children:  [
                const Padding(
                  padding: EdgeInsets.only(left: 20,top: 20),
                  child: Text("Address - Home",style: TextStyle(fontWeight: FontWeight.bold),),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20,top: 20),
                  child: Text(widget.address),
                )
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children:  [
                 Padding(
                  padding: const EdgeInsets.only(left: 20,top: 20),
                  child: Text("Phone_Number".tr,style: const TextStyle(fontWeight: FontWeight.bold),),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20,top: 20),
                  child: Text(widget.phone),
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children:  [
                 Padding(
                  padding: const EdgeInsets.only(left: 20,top: 20),
                  child: Text("Pickup_date".tr,style: const TextStyle(fontWeight: FontWeight.bold),),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20,top: 20),
                  child: Text(widget.date),
                ),
              ],
            ),

          ],
        ),
      ),
    );
  }

}
