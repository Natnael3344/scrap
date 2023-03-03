import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:scrap/database.dart';

class Rate extends StatefulWidget {
  const Rate({Key? key}) : super(key: key);

  @override
  State<Rate> createState() => _RateState();
}

class _RateState extends State<Rate> {
  Database database=Database();
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
  void initState() {
    // TODO: implement initState
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
          automaticallyImplyLeading: false,
          title:  Text("Rate_list".tr),
          backgroundColor: const Color.fromARGB(255,130,36,50),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                   Padding(
                    padding: const EdgeInsets.only(left: 20,top: 20),
                    child: Text("Paper".tr,style: const TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                  ),

                  buildContainer(paper,paperPrice,paper.length),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                   Padding(
                    padding: const EdgeInsets.only(left: 20,top: 20),
                    child: Text("Plastic".tr,style: const TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                  ),
                  buildContainer(plastic,plasticPrice,plastic.length),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                   Padding(
                    padding: const EdgeInsets.only(left: 20,top: 20),
                    child: Text("Metal".tr,style: const TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                  ),
                  buildContainer(metals,metalsPrice,metals.length),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                   Padding(
                    padding: const EdgeInsets.only(left: 20,top: 20),
                    child: Text("E_waste".tr,style: const TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                  ),
                  buildContainer(ewaste,ewastePrice,ewaste.length),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                   Padding(
                    padding: const EdgeInsets.only(left: 20,top: 20),
                    child: Text("Other_items".tr,style: const TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                  ),
                  buildContainer(other,otherPrice,other.length),
                ],
              ),

            ],
          ),
        ),
      ),
    );
  }

  Container buildContainer(dynamic value,  dynamic price,int? itemCount) {
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
              child: Container(
                    decoration: BoxDecoration(
                        gradient: LinearGradient(colors: [
                          const Color.fromARGB(255,130,36,50).withOpacity(0.1),
                          Colors.yellow.withOpacity(0.1),
                        ]),
                        border: Border.all(color: const Color.fromARGB(255,130,36,50)),
                        borderRadius: BorderRadius.circular(20)),
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
            );

          }),
    );
  }
}
