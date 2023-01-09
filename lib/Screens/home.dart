import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_multi_select_items/flutter_multi_select_items.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:scrap/Screens/search.dart';
import 'package:scrap/Screens/sell.dart';

import '../generated/l10n.dart';

class Home extends StatefulWidget {
  final String phone;
  const Home({Key? key, required this.phone}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final _formKey = GlobalKey<FormState>();
  final Completer<GoogleMapController> _controller = Completer();
   bool _selected=false;
   bool _selected1=false;
   bool _selected2=false;
   bool _selected3=false;
   bool _selected4=false;
 TextEditingController controller=TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
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

        body: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.all(15),
                  height: 150,
                  width: double.maxFinite,
                  decoration: const BoxDecoration(color: Color.fromARGB(255,130,36,50),borderRadius: BorderRadius.all(Radius.circular(20))),
                  child:   Center(child:
                  Text(S.of(context).welcomeText,style: const TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.bold),),
                  // Text("What would you like to sell?",style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.bold),)
                  ),

                ),
                SizedBox(
                  height: 240,
                  child: MultiSelectContainer(
                    itemsPadding: const EdgeInsets.only(left: 5,right: 5,top: 10,bottom: 10),
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
                          'https://cdn-icons-png.flaticon.com/512/3073/3073464.png',
                          'Paper'),
                    ),
                    MultiSelectCard(
                      value: 'Plastic',
                      child: getChild(
                          'https://www.pngall.com/wp-content/uploads/5/Plastic-Bottle-PNG-Image.png',
                          'Plastic'),
                    ),
                    MultiSelectCard(
                      value: 'Metal',

                        child: getChild(
                            'https://www.pngall.com/wp-content/uploads/2018/03/Steel-PNG-File-Download-Free.png',
                            'Metal'),
                    ),
                    MultiSelectCard(
                      value: 'E-waste',
                      child: getChild(
                          'https://cdn-icons-png.flaticon.com/512/4380/4380451.png',
                          'E-waste'),
                    ),
                    MultiSelectCard(
                      value: 'Other items',
                      child: getChild(
                          'https://cdn-icons-png.flaticon.com/512/1327/1327264.png',
                          'Other items'),
                    ),

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
                      child:    TextFormField(
                        controller: controller,
                        validator: (value){
                          if (value!.isEmpty) {
                            return "address is empty";
                          }
                          return null;
                        },
                        decoration: const InputDecoration(
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
                        if(_formKey.currentState!.validate()) {
                          Navigator.push(context, MaterialPageRoute(
                            builder: (BuildContext context) =>
                                Sell(selected1: _selected1,
                                  selected2: _selected2,
                                  selected3: _selected3,
                                  selected4: _selected4,
                                  selected: _selected,
                                  phone: widget.phone,
                                  address: controller.text,
                                ),
                          ),
                          );
                        }
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
      ),
    );
  }



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
