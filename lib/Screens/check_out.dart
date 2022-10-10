import 'dart:io';

import 'package:checkout_screen_ui/checkout_page.dart';
import 'package:flutter/material.dart';

class CheckOut extends StatefulWidget {
  const CheckOut({Key? key, required this.priceItems}) : super(key: key);
  final List<PriceItem> priceItems;
  @override
  State<CheckOut> createState() => _CheckOutState();
}

class _CheckOutState extends State<CheckOut> {



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Checkout"),
        backgroundColor: const Color.fromARGB(255,130,36,50),
      ),
      body: CheckoutPage(
        priceItems: widget.priceItems,
        payToName: 'Scrapify',
        displayNativePay: true,
        onNativePay: () => print('Native Pay Clicked'),
        isApple: Platform.isIOS,
        onCardPay: (results) => print( 'Credit card form submitted with results: $results'),
      ),
    );
  }
}
