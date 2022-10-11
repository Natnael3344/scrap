import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:scrap/Screens/money.dart';
class PickDate extends StatefulWidget {
  const PickDate({Key? key}) : super(key: key);

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
            title: const Text("Sell scrap"),
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
                          builder: (BuildContext context) =>const Money()
                        // CheckOut(priceItems: _priceItems)
                        // const TakePictureScreen(picture: []),
                      ),
                    );
                  }
                },
                child: Container(margin: const EdgeInsets.only(left: 20,right: 20),child: const Text("Continue",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),))),
          ),
          body: Column(
            children: [
              const Padding(
                padding: EdgeInsets.all(20),
                child: Text("Select a date for scrap pickup",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25),),
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