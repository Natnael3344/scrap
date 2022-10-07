import 'dart:io';

import 'package:checkout_screen_ui/checkout_page.dart';
import 'package:flutter/material.dart';

class CheckOut extends StatefulWidget {
  const CheckOut({Key? key}) : super(key: key);

  @override
  State<CheckOut> createState() => _CheckOutState();
}

class _CheckOutState extends State<CheckOut> {

  final List<PriceItem> _priceItems = [
    PriceItem(name: 'Product A', quantity: 1, totalPriceCents: 5200),
    PriceItem(name: 'Product B', quantity: 2, totalPriceCents: 8599),
    PriceItem(name: 'Product C', quantity: 1, totalPriceCents: 2499),
    PriceItem(name: 'Delivery Charge', quantity: 1, totalPriceCents: 1599),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Checkout"),
        backgroundColor: const Color.fromARGB(255,130,36,50),
      ),
      body: CheckoutPage(
        priceItems: _priceItems,
        payToName: 'Vendor Name Here',
        displayNativePay: true,
        onNativePay: () => print('Native Pay Clicked'),
        isApple: Platform.isIOS,
        onCardPay: (results) => print( 'Credit card form submitted with results: $results'),
        onBack: ()=> Navigator.of(context).pop(),
      ),
    );
  }
}
