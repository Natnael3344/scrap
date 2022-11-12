import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
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
    final databasePaper = FirebaseDatabase.instance.ref().child("Confirmation").child("paper");
    databasePaper.once().then((event) {
      Map  dataSnapshot = event.snapshot.value as Map;
      dataSnapshot.forEach((key, values){
        setState(() {
          paper.add(key);
          paperPrice.add(values);
        });
      });
    } );
    final databasePlastic = FirebaseDatabase.instance.ref().child("Confirmation").child("plastic");
    databasePlastic.once().then((event) {
      Map  dataSnapshot = event.snapshot.value as Map;
      dataSnapshot.forEach((key, values){
        setState(() {
          plastic.add(key);
          plasticPrice.add(values);
        });

      });
    } );
    final databaseMetals = FirebaseDatabase.instance.ref().child("Confirmation").child("metals");
    databaseMetals.once().then((event) {
      Map  dataSnapshot = event.snapshot.value as Map;

      dataSnapshot.forEach((key, values){
        setState(() {
          metals.add(key);
          metalsPrice.add(values);
        });
      });
    } );
    final databaseEwaste = FirebaseDatabase.instance.ref().child("Confirmation").child("ewaste");
    databaseEwaste.once().then((event) {
      Map  dataSnapshot = event.snapshot.value as Map;

      dataSnapshot.forEach((key, values){
        setState(() {
          ewaste.add(key);
          ewastePrice.add(values);
        });

      });
    } );
    final databaseOther = FirebaseDatabase.instance.ref().child("Confirmation").child("other");
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
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: const Text("Rate List"),
          backgroundColor: const Color.fromARGB(255,130,36,50),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(left: 20,top: 20),
                    child: Text("Paper",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                  ),

                  buildContainer(paper,paperPrice,paper.length),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(left: 20,top: 20),
                    child: Text("Plastic",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                  ),
                  buildContainer(plastic,plasticPrice,plastic.length),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(left: 20,top: 20),
                    child: Text("Metal",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                  ),
                  buildContainer(metals,metalsPrice,metals.length),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(left: 20,top: 20),
                    child: Text("E-Waste",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                  ),
                  buildContainer(ewaste,ewastePrice,ewaste.length),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(left: 20,top: 20),
                    child: Text("Other items",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
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
