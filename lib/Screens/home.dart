import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_multi_select_items/flutter_multi_select_items.dart';
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
                height: 240,
                child: MultiSelectContainer(
                  itemsPadding: const EdgeInsets.only(left: 4,right: 4,top: 10,bottom: 10),
                  itemsDecoration: MultiSelectDecorations(
                    decoration: BoxDecoration(
                      border: Border.all(color: const Color.fromARGB(255,130,36,50)),
                      gradient: LinearGradient(colors: [
                        const Color.fromARGB(255,130,36,50).withOpacity(0.1),
                        Colors.yellow.withOpacity(0.1),
                      ]),
                    ),
                    selectedDecoration:   BoxDecoration(
                      border: Border.all(color: const Color.fromARGB(255,130,36,50)),
                      gradient:  const LinearGradient(colors: [
                        Color.fromARGB(255,130,36,50),
                        Color.fromARGB(255,130,36,50)
                      ]),
                       ),
                  ),
                items:

                [

                  MultiSelectCard(
                    value: 'Paper',
                    child: getChild(
                        'http://assets.stickpng.com/images/5848152fcef1014c0b5e4967.png',
                        'Paper'),
                  ),
                  MultiSelectCard(
                    value: 'Plastic',
                    child: getChild(
                        'http://assets.stickpng.com/images/58480979cef1014c0b5e4901.png',
                        'Plastic'),
                  ),
                  MultiSelectCard(
                    value: 'Metal',

                      child: getChild(
                          'https://upload.wikimedia.org/wikipedia/commons/thumb/9/99/Unofficial_JavaScript_logo_2.svg/480px-Unofficial_JavaScript_logo_2.svg.png',
                          'Metal'),
                  ),
                  MultiSelectCard(
                    value: 'E-waste',
                    child: getChild(
                        'https://seeklogo.com/images/C/c-sharp-c-logo-02F17714BA-seeklogo.com.png',
                        'E-waste'),
                  ),
                  MultiSelectCard(
                    value: 'Other items',
                    child: getChild(
                        'https://cdn.freebiesupply.com/logos/thumbs/2x/c-logo.png',
                        'Other items'),
                  ),
                    // buildContainer(selected: _selected,title: "Paper",
                    // onValueChanged: (newValue) {
                    //   setState(() {
                    //     _selected = newValue;
                    //   });
                    // }
                    // ),
                    // buildContainer(selected: _selected1,title: "Plastic",
                    //     onValueChanged: (newValue) {
                    //       setState(() {
                    //         _selected1 = newValue;
                    //       });
                    //     }
                    // ),
                    // buildContainer(selected: _selected2,title: "Metal",
                    //     onValueChanged: (newValue) {
                    //       setState(() {
                    //         _selected2 = newValue;
                    //       });
                    //     }
                    // ),
                    // buildContainer(selected: _selected3,title: "E-Waste",
                    //     onValueChanged: (newValue) {
                    //       setState(() {
                    //         _selected3 = newValue;
                    //       });
                    //     }
                    // ),
                    // buildContainer(selected: _selected4,title: "Other items",
                    //     onValueChanged: (newValue) {
                    //       setState(() {
                    //         _selected4 = newValue;
                    //       });
                    //     }
                    // ),
                  ],
                onChange: (List<String> selectedItems, String selectedItem) {

                    if(selectedItems.contains("Paper"))
                      {
                      setState(() {
                      _selected = true;
                    }
                      );
                    }
                    if(!selectedItems.contains("Paper")){
                      setState(() {
                        _selected = false;
                      }
                      );
                    }
                    if(selectedItems.contains("Plastic")){
                      setState(() {
                        _selected1 = true;
                      }
                      );
                    }
                    if(!selectedItems.contains("Plastic")){
                      setState(() {
                        _selected1 = false;
                      }
                      );
                    }
                    if(selectedItems.contains("Metal")){
                      setState(() {
                        _selected2 = true;
                      }
                      );
                    }
                    if(!selectedItems.contains("Metal")){
                      setState(() {
                        _selected2 = false;
                      }
                      );
                    }
                    if(selectedItems.contains("E-waste")){
                      setState(() {
                        _selected3 = true;
                      }
                      );
                    }
                    if(!selectedItems.contains("E-waste")){
                      setState(() {
                        _selected3 = false;
                      }
                      );
                    }
                    if(selectedItems.contains("Other items")){
                      setState(() {
                        _selected4 = true;
                      }
                      );
                    }
                    if(!selectedItems.contains("Other items")){
                      setState(() {
                        _selected4 = false;
                      }
                      );
                    }
                },
                )),
              Row(
                children: [
                  Container(
                    margin: const EdgeInsets.only(right: 15,left: 15),
                    width: 300,
                    decoration: BoxDecoration(
                        borderRadius: const BorderRadius.all(Radius.circular(30)),
                      gradient:LinearGradient(colors: [
                      const Color.fromARGB(255,130,36,50).withOpacity(0.1),
                      Colors.yellow.withOpacity(0.1),
                    ]),),
                    child:    const TextField(
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.search,color: Colors.black,),
                        hintText: "Pick up address....",
                        labelStyle: TextStyle(color: Colors.black),
                        hintStyle: TextStyle(color: Colors.black),

                        filled: true,
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Color.fromARGB(255,130,36,50)),
                            borderRadius: BorderRadius.all(Radius.circular(30)))
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

  // Container buildContainer({required bool selected, required String title,required void Function(bool) onValueChanged}) {
  //   return Container(
  //                   height: 50,
  //                   width: 50,
  //                   decoration: const BoxDecoration(color:Color.fromARGB(255,130,36,50),borderRadius: BorderRadius.all(Radius.circular(10))),
  //                   child: SelectableContainer(
  //                     selectedBorderColor: const Color.fromARGB(255,130,36,50),
  //                     selectedBackgroundColor: const Color.fromARGB(255,130,36,50),
  //                     unselectedBorderColor: Colors.white,
  //                     unselectedBackgroundColor: const Color.fromARGB(255,130,36,50),
  //                     unselectedOpacity: 1,
  //                     borderSize: 0,
  //                     iconColor: const Color.fromARGB(255,130,36,50),
  //                     selected: selected,
  //                     onValueChanged: onValueChanged,
  //                    child:  Center(child: Column(
  //                       children: [
  //                         // Lottie.asset('assets/paper.json',height: 70),
  //                          Text(title,style: const TextStyle(color: Colors.white),),
  //                       ],
  //                     )),
  //                   ),
  //                 );
  // }
  Widget getChild(String imagePath, String title) {
    return SizedBox(
      width: 100,
      height: 80,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
              child: Image.network(
                imagePath,
                fit: BoxFit.contain,
              )),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(title),
          )
        ],
      ),
    );
  }
}
