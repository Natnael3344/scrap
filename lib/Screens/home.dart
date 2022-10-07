import 'dart:async';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:scrap/Screens/sell.dart';
import 'package:selectable_container/selectable_container.dart';
class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final Completer<GoogleMapController> _controller = Completer();
  bool _selected=false;
  bool _selected1=false;
  bool _selected2=false;
  bool _selected3=false;
  bool _selected4=false;
  bool _selected5=false;
  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  static const CameraPosition _kLake = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(37.43296265331129, -122.08832357078792),
      tilt: 59.440717697143555,
      zoom: 19.151926040649414);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home),label: "Home",backgroundColor: Color.fromARGB(255,130,36,50)),
          BottomNavigationBarItem(icon: Icon(Icons.history),label: "Activity"),
          BottomNavigationBarItem(icon: Icon(Icons.person),label: "Account"),
          BottomNavigationBarItem(icon: Icon(Icons.monetization_on_outlined),label: "Rate list"),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.all(15),
              height: 150,
              width: double.maxFinite,
              decoration: const BoxDecoration(color: Color.fromARGB(255,130,36,50),borderRadius: BorderRadius.all(Radius.circular(20))),
              child:  const Center(child: Text("What would you like to sell?",style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.bold),)),
            ),
            SizedBox(
              height: 275,
              child: GridView.count(
                crossAxisCount: 3,
                primary: false,
                padding: const EdgeInsets.all(15),
                crossAxisSpacing: 15,
                mainAxisSpacing: 15,
                children: [
                  Container(
                    height: 50,
                    width: 50,
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
                        children: [
                          Lottie.asset('assets/paper.json',height: 70),
                          const Text("Paper",style: TextStyle(color: Colors.white),),
                        ],
                      )),
                    ),
                  ),
                  Container(
                    height: 50,
                    width: 50,
                    decoration: const BoxDecoration(color:Color.fromARGB(255,130,36,50),borderRadius: BorderRadius.all(Radius.circular(10))),
                    child:  SelectableContainer(
                      selectedBorderColor: const Color.fromARGB(255,130,36,50),
                      selectedBackgroundColor: const Color.fromARGB(255,130,36,50),
                      unselectedBorderColor: Colors.white,
                      unselectedBackgroundColor: const Color.fromARGB(255,130,36,50),
                      borderSize: 0,
                      iconColor: const Color.fromARGB(255,130,36,50),
                      selected: _selected1,
                      onValueChanged: (newValue) {
                        setState(() {
                          _selected1 = newValue;
                        });
                      },
                      child: Center(child: Column(
                        children: [
                          Container(margin:const EdgeInsets.only(top:20,bottom: 10),child: Lottie.asset('assets/plastic.json',height: 40)),
                          const Text("Plastic",style: TextStyle(color: Colors.white),),
                        ],
                      )),
                    ),
                  ),
                  Container(
                    height: 50,
                    width: 50,
                    decoration: const BoxDecoration(color:Color.fromARGB(255,130,36,50),borderRadius: BorderRadius.all(Radius.circular(10))),
                    child:  SelectableContainer(
                      selectedBorderColor: const Color.fromARGB(255,130,36,50),
                      selectedBackgroundColor: const Color.fromARGB(255,130,36,50),
                      unselectedBorderColor: Colors.white,
                      unselectedBackgroundColor: const Color.fromARGB(255,130,36,50),
                      borderSize: 0,
                      iconColor: const Color.fromARGB(255,130,36,50),
                      selected: _selected2,
                      onValueChanged: (newValue) {
                        setState(() {
                          _selected2 = newValue;
                        });
                      },
                      child: Center(child: Column(
                        children: [
                          Container(margin:const EdgeInsets.only(top:10),child: Lottie.asset('assets/metal.json',height: 60)),
                          const Text("Metals",style: TextStyle(color: Colors.white),),
                        ],
                      )),
                    ),
                  ),
                  Container(
                    height: 50,
                    width: 50,
                    decoration: const BoxDecoration(color:Color.fromARGB(255,130,36,50),borderRadius: BorderRadius.all(Radius.circular(10))),
                    child:  SelectableContainer(
                      selectedBorderColor: const Color.fromARGB(255,130,36,50),
                      selectedBackgroundColor: const Color.fromARGB(255,130,36,50),
                      unselectedBorderColor: Colors.white,
                      unselectedBackgroundColor: const Color.fromARGB(255,130,36,50),
                      borderSize: 0,
                      iconColor: const Color.fromARGB(255,130,36,50),
                      selected: _selected4,
                      onValueChanged: (newValue) {
                        setState(() {
                          _selected4 = newValue;
                        });
                      },
                      child: Center(child: Column(
                        children: [
                          Container(margin:const EdgeInsets.only(top:10),child: Lottie.asset('assets/ewaste.json',height: 60,width: 50)),
                          const Text("E-Waste",style: TextStyle(color: Colors.white),),
                        ],
                      )),
                    ),
                  ),
                  Container(
                    height: 50,
                    width: 50,
                    decoration: const BoxDecoration(color:Color.fromARGB(255,130,36,50),borderRadius: BorderRadius.all(Radius.circular(10))),
                    child: SelectableContainer(
                      selectedBorderColor: const Color.fromARGB(255,130,36,50),
                      selectedBackgroundColor: const Color.fromARGB(255,130,36,50),
                      unselectedBorderColor: Colors.white,
                      unselectedBackgroundColor: const Color.fromARGB(255,130,36,50),
                      borderSize: 0,
                      iconColor: const Color.fromARGB(255,130,36,50),
                      selected: _selected5,
                      onValueChanged: (newValue) {
                        setState(() {
                          _selected5 = newValue;
                        });
                      },
                      child: Center(child: Column(
                        children: [
                          Container(margin:const EdgeInsets.only(top:10),child: Lottie.asset('assets/other.json',height: 60)),
                         const Text("Other items",style: TextStyle(color: Colors.white),),
                        ],
                      )),
                    ),
                  )
                ],
              ),
            ),
            Row(
              children: [
                Container(
                  margin: const EdgeInsets.only(right: 15,left: 15),
                  width: 300,
                  child:   const TextField(
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.search,color: Colors.white,),
                      hintText: "Pick up address....",
                      labelStyle: TextStyle(color: Colors.white),
                      hintStyle: TextStyle(color: Colors.white),
                      fillColor: Color.fromARGB(255,130,36,50),
                      filled: true,
                      border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(30)))
                    ),
                  ),
                ),
                IconButton(onPressed: (){

                  Navigator.push(context, MaterialPageRoute (
                    builder: (BuildContext context) => const Sell(),
                  ),
                  );
                },
                    icon: const Icon(Icons.send,color: Color.fromARGB(255,130,36,50),)),
              ],
            ),

            Container(
              margin: const EdgeInsets.only(left: 15,right: 15,bottom: 15,top: 15),
              height: 150,
              child: GoogleMap(
                mapType: MapType.hybrid,
                initialCameraPosition: _kGooglePlex,
                onMapCreated: (GoogleMapController controller) {
                  _controller.complete(controller);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
