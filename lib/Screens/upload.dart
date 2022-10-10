
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:scrap/Screens/check_out.dart';

import 'cameras.dart';


class Upload extends StatefulWidget {

  const Upload({Key? key, required this.picture}) : super(key: key);
  final List picture;
  @override
  State<Upload> createState() => _UploadState();
}

class _UploadState extends State<Upload> {
  int hide=0;
  @override
  void initState() {
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
                              builder: (BuildContext context) =>  TakePictureScreen(picture: widget.picture),
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
                  // Navigator.push(context,
                  //   MaterialPageRoute (
                  //     builder: (BuildContext context) => const CheckOut(),
                  //   ),
                  // );
                },
                child: Container(margin: const EdgeInsets.only(left: 20,right: 20),child: const Text("Continue",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),))),
          ),
        ],
      ),
    );
  }
}
