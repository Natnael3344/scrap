import 'package:flutter/material.dart';
import 'package:scrap/Screens/cameras.dart';
import 'package:scrap/database.dart';
import 'package:selectable_container/selectable_container.dart';

class Sell extends StatefulWidget {
  const Sell({Key? key}) : super(key: key);

  @override
  State<Sell> createState() => _SellState();
}

class _SellState extends State<Sell> {
  bool _selected=false;
  Database database=Database();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sell scrap"),
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
                Container(
                  height: 100,
                  width:  double.maxFinite,
                  margin: const EdgeInsets.all(20),
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: database.paper.length,
                    itemBuilder: (context, index) {
                      return Container(
                        height: 50,
                        width: 150,
                        margin: const EdgeInsets.only(right: 20),
                        decoration: const BoxDecoration(color:Color.fromARGB(255,130,36,50),borderRadius: BorderRadius.all(Radius.circular(10))),
                        child: SelectableContainer(
                          selectedBorderColor: const Color.fromARGB(255,130,36,50),
                          selectedBackgroundColor: const Color.fromARGB(255,130,36,50),
                          unselectedBorderColor: Colors.white,
                          unselectedBackgroundColor: const Color.fromARGB(255,130,36,50),
                          borderSize: 0,
                          iconColor: const Color.fromARGB(255,130,36,50),
                          selected: _selected,
                          onValueChanged: (newValue) {
                            setState(() {
                              _selected = newValue;
                            });
                          },
                          child:  Center(child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(database.paper[index],style: const TextStyle(color: Colors.white,fontWeight: FontWeight.bold)),
                              Text('${'₹'+ database.paperPrice[index]}/kg',style: const TextStyle(color: Colors.white),),
                            ],
                          )),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: 20,top: 20),
                  child: Text("Plastic",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                ),
                Container(
                  height: 100,
                  width:  double.maxFinite,
                  margin: const EdgeInsets.all(20),
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: database.plastic.length,
                    itemBuilder: (context, index) {
                      return Container(
                        height: 50,
                        width: 150,
                        margin: const EdgeInsets.only(right: 20),
                        decoration: const BoxDecoration(color:Color.fromARGB(255,130,36,50),borderRadius: BorderRadius.all(Radius.circular(10))),
                        child: SelectableContainer(
                          selectedBorderColor: const Color.fromARGB(255,130,36,50),
                          selectedBackgroundColor: const Color.fromARGB(255,130,36,50),
                          unselectedBorderColor: Colors.white,
                          unselectedBackgroundColor: const Color.fromARGB(255,130,36,50),
                          borderSize: 0,
                          iconColor: const Color.fromARGB(255,130,36,50),
                          selected: _selected,
                          onValueChanged: (newValue) {
                            setState(() {
                              _selected = newValue;
                            });
                          },
                          child:  Center(child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(database.plastic[index],style: const TextStyle(color: Colors.white,fontWeight: FontWeight.bold)),
                              Text('${'₹'+ database.plasticPrice[index]}/kg',style: const TextStyle(color: Colors.white),),
                            ],
                          )),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: 20,top: 20),
                  child: Text("E-Waste",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                ),
                Container(
                  height: 100,
                  width:  double.maxFinite,
                  margin: const EdgeInsets.all(20),
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: database.ewaste.length,
                    itemBuilder: (context, index) {
                      return Container(
                        height: 50,
                        width: 150,
                        margin: const EdgeInsets.only(right: 20),
                        decoration: const BoxDecoration(color:Color.fromARGB(255,130,36,50),borderRadius: BorderRadius.all(Radius.circular(10))),
                        child: SelectableContainer(
                          selectedBorderColor: const Color.fromARGB(255,130,36,50),
                          selectedBackgroundColor: const Color.fromARGB(255,130,36,50),
                          unselectedBorderColor: Colors.white,
                          unselectedBackgroundColor: const Color.fromARGB(255,130,36,50),
                          borderSize: 0,
                          iconColor: const Color.fromARGB(255,130,36,50),
                          selected: _selected,
                          onValueChanged: (newValue) {
                            setState(() {
                              _selected = newValue;
                            });
                          },
                          child:  Center(child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(database.ewaste[index],style: const TextStyle(color: Colors.white,fontWeight: FontWeight.bold)),
                              Text('${'₹'+ database.ewastePrice[index]}/kg',style: const TextStyle(color: Colors.white),),
                            ],
                          )),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: 20,top: 20),
                  child: Text("Other items",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                ),
                Container(
                  height: 100,
                  width:  double.maxFinite,
                  margin: const EdgeInsets.all(20),
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: database.other.length,
                    itemBuilder: (context, index) {
                      return Container(
                        height: 50,
                        width: 150,
                        margin: const EdgeInsets.only(right: 20),
                        decoration: const BoxDecoration(color:Color.fromARGB(255,130,36,50),borderRadius: BorderRadius.all(Radius.circular(10))),
                        child: SelectableContainer(
                          selectedBorderColor: const Color.fromARGB(255,130,36,50),
                          selectedBackgroundColor: const Color.fromARGB(255,130,36,50),
                          unselectedBorderColor: Colors.white,
                          unselectedBackgroundColor: const Color.fromARGB(255,130,36,50),
                          borderSize: 0,
                          iconColor: const Color.fromARGB(255,130,36,50),
                          selected: _selected,
                          onValueChanged: (newValue) {
                            setState(() {
                              _selected = newValue;
                            });
                          },
                          child:  Center(child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(database.other[index],style: const TextStyle(color: Colors.white,fontWeight: FontWeight.bold)),
                              Text('${'₹'+ database.otherPrice[index]}/kg',style: const TextStyle(color: Colors.white),),
                            ],
                          )),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: 20,top: 20),
                  child: Text("Metals",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                ),
                Container(
                  height: 100,
                  width:  double.maxFinite,
                  margin: const EdgeInsets.all(20),
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: database.metals.length,
                    itemBuilder: (context, index) {
                      return Container(
                        height: 50,
                        width: 150,
                        margin: const EdgeInsets.only(right: 20),
                        decoration: const BoxDecoration(color:Color.fromARGB(255,130,36,50),borderRadius: BorderRadius.all(Radius.circular(10))),
                        child: SelectableContainer(
                          selectedBorderColor: const Color.fromARGB(255,130,36,50),
                          selectedBackgroundColor: const Color.fromARGB(255,130,36,50),
                          unselectedBorderColor: Colors.white,
                          unselectedBackgroundColor: const Color.fromARGB(255,130,36,50),
                          borderSize: 0,
                          iconColor: const Color.fromARGB(255,130,36,50),
                          selected: _selected,
                          onValueChanged: (newValue) {
                            setState(() {
                              _selected = newValue;
                            });
                          },
                          child:  Center(child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(database.metals[index],style: const TextStyle(color: Colors.white,fontWeight: FontWeight.bold)),
                              Text('${'₹'+ database.metalsPrice[index]}/kg',style: const TextStyle(color: Colors.white),),
                            ],
                          )),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
            Container(
              width: double.maxFinite,
              margin: const EdgeInsets.all(20),
              height: 50,
              child: ElevatedButton(
                  style: ButtonStyle(backgroundColor: MaterialStateProperty.all(const Color.fromARGB(255,130,36,50))
                  ),
                  onPressed: (){
                    Navigator.push(context,
                      MaterialPageRoute (
                        builder: (BuildContext context) =>   const TakePictureScreen(picture: []),
                      ),
                    );
                  },
                  child: Container(margin: const EdgeInsets.only(left: 20,right: 20),child: const Text("Continue",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),))),
            ),
          ],
        ),
      ),
    );
  }
}
