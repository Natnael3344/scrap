import 'package:flutter/material.dart';
import 'package:scrap/database.dart';

class Rate extends StatefulWidget {
  const Rate({Key? key}) : super(key: key);

  @override
  State<Rate> createState() => _RateState();
}

class _RateState extends State<Rate> {
  Database database=Database();
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

                  buildContainer(database.paper,database.paperPrice,database.paper.length),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(left: 20,top: 20),
                    child: Text("Plastic",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                  ),
                  buildContainer(database.plastic,database.plasticPrice,database.plastic.length),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(left: 20,top: 20),
                    child: Text("Metal",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                  ),
                  buildContainer(database.metals,database.metalsPrice,database.metals.length),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(left: 20,top: 20),
                    child: Text("E-Waste",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                  ),
                  buildContainer(database.ewaste,database.ewastePrice,database.ewaste.length),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(left: 20,top: 20),
                    child: Text("Other items",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                  ),
                  buildContainer(database.other,database.otherPrice,database.other.length),
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
