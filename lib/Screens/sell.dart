import 'package:checkout_screen_ui/checkout_page.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_multi_select_items/flutter_multi_select_items.dart';
import 'package:get/get.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:scrap/Screens/cameras.dart';
import 'package:scrap/database.dart';

import 'check_out.dart';

class Sell extends StatefulWidget {
  const Sell({Key? key, required this.selected, required this.selected1, required this.selected2, required this.selected3, required this.selected4, required this.phone, required this.address}) : super(key: key);
  final String phone;
  final String address;
  final bool selected;
  final bool selected1;
  final bool selected2;
  final bool selected3;
  final bool selected4;
  @override
  State<Sell> createState() => _SellState();
}

class _SellState extends State<Sell> {


  final List<PriceItem> _priceItems = [

  ];
  bool _select=false;


  Database database=Database();
  dynamic data;
  List paper=[];
  List paperPrice=[];
  List plastic=[];
  List plasticPrice=[];
  List metals=[];
  List metalsPrice=[];
  List ewaste=[];
  List ewastePrice=[];
  List other=[];
  List otherPrice=[];

  void readData() {
    final databasePaper = FirebaseDatabase.instance.ref().child("Confirmation".tr).child("paper".tr);
    databasePaper.once().then((event) {
      Map  dataSnapshot = event.snapshot.value as Map;
      dataSnapshot.forEach((key, values){
        setState(() {
          paper.add(key);
          paperPrice.add(values);
        });
      });
    } );
    final databasePlastic = FirebaseDatabase.instance.ref().child("Confirmation".tr).child("plastic".tr);
    databasePlastic.once().then((event) {
      Map  dataSnapshot = event.snapshot.value as Map;
      dataSnapshot.forEach((key, values){
        setState(() {
          plastic.add(key);
          plasticPrice.add(values);
        });

      });
    } );
    final databaseMetals = FirebaseDatabase.instance.ref().child("Confirmation".tr).child("metals".tr);
    databaseMetals.once().then((event) {
      Map  dataSnapshot = event.snapshot.value as Map;

      dataSnapshot.forEach((key, values){
        setState(() {
          metals.add(key);
          metalsPrice.add(values);
        });
      });
    } );
    final databaseEwaste = FirebaseDatabase.instance.ref().child("Confirmation".tr).child("ewaste".tr);
    databaseEwaste.once().then((event) {
      Map  dataSnapshot = event.snapshot.value as Map;

      dataSnapshot.forEach((key, values){
        setState(() {
          ewaste.add(key);
          ewastePrice.add(values);
        });

      });
    } );
    final databaseOther = FirebaseDatabase.instance.ref().child("Confirmation".tr).child("other".tr);
    databaseOther.once().then((event) {
      Map  dataSnapshot = event.snapshot.value as Map;
      dataSnapshot.forEach((key, values){
        setState(() {
          other.add(key);
          otherPrice.add(values);
        });

      });
    } );
  }

  @override
  initState() {
    super.initState();
    readData();
  }
  @override
  Widget build(BuildContext context) {
    return other.isEmpty||paper.isEmpty||plastic.isEmpty||metals.isEmpty||ewaste.isEmpty? const SafeArea(
      child: Scaffold(
          backgroundColor: Colors.white,
          // appBar: AppBar(
          // title: Text(indicator.toString().split('.').last),
          // ),
          body: Padding(
            padding: EdgeInsets.all(125),
            child: Center(
                child: LoadingIndicator(
                    indicatorType: Indicator.lineScalePulseOut,
                    colors: [
                      Color.fromARGB(255,130,36,50),
                    ],
                    strokeWidth: 0.5,
                    backgroundColor: Colors.white,
                    pathBackgroundColor: Colors.white
                )
            ),
          )
      ),
    ):SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title:  Text("Sell_Scrap".tr),
          backgroundColor: const Color.fromARGB(255,130,36,50),
        ),
        bottomNavigationBar: Container(
          width: double.maxFinite,
          margin: const EdgeInsets.all(20),
          height: 50,
          child: ElevatedButton(
              style: ButtonStyle(backgroundColor: _priceItems.isNotEmpty?MaterialStateProperty.all(const Color.fromARGB(255,130,36,50)):MaterialStateProperty.all(const Color.fromARGB(100,130,36,50))
              ),
              onPressed: (){
                if(_priceItems.isNotEmpty) {
                  Navigator.push(context,
                    MaterialPageRoute(
                        builder: (BuildContext context) =>
                        // const PickDate()
                            // CheckOut(priceItems: _priceItems)
                       TakePictureScreen(picture: const [],priceItems: _priceItems,phone: widget.phone, address: widget.address,),
                    ),
                  );

                }
              },
              child: Container(margin: const EdgeInsets.only(left: 20,right: 20),child:  Text("continue".tr,style: const TextStyle(fontSize: 18,fontWeight: FontWeight.bold),))),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              widget.selected?Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                   Padding(
                    padding: const EdgeInsets.only(left: 20,top: 20),
                    child: Text("Paper".tr,style: const TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                  ),

                  buildContainer(paper,paperPrice,paper.length),
                ],
              ):const SizedBox(),
              widget.selected1?Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                   Padding(
                    padding: const EdgeInsets.only(left: 20,top: 20),
                    child: Text("Plastic".tr,style: const TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                  ),
                  buildContainer(plastic,plasticPrice,plastic.length),
                ],
              ):const SizedBox(),
              widget.selected2?Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                   Padding(
                    padding: const EdgeInsets.only(left: 20,top: 20),
                    child: Text("Metal".tr,style: const TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                  ),
                  buildContainer(metals,metalsPrice,metals.length),
                ],
              ):const SizedBox(),
              widget.selected3?Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                   Padding(
                    padding: const EdgeInsets.only(left: 20,top: 20),
                    child: Text("E_waste".tr,style: const TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                  ),
                  buildContainer(ewaste,ewastePrice,ewaste.length),
                ],
              ):const SizedBox(),
              widget.selected4?Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                   Padding(
                    padding: const EdgeInsets.only(left: 20,top: 20),
                    child: Text("Other_items".tr,style: const TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                  ),
                  buildContainer(other,otherPrice,other.length),
                ],
              ):const SizedBox(),

            ],
          ),
        ),
      ),
    );
  }

  Container buildContainer(List<dynamic> value,  List<dynamic> price,int? itemCount) {
    return Container(
                height: 60,
                  width:  double.maxFinite,
                  margin: const EdgeInsets.all(20),
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: itemCount,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(right: 20),
                        child: MultiSelectContainer(
                            itemsDecoration: MultiSelectDecorations(
                              decoration: BoxDecoration(
                                  gradient: LinearGradient(colors: [
                                    const Color.fromARGB(255,130,36,50).withOpacity(0.1),
                                    Colors.yellow.withOpacity(0.1),
                                  ]),
                                  border: Border.all(color: const Color.fromARGB(255,130,36,50)),
                                  borderRadius: BorderRadius.circular(20)),
                              selectedDecoration: BoxDecoration(
                                  gradient: const LinearGradient(colors: [
                                    Color.fromARGB(255,130,36,50),
                                    Color.fromARGB(255,130,36,50)
                                  ]),
                                  border: Border.all(color: const Color.fromARGB(255,130,36,50)),
                                  borderRadius: BorderRadius.circular(5)),
                              disabledDecoration: BoxDecoration(
                                  color: Colors.grey,
                                  border: Border.all(color: Colors.grey[500]!),
                                  borderRadius: BorderRadius.circular(10)),
                            ),
                            items: [
                              MultiSelectCard(value: value[index],
                                  child: SizedBox(
                                height: 50,
                                width: 150,
                                child: Center(child: Column(
                                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Text(value[index],style: const TextStyle(fontWeight: FontWeight.bold)),
                                            Text('${'₹'+price[index]}/kg'),
                                          ],
                                        )),
                              )),
                            ],
                            onChange: (allSelectedItems, selectedItem) {
                              for(int i=0;i<allSelectedItems.length;i++){
                                print(allSelectedItems.toList());
                              }
                              if(allSelectedItems.contains(selectedItem)) {
                                setState(() {
                                  _priceItems.add(PriceItem(name: value[index],
                                      quantity: 1,
                                      totalPriceCents: int.parse(
                                          price[index])));
                                }
                                );
                              }
                              else{
                                setState(() {
                                  _priceItems.removeWhere((item) =>
                                  item.name == value[index]);
                                }
                                );
                                }
                            }),
                      );

                    }),
              );
  }
  }
