import 'dart:io';

import 'package:camera/camera.dart';
import 'package:checkout_screen_ui/checkout_page.dart';
import 'package:flutter/material.dart';
import 'package:scrap/Screens/upload.dart';


class TakePictureScreen extends StatefulWidget{
    const TakePictureScreen({super.key, required this.picture, required this.priceItems, required this.phone});
    final String phone;
    final List picture;
    final List<PriceItem> priceItems;
  @override
  State<TakePictureScreen> createState() => _TakePictureScreenState();
}
class _TakePictureScreenState extends State<TakePictureScreen>{

  List<CameraDescription>? cameras; //list out the camera available
  CameraController? controller; //controller for camera
  XFile? image; //for caputred image
  List? picture1;
  bool hide=false;
  bool show=false;
  @override
  void initState() {
    picture1=widget.picture.toList();
    loadCamera();
    super.initState();
  }

  loadCamera() async {
    cameras = await availableCameras();
    if(cameras != null){
      controller = CameraController(cameras![0], ResolutionPreset.max);
      //cameras[0] = first camera, change to 1 to another camera

      controller!.initialize().then((_) {
        if (!mounted) {
          return;
        }
        setState(() {});
      });
    }else{
      print("NO any camera found");
    }
  }

  @override
  Widget build(BuildContext context) {

    return  Scaffold(
      appBar: AppBar(
        title: const Text("Upload scrap items' pictures"),
        backgroundColor: const Color.fromARGB(255,130,36,50),
      ),
      body: Column(
          children:[
            show==false?Expanded(
              child: SizedBox(
                  width:double.maxFinite,
                  child: controller == null?
                  const Center(child:Text("Loading Camera...")):
                  !controller!.value.isInitialized?
                  const Center(
                    child: CircularProgressIndicator(),
                  ):
                  CameraPreview(controller!)
              ),
            ):const SizedBox(),
            show?Expanded(
              child: SizedBox(//show captured image
                width: double.maxFinite,
                child: image == null?
                const Center(child: Text("wait......")):Image.file(File(image!.path), height: 300,),
                //display captured image
              ),
            ):const SizedBox()
          ]
      ),

      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          hide?Padding(
            padding: const EdgeInsets.only(left: 30),
            child: FloatingActionButton(

              backgroundColor: const Color.fromARGB(255,130,36,50),
              onPressed: (){
                setState(() {
                  hide=false;
                  show=false;
                });
            },
              child: const Icon(Icons.cancel),
            ),
          ):const SizedBox(),
          hide==false?Padding(
            padding: const EdgeInsets.only(left: 25),
            child: FloatingActionButton(
              backgroundColor: const Color.fromARGB(255,130,36,50),
              onPressed: () async{
                setState(() {
                  hide=true;
                  show=true;
                });
                try {
                  if(controller != null){ //check if contrller is not null
                    if(controller!.value.isInitialized){ //check if controller is initialized
                      image = await controller!.takePicture(); //capture image
                      setState(() {
                        //update UI
                      });
                    }
                  }
                } catch (e) {
                  print(e); //show error
                }
              },
              child: const Icon(Icons.camera),
            ),
          ):const SizedBox(),
          hide?const SizedBox(width: 80,):const SizedBox(),
          hide?Padding(
            padding: const EdgeInsets.only(left: 20),
            child: FloatingActionButton(

              backgroundColor: const Color.fromARGB(255,130,36,50),
              onPressed: (){
                setState(() {
                  picture1?.add(image);
                });
                if(picture1!=null) {
                  Navigator.push(context,
                    MaterialPageRoute(
                      builder: (BuildContext context) =>
                           Upload(picture: picture1!,priceItems: widget.priceItems,phone: widget.phone,),
                    ),);
                }
            },
              child: const Icon(Icons.check),
            ),
          ):const SizedBox()
        ],
      ),

    );
  }
}