import 'package:flutter/material.dart';

class Money extends StatefulWidget {
  const Money({Key? key}) : super(key: key);

  @override
  State<Money> createState() => _MoneyState();
}

class _MoneyState extends State<Money> {
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
                style: ButtonStyle(backgroundColor: MaterialStateProperty.all(const Color.fromARGB(255,130,36,50))
                ),
                onPressed: (){


                },
                child: Container(margin: const EdgeInsets.only(left: 20,right: 20),child: const Text("Continue",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),))),
          ),
          body: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Text("Select money acceptance mode",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25),),
                ListTile(
                  contentPadding: const EdgeInsets.all(10),
                  shape: Border.all(color: const Color.fromARGB(255,130,36,50)),
                  leading: Image.network(
                    'https://img.icons8.com/color/344/bhim.png',
                    fit: BoxFit.contain,
                  ),
                  title: const Text("UPI",style: TextStyle(fontWeight: FontWeight.bold),),
                  subtitle: const Text("Get money in bank account through UPI"),
                ),
                ListTile(
                  contentPadding: const EdgeInsets.all(10),
                  shape: Border.all(color: const Color.fromARGB(255,130,36,50)),
                  leading: Image.network(
                    'https://cdn2.iconfinder.com/data/icons/social-icons-color/512/paytm-512.png',
                    fit: BoxFit.contain,
                  ),
                  title: const Text("Paytm wallet",style: TextStyle(fontWeight: FontWeight.bold),),
                  subtitle: const Text("Get money in Paytm wallet"),
                ),
                ListTile(
                  contentPadding: const EdgeInsets.all(10),
                  shape: Border.all(color: const Color.fromARGB(255,130,36,50)),
                  leading: Image.network(
                    'https://cdn3.iconfinder.com/data/icons/random-04/100/Artboard_1512x-512.png',
                    fit: BoxFit.contain,
                  ),
                  title: const Text("Bank Account",style: TextStyle(fontWeight: FontWeight.bold),),
                  subtitle: const Text("Get money in bank account through IMPS"),
                ),
                ListTile(
                  contentPadding: const EdgeInsets.all(10),
                  shape: Border.all(color: const Color.fromARGB(255,130,36,50)),
                  leading: Image.network(
                    'https://cdn2.iconfinder.com/data/icons/finance-253/24/money-payment-finance-coin-credit-256.png',
                    fit: BoxFit.contain,
                  ),
                  title: const Text("Cash",style: TextStyle(fontWeight: FontWeight.bold),),
                  subtitle: const Text("Get money in cash by the scrap collector"),
                ),
              ],
            ),
          )),
    );
  }
}
