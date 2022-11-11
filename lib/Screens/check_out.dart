import 'dart:io';

import 'package:checkout_screen_ui/checkout_page.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:scrap/Screens/money.dart';

class CheckOut extends StatefulWidget {
  const CheckOut({Key? key, required this.priceItems, required this.date, required this.phone}) : super(key: key);
  final String phone;
  final List<PriceItem> priceItems;
  final String date;
  @override
  State<CheckOut> createState() => _CheckOutState();
}

class _CheckOutState extends State<CheckOut> {
  late DatabaseReference _ref;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _ref = FirebaseDatabase.instance.ref().child('Confirmation');
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Confirmation"),
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
              saveConfirmation();

            },
            child: Container(margin: const EdgeInsets.only(left: 20,right: 20),child: const Text("Confirm",style: TextStyle(fontSize: 16),))),
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
              children: const [
                Padding(
                  padding: EdgeInsets.only(left: 20,top: 20),
                  child: Text("Address - Home",style: TextStyle(fontWeight: FontWeight.bold),),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 20,top: 20),
                  child: Text("1, Tulsi vihar, Jaitala, 440035, Nagpur"),
                )
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children:  [
                const Padding(
                  padding: EdgeInsets.only(left: 20,top: 20),
                  child: Text("Phone number",style: TextStyle(fontWeight: FontWeight.bold),),
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
                const Padding(
                  padding: EdgeInsets.only(left: 20,top: 20),
                  child: Text("Pickup date",style: TextStyle(fontWeight: FontWeight.bold),),
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
  void saveConfirmation() {
    // List items = widget.priceItems.toList();
    String address = "1, Tulsi vihar, Jaitala, 440035, Nagpur";
    String phone=widget.phone;
    String date=widget.date;
    List<String> name=[];
    List<String> price=[];
    List<dynamic> item() {
      for (var item in widget.priceItems) {
        name.add(item.name);
      }
      return name.toList();
    }
    print(item);

    List<dynamic> item1() {
      for (var item in widget.priceItems) {
        price.add(item.price);
      }
      return price.toList();
    }
    print(item1());
    Map<String, dynamic> save = {
      'name': item(),
      'price': item1(),
      'address':  address,
      'phone': phone,
      'date': date,
    };

    _ref.child(widget.phone).set(save).then((value) {
      Navigator.push(context,
        MaterialPageRoute (
          builder: (BuildContext context) =>     Money(phone: widget.phone,),
        ),
      );
    });
  }
}
