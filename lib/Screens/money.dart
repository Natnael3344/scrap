import 'package:checkout_screen_ui/checkout_page.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'home_page.dart';

class Money extends StatefulWidget {
  const Money({Key? key, required this.phone, required this.priceItems, required this.date, required this.address}) : super(key: key);
  final String phone;
  final List<PriceItem> priceItems;
  final String date;
  final String address;
  @override
  State<Money> createState() => _MoneyState();
}

class _MoneyState extends State<Money> {
  bool select=false;
  bool select1=false;
  bool select2=false;
  bool select3=false;
  String pay='';
  String method='UPI';
  String method1='Paytm wallet';
  String method2='Bank Account';
  String method3='Cash';
  late DatabaseReference _ref;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _ref = FirebaseDatabase.instance.ref().child("Customers").child(widget.phone).child("Requests");
  }
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
                style: ButtonStyle(backgroundColor: MaterialStateProperty.all(select==true||select1==true||select2==true||select3==true?const Color.fromARGB(255,130,36,50):const Color.fromARGB(100,130,36,50))
                ),
                onPressed: (){
                  saveConfirmation();
                },
                child: Container(margin: const EdgeInsets.only(left: 20,right: 20),child:  Text("Submit".tr,style: const TextStyle(fontSize: 18,fontWeight: FontWeight.bold),))),
          ),
          body: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                 Text("Select_money".tr,style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 25),),
                ListTile(
                  onTap: (){
                    setState(() {
                      if(select==false) {
                        select = true;
                        select1=false;
                        select2=false;
                        select3=false;
                        pay=method;
                      }
                    });

                  },
                  selected: select,
                  selectedTileColor: const Color.fromARGB(255,130,36,50),
                  contentPadding: const EdgeInsets.all(10),
                  shape: Border.all(color: const Color.fromARGB(255,130,36,50)),
                  leading: Image.network(
                    'https://img.icons8.com/color/344/bhim.png',
                    fit: BoxFit.contain,
                  ),
                  title:  Text("UPI",style: TextStyle(fontWeight: FontWeight.bold,color: select==false?Colors.black:Colors.white),),
                  subtitle: Text("Get money in bank account through UPI",style: TextStyle(color: select==false?Colors.black:Colors.white),),
                ),
                ListTile(
                  onTap: (){
                    setState(() {
                      if(select1==false) {
                        select1 = true;
                        select=false;
                        select2=false;
                        select3=false;
                        pay=method1;
                      }
                    });

                  },
                  selected: select1,
                  selectedTileColor: const Color.fromARGB(255,130,36,50),
                  contentPadding: const EdgeInsets.all(10),
                  shape: Border.all(color: const Color.fromARGB(255,130,36,50)),
                  leading: Image.network(
                    'https://cdn2.iconfinder.com/data/icons/social-icons-color/512/paytm-512.png',
                    fit: BoxFit.contain,
                  ),
                  title:  Text("Paytm wallet",style: TextStyle(fontWeight: FontWeight.bold,color: select1==false?Colors.black:Colors.white),),
                  subtitle:Text("Get money in Paytm wallet",style: TextStyle(color: select1==false?Colors.black:Colors.white),),
                ),
                ListTile(
                  onTap: (){
                    setState(() {
                      if(select2==false) {
                        select2 = true;
                        select=false;
                        select1=false;
                        select3=false;
                        pay=method2;
                      }
                    });

                  },
                  selected: select2,
                  selectedTileColor: const Color.fromARGB(255,130,36,50),
                  contentPadding: const EdgeInsets.all(10),
                  shape: Border.all(color: const Color.fromARGB(255,130,36,50)),
                  leading: Image.network(
                    'https://cdn3.iconfinder.com/data/icons/random-04/100/Artboard_1512x-512.png',
                    fit: BoxFit.contain,
                  ),
                  title: Text("Bank Account",style: TextStyle(fontWeight: FontWeight.bold,color: select2==false?Colors.black:Colors.white),),
                  subtitle:Text("Get money in bank account through IMPS",style: TextStyle(color: select2==false?Colors.black:Colors.white),),
                ),
                ListTile(
                  onTap: (){
                    setState(() {
                      if(select3==false) {
                        select3 = true;
                        select=false;
                        select2=false;
                        select1=false;
                        pay=method3;
                      }
                    });

                  },
                  selected: select3,
                  selectedTileColor: const Color.fromARGB(255,130,36,50),
                  contentPadding: const EdgeInsets.all(10),
                  shape: Border.all(color: const Color.fromARGB(255,130,36,50)),
                  leading: Image.network(
                    'https://cdn2.iconfinder.com/data/icons/finance-253/24/money-payment-finance-coin-credit-256.png',
                    fit: BoxFit.contain,
                  ),
                  title:  Text("Cash",style: TextStyle(fontWeight: FontWeight.bold,color: select3==false?Colors.black:Colors.white),),
                  subtitle:  Text("Get money in cash by the scrap collector",style: TextStyle(color: select3==false?Colors.black:Colors.white),),
                ),
              ],
            ),
          )),
    );
  }
  void saveConfirmation() {
    // List items = widget.priceItems.toList();
    String address = "1, Tulsi vihar, Jaitala, 440035, Nagpur";
    String phone=widget.phone;
    String date=widget.date;
    List<String> name=[];
    List<String> price=[];
    List<dynamic> item() {
      for (var item in widget.priceItems) {
        name.add(item.name);
      }
      return name.toList();
    }
    print(item);

    List<dynamic> item1() {
      for (int i=0;i<name.length;i++) {
        price.add(widget.priceItems[i].price);
      }
      return price.toList();
    }
    print(item1());
    Map<String, dynamic> save = {
      'name': item(),
      'price': item1(),
      'address':  widget.address,
      'phone': phone,
      'date': date,
      'Payment':pay
    };

    _ref.push().set(save).then((value) {
      if(select==true||select1==true||select2==true||select3==true) {
        Navigator.push(context,
          MaterialPageRoute(
              builder: (context) =>  HomePage(phone: widget.phone,)),);
      }
    });
  }
}
