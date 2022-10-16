import 'package:flutter/material.dart';

import 'home_page.dart';

class Money extends StatefulWidget {
  const Money({Key? key}) : super(key: key);

  @override
  State<Money> createState() => _MoneyState();
}

class _MoneyState extends State<Money> {
  bool select=false;
  bool select1=false;
  bool select2=false;
  bool select3=false;

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
                style: ButtonStyle(backgroundColor: MaterialStateProperty.all(select==true||select1==true||select2==true||select3==true?const Color.fromARGB(255,130,36,50):const Color.fromARGB(100,130,36,50))
                ),
                onPressed: (){
                  if(select==true||select1==true||select2==true||select3==true) {
                    Navigator.push(context,
                      MaterialPageRoute(
                          builder: (context) => const HomePage()),);
                  }
                },
                child: Container(margin: const EdgeInsets.only(left: 20,right: 20),child: const Text("Submit",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),))),
          ),
          body: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Text("Select money acceptance mode",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25),),
                ListTile(
                  onTap: (){
                    setState(() {
                      if(select==false) {
                        select = true;
                        select1=false;
                        select2=false;
                        select3=false;
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
}
