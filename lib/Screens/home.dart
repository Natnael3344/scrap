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
    return SafeArea(
      child: Scaffold(
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
                    buildContainer(selected: _selected,title: "Paper",
                    onValueChanged: (newValue) {
                      setState(() {
                        _selected = newValue;
                      });
                    }
                    ),
                    buildContainer(selected: _selected1,title: "Plastic",
                        onValueChanged: (newValue) {
                          setState(() {
                            _selected1 = newValue;
                          });
                        }
                    ),
                    buildContainer(selected: _selected2,title: "Metal",
                        onValueChanged: (newValue) {
                          setState(() {
                            _selected2 = newValue;
                          });
                        }
                    ),
                    buildContainer(selected: _selected3,title: "E-Waste",
                        onValueChanged: (newValue) {
                          setState(() {
                            _selected3 = newValue;
                          });
                        }
                    ),
                    buildContainer(selected: _selected4,title: "Other items",
                        onValueChanged: (newValue) {
                          setState(() {
                            _selected4 = newValue;
                          });
                        }
                    ),
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
                    if(_selected||_selected1||_selected2||_selected3||_selected4) {
                      Navigator.push(context, MaterialPageRoute(
                        builder: (BuildContext context) =>
                            Sell(selected1: _selected1,
                              selected2: _selected2,
                              selected3: _selected3,
                              selected4: _selected4,
                              selected: _selected,),
                      ),
                      );
                    }
                  },
                      icon:  Icon(Icons.send,color: _selected||_selected1||_selected2||_selected3||_selected4?const Color.fromARGB(255,130,36,50):const Color.fromARGB(100,130,36,50),)),
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
      ),
    );
  }

  Container buildContainer({required bool selected, required String title,required void Function(bool) onValueChanged}) {
    return Container(
                    height: 50,
                    width: 50,
                    decoration: const BoxDecoration(color:Color.fromARGB(255,130,36,50),borderRadius: BorderRadius.all(Radius.circular(10))),
                    child: SelectableContainer(
                      selectedBorderColor: const Color.fromARGB(255,130,36,50),
                      selectedBackgroundColor: const Color.fromARGB(255,130,36,50),
                      unselectedBorderColor: Colors.white,
                      unselectedBackgroundColor: const Color.fromARGB(255,130,36,50),
                      unselectedOpacity: 1,
                      borderSize: 0,
                      iconColor: const Color.fromARGB(255,130,36,50),
                      selected: selected,
                      onValueChanged: onValueChanged,
                     child:  Center(child: Column(
                        children: [
                          // Lottie.asset('assets/paper.json',height: 70),
                           Text(title,style: const TextStyle(color: Colors.white),),
                        ],
                      )),
                    ),
                  );
  }
}
