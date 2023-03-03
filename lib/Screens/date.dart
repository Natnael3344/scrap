import 'package:checkout_screen_ui/checkout_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:scrap/Screens/check_out.dart';
import 'package:scrap/Screens/money.dart';
class PickDate extends StatefulWidget {
  const PickDate({Key? key, required this.priceItems, required this.phone, required this.address}) : super(key: key);
  final String phone;
  final String address;
  final List<PriceItem> priceItems;
  @override
  State<PickDate> createState() => _PickDateState();
}

class _PickDateState extends State<PickDate> {
  dynamic date1='Choose A Date';
  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            title:  Text("Sell_Scrap".tr),
            backgroundColor: const Color.fromARGB(255,130,36,50),
          ),
          bottomNavigationBar: Container(
            width: double.maxFinite,
            margin: const EdgeInsets.all(20),
            height: 50,
            child: ElevatedButton(
                style: ButtonStyle(backgroundColor: date1!='Choose A Date'?MaterialStateProperty.all(const Color.fromARGB(255,130,36,50)):MaterialStateProperty.all(const Color.fromARGB(100,130,36,50))
                ),
                onPressed: (){
                  if(date1!='Choose A Date') {
                    Navigator.push(context,
                      MaterialPageRoute(
                          builder: (BuildContext context) => CheckOut(priceItems: widget.priceItems, date: date1, phone: widget.phone, address: widget.address,)
                        // CheckOut(priceItems: _priceItems)
                        // const TakePictureScreen(picture: []),
                      ),
                    );
                  }
                },
                child: Container(margin: const EdgeInsets.only(left: 20,right: 20),child:  Text("continue".tr,style: const TextStyle(fontSize: 18,fontWeight: FontWeight.bold),))),
          ),
          body: Column(
            children: [
               Padding(
                padding: const EdgeInsets.all(20),
                child: Text("Select_date".tr,style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 25),),
              ),
              Container(
                margin: const EdgeInsets.only(left: 20, right: 20),
                decoration:  BoxDecoration(
                  border: Border.all(color:const Color.fromARGB(255,130,36,50))
                ),
                child: Container(
                  margin:const EdgeInsets.only(left: 20,right: 20,top: 10,bottom: 10),
                  child: DropdownButton<DateTime>(
                      hint: Text(date1,style: const TextStyle(fontSize: 20),),
                      items: [
                        date1
                      ].map((e) => DropdownMenuItem<DateTime>(child: Text(e))).toList(),
                      isExpanded: true,
                      iconSize: 30,
                      icon: const Icon(Icons.arrow_drop_down_sharp,color: Color.fromARGB(255,130,36,50),),
                      onChanged: (value) {
                        setState(() {
                          showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(2001),
                              lastDate: DateTime(2099))
                              .then((date) {
                            setState(() {
                              final DateFormat formatter = DateFormat('yyyy-MM-dd');
                              date1 = formatter.format(date!);
                              print(date1);
                            });
                          });
                        });
                      }),
                ),
              )
            ],
          )),
    );
  }
}
