
import 'dart:io';
import 'dart:math';
import 'package:checkout_screen_ui/checkout_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:scrap/Screens/date.dart';

import 'cameras.dart';


class Upload extends StatefulWidget {
  const Upload({Key? key, required this.picture, required this.priceItems, required this.phone, required this.address}) : super(key: key);
  final String phone;
  final String address;
  final List picture;
  final List<PriceItem> priceItems;
  @override
  State<Upload> createState() => _UploadState();
}

class _UploadState extends State<Upload> {
  int hide=0;
  Reference storage= FirebaseStorage.instance.ref();
  @override
  void initState() {
    storage= FirebaseStorage.instance.ref().child(widget.phone);
    hide=widget.picture.length;
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Upload scrap items' pictures"),
        backgroundColor: const Color.fromARGB(255,130,36,50),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
         const SizedBox(),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                height: 75,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: widget.picture.length,

                  itemBuilder: (context, index) {
                    return Container(
                      margin: const EdgeInsets.only(right: 20),
                      child: Stack(
                        children:[
                          ClipRRect(
                          borderRadius: const BorderRadius.all(Radius.circular(15)),
                              child: Image.file(File(widget.picture[index].path),
                                width: 75,
                                height: 75,
                                fit: BoxFit.fill,
                                // items[index]
                              ),
                        ),
                          Positioned(
                            right: -14,
                            top: -14,
                            child: IconButton(
                              onPressed: (){
                                setState((){
                                 widget.picture.removeAt(index);
                                 hide=widget.picture.length;
                                });
                              },
                              icon: const Icon(
                                Icons.cancel,
                                color: Colors.white,
                                size: 26,
                              ),
                            ),
                          ),
                      ]
                      ),
                    );
                  },
                ),
              ),

                  hide<3?Align(
                    child: Container(
                      width: 75,
                      height: 75,
                      decoration: BoxDecoration(
                        border: Border.all(color: const Color.fromARGB(255,130,36,50)),
                        borderRadius: const BorderRadius.all(Radius.circular(15)),
                      ),
                      child: Center(
                        child: IconButton(onPressed: (){
                          Navigator.push(context,
                            MaterialPageRoute (
                              builder: (BuildContext context) =>  TakePictureScreen(picture: widget.picture,priceItems: widget.priceItems, phone: widget.phone, address: widget.address,),
                            ),
                          );
                        },
                            icon: const Icon(Icons.add)),
                      ),
                    ),
                  ):const SizedBox()


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
                  for(int i=0;i<widget.picture.length;i++) {
                    uploadImage(File(widget.picture[i].path));
                  }
                  Navigator.push(context,
                    MaterialPageRoute (
                      builder: (BuildContext context) =>  PickDate(priceItems: widget.priceItems,phone: widget.phone, address: widget.address,),
                    ),
                  );
                },
                child: Container(margin: const EdgeInsets.only(left: 20,right: 20),child: const Text("Continue",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),))),
          ),
        ],
      ),
    );
  }

  uploadImage(img) async {
    // Initialize Firebase once again
    await Firebase.initializeApp();
    var random =  Random();
    var rand = random.nextInt(1000000000);
    // Give the image a random name
    String name = "image:$rand";
    try {
      await storage.child(name).putFile(img);
      // await FirebaseStorage.instance
      // // Give the image a name
      //     .ref('$name.jpg')
      // Upload image to firebase
      //     .putFile(img);
      print("Uploaded image");
    } on FirebaseException catch (e) {
      print(e);
    }
  }
}
